import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/icon_card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: const Text('Sign In', style: TextStyle(
          color: Colors.white,
          fontSize: 14
        ),),
        leading: IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.arrow_back_rounded, 
              size: 25,)),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            Image.asset(appImage,width: 100,height: 70,fit: BoxFit.contain,),
            const SpaceWidget(height: 10.0,),
            TextFormField(
              controller: emailController,
              keyboardType: TextInputType.emailAddress,
              validator: (value){
                if(value == null || value.isNotEmpty){
                  return 'Please enter a valid email address.';
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
                )
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
                  prefixIcon: const Icon(Icons.email_outlined, size: 15,color: Colors.grey,),
                  suffix: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility, size: 15,)),
                  hintText: 'Please enter password here',
                  hintStyle: const TextStyle(
                      fontSize: 12,
                      color: Colors.grey
                  )
              ),
            ),
            const SpaceWidget(height: 10.0,),
            TextButton(onPressed: () {}, child: const Text('Forgot password', style: TextStyle(
              fontSize: 14,
              color: Colors.red
            ),)),
            const SpaceWidget(height: 5.0,),
            const CardButtonWidget(buttonColor: Colors.red, text: 'LOGIN'),
            const SpaceWidget(height: 5.0,),
            const Row(
              children: [
                Expanded(child: Divider()),
                Text('OR'),
                Expanded(child: Divider())
              ],
            ),
            const SpaceWidget(height: 5.0,),
            const Row(
              children: [
                Expanded(child: IconCardButtonWidget(size: 35, image: googleIcon)),
                Expanded(child: IconCardButtonWidget(size: 35, image: facebookIcon))
              ],
            ),
            const SpaceWidget(height: 5.0,),
            const Divider(),
            const SpaceWidget(height: 5.0,),
            Row(
              children: [
                const Text("Don't have an account? ",style: TextStyle(
                  fontSize: 14
                ),),
                TextButton(onPressed: () {}, child: const Text('Sign Up', style: TextStyle(
                  fontSize: 14,
                  color: Colors.red
                ),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
