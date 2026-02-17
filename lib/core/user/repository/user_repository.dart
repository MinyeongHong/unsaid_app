import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:unsaid_app/core/user/model/user_model.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/fetch.dart';

abstract class UserRepository {
  Future<Either<Failure, User>> getUser();
  Future<Either<Failure, User>> addUser(UserAdd userAdd);
  Future<Either<Failure, User>> updateUser(DateTime? birth);
  Future<Either<Failure, void>> deleteUser();
}

class UserRepositoryImpl implements UserRepository {
  @override
  Future<Either<Failure, User>> getUser() async {
    try {
      final Map<String, dynamic> data = await fetchData(
        method: 'get',
        path: 'users',
      );

      final User user = User.fromJson(data);

      return Right(user);
    } catch (e) {
      return Left(Failure('getUser', e));
    }
  }

  @override
  Future<Either<Failure, User>> addUser(UserAdd userAdd) async {
    try {
      final Map<String, dynamic> data = await fetchData(
        method: 'post',
        path: 'users',
        headerType: 'auth',
        body: {
          'uid': userAdd.uid,
          'provider': userAdd.provider,
          'email': userAdd.email,
          'locale': Platform.localeName,
          'platform': Platform.operatingSystem,
        },
      );

      final User user = User.fromJson(data);

      return Right(user);
    } catch (e) {
      return Left(Failure('addUser', e));
    }
  }

  @override
  Future<Either<Failure, User>> updateUser(DateTime? birth) async {
    try {
      String? birthString;

      if (birth != null) {
        final y = birth.year.toString().padLeft(4, '0');
        final m = birth.month.toString().padLeft(2, '0');
        final d = birth.day.toString().padLeft(2, '0');

        birthString = '$y-$m-$d';
      }

      final dynamic data = await fetchData(
        method: 'put',
        path: 'users',
        body: {
          'birth': birthString,
          'is_birth_complete': true,
        },
      );

      final User user = User.fromJson(data);

      return Right(user);
    } catch (e) {
      return Left(Failure('updateUser', e));
    }
  }

  @override
  Future<Either<Failure, void>> deleteUser() async {
    try {
      final Map<String, dynamic> data = await fetchData(
        method: 'delete',
        path: 'users',
      );

      return Right(data);
    } catch (e) {
      return Left(Failure('deleteUser', e));
    }
  }
}
