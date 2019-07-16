import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';

import 'image_picker_dialog.dart';

class ImagePickerHandler extends StatefulWidget {
  ImagePickerDialog imagePicker;
  AnimationController _controller;
  ImagePickerListener _listener;
  String downloadUrl;

  ImagePickerHandler(this._listener, this._controller);

  Future openCamera() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.camera);
    cropImage(image);
  }

  Future openGallery() async {
    imagePicker.dismissDialog();
    var image = await ImagePicker.pickImage(source: ImageSource.gallery);
    cropImage(image);
  }

  void init() {
    imagePicker = new ImagePickerDialog(this, _controller);
    imagePicker.initState();
  }

  Future cropImage(File image) async {
    File croppedFile = await ImageCropper.cropImage(
      sourcePath: image.path,
      ratioX: 1.0,
      ratioY: 1.0,
      maxWidth: 512,
      maxHeight: 512,
    );

    _listener.onImageCropped(croppedFile);
//    StorageReference storageReference=FirebaseStorage.instance.ref().child('pUprofilepics/${AppDataProvider.instance.user.id}.jpg');
//    StorageUploadTask uploadTask = storageReference.putFile(croppedFile);
//    StorageTaskSnapshot taskSnapshot = await uploadTask.onComplete;
//    var url = await storageReference.getDownloadURL();
//    var url = "abc";
//    _listener.onUploaded(croppedFile,url);
  }

  showDialog(BuildContext context) {
    imagePicker.getImage(context);
  }

  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

abstract class ImagePickerListener {
  onImageCropped(File _image);

  onUploaded(File _image, String imgUrl);
}
