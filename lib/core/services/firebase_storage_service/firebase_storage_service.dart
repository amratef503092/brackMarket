

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

class FirebaseStorageService 
{
  final FirebaseStorage _firebaseStorage = 
  FirebaseStorage.instance;

  Future<String> uploadImage({
    required File image,
    required String imageName,
  }) async {
    try {
      final Reference reference = _firebaseStorage.ref().child(imageName);
      await reference.putFile(image);
      return await reference.getDownloadURL();
    } on FirebaseException catch (e) 
    {
      print(e.toString());
      rethrow;
    }
  }
}