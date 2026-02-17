import 'package:flutter/material.dart';
import 'package:unsaid_app/app/reading/page/reading_list_page.dart';
import 'package:unsaid_app/app/user_setting/page/user_setting_notification_page.dart';
import 'package:unsaid_app/app/user_setting/widget/user_setting_widget.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/user/page/user_page.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/url.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/line.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/web_view.dart';

class UserSettingPage extends StatefulWidget {
  const UserSettingPage({super.key});

  @override
  State<UserSettingPage> createState() => _UserSettingPageState();
}

class _UserSettingPageState extends State<UserSettingPage> {
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'Setting',
      body: CustomBody(
        children: [
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_personal');

              addRoute(
                page: UserPage(),
              );
            },
            title: 'Personal',
          ),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_notification');

              addRoute(
                page: ReadingListPage(),
              );
            },
            title: 'History',
          ),

          ThickLineCard(),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_notification');

              addRoute(
                page: UserSettingNotificationPage(),
              );
            },
            title: 'Set notifications',
          ),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_service');

              addRoute(
                page: WebViewPage(
                  title: 'Terms of Service',
                  url: serviceTermsUrl,
                ),
              );
            },
            title: 'Terms of Service',
          ),
          UserSettingCard(
            onTap: () {
              analyticsLogEvent('user_setting_click_service');

              addRoute(
                page: WebViewPage(
                  title: 'Privacy Policy',
                  url: privacyTermsUrl,
                ),
              );
            },
            title: 'Privacy Policy',
          ),
        ],
      ),
    );
  }
}
