import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';

uploadToFirebaseStorage(path) async {
  String uniqueName = DateTime.now().toString();
  Reference reference = FirebaseStorage.instance.ref();
  Reference referenceDirImage = reference.child('Images');
  Reference referenceImageToUpload = referenceDirImage.child(uniqueName);
  await referenceImageToUpload.putFile(File(path));
}
