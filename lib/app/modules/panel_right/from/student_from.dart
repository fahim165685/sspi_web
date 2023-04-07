import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sspi_web/app/modules/panel_right/from/controller/student_controller.dart';
import 'package:sspi_web/helper/constants.dart';

import '../../../components/custom_drop_down.dart';
import '../../../components/image_picker.dart';
import 'components/custom_text_filed.dart';

class StudentForm extends StatelessWidget{
  const StudentForm({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    StudentController controller=Get.put(StudentController());
    final fromKey = GlobalKey<FormState>();

    return Scaffold(
      body: Obx(() =>  SafeArea(
      child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30),
      child: Form(
        onChanged: () {
          final isValidFrom = fromKey.currentState!.validate();
          controller.onValid.value=isValidFrom;
        },
        autovalidateMode: AutovalidateMode.onUserInteraction,
        key: fromKey,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              h10(),
              const CircleAvatar(
                radius: 50,
                backgroundImage: AssetImage('assets/images/sspi_logo.png'),
              ),
              h10(),
              FittedBox(
                child: Text(
                  "Shebapolly Science and Polytechnic Institute \nS T U D E N T    I N F O R M A T I O N  ",
                  textAlign: TextAlign.center,
                  style:
                  GoogleFonts.raleway(fontSize: 30, color: kSecondaryColor),
                ),
              ),
              h10(),
              h10(),
              Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  "Give us the correct information you have.",
                  textAlign: TextAlign.left,
                  style:
                  GoogleFonts.bebasNeue(fontSize: 30, color: kSecondaryColor),
                ),
              ),
              h10(),
              Row(
                children: [
                  Expanded(
                    flex: 5,
                    child: CustomTextFiled(
                      controller: controller.nameCon,
                      labelText: "Name",
                      validator: (value) {
                        if(value!.isEmpty){
                          return "Fill Out The Form";
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(width: 10,),
                  Expanded(
                    flex: 2,
                    child: CustomTextFiled(
                    controller: controller.ageCon,
                    labelText: "Age",
                      validator: (value) {
                        var check = RegExp("^[A-Za-z]");
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        } else if (check.hasMatch(value)) {
                          return "Enter valid age ";
                        }  else if (value.length > 3) {
                          return "Enter valid age ";
                        }
                        return null;
                      },
                  ),)
                ],
              ),
              h10(),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextFiled(
                      controller: controller.rollCon,
                      labelText: "Roll",
                      validator: (value) {
                        var check = RegExp("^[A-Za-z]");
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        } else if (check.hasMatch(value)) {
                          return "Enter Valid Roll ";
                        }
                        return null;
                      },
                    ),
                  ),
                  w10(),
                  Expanded(
                    flex: 4,
                    child: CustomTextFiled(
                      controller:controller.regCon,
                    labelText: "Reg",
                      validator: (value) {
                        var check = RegExp("^[A-Za-z]");
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        } else if (check.hasMatch(value)) {
                          return "Enter Valid Reg ";
                        }
                        return null;
                      },
                  ),)
                ],
              ),
              h10(),
              CustomDropdown(
                labelText: "Department",
                value: controller.departmentSel.value,
                items: controller.departmentItem,
                onChanged: (value) {
                  controller.departmentSel.value = value.toString();
                },
              ),
              h10(),
              Row(
                children: [
                  Expanded(
                    flex:3,
                    child: CustomTextFiled(
                      controller: controller.sessionCon,
                      labelText: "Session",
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        }
                        return null;
                      },
                    ), ),
                  w10(),
                  Expanded(
                    flex: 4,
                    child: CustomDropdown(
                      labelText: "Semester",
                      value: controller.semesterSel.value,
                      items: controller.semesterItem,
                      onChanged: (value) {
                        controller.semesterSel.value = value.toString();
                      },
                    ),
                  ),

                ],
              ),
              h10(),
              CustomTextFiled(
                controller: controller.emileCon,
                labelText: "Emile Addresses",
                validator: (value) {

                  bool isValid = kEmailValid.hasMatch(value.toString());
                  if (value!.isEmpty) {
                    return "Fill Out The Form";
                  } else if (isValid==false) {
                    return "Enter Valid Emile";
                  }
                  return null;
                },
              ),
              h10(),
              Row(
                children: [
                  Expanded(
                    flex: 3,
                    child: CustomTextFiled(
                      controller: controller.phoneCon,
                      labelText: "Phone",
                      maxLength: 11,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        }  else if (value.length < 11) {
                          return "Enter valid Phone Number ";
                        }
                        return null;
                      },
                    ),
                  ),
                  w10(),
                  Expanded(
                    flex: 4,
                    child: CustomTextFiled(
                      controller:controller.homePhoneCon,
                      labelText: "Home Phone",
                      maxLength: 11,
                      validator: (value) {
                        if (value!.isEmpty) {
                          return "Fill Out The Form";
                        }  else if (value.length < 11) {
                          return "Enter valid Phone Number ";
                        }
                        return null;
                      },
                    ),)
                ],
              ),
              h10(),
              Row(
                children: [
                  Expanded(
                    flex: 4,
                    child: CustomDropdown(
                      labelText: "Blood Grope",
                      value: controller.bloodGroupSel.value,
                      items: controller.bloodGroupItem,
                      onChanged: (value) {
                        controller.bloodGroupSel.value = value.toString();
                      },
                    ),
                  ),
                  w10(),
                  const Expanded(
                      flex: 2,
                      child: Text("Do you donate\nblood?")),
                  Expanded(
                    flex: 1,
                    child: bloodDownerButton(controller),)
                ],
              ),
              h10(),
              CustomTextFiled(
                controller: controller.addressCon,
                labelText: "Home Addresses",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Fill Out The Form";
                  }
                  return null;
                },
              ),
              h10(),
              CustomTextFiled(
                controller: controller.socialMediaAccountCon,
                labelText: "Social Media Account(Optional)",
              ),
              h10(),
              CustomTextFiled(
                controller: controller.aboutYourCon,
                maxLength: 500,
                labelText: "Write About Your Self(Optional)",
              ),
              h10(),
              ProfileImage(
                controller: controller,
              ),

              ElevatedButton(onPressed: (){
                controller.getImage();
              }, child: Text("Get IMG")),
               h10(),

              ElevatedButton(onPressed: (){
                controller.uploadImage();
              }, child: Text("uplode")),


              Align(
                alignment: Alignment.centerLeft,
                child: OnHover(
                  isValid: controller.onValid.value,
                  builder: (isHovered) {
                  return   ElevatedButton(
                      onPressed: (){
                       // print(webImage);
                        final isValidFrom = fromKey.currentState!.validate();
                        if(isValidFrom){
                         //controller.uploadData(pickImage: pickImage,webImage: webImage);
                        }else{
                        }
                      },
                      style: ButtonStyle(
                          backgroundColor: MaterialStatePropertyAll(kSecondaryColor.withOpacity(0.5)),
                          side: const MaterialStatePropertyAll(BorderSide(color: kSecondaryColor)),
                          fixedSize: const MaterialStatePropertyAll(
                              Size(200,50)
                          ),
                          shape: MaterialStatePropertyAll(RoundedRectangleBorder(borderRadius: BorderRadius.circular(50)))
                      ),
                      child: const Row(
                        children:   [
                          Expanded(
                              flex: 2,
                              child: Icon(Icons.upload,color: Colors.white,)),
                          Expanded(
                            flex: 1,
                            child: VerticalDivider(
                              color: Colors.white12,
                              thickness: 2,
                            ),
                          ),
                          Expanded(
                              flex: 5,
                              child: Text("UPLOAD",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w100,color: Colors.white),)),
                          Expanded(
                              flex: 2,
                              child: Icon(Icons.arrow_circle_right_outlined,color: Colors.white,))
                        ],
                      ));
                },),
              ),
              h10(),
              h10(),
            ],
          ),
        ),
      ),
    ),
      )),
    );
  }

  InkWell bloodDownerButton(StudentController controller) {
    return InkWell(
              onTap: (){
                controller.bloodDowner.value=!controller.bloodDowner.value;
                print(controller.bloodDowner);
              },
              radius: 5,
              hoverColor: Colors.transparent,
              borderRadius: BorderRadius.circular(10),
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 500),
                height: 50,
                width: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  border: Border.all(color: controller.bloodDowner.value?Colors.green:Colors.white24,width: 2),
                ),
                child: AnimatedOpacity(
                  duration: const Duration(milliseconds:500),
                  opacity: controller.bloodDowner.value?1:0,
                  child: const Center(
                    child: Icon(Icons.task_alt,color: Colors.red,size: 40),
                  ),
                )


              ),
            );
  }

  SizedBox h10()=>const SizedBox(
    height: 15,
  );

  SizedBox w10()=>const SizedBox(
    width: 15,
  );
}

class OnHover extends StatefulWidget {
  const OnHover({
    required this.builder,
    required this.isValid,
    Key? key}) : super(key: key);
  final Widget Function(bool isHovered) builder;
  final bool? isValid ;

  @override
  State<OnHover> createState() => _OnHoverState();
}

class _OnHoverState extends State<OnHover> {
  bool isHovered = false;

  @override
  Widget build(BuildContext context) {
    final hovered = Matrix4.identity()..translate(250,0,250);
    final transform =isHovered? hovered:Matrix4.identity();


    return MouseRegion(
      onEnter:widget.isValid==true?null: (_)=> onEntered(true),
      onExit: widget.isValid==true?null:  (_)=> onEntered(false),
      child: AnimatedContainer(
        duration: const Duration(milliseconds: 150),
        transform: transform,
        child: widget.builder(isHovered),
      ),
    );
  }
  void onEntered(bool isHovered){
    setState(() {
      this.isHovered = isHovered;
    });
  }
}

