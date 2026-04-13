import 'package:flutter/material.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/format.dart';
import 'package:unsaid_app/core/widget/button.dart';
import 'package:unsaid_app/core/widget/line.dart';
import 'package:unsaid_app/core/widget/loading.dart';
import 'package:unsaid_app/core/widget/svg_asset.dart';
import 'package:unsaid_app/core/widget/text.dart';

class ReadingListCard extends StatelessWidget {
  final void Function() onTap;
  final bool isLoading;
  final Reading reading;

  const ReadingListCard({
    super.key,
    required this.onTap,
    required this.isLoading,
    required this.reading,
  });

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Opacity(
          opacity: isLoading ? 0.3 : 1,
          child: FadeButton(
            padding: EdgeInsets.only(top: 12, left: 24, right: 24, bottom: 12),
            onTap: isLoading ? null : onTap,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                BoldText(
                  title: reading.question,
                  fontSize: 16,
                  color: CustomColor.gray080,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                NormalText(
                  margin: EdgeInsets.only(top: 4),
                  title: 'UNSAID: ${reading.unsaidLine}',
                  fontSize: 14,
                  color: CustomColor.gray050,
                  overflow: TextOverflow.ellipsis,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    MediumText(
                      margin: EdgeInsets.only(top: 12),
                      title: formatDate(reading.createdAt, newPattern: 'E d, MMM yyyy'),
                      fontSize: 12,
                      color: CustomColor.gray080,
                    ),
                  ],
                ),
                ThinLineCard(margin: EdgeInsets.only(top: 12)),
              ],
            ),
          ),
        ),
        if (isLoading)
          Positioned(
            top: 32,
            left: 0,
            right: 0,
            child: ButtonLoading(
              size: 30,
              color: CustomColor.gray040,
            ),
          )
        else
          Container(),
      ],
    );
  }
}
