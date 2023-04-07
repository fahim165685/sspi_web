import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:image_picker/image_picker.dart';

class StudentController extends GetxController {
  var onValid = false.obs;
  var bloodDowner = false.obs;


  Uint8List webImage = Uint8List(8);
  File? pickImage;
  String fileName = "";
  late firebase_storage.Reference ref;
  //blood Downer

  RxList<String> semesterItem = [
    'First',
    'Second',
    'Third',
    'Fourth',
    'Fifth',
    'Sixth',
    'Seventh',
    'Eighth'
  ].obs;
  RxString semesterSel = "First".obs;
    var bloodGroupItem = ["A+", "O+", "B+", "AB+", "A-", "O-", "B-", "AB-"].obs;
    var bloodGroupSel = "O+".obs;
  var departmentItem = ["Computer", "CIVIL", "Electrical"].obs;
  var departmentSel = "Computer".obs;

  String? aboutText ="Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.";

  TextEditingController nameCon = TextEditingController();
  TextEditingController ageCon = TextEditingController();
  TextEditingController rollCon = TextEditingController();
  TextEditingController regCon = TextEditingController();
  TextEditingController emileCon = TextEditingController();
  TextEditingController phoneCon = TextEditingController();
  TextEditingController homePhoneCon = TextEditingController();
  TextEditingController addressCon = TextEditingController();
  TextEditingController sessionCon = TextEditingController();
  TextEditingController aboutYourCon = TextEditingController();
  TextEditingController socialMediaAccountCon = TextEditingController();

  @override
  void dispose() {
    nameCon.dispose();
    ageCon.dispose();
    rollCon.dispose();
    regCon.dispose();
    emileCon.dispose();
    phoneCon.dispose();
    homePhoneCon.dispose();
    addressCon.dispose();
    sessionCon.dispose();
    aboutYourCon.dispose();
    socialMediaAccountCon.dispose();

    super.dispose();
  }


  Future<void> getImage()async{
    print("Open Get image");
    if(!kIsWeb){
      final ImagePicker picker = ImagePicker();
      XFile? image = await picker.pickImage(source: ImageSource.gallery,imageQuality: 50);
      if(image  != null){
        var selected = File(image.path);
        fileName=image.name;
        pickImage = selected;
      }else{
        print("No Image Picked");
      }
    }
    else if(kIsWeb){

      final ImagePicker picker0 = ImagePicker();
      XFile? image = await picker0.pickImage(source: ImageSource.gallery,imageQuality: 50);
      if(image  != null){
        var f = await image.readAsBytes();
        webImage=f;
        fileName=image.name;
        pickImage=File('a');
      }else{
        print("No Image Picked");
      }

    }else{
      print("Summing was wrong");
    }
  }

  Future<void> uploadImage() async {
    try{
      firebase_storage.UploadTask? uploadTask;
      firebase_storage.Reference ref = firebase_storage.FirebaseStorage.instance.ref().child("Student Picture/computer").child("${DateTime.now().millisecondsSinceEpoch}$fileName");

      final metaData = firebase_storage.SettableMetadata(contentType: 'image/jpeg');

      uploadTask = ref.putData(webImage, metaData);
      uploadTask.whenComplete(() async{
        ref.getDownloadURL().then((value){print(value);});
      });

    }catch(e){print(e);}
  }
  ///Up-lode Data on Firebase

  Future<void> uploadData({
    File? pickImage,
    Uint8List? webImage,
}) async {
    loadingSpinner();
    FirebaseFirestore.instance.collection('student').doc(departmentSel.toLowerCase()).collection(rollCon.text).add({
      'name': nameCon.text,
      'age': ageCon.text,
      'roll': rollCon.text,
      'reg': regCon.text,
      'department': departmentSel.toString(),
      'session': sessionCon.text,
      'emile': emileCon.text,
      'phone': phoneCon.text,
      'homePhone': homePhoneCon.text,
     /* 'SMAccount': socialMediaAccountCon.text.isEmpty?"www.facebook.com":socialMediaAccountCon.text,
      'WAYourSelf': aboutYourCon.text.isEmpty?aboutText:aboutYourCon,*/

    }).then((value) async {
      ref = firebase_storage.FirebaseStorage.instance.ref().child("student images/${DateTime.now()}");
      await ref.putFile(webImage as File).whenComplete(() async {
        await ref.getDownloadURL().then((value) async {
          FirebaseFirestore.instance.collection('student').doc(departmentSel.toLowerCase()).collection(rollCon.text).doc().update({
            'image':value.toString(),
          });
        });
      });
      Get.back();
      Get.snackbar("Success","Data uploaded successfully",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.cloud_done_outlined,color: Colors.green,size: 40,),
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          maxWidth:350,
          backgroundColor:  Colors.green.withOpacity(0.3)
      );
    }).onError((error, stackTrace) {
      Get.back();
      Get.snackbar("Error","Something was wrong\nPlease try again later$error",
          snackPosition: SnackPosition.BOTTOM,
          icon: const Icon(Icons.cloud_done_outlined,color: Colors.green,size: 40,),
          padding: const EdgeInsets.symmetric(horizontal: 8,vertical: 20),
          margin: const EdgeInsets.symmetric(vertical: 20),
          maxWidth:350,
          backgroundColor: const Color(0xFFff5230).withOpacity(0.3)
      );
    });
  }

  Future loadingSpinner () async{
    Get.dialog(
        barrierDismissible: false,
        const Stack(
          children:  [
            Center(
              child: FittedBox(child: Text("Uploading...",)),
            ),
            SizedBox(
              width: double.infinity,
              height: double.infinity,
              child: FittedBox(
                child: Padding(
                  padding: EdgeInsets.all(2.0),
                  child: CircularProgressIndicator(
                    strokeWidth: 1.5,
                  ),
                ),
              ),
            ),
          ],
        ));

  }
}
