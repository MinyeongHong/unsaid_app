import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/sign/page/sign_success_page.dart';
import 'package:unsaid_app/app/zodiac/model/zodiac_model.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/bloc/user_bloc.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/inkwell.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/app/sign/widget/sign_birth_widget.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class ZodiacQuestionPage extends StatefulWidget {
  final bool isEdit;
  final Zodiac zodiac;

  const ZodiacQuestionPage({
    super.key,
    required this.isEdit,
    required this.zodiac,
  });

  @override
  State<ZodiacQuestionPage> createState() => _ZodiacQuestionPageState();
}

class _ZodiacQuestionPageState extends State<ZodiacQuestionPage> {
  late bool _isEdit = widget.isEdit;
  late Zodiac _zodiac = widget.zodiac;
  late List<ZodiacShadow> _zodiacShadow = _zodiac.zodiacShadows;

  ZodiacAdd _zodiacAdd = ZodiacAdd();

  bool _isLoading = false;

  bool get _isActive => _zodiacAdd.shadowId != null;

  @override
  void initState() {
    _zodiacAdd.name = _zodiac.name;
    super.initState();
  }

  void _updateUserZodiac() async {
    if (_isLoading) return;
    if (!_isActive) return;

    try {
      analyticsLogEvent('zodiac_question_click_complete');

      setState(() {
        _isLoading = true;
      });

      final User user = await UserBloc.updateUserZodiac(_zodiacAdd);

      BlocProvider.of<UserBloc>(context).add(
        UserEvent.update(user),
      );

      if (_isEdit) {
        Navigator.pop(context);
        Navigator.pop(context);

        successToast('Successfuly change your sign.');
      } else {
        addRoute(
          context: context,
          page: SignSuccessPage(),
        );
      }
    } catch (e) {
      errorToast(context, e);
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
        });
      }
    }
  }

  // void _updateUserWithSkip() async {
  //   if (_isLoading) return;
  //   if (_isSkipLoading) return;

  //   try {
  //     analyticsLogEvent('sign_birth_click_skip');

  //     FocusScope.of(context).unfocus();

  //     setState(() {
  //       _isSkipLoading = true;
  //     });

  //     final User user = await UserBloc.updateUser(null);

  //     BlocProvider.of<UserBloc>(context).add(
  //       UserEvent.update(user),
  //     );

  //     addRoute(
  //       context: context,
  //       page: SignSuccessPage(),
  //     );
  //   } catch (e) {
  //     errorToast(context, e);
  //   } finally {
  //     if (mounted) {
  //       setState(() {
  //         _isSkipLoading = false;
  //       });
  //     }
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: '',
      body: CustomBody(
        bottom: screenBottom + 84,
        children: [
          BoldText(
            margin: EdgeInsets.only(top: 24),
            title: 'Face your shadow.',
            fontSize: 26,
            color: CustomColor.gray080,
            textAlign: TextAlign.center,
          ),
          MediumText(
            margin: EdgeInsets.only(top: 12, left: 24, right: 24),
            title: 'Select the truth that makes you most uncomfortable.',
            fontSize: 18,
            color: CustomColor.gray060,
            textAlign: TextAlign.center,
          ),
          Container(
            margin: EdgeInsets.only(top: 36, left: 24, right: 24),
            child: Wrap(
              runSpacing: 24,
              children: _zodiacShadow
                  .map(
                    (zodiacShadow) => Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(
                          color: _zodiacAdd.shadowId == zodiacShadow.id
                              ? CustomColor.gray040
                              : CustomColor.gray010,
                        ),
                      ),
                      child: CustomInkWell(
                        onTap: () {
                          setState(() {
                            _zodiacAdd.shadowId = zodiacShadow.id;
                          });
                        },
                        padding: EdgeInsets.only(top: 24, left: 24, right: 24, bottom: 24),
                        borderRadius: BorderRadius.circular(10),
                        child: MediumText(
                          title: zodiacShadow.title,
                          fontSize: 20,
                          color: _zodiacAdd.shadowId == zodiacShadow.id
                              ? CustomColor.gray080
                              : CustomColor.gray040,
                          textAlign: TextAlign.center,
                        ),
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        ],
      ),
      positioned: BottomButton(
        onTap: () {
          _updateUserZodiac();
        },
        title: 'Continue',
        isActive: _isActive,
        isLoading: _isLoading,
      ),
    );
  }
}
