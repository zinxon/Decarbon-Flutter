import 'dart:convert';
import 'dart:io';

import 'package:DeCarbon/ui/page/merchants/style/merchants_style.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class MerchantsImagePickerField extends StatefulWidget {
  final Function({@required String imageBase64}) onImageSelected;
  final String imagePlaceholderUrl;

  const MerchantsImagePickerField({
    Key key,
    @required this.onImageSelected,
    this.imagePlaceholderUrl,
  }) : super(key: key);

  @override
  _MerchantsImagePickerFieldState createState() =>
      _MerchantsImagePickerFieldState();
}

class _MerchantsImagePickerFieldState extends State<MerchantsImagePickerField> {
  File image;

  Future<void> showGallery() async {
    final pickedFile =
        await ImagePicker().getImage(source: ImageSource.gallery);
    setState(() {
      image = File(pickedFile.path);
      List<int> imageBytes = image.readAsBytesSync();
      String base64Image = base64Encode(imageBytes);
      widget.onImageSelected(imageBase64: base64Image);
    });
  }

  Widget buildAddImageWidget() {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      padding: EdgeInsets.all(50),
      decoration: BoxDecoration(
        border: Border.all(
          color: MerchantsStyle.mainFieldBorderColor,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      width: 200,
      height: 200,
      child: Center(
        child: GestureDetector(
          onTap: () => showGallery(),
          child: Image.asset(
            'assets/icons/add.png',
            fit: BoxFit.contain,
          ),
        ),
      ),
    );
  }

  Widget buildEditImageWidget({String imagePlaceholderUrl}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 20),
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        image: DecorationImage(
            image: imagePlaceholderUrl == null
                ? FileImage(File(image.path))
                : NetworkImage(imagePlaceholderUrl),
            fit: BoxFit.fill),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.black.withOpacity(0.2),
        ),
        child: Center(
          child: GestureDetector(
            onTap: () => showGallery(),
            child: Text(
              'Edit',
              style: TextStyle(
                color: Colors.white,
                fontSize: 20,
              ),
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    Widget imagePickerWidget;
    if (image == null && widget.imagePlaceholderUrl != null) {
      imagePickerWidget =
          buildEditImageWidget(imagePlaceholderUrl: widget.imagePlaceholderUrl);
    } else if (image == null) {
      imagePickerWidget = buildAddImageWidget();
    } else {
      imagePickerWidget = buildEditImageWidget();
    }

    return Align(
      alignment: Alignment.centerLeft,
      child: imagePickerWidget,
    );
  }
}
