import 'package:dartz/dartz.dart';
import 'package:unsaid_app/app/zodiac/model/zodiac_model.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';
import 'package:unsaid_app/core/util/zodiac.dart';

abstract class ZodiacRepository {
  Future<Either<Failure, List<Zodiac>>> getZodiacs();
}

class ZodiacRepositoryImpl implements ZodiacRepository {
  @override
  Future<Either<Failure, List<Zodiac>>> getZodiacs() async {
    try {
      await Future.delayed(Duration(milliseconds: 500));

      return Right(zodiacList);

      final List<dynamic> data = await fetchData(
        method: 'get',
        path: 'zodiacs',
      );

      final List<Zodiac> zodiacs = data
          .map(
            (e) => Zodiac.fromJson(e),
          )
          .toList();

      return Right(zodiacs);
    } catch (e) {
      return Left(Failure('getZodiacs', e));
    }
  }
}
