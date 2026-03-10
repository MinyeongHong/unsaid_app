import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:unsaid_app/app/reading/bloc/reading_bloc.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/app/reading/widget/reading_detail_dialog.dart';
import 'package:unsaid_app/core/util/analytics.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/body.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/scaffold.dart';
import 'package:unsaid_app/core/widget/text.dart';
import 'package:unsaid_app/core/widget/toast.dart';

class ReadingDetailPage extends StatefulWidget {
  final Reading reading;
  final bool hasDelete;

  const ReadingDetailPage({
    super.key,
    required this.reading,
    this.hasDelete = false,
  });

  @override
  State<ReadingDetailPage> createState() => _ReadingDetailPageState();
}

class _ReadingDetailPageState extends State<ReadingDetailPage> {
  bool _isLoading = false;

  late bool _hasDelete = widget.hasDelete;
  late Reading _reading = widget.reading;

  void _deleteReading() async {
    if (_isLoading) return;
    if (!_hasDelete) return;

    try {
      analyticsLogEvent('reading_detail_delete_sheet_click_delete');

      setState(() {
        _isLoading = true;
      });

      await ReadingBloc.deleteReading(_reading.id);

      BlocProvider.of<ReadingBloc>(context).add(ReadingEvent.delete(_reading.id));

      Navigator.of(context).pop();
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

  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
      isLeading: false,
      isLoading: _isLoading,
      title: '',
      body: CustomBody(
        bottom: screenBottom + 84,
        children: [
          BoldText(
            margin: const EdgeInsets.only(top: 6, left: 24, right: 24),
            title: 'What no one says',
            fontSize: 18,
            color: CustomColor.gray070,
          ),
          MediumText(
            margin: const EdgeInsets.only(top: 24, left: 24, right: 24),
            title: 'Your question',
            color: CustomColor.gray040,
            fontSize: 13,
          ),
          NormalText(
            margin: const EdgeInsets.only(top: 6, left: 24, right: 24),
            title: _reading.question,
            color: CustomColor.gray060,
            fontSize: 15,
          ),
          MediumText(
            margin: EdgeInsets.only(top: 28, left: 24, right: 24),
            title: 'Answer',
            color: CustomColor.gray050,
            fontSize: 13,
          ),
          MediumText(
            margin: EdgeInsets.only(top: 6, left: 24, right: 28),
            title: _reading.interpretation!,
            fontSize: 18,
            color: CustomColor.gray080,
          ),
          MediumText(
            margin: EdgeInsets.only(top: 48, left: 24, right: 24),
            title: 'UNSAID',
            color: CustomColor.gray040,
            fontSize: 11,
            spacing: 2.1,
          ),
          NormalText(
            margin: EdgeInsets.only(top: 6, left: 24, right: 24),
            title: _reading.unsaidLine,
            color: CustomColor.gray070,
            fontSize: 15,
            height: 1.5,
          ),
          if (_hasDelete)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                FadeButton(
                  onTap: () {
                    analyticsLogEvent('reading_detail_click_delete');

                    readingDetailDeleteDialog(
                      onTap: () {
                        _deleteReading();
                      },
                    );
                  },
                  margin: EdgeInsets.only(top: 24),
                  child: UnderlineText(
                    title: 'Delete This',
                    fontWeight: FontWeight.w500,
                    fontSize: 14,
                    color: CustomColor.gray040,
                  ),
                ),
              ],
            )
          else
            Container(),
        ],
        positioned: BottomButton(
          onTap: () {
            Navigator.pop(context);
          },
          title: 'Close',
        ),
      ),
    );
  }
}
