import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app/zodiac/model/zodiac_model.dart';
import 'package:unsaid_app/app/zodiac/repository/zodiac_repository.dart';
import 'package:unsaid_app/core/util/color.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/size.dart';
import 'package:unsaid_app/core/widget/shimmer.dart';
import 'package:unsaid_app/core/widget/text.dart';

part 'zodiac_bloc.freezed.dart';
part 'zodiac_event.dart';
part 'zodiac_state.dart';

class ZodiacBloc extends Bloc<ZodiacEvent, ZodiacState> {
  static ZodiacRepository _zodiacRepository = ZodiacRepositoryImpl();

  ZodiacBloc() : super(ZodiacState.loading()) {
    on<_Fetch>(_fetch);
  }

  void _fetch(_, emit) async {
    final either = await _zodiacRepository.getZodiacs();

    either.fold(
      (l) {
        emit(ZodiacState.failure(l));
      },
      (r) {
        emit(ZodiacState.loading());
        emit(ZodiacState.success(r));
      },
    );
  }
}

class CustomZodiacBloc extends StatelessWidget {
  final Widget Function(List<Zodiac>) success;

  const CustomZodiacBloc({
    super.key,
    required this.success,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ZodiacBloc, ZodiacState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return Container(
              margin: EdgeInsets.only(top: 24, left: 24, right: 24),
              child: Wrap(
                spacing: 12,
                runSpacing: 16,
                children: List.generate(
                  12,
                  (_) => ShimmerCard(
                    width: (screenWidth - 60) / 2,
                    borderRadius: BorderRadius.circular(10),
                    height: 114,
                  ),
                ).toList(),
              ),
            );
          },
          failure: (_) {
            return Container();
          },
          success: (List<Zodiac> zodiacs) {
            return success(zodiacs);
          },
        );
      },
    );
  }
}
