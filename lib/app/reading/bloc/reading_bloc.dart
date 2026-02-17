import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/app/reading/repository/reading_repository.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/log.dart';
import 'package:unsaid_app/core/widget/loading.dart';

part 'reading_bloc.freezed.dart';
part 'reading_event.dart';
part 'reading_state.dart';

class ReadingBloc extends Bloc<ReadingEvent, ReadingState> {
  static ReadingRepository _readingRepository = ReadingRepositoryImpl();

  ReadingBloc() : super(ReadingState.loading()) {
    on<_Fetch>(_fetch);
    on<_Add>(_add);
    on<_Delete>(_delete);
  }

  void _fetch(_, emit) async {
    final either = await _readingRepository.getReadings();

    either.fold(
      (l) {
        emit(ReadingState.failure(l));
      },
      (r) {
        emit(ReadingState.loading());
        emit(ReadingState.success(r));
      },
    );
  }

  void _add(_Add _add, emit) async {
    try {
      final currentState = state;

      if (currentState is _Success) {
        final List<Reading> newReadings = [_add.reading, ...currentState.readings];

        emit(ReadingState.loading());
        emit(ReadingState.success(newReadings));
      }
    } catch (e) {
      errorLog('ReadingBloc', e);
    }
  }

  void _delete(_Delete _delete, emit) async {
    try {
      final currentState = state;

      if (currentState is _Success) {
        final newReadings = currentState.readings
            .where((reading) => reading.id != _delete.id)
            .toList();

        emit(ReadingState.loading());
        emit(ReadingState.success(newReadings));
      }
    } catch (e) {
      errorLog('ReadingBloc', e);
    }
  }

  static Future<Reading> getReading(String id) async {
    final either = await _readingRepository.getReading(id);

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<Reading> addReading(String question) async {
    final either = await _readingRepository.addReading(question);

    return either.fold(
      (l) => throw l,
      (r) => r,
    );
  }

  static Future<void> deleteReading(String id) async {
    final either = await _readingRepository.deleteReading(id);

    either.fold(
      (l) => throw l,
      (r) => r,
    );
  }
}

class CustomReadingBloc extends StatelessWidget {
  final Widget Function(List<Reading>) success;

  const CustomReadingBloc({super.key, required this.success});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ReadingBloc, ReadingState>(
      builder: (context, state) {
        return state.when(
          loading: () {
            return CustomLoading(
              margin: EdgeInsets.only(top: 32),
            );
          },
          failure: (_) {
            return Container();
          },
          success: (List<Reading> readings) {
            return success(readings);
          },
        );
      },
    );
  }
}
