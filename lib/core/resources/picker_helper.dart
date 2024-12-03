import 'dart:io';

import 'package:easy_localization/easy_localization.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickerHelper {
  static Future<DateTime?> pickDate(
      {DateTime? initialDate, required BuildContext context}) async {
    final DateTime currentDate = DateTime.now();
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: initialDate ??
          DateTime(currentDate.year - 5, currentDate.month, currentDate.day),
      firstDate: DateTime(currentDate.year - 100),
      lastDate:
          DateTime(currentDate.year - 5, currentDate.month, currentDate.day),
      helpText: 'select_birthdate'.tr(),
      errorFormatText: 'enter_valid_date'.tr(),
      errorInvalidText: 'enter_valid_date'.tr(),
      fieldHintText: 'select_birthdate'.tr(),
      fieldLabelText: 'birthdate'.tr(),
    );
    return picked;
  }

  static Future<File?> pickGalleryImage() async {
    final imagePicker = ImagePicker();
    final photo = await imagePicker.pickImage(source: ImageSource.gallery);
    if (photo != null) return File(photo.path);
    return null;
  }

  static Future<File?> pickTextFile() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowMultiple: false,
      allowCompression: true,
      allowedExtensions: ['pdf', 'doc', 'docx', 'txt'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  static Future<File?> pickMP4File() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: ['mp4'],
    );
    if (result != null) {
      file = File(result.files.single.path!);
      return file;
    } else {
      return null;
    }
  }

  static Future<File?> pickAudioFile() async {
    File? file;
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: false,
      type: FileType.custom,
      allowCompression: true,
      allowedExtensions: ['mp3', 'm4a', 'wav', 'caf'],
    );
    if (result != null) {
      file = File(result.files.single.path!);

      return file;
    } else {
      return null;
    }
  }
}
