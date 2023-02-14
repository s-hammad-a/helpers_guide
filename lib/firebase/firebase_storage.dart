import 'dart:typed_data';
import 'package:file_picker_cross/file_picker_cross.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';

class StorageManager
{
  Future<String?> uploadFile() async {
    await FirebaseAuth.instance.signInAnonymously();
    FilePickerCross myFile = await FilePickerCross.importFromStorage();
    // FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.image);
    String? location;
    Uint8List fileBytes = myFile.toUint8List();
    String fileName = myFile.fileName!;

    // Upload file
    TaskSnapshot snapshot =  await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
    location = await snapshot.ref.getDownloadURL();
    //returns the download url
    return location;
  }
}