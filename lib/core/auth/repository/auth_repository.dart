import 'package:dartz/dartz.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:unsaid_app/core/util/failure.dart';
import 'package:unsaid_app/core/util/firebase.dart';

abstract class AuthRepository {
  Future<Either<Failure, UserCredential>> signApple();
  Future<Either<Failure, UserCredential>> signGoogle();
}

class AuthRepositoryImpl implements AuthRepository {
  @override
  Future<Either<Failure, UserCredential>> signApple() async {
    try {
      final AppleAuthProvider appleAuthProvider = AppleAuthProvider();

      appleAuthProvider.addScope('email');

      final UserCredential userCredential = await firebaseAuth.signInWithProvider(
        appleAuthProvider,
      );

      return Right(userCredential);
    } catch (e) {
      return Left(Failure('signApple', e));
    }
  }

  @override
  Future<Either<Failure, UserCredential>> signGoogle() async {
    try {
      final GoogleSignIn googleSignIn = GoogleSignIn.instance;

      await googleSignIn.disconnect();

      await googleSignIn.initialize();

      if (!googleSignIn.supportsAuthenticate()) {
        throw 'This platform does not have a known authentication method';
      }

      final GoogleSignInAccount googleSignInAccount = await googleSignIn.authenticate();

      final GoogleSignInAuthentication googleSignInAuthentication =
          googleSignInAccount.authentication;

      final AuthCredential authCredential = GoogleAuthProvider.credential(
        idToken: googleSignInAuthentication.idToken,
      );

      final UserCredential userCredential = await firebaseAuth.signInWithCredential(authCredential);

      return Right(userCredential);
    } catch (e) {
      return Left(Failure('signGoogle', e));
    }
  }
}
