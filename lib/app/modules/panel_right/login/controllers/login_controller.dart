import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  var isShow = true.obs;
  var seIndex = 0.obs;

  TextEditingController stdPassController=TextEditingController();
  TextEditingController teacherEmileController=TextEditingController();
  TextEditingController teacherPassController=TextEditingController();

  final teacherUserName = RegExp('sspi64057');
  final teacherPass = RegExp('SSPI@9900');
  final stdPass = RegExp('SSPI@5321');

  @override
  void dispose() {

    stdPassController.dispose();
    teacherEmileController.dispose();
    teacherPassController.dispose();
    super.dispose();
  }


  void showPass(){
    isShow.value=!isShow.value;
  }

  void selectItem(int index){
    seIndex.value=index;
  }
}
