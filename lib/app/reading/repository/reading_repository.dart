import 'package:dartz/dartz.dart';
import 'package:unsaid_app/app/reading/model/reading_model.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';

abstract class ReadingRepository {
  Future<Either<Failure, List<Reading>>> getReadings();
  Future<Either<Failure, Reading>> getReading(String id);
  Future<Either<Failure, Reading>> addReading(String question);
  Future<Either<Failure, void>> deleteReading(String id);
}

class ReadingRepositoryImpl implements ReadingRepository {
  @override
  Future<Either<Failure, List<Reading>>> getReadings({
    int limit = 20,
    String? cursor,
    String? cursorId,
  }) async {
    try {
      final qp = <String, dynamic>{
        'limit': limit,
        if (cursor != null && cursorId != null) 'cursor': cursor,
        if (cursor != null && cursorId != null) 'cursor_id': cursorId,
      };

      final dynamic data = await fetchData(
        method: 'get',
        path: 'readings',
        queryParameters: qp,
      );

      final items = (data['items'] as List<dynamic>? ?? [])
          .map((e) => Reading.fromJson(Map<String, dynamic>.from(e)))
          .toList();

      return Right(items);
    } catch (e) {
      return Left(Failure('getReadings', e));
    }
  }

  @override
  Future<Either<Failure, Reading>> getReading(String id) async {
    try {
      final dynamic data = await fetchData(
        method: 'get',
        path: 'readings/$id',
      );

      final reading = Reading.fromJson(Map<String, dynamic>.from(data));

      return Right(reading);
    } catch (e) {
      return Left(Failure('getReading', e));
    }
  }

  @override
  Future<Either<Failure, Reading>> addReading(String question) async {
    try {
      final Map<String, dynamic> data = await fetchData(
        method: 'post',
        path: 'gemini',
        body: {
          'prompt': question,
        },
      );

      final reading = Reading.fromJson(data);

      return Right(reading);
    } catch (e) {
      final int? status = (e is Map) ? e['status'] as int? : null;

      if (status == 429) {
        return Left(Failure('quota_exceeded', e));
      }

      return Left(Failure('addReading', e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteReading(String id) async {
    try {
      await fetchData(
        method: 'delete',
        path: 'readings/$id',
      );

      return Right(null);
    } catch (e) {
      return Left(Failure('deleteReading', e));
    }
  }
}
