import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/home/home_loading_page.dart';
import 'package:unsaid_app/app/reading/page/reading_detail_page.dart';
import 'package:unsaid_app/app/reading/bloc/reading_bloc.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/app/user_setting/page/user_setting_page.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/common.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/animation.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/lottie_asset.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int? _remaining; // null = 아직 모름(서버에서 quota를 안 내려줬거나 최초)

  bool _isQuestion = false;
  bool _isLoading = false;

  String _question = '';

  final TextEditingController _questionController = TextEditingController();
  final FocusNode _questionFocusNode = FocusNode();

  bool get _quotaBlocked => (_remaining != null && _remaining! <= 0);
  bool get _canSubmit => _isActive && !_isLoading && !_quotaBlocked;
  bool get _isActive => _question.isNotEmpty;

  @override
  void initState() {
    super.initState();
    _isQuestion = false;

    _questionController.addListener(() {
      setState(() {
        _question = _questionController.text.trim();
      });
    });
    _questionFocusNode.addListener(() {
      setState(() {});
    });
  }

  @override
  void dispose() {
    _questionController.dispose();
    _questionFocusNode.dispose();
    super.dispose();
  }

  void _addReading() async {
    if (!_isActive) return;
    if (_isLoading) return;
    if (_quotaBlocked) {
      return errorToast(context, 'Today’s limit reached. Try again tomorrow.');
    }

    try {
      analyticsLogEvent('home_click_continue');

      FocusScope.of(context).unfocus();

      setState(() {
        _isLoading = true;
      });

      final Reading reading = await ReadingBloc.addReading(_question);

      BlocProvider.of<ReadingBloc>(context).add(
        ReadingEvent.add(reading),
      );

      addRoute(
        fullscreenDialog: true,
        context: context,
        page: ReadingDetailPage(
          reading: reading,
        ),
      );
    } catch (e) {
      // TODO fix
      if (e is Failure && e.message == 'quota_exceeded') {
        setState(() {
          _remaining = 0;
        });

        errorToast(context, 'Today’s limit reached. Try again tomorrow.');
      } else {
        errorToast(context, e);
      }
    } finally {
      if (mounted) {
        setState(() {
          _isLoading = false;
          _isQuestion = false;
          _questionController.clear();
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    if (_isLoading) {
      return HomeLoadingPage();
    } else {
      return CustomScaffold(
        isLeading: false,
        title: 'Unsaid',
        actions: [
          _isQuestion
              ? FadeButton(
                  onTap: () {
                    analyticsLogEvent('home_click_cancel');

                    setState(() {
                      _isQuestion = false;
                    });
                  },
                  margin: EdgeInsets.only(right: 14),
                  child: CustomSvgAsset(
                    name: 'icons/x_mono',
                    width: 20,
                    height: 20,
                  ),
                )
              : FadeButton(
                  onTap: () {
                    analyticsLogEvent('home_click_setting');

                    addRoute(
                      context: context,
                      page: UserSettingPage(),
                    );
                  },
                  margin: EdgeInsets.only(right: 14),
                  child: CustomSvgAsset(
                    name: 'icons/setting',
                    width: 20,
                    height: 20,
                  ),
                ),
        ],
        body: CustomBody(
          children: [
            Container(
              margin: EdgeInsets.only(top: 48, left: 24, right: 24),
              child: Stack(
                alignment: AlignmentGeometry.center,
                clipBehavior: Clip.none,
                children: [
                  TweenAnimationBuilder<double>(
                    tween: Tween<double>(
                      begin: 1.0,
                      end: _isQuestion ? 1.1 : 0.9,
                    ),
                    duration: const Duration(milliseconds: 320),
                    curve: Curves.easeOutCubic,
                    builder: (context, scale, child) {
                      return Opacity(
                        opacity: _isQuestion ? 0.4 : 0.8,
                        child: Transform.scale(
                          scale: scale,
                          child: child,
                        ),
                      );
                    },
                    child: CustomLottieAsset(
                      width: screenWidth - 20,
                      height: screenWidth - 20,
                      name: 'assets/lotties/circle.json',
                      duration: const Duration(seconds: 7),
                    ),
                  ),
                  Positioned(
                    child: Center(
                      child: Column(
                        children: [
                          if (_isQuestion)
                            FadeInDownAnimationCard(
                              child: Column(
                                children: [
                                  BoldText(
                                    margin: EdgeInsets.only(top: 24),
                                    title: 'Ask what you already suspect',
                                    fontSize: 18,
                                    color: CustomColor.gray080,
                                    textAlign: TextAlign.center,
                                  ),
                                  Container(
                                    margin: EdgeInsets.only(top: 24, left: 24, right: 24),
                                    child: Column(
                                      children: [
                                        TextField(
                                          controller: _questionController,
                                          focusNode: _questionFocusNode,
                                          scrollPadding: EdgeInsets.only(bottom: 200),
                                          autofocus: true,
                                          maxLines: null, // multiline
                                          minLines: 2,
                                          maxLength: 150,
                                          keyboardType: TextInputType.multiline,
                                          textInputAction: TextInputAction.newline,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                            fontSize: 14,
                                            height: 1.4,
                                            color: Colors.black87,
                                          ),
                                          decoration: InputDecoration(
                                            hintText: 'Write the question\nyou’ve been avoiding',
                                            hintStyle: TextStyle(
                                              color: Colors.black38,
                                              fontSize: 16,
                                            ),
                                            border: InputBorder.none,
                                            counterText: '',
                                            contentPadding: EdgeInsets.only(bottom: 8),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            )
                          else
                            BoldText(
                              title: 'Did you think this through?',
                              fontSize: 18,
                              color: CustomColor.gray080,
                              textAlign: TextAlign.center,
                            ),
                          _isQuestion
                              ? Column(
                                  children: [
                                    CustomButton(
                                      onTap: () {
                                        _addReading();
                                      },
                                      margin: EdgeInsets.only(top: 24, left: 48, right: 48),
                                      title: _quotaBlocked ? 'Come back tomorrow' : 'Continue',
                                      isActive: _canSubmit,
                                    ),
                                    NormalText(
                                      margin: EdgeInsets.only(top: 12),
                                      title: 'you can ask 3 times a day',
                                      fontSize: 12,
                                      color: CustomColor.gray040,
                                      textAlign: TextAlign.center,
                                    ),
                                  ],
                                )
                              : CustomButton(
                                  onTap: () {
                                    setState(() {
                                      _isQuestion = true;
                                    });

                                    WidgetsBinding.instance.addPostFrameCallback((_) {
                                      _questionFocusNode.requestFocus();
                                    });
                                  },
                                  margin: EdgeInsets.only(top: 24, left: 78, right: 78),
                                  color: CustomColor.gray090,
                                  borderRadius: BorderRadius.circular(60),
                                  title: 'Ask Anyway',
                                ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
            _isQuestion
                ? FadeInDownAnimationCard(
                    child: NormalText(
                      margin: EdgeInsets.only(top: 40),
                      title: 'This isn’t about the future',
                      fontSize: 14,
                      color: CustomColor.gray040,
                      textAlign: TextAlign.center,
                    ),
                  )
                : Container(),
          ],
        ),
      );
    }
  }
}
