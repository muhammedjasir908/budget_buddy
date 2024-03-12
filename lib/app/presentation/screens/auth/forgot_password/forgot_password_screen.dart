import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../../res/images.dart';
import '../../../widgets/card_button_widget.dart';
import '../../../widgets/space_widget.dart';

class ForgotPasswordScreen extends StatelessWidget {
  const ForgotPasswordScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: const Text('Forgot Password', style: TextStyle(
          fontSize: 14,
        ),),
        leading: IconButton(onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 15,)),
      ),
      body: Column(
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
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                prefixIcon: const Icon(Icons.account_circle_outlined, size: 15,color: Colors.grey,),
                hintText: 'Please enter email here',
                hintStyle: const TextStyle(
                    fontSize: 12,
                    color: Colors.grey
                ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8.0),
                borderSide: const BorderSide(color: Colors.grey),
              ),
            ),
          ),
          const SpaceWidget(height: 10.0,),
          CardButtonWidget(buttonColor: Colors.red,
            text: 'SEND OTP',
            onTap: () {
            Get.toNamed(AppPages.otpValidation);
            },),
          const SpaceWidget(height: 15.0,),
        ],
      ),
    );
  }
}
