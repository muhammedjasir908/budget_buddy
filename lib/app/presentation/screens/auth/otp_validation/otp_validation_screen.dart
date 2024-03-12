import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

import '../../../../../res/images.dart';
import '../../../widgets/card_button_widget.dart';
import '../../../widgets/space_widget.dart';

class OTPValidationScreen extends StatelessWidget {
  const OTPValidationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController otp1Controller = TextEditingController();
    TextEditingController otp2Controller = TextEditingController();
    TextEditingController otp3Controller = TextEditingController();
    TextEditingController otp4Controller = TextEditingController();
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text('OTP Validation', style: TextStyle(
          fontSize: 14,
        ),),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded, size: 25,)),
      ),
      body: Column(
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
                  controller: otp1Controller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isNotEmpty){
                      return 'Please enter a valid email.';
                    }
                    return null;
                  },
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SpaceWidget(width: 10,),
              Expanded(
                child: TextFormField(
                  controller: otp2Controller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isNotEmpty){
                      return 'Please enter a valid email.';
                    }
                    return null;
                  },
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SpaceWidget(width: 10,),
              Expanded(
                child: TextFormField(
                  controller: otp3Controller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isNotEmpty){
                      return 'Please enter a valid email.';
                    }
                    return null;
                  },
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
              const SpaceWidget(width: 10,),
              Expanded(
                child: TextFormField(
                  controller: otp4Controller,
                  keyboardType: TextInputType.number,
                  validator: (value){
                    if(value == null || value.isNotEmpty){
                      return 'Please enter a valid email.';
                    }
                    return null;
                  },
                  maxLength: 1,
                  textAlign: TextAlign.center,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                    counterText: '',
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(8.0),
                      borderSide: const BorderSide(color: Colors.grey),
                    ),
                  ),
                ),
              ),
            ],
          ),
          const SpaceWidget(height: 10.0,),
          CardButtonWidget(buttonColor: Colors.red, text: 'VALIDATE OTP',onTap: () {},),
          const SpaceWidget(height: 15.0,),
        ],
      ),
    );
  }
}
