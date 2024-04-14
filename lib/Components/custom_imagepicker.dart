import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:image_picker/image_picker.dart';

Future imagePicker(Function(String)? onImageSelected) async {
  final picker = ImagePicker();
  XFile? pickedFile = await picker.pickImage(source: ImageSource.gallery);
  String uniqueName = DateTime.now().toString();

  if (pickedFile != null) {
    /// File Uploading to Firebase Storage
    Reference reference = FirebaseStorage.instance.ref();
    Reference referenceDirImage = reference.child('Images');
    Reference referenceImageToUpload = referenceDirImage.child(uniqueName);
    await referenceImageToUpload.putFile(File(pickedFile.path));

    onImageSelected!(pickedFile.path);
  }
}
