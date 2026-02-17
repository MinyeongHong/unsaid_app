import 'package:firebase_auth/firebase_auth.dart';

FirebaseAuth get firebaseAuth => FirebaseAuth.instance;

String? get currentUid => firebaseAuth.currentUser?.uid;
