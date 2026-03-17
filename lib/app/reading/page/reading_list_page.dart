import 'package:flutter/widgets.dart';
import 'package:unsaid_app/app/reading/bloc/reading_bloc.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/app/reading/page/reading_detail_page.dart';
import 'package:unsaid_app/app/reading/widget/reading_list_widget.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class ReadingListPage extends StatefulWidget {
  const ReadingListPage({super.key});

  @override
  State<ReadingListPage> createState() => _ReadingListPageState();
}

class _ReadingListPageState extends State<ReadingListPage> {
  String? _loadingId;

  void _getReading(String id) async {
    if (_loadingId != null) return;

    try {
      analyticsLogEvent('reading_list_click_reading');

      setState(() {
        _loadingId = id;
      });

      Reading reading = await ReadingBloc.getReading(id);

      addRoute(
        fullscreenDialog: true,
        context: context,
        page: ReadingDetailPage(
          hasDelete: true,
          reading: reading,
        ),
      );
    } catch (e) {
      errorToast(context, e);
    } finally {
      if (mounted) {
        setState(() {
          _loadingId = null;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      title: 'History',
      isLoading: true,
      body: CustomBody(
        children: [
          CustomReadingBloc(
            success: (List<Reading> readings) {
              if (readings.isEmpty) {
                return Column(
                  children: [
                    NormalText(
                      margin: EdgeInsets.only(top: 48, left: 24, right: 24),
                      title: 'You haven’t asked.',
                      fontSize: 20,
                      color: CustomColor.gray070,
                      textAlign: TextAlign.center,
                    ),
                    NormalText(
                      margin: EdgeInsets.only(top: 8),
                      title: 'Take your time.',
                      fontSize: 14,
                      color: CustomColor.gray050,
                      textAlign: TextAlign.center,
                    ),
                  ],
                );
              } else {
                return Container(
                  margin: EdgeInsets.only(top: 12),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: readings.map((reading) {
                      return ReadingListCard(
                        onTap: () {
                          _getReading(reading.id);
                        },
                        isLoading: _loadingId == reading.id,
                        reading: reading,
                      );
                    }).toList(),
                  ),
                );
              }
            },
          ),
        ],
      ),
    );
  }
}
