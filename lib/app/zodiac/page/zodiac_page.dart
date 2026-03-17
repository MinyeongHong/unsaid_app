import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/sign/page/sign_success_page.dart';
import 'package:unsaid_app/app/zodiac/bloc/zodiac_bloc.dart';
import 'package:unsaid_app/app/zodiac/model/zodiac_model.dart';
import 'package:unsaid_app/app/zodiac/page/zodiac_question_page.dart';
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

class ZodiacPage extends StatefulWidget {
  final bool hasAppBar;
  final bool isEdit;

  const ZodiacPage({
    super.key,
    this.hasAppBar = true,
    this.isEdit = false,
  });

  @override
  State<ZodiacPage> createState() => _ZodiacPageState();
}

class _ZodiacPageState extends State<ZodiacPage> {
  late bool _hasAppBar = widget.hasAppBar;
  late bool _isEdit = widget.isEdit;

  bool _isLoading = false;

  String? _zodiacName;

  Zodiac? _zodiac;

  bool get _isActive => _zodiac != null;

  // void _updateUser() async {
  //   if (_isLoading) return;
  //   if (_zodiac == null) return;

  //   try {
  //     analyticsLogEvent('sign_zodiac_click_complete');

  //     FocusScope.of(context).unfocus();

  //     setState(() {
  //       _isLoading = true;
  //     });

  //     final User user = await UserBloc.updateUserSign(_zodiac!);

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
  //         _isLoading = false;
  //       });
  //     }
  //   }
  // }

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
      title: _hasAppBar ? '' : null,
      body: CustomBody(
        bottom: screenBottom + 84,
        top: !_hasAppBar,
        children: [
          BoldText(
            margin: EdgeInsets.only(
              top: 32 + (_hasAppBar ? 0 : statusBarHeight),
              left: 24,
              right: 24,
            ),
            title: 'What is your sun sign?',
            fontSize: 26,
            color: CustomColor.gray080,
            textAlign: TextAlign.center,
          ),
          CustomZodiacBloc(
            success: (List<Zodiac> zodiacs) {
              return Container(
                margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                child: Wrap(
                  spacing: 12,
                  runSpacing: 16,
                  children: zodiacs
                      .map(
                        (zodiac) => Container(
                          width: (screenWidth - 60) / 2,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            border: Border.all(
                              color: _zodiacName == zodiac.name
                                  ? CustomColor.gray040
                                  : CustomColor.gray010,
                            ),
                          ),
                          child: CustomInkWell(
                            onTap: () {
                              setState(() {
                                _zodiac = zodiac;
                                _zodiacName = zodiac.name;
                              });
                            },
                            padding: EdgeInsets.only(top: 24, bottom: 16),
                            borderRadius: BorderRadius.circular(10),
                            child: Column(
                              children: [
                                CustomSvgAsset(
                                  name: 'icons/zodiac/${zodiac.name.toLowerCase()}',
                                  width: 32,
                                  height: 32,
                                ),
                                MediumText(
                                  margin: EdgeInsets.only(top: 16),
                                  title: zodiac.name,
                                  fontSize: 16,
                                  color: _zodiacName == zodiac.name
                                      ? CustomColor.gray080
                                      : CustomColor.gray040,
                                ),
                              ],
                            ),
                          ),
                        ),
                      )
                      .toList(),
                ),
              );
            },
          ),
        ],
      ),
      positioned: BottomButton(
        onTap: () {
          addRoute(
            context: context,
            page: ZodiacQuestionPage(
              isEdit: _isEdit,
              zodiac: _zodiac!,
            ),
          );
        },
        title: 'Continue',
        isActive: _isActive,
      ),
    );
  }
}
