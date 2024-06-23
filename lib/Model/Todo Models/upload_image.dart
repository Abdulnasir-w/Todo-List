import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

/// Upload Image To Firebase Storage
uploadToFirebaseStorage(path, String name) async {
  Reference reference = FirebaseStorage.instance.ref();
  Reference referenceDirImage = reference.child('Images');
  Reference referenceImageToUpload = referenceDirImage.child(name);
  await referenceImageToUpload.putFile(File(path));
}

/// Download Image Url From Firebase Storage
Future<String> getImageFromFirebase(String imagePath) async {
  try {
    Reference reference =
        FirebaseStorage.instance.ref().child("Images/$imagePath");
    String downloadUrl = await reference.getDownloadURL();
    return downloadUrl;
  } catch (e) {
    throw Exception(e);
  }
}
