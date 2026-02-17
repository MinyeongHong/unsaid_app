import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/text_field.dart';

class SignBirthDateField extends StatefulWidget {
  final ValueChanged<String> onRawChanged;

  const SignBirthDateField({super.key, required this.onRawChanged});

  @override
  State<SignBirthDateField> createState() => _SignBirthDateFieldState();
}

class _SignBirthDateFieldState extends State<SignBirthDateField> {
  final int _digitCount = 8;
  final List<String> _hintText = ['d', 'd', 'm', 'm', 'y', 'y', 'y', 'y'];

  final List<TextEditingController> _controllers = List.generate(8, (_) => TextEditingController());
  final List<FocusNode> _focusNodes = List.generate(8, (_) => FocusNode());

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < _digitCount; i++) {
      _controllers[i].addListener(_onTextChanged);
    }

    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) _focusNodes[0].requestFocus();
    });
  }

  @override
  void dispose() {
    for (int i = 0; i < _digitCount; i++) {
      _controllers[i].removeListener(_onTextChanged);
      _controllers[i].dispose();
      _focusNodes[i].dispose();
    }

    super.dispose();
  }

  void _onTextChanged() {
    widget.onRawChanged(_controllers.map((c) => c.text).join());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.min,
      children: [
        ..._buildSegment('day'),
        ..._buildSegment('/'),
        ..._buildSegment('month'),
        ..._buildSegment('/'),
        ..._buildSegment('year'),
      ],
    );
  }

  List<Widget> _buildSegment(String type) {
    final List<Widget> children = [];

    if (type == 'day') {
      for (int i = 0; i < 2; i++) {
        children.add(_buildDigitBox(i));
      }
    } else if (type == 'month') {
      for (int i = 2; i < 4; i++) {
        children.add(_buildDigitBox(i));
      }
    } else if (type == 'year') {
      for (int i = 4; i < 8; i++) {
        children.add(_buildDigitBox(i));
      }
    } else {
      children.add(
        MediumText(
          margin: EdgeInsets.only(left: 4, right: 4),
          title: '/',
          fontSize: 20,
          color: CustomColor.gray060,
        ),
      );
    }

    return children;
  }

  Widget _buildDigitBox(int index) {
    return Container(
      width: (screenWidth - 120) / 8,
      child: CallbackShortcuts(
        bindings: {
          SingleActivator(LogicalKeyboardKey.backspace): () {
            if (_controllers[index].text.isEmpty && index > 0) {
              _focusNodes[index - 1].requestFocus();
            }
          },
        },
        child: OutLineTextField(
          controller: _controllers[index],
          focusNode: _focusNodes[index],
          hintText: _hintText[index],
          cursorWidth: 0,
          textAlign: TextAlign.center,
          keyboardType: TextInputType.number,

          inputFormatters: [FilteringTextInputFormatter.digitsOnly],
          onChanged: (value) {
            if (value.length > 1) {
              // 이미 숫자가 있을 때 새 숫자를 누르면 기존 건 지우고 새 숫자만 남김
              _controllers[index].text = value[value.length - 1];
              _controllers[index].selection = TextSelection.collapsed(offset: 1);
            }

            if (index < 7) {
              _focusNodes[index + 1].requestFocus();
            }
          },
        ),
      ),
    );
  }
}
