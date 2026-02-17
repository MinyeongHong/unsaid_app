import 'package:flutter/widgets.dart';
import 'package:unsaid_app/app/reading/bloc/reading_bloc.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/app/reading/page/reading_detail_page.dart';
import 'package:unsaid_app/app/reading/widget/reading_list_widget.dart';
import 'package:unsaid_app/core/route/model/route_model.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
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
        page: ReadingDetailPage(
          hasDelete: true,
          reading: reading,
        ),
      );
    } catch (e) {
      errorToast(e);
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
                return ReadingListEmptyCard();
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
