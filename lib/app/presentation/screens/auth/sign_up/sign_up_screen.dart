import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../widgets/card_button_widget.dart';
import '../../../widgets/icon_card_button_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController nameController = TextEditingController();
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController confirmPasswordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign Up',style: TextStyle(
          fontSize: 14,
        ),),
        leading: IconButton(onPressed: () {}, icon: const Icon(Icons.arrow_back_rounded, size: 25,)),
      ),
      body: Padding(padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Image.asset(appImage, height: 50,width: 100,),
          const SpaceWidget(height: 10,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.name,
            validator: (value){
              if(value == null || value.isNotEmpty){
                return 'Please enter a valid username.';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                prefixIcon: const Icon(Icons.account_circle_outlined, size: 15,color: Colors.grey,),
                hintText: 'Please enter username here',
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
          const SpaceWidget(height: 10,),
          TextFormField(
            controller: emailController,
            keyboardType: TextInputType.emailAddress,
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
                prefixIcon: const Icon(Icons.email_outlined, size: 15,color: Colors.grey,),
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
          TextFormField(
            controller: passwordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value){
              if(value == null || value.isNotEmpty){
                return 'Please enter a valid password.';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                prefixIcon: const Icon(Icons.password_outlined, size: 15,color: Colors.grey,),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility, size: 15,)),
                hintText: 'Please enter password here',
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
          TextFormField(
            controller: confirmPasswordController,
            keyboardType: TextInputType.visiblePassword,
            validator: (value){
              if(value == null || value.isNotEmpty){
                return 'Please enter a valid password.';
              }
              return null;
            },
            decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
                prefixIcon: const Icon(Icons.password_outlined, size: 15,color: Colors.grey,),
                suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility, size: 15,)),
                hintText: 'Please enter confirm password here',
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
          CardButtonWidget(buttonColor: Colors.red, text: 'SIGN UP',onTap: () {},),
          const SpaceWidget(height: 15.0,),
          const Row(
            children: [
              Expanded(child: Divider(color: Colors.black,)),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0),
                child: Text('or'),
              ),
              Expanded(child: Divider(color: Colors.black,))
            ],
          ),
          const SpaceWidget(height: 15.0,),
          const Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              IconCardButtonWidget(size: 35, image: googleIcon),
              SizedBox(width: 40,),
              IconCardButtonWidget(size: 35, image: facebookIcon)
            ],
          ),
          const SpaceWidget(height: 15.0,),
          const Divider(color: Colors.black,),
          const SpaceWidget(height: 15.0,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text("Already have an account? ",style: TextStyle(
                  fontSize: 14
              ),),
              TextButton(onPressed: () {
                Get.back();
              }, child: const Text('Login', style: TextStyle(
                  fontSize: 14,
                  color: Colors.red
              ),))
            ],
          )
        ],
      ),),
    );
  }
}
