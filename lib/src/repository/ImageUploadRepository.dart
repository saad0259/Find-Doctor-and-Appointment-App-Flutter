import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' show Client;
import 'dart:io';
import 'package:path/path.dart';

class ImageUploadRepository {
  Client client = Client();

  Future uploadUserImageToFirebase(
      BuildContext context, File _imageFile) async {
    String fileName = basename(_imageFile.path);
    Reference firebaseStorageRef =
        FirebaseStorage.instance.ref().child('users/$fileName');
    UploadTask uploadTask = firebaseStorageRef.putFile(_imageFile);

    var value = await uploadTask;
    var url = await value.ref.getDownloadURL();

    return url;
  }
}
