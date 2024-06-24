import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_dynamic_links/firebase_dynamic_links.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:injectable/injectable.dart';

@module
abstract class FirebaseModule {
  FirebaseAuth get firebaseAuth => FirebaseAuth.instance;
  FirebaseFirestore get firebaseFirestore => FirebaseFirestore.instance;
  FirebaseStorage get firebaseStorage => FirebaseStorage.instance;
  FirebaseDynamicLinks get firebaseDynamicLinks =>
      FirebaseDynamicLinks.instance;
}
