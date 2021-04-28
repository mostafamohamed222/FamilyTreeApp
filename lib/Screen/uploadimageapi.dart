import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';


class FirebaseApi {
  static UploadTask uploadFile(String des, File file) {
    try {
      final ref = FirebaseStorage.instance.ref(des);
      return ref.putFile(file);
    } on FirebaseException catch (e) {
      return null;
    }
  }
}
