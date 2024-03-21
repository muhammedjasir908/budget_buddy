import 'package:budget_buddy/app/presentation/controllers/auth/forgot_password/forgot_password_controller.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../../res/images.dart';
import '../../../widgets/card_button_widget.dart';
import '../../../widgets/space_widget.dart';

class ForgotPasswordScreen extends GetView<ForgotPasswordController> {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title:  Text('Forgot Password', style: GoogleFonts.poppins(
          fontSize: 16,
          color:Colors.white,
            fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 25,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Form(
          key: controller.formKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Image.asset(appImage, height: 50,width: 100,),
              const SpaceWidget(height: 10,),
              TextFormField(
                controller: emailController,
                keyboardType: TextInputType.name,
                validator: (value){
                  if(value == null || value.isNotEmpty){
                    return 'Please enter a valid email.';
                  }
                  return null;
                },
                style: GoogleFonts.poppins(
                    fontSize: 14,
                    color: Colors.white
                ),
                decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.white),
                    ),
                    prefixIcon: const Icon(Icons.email_outlined, size: 15,color: Colors.grey,),
                    hintText: 'Please enter email here',
                    hintStyle: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.grey
                    ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                ),
              ),
              const SpaceWidget(height: 10.0,),
              CardButtonWidget(
                isLoading: false,
                buttonColor: Colors.red,
                text: 'SEND LINK',
                onTap: () async => controller.onForgotPasswordTap(),),
              const SpaceWidget(height: 15.0,),
            ],
          ),
        ),
      ),
    );
  }
}
