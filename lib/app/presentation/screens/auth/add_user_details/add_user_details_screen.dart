import 'dart:ffi';

import 'package:budget_buddy/app/presentation/controllers/auth/add_user_details/add_user_details_controller.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../route/app_pages.dart';
import '../../../widgets/card_button_widget.dart';

class AddUserDetailsScreen extends GetView<AddUserDetailsController> {
  const AddUserDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Add User Details',style: GoogleFonts.poppins(
          fontSize:16,
          fontWeight:FontWeight.bold,
          color:Colors.white
        ),),
        centerTitle: true,
        leading: const SizedBox(),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
        child: Column(
          children: [
            Center(
              child: SizedBox(
                width: 150,
                height: 150,
                child: Stack(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(shoppingIcon),
                      radius: 70,
                    ),
                    Positioned(
                      bottom: 5,
                        right: 0,
                        child: Card(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(55),
                            side: const BorderSide(color: Colors.red,width: 2)
                          ),
                          child: IconButton(onPressed: () {
                            controller.onCameraTap();
                          },
                          icon: const Icon(Icons.camera_alt_outlined,
                            size: 30,color: darkColor,)),
                        ))
                  ],
                ),
              ),
            ),
            const SpaceWidget(height: 10,),
            TextFormField(
              controller: controller.usernameController,
              keyboardType: TextInputType.text,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid username.';
                }
                return null;
              },
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.person_outline_outlined ,
                  size: 15,
                  color: Colors.grey,
                ),
                hintText: 'Please enter username here',
                hintStyle:
                GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SpaceWidget(height: 10,),
            TextFormField(
              controller: controller.mobileNoController,
              keyboardType: TextInputType.number,
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a valid mobile no.';
                }
                return null;
              },
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.phone_android_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
                hintText: 'Please enter mobile no here',
                hintStyle:
                GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SpaceWidget(height: 10,),
            DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                iconEnabledColor: Colors.white,
                iconDisabledColor: Colors.white,
                // hint: Text(
                //   'Please select a ',
                //   style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                // ),
                value: controller.selectedUserStatus.value,
                items: controller.userStatusList.map((value) {
                  return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.white),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  controller.selectedUserStatus.value = newValue!;
                }),
            const SpaceWidget(height: 10,),
            TextFormField(
              controller: controller.incomeController,
              keyboardType: TextInputType.number,
              style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
                prefixIcon: const Icon(
                  Icons.monetization_on_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
                hintText: 'Please enter income here',
                hintStyle:
                GoogleFonts.poppins(fontSize: 12, color: Colors.grey),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(color: Colors.white),
                ),
              ),
            ),
            const SpaceWidget(height: 20,),
            CardButtonWidget(
              isLoading: false,
              buttonColor: Colors.red,
              text: 'Save',
              onTap: () async {
                await Get.toNamed(AppPages.addAccountDetails);
                // await controller.onRegisterTap();
              },
            ),
          ],
        ),
      ),
    );
  }
}
