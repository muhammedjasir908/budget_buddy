import 'package:budget_buddy/app/presentation/controllers/auth/otp_validation/otp_validation_controller.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../res/images.dart';
import '../../../widgets/card_button_widget.dart';
import '../../../widgets/space_widget.dart';

class OTPValidationScreen extends GetView<OTPValidationController> {
  const OTPValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text('OTP Validation', style: GoogleFonts.poppins(
          fontSize: 16,
          color:Colors.white,
            fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 25,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(appImage, height: 50,width: 100,),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Expanded(
                  child: TextFormField(
                    controller: controller.otp1Controller,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.isNotEmpty){
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                      fontSize: 20,
                      color:Colors.white
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(width: 10,),
                Expanded(
                  child: TextFormField(
                    controller: controller.otp2Controller,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.isNotEmpty){
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    textInputAction: TextInputAction.next,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color:Colors.white
                    ),
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(width: 10,),
                Expanded(
                  child: TextFormField(
                    controller: controller.otp3Controller,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.isNotEmpty){
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color:Colors.white
                    ),
                    textInputAction: TextInputAction.next,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(width: 10,),
                Expanded(
                  child: TextFormField(
                    controller: controller.otp4Controller,
                    keyboardType: TextInputType.number,
                    validator: (value){
                      if(value == null || value.isNotEmpty){
                        return 'Please enter a valid email.';
                      }
                      return null;
                    },
                    maxLength: 1,
                    textAlign: TextAlign.center,
                    style: GoogleFonts.poppins(
                        fontSize: 20,
                        color:Colors.white
                    ),
                    textInputAction: TextInputAction.done,
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                      counterText: '',
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(8.0),
                        borderSide: const BorderSide(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            const SpaceWidget(height: 20.0,),
            CardButtonWidget(buttonColor: Colors.red,
              text: 'VALIDATE OTP',onTap: () {
              Get.toNamed(AppPages.changePassword);
              },),
            const SpaceWidget(height: 15.0,),
          ],
        ),
      ),
    );
  }
}
