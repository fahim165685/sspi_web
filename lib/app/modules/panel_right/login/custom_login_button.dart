import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sspi_web/app/modules/panel_right/from/components/from_widget_tree.dart';


import '../../../../helper/constants.dart';
import '../../../components/custom_text_form_filed.dart';
import 'controllers/login_controller.dart';


class CustomButton extends StatelessWidget {
  const CustomButton({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    LoginController controller = Get.put(LoginController());

    final formKey = GlobalKey<FormState>();

    final List item = [
      ["Teacher", "teacher"],
      ["Student", "student"],
    ];

    return Obx(() => Form(
      key: formKey,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: Container(
        height: 60,
        width: 250,
        clipBehavior: Clip.antiAlias,
        decoration: BoxDecoration(
        border: Border.all(color: kSecondaryColor),
        borderRadius: BorderRadius.circular(11),
        color: Colors.white.withOpacity(0.1)),
        child: Row(
      children: List.generate(
        item.length,
        (index) => Expanded(
          child: InkWell(
            borderRadius: BorderRadius.circular(10),
            onTap: () {
              controller.selectItem(index);

              showDialog<void>(
                context: context,
                barrierDismissible: false,
                builder: (BuildContext dialogContext) {
                  return Obx(() => AlertDialog(
                        title: Text('${item[index][0]} Login ',
                            style: const TextStyle(
                                color: Colors.grey,
                                fontSize: 20,
                                fontWeight: FontWeight.w500)),
                        content: Column(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            if(controller.seIndex.value==0)
                            CustomTextFormField(
                              controller: controller.teacherEmileController,
                              labelText: "Enter UserName",
                              keyboardType: TextInputType.emailAddress,
                              prefixIcon: Icon(Icons.email_outlined,
                                  size: 20, color: Colors.grey[400]),
                              validator: (userName) {
                                if (userName!.isEmpty) {
                                  return "Please Enter User Name";

                                }
                                return null;
                              },
                            ),
                            CustomTextFormField(
                              controller:(controller.seIndex.value==0)? controller.teacherPassController:controller.stdPassController,
                              labelText: "Enter Password",
                              keyboardType: TextInputType.visiblePassword,
                              obscureText: controller.isShow.value,
                              suffixIcon: InkWell(
                                onTap: () => controller.showPass(),
                                borderRadius: BorderRadius.circular(50),
                                child: Icon(
                                    controller.isShow.value == true
                                        ? Icons.visibility_off_outlined
                                        : Icons.visibility_outlined,
                                    size: 20),
                              ),
                              prefixIcon: Icon(Icons.lock_outline,
                                  color: Colors.grey[400], size: 20),
                              validator: (password) {
                                if (password!.isEmpty) {
                                  return "Please Enter Password";
                                }
                                return null;
                              },
                            ),
                            Align(
                              alignment: Alignment.topRight,
                              child:IconButton(
                                icon: const Icon(Icons.info_outline),
                                onPressed: () {
                                  showDialog<void>(
                                            context: context,
                                            builder:
                                                (BuildContext dialogContext) {
                                              return AlertDialog(
                                                title: const Text('UserName & Password'),
                                                content: const SelectableText('if you do not know the username or\npassword please Contact \n\n01722-452791(Atik Sir)'),
                                                actions: <Widget>[
                                                  TextButton(
                                                    child: const Text('Back'),
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                  ),
                                                ],
                                              );
                                            },
                                          );
                                        },
                                tooltip: "Help ",
                              ),
                            ),
                           /* OutlinedButton(
                                onPressed: () {
                                  Get.offAll(()=>FromWidgetTree(value: item[index][1],) );

                                },
                                style: ButtonStyle(
                                    shape: MaterialStatePropertyAll(
                                        RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(50),
                                        )),
                                    side:  const MaterialStatePropertyAll(
                                        BorderSide(
                                          color: kSecondaryColor,
                                          width: 2,
                                        ))),
                                child: const Text("Login")),*/
                          ],
                        ),
                        actions: <Widget>[
                          OutlinedButton(
                              onPressed: () {
                                Get.back();
                              },
                              style: ButtonStyle(
                                shape: MaterialStatePropertyAll(
                                    RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(50),
                                )),
                              ),
                              child: const Text("Cansel")),
                          OutlinedButton(
                              onPressed: () {
                                //Teacher
                                final bool validTeacherUserName = controller.teacherUserName.hasMatch(controller.teacherEmileController.text);
                                final bool validTeacherPass = controller.teacherPass.hasMatch(controller.teacherPassController.text);
                                //Student
                                final bool validStdPass = controller.stdPass.hasMatch(controller.stdPassController.text);


                                final isValidFrom = formKey.currentState!.validate();
                                if (isValidFrom) {
                                  if(controller.seIndex.value==0){
                                    if (validTeacherUserName == false) {
                                      buildSnackBar("Username");
                                    } else if ( validTeacherPass == false) {
                                      buildSnackBar("Password");
                                    } else {
                                      Get.offAll(()=>FromWidgetTree(value: item[index][1],) );
                                    }
                                  }else{
                                if ( validStdPass == false) {
                                  buildSnackBar("Password");
                                } else {
                                  Get.offAll(()=>FromWidgetTree(value: item[index][1],) );
                                  print(
                                      "<<<<<<<<<<<<<<<<<Student Login>>>>>>>>>>>>>>>>>");
                                }
                                  }
                                }
                              },
                              style: ButtonStyle(
                                  shape: MaterialStatePropertyAll(
                                      RoundedRectangleBorder(
                                    borderRadius:
                                        BorderRadius.circular(50),
                                  )),
                                  side:  const MaterialStatePropertyAll(
                                      BorderSide(
                                    color: kSecondaryColor,
                                    width: 2,
                                  ))),
                              child: const Text("Login")),
                        ],
                      ));
                },
              );

            },
            child: AnimatedContainer(
              duration: const Duration(milliseconds: 300),
              height: 60,
              width: 125,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: controller.seIndex.value == index
                    ? kSecondaryColor
                    : Colors.transparent,
              ),
              child: Center(
                  child: Text(
                item[index][0],
                style: GoogleFonts.roboto(
                    color: controller.seIndex.value == index
                        ? Colors.grey[800]
                        : kSecondaryColor,
                    fontSize: 18,
                    fontWeight: FontWeight.w500),
              )),
            ),
          ),
        ),
      ),
        ),
      ),
    ));
  }

  SnackbarController buildSnackBar( String massage) {
    return Get.snackbar(
      "Warning",
      "$massage Not Match",
      colorText: kPrimaryColor,
      isDismissible: false,
      backgroundColor: Colors.white.withOpacity(0.5),
      snackPosition: SnackPosition.BOTTOM,
      maxWidth: 400,
      margin: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
      icon: const Icon(
        Icons.close,
        color: Colors.redAccent,
        size: 35,
      ),
      duration: const Duration(seconds: 2),
    );
  }
}
