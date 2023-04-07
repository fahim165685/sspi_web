import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sspi_web/app/modules/panel_right/from/controller/student_controller.dart';
import 'package:sspi_web/helper/constants.dart';

class ProfileImage extends StatefulWidget {
  const ProfileImage({Key? key, required this.controller}) : super(key: key);

  final StudentController controller;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {

  Future<void> getImage()async{
    print("Open Get image");
    if(!kIsWeb){
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
      if(image  != null){
        var selected = File(image.path);
        setState(() {
          widget.controller.pickImage = selected;
          widget.controller.fileName = image.name;
        });
      }else{
        print("No Image Picked");
      }
    }
    else if(kIsWeb){

      final ImagePicker picker0 = ImagePicker();
      XFile? image = await picker0.pickImage(source: ImageSource.gallery,imageQuality: 50);
      if(image  != null){
        var f = await image.readAsBytes();

        setState(() {
          widget.controller.pickImage = File('a');
          widget.controller.webImage = f;
          widget.controller.fileName = image.name;
        });
      }else{
        print("No Image Picked");
      }
    }else{
      print("Summing was wrong");
    }
  }
  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 16 / 9,
      child: InkWell(
        borderRadius: BorderRadius.circular(10),
        onTap: () => getImage(),
        child: Ink(
          decoration: BoxDecoration(
            color: kPrimaryLightColor,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Center(
            child: (widget.controller.pickImage == null)
                ? CircleAvatar(
                    radius: 40,
                    backgroundColor: Colors.white24,
                    child: SvgPicture.asset(
                      "assets/icon/camera.svg",
                      color: kSecondaryColor,
                      width: 40,
                    ))
                : kIsWeb
                    ? Image.memory(
                        widget.controller.webImage,
                        fit: BoxFit.fill,
                      )
                    : Image.file(
                        widget.controller.pickImage!,
                        fit: BoxFit.fill,
                      ),
          ),
        ),
      ),
    );
  }
}
