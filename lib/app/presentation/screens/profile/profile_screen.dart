import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/images.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(child:
    Padding(
      padding: const EdgeInsets.only(left: 20.0, right: 20.0,top: 10.0,bottom: 20.0),
    child: Column(
      // crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Profile', style: GoogleFonts.poppins(
            fontSize:16,
            fontWeight: FontWeight.bold,
            color:Colors.white
        ),),
        const SpaceWidget(height: 10.0,),
        const CircleAvatar(
          backgroundImage: AssetImage(appImage),
          radius: 80,
        ),
        const SpaceWidget(height: 10.0,),
        Text('Muhammed Jasir',style: GoogleFonts.poppins(
            fontSize:14,
            fontWeight: FontWeight.bold,
            color:Colors.white
        ),),
        const Padding(
          padding:  EdgeInsets.symmetric(horizontal: 10.0, vertical: 10.0),
          child:  Divider(color: Colors.white,),
        ),
        Row(
          children: [
            const Icon(Icons.person_outline_outlined, size: 25,color: Colors.white,),
            const SpaceWidget(width: 20,),
            Text('Personal Details',style: GoogleFonts.poppins(
                fontSize:14,
                color:Colors.white
            ),),
          ],
        ),
        const SpaceWidget(height: 10,),
        Row(
          children: [
            const Icon(Icons.password_outlined, size: 25,color: Colors.white,),
            const SpaceWidget(width: 20,),
            Text('Change Password',style: GoogleFonts.poppins(
                fontSize:14,
                color:Colors.white
            ),),
          ],
        ),
        const SpaceWidget(height: 10,),
        InkWell(
          onTap: () {
            Get.toNamed(AppPages.settings);
          },
          child: Row(
            children: [
              const Icon(Icons.settings, size: 25,color: Colors.white,),
              const SpaceWidget(width: 20,),
              Text('Settings',style: GoogleFonts.poppins(
                  fontSize:14,
                  color:Colors.white
              ),),
            ],
          ),
        ),
        const SpaceWidget(height: 10,),
        Row(
          children: [
            const Icon(Icons.privacy_tip_outlined, size: 25,color: Colors.white,),
            const SpaceWidget(width: 20,),
            Text('Data & Privacy',style: GoogleFonts.poppins(
                fontSize:14,
                color:Colors.white
            ),),
          ],
        ),
        const SpaceWidget(height: 10,),
        Row(
          children: [
            const Icon(Icons.logout, size: 25,color: Colors.white,),
            const SpaceWidget(width: 20,),
            Text('Logout',style: GoogleFonts.poppins(
                fontSize:14,
                color:Colors.red
            ),),
          ],
        ),
        const SpaceWidget(height: 10,),
      ],
    ),));
  }
}
