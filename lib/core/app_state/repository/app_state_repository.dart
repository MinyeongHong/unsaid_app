import 'package:dartz/dartz.dart';
import 'package:unsaid_app/core/app_state/model/app_state_model.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';

abstract class AppStateRepository {
  Future<Either<Failure, AppState>> getAppState();
}

class AppStateRepositoryImpl implements AppStateRepository {
  @override
  Future<Either<Failure, AppState>> getAppState() async {
    try {
      return Left(Failure('getAppState', 'test'));

      final Map<String, dynamic> data = await fetchData(
        method: 'get',
        path: 'app-states',
      );

      final AppState appState = AppState.fromJson(data);

      return Right(appState);
    } catch (e) {
      return Left(Failure('getAppState', e));
    }
  }
}
