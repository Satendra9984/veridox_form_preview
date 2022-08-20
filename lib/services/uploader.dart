import 'dart:typed_data';
import 'dart:io';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:veridox_form_preview/services/pick_file.dart';

class FileUploader {
  static Future<UploadTask?> uploadSingleFileToFirebase(
    String dbPath,
  ) async {
    return await PickFile.pickFileAndGetPath().then((file) async {
      if (file != null) {
        Uint8List data = await File(file).readAsBytes();
        return FirebaseStorage.instance.ref(dbPath).putData(data);
      } else {
        return null;
      }
    });
  }

  static Future<UploadTask?> uploadFileFromPath(
      {required String path, required String dbPath}) async {
    try {
      Uint8List data = await File(path).readAsBytes();
      return FirebaseStorage.instance.ref(dbPath).putData(data);
    } catch (e) {
      return null;
    }
  }
}
