import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/icon_card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SignInScreen extends StatelessWidget {
  const SignInScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Sign In',
          style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.white,
              fontWeight: FontWeight.bold
          )),
        leading: IconButton(
            onPressed: () {}, 
            icon: const Icon(
              Icons.arrow_back_rounded, 
              size: 25,
              color: Colors.white,
            ),),
      ),
      body: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              appImage,
              width: 100,
              height: 70,
              fit: BoxFit.contain,
            ),
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
                  borderSide: const BorderSide(
                      color: Colors.white
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.email_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
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
                    borderSide: const BorderSide(color: Colors.white),
                  ),
                  prefixIcon: const Icon(Icons.password_outlined, size: 15,color: Colors.white,),
                  suffixIcon: IconButton(onPressed: () {}, icon: const Icon(Icons.visibility, size: 15,)),
                  hintText: 'Please enter password here',
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
            TextButton(onPressed: () {
              Get.toNamed(AppPages.forgotPassword);
            }, child: Text('Forgot password', style: GoogleFonts.poppins(
              fontSize: 16,
              color: Colors.red,
              fontWeight: FontWeight.bold
            ),)),
            const SpaceWidget(height: 5.0,),
            CardButtonWidget(buttonColor: Colors.red, text: 'LOGIN',onTap: () {
              Get.toNamed(AppPages.home);
            },),
            const SpaceWidget(height: 15.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const Expanded(child: Divider(color: Colors.white,)),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: Text('or',style: GoogleFonts.poppins(
                    color: Colors.white
                  ),),
                ),
                const Expanded(child: Divider(color: Colors.white,))
              ],
            ),
            const SpaceWidget(height: 15.0,),
            const Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconCardButtonWidget(size: 30, image: googleIcon),
                SizedBox(width:40),
                IconCardButtonWidget(size: 30, image: facebookIcon)
              ],
            ),
            const SpaceWidget(height: 15.0,),
            const Divider(color: Colors.white,),
            const SpaceWidget(height: 5.0,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text("Don't have an account? ",style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.white
                ),),
                TextButton(onPressed: () {
                  Get.toNamed(AppPages.signUp);
                }, child: Text('Sign Up', style: GoogleFonts.poppins(
                  fontSize: 16,
                  color: Colors.red,
                    fontWeight: FontWeight.bold
                ),))
              ],
            )
          ],
        ),
      ),
    );
  }
}
