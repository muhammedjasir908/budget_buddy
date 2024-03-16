import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Settings', style: GoogleFonts.poppins(
          fontSize:16,
          fontWeight: FontWeight.bold,
          color:Colors.white
        ),),
        leading: IconButton(onPressed: () => Get.back(), icon: const Icon(
          Icons.arrow_back_rounded,
          size: 25,
          color: Colors.white,
        )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 10.0,vertical: 10.0),
        child: Column(
          children: [
           Card(
             shape: RoundedRectangleBorder(
               borderRadius: BorderRadius.circular(15.0)
             ),
             // margin: const EdgeInsets.symmetric(horizontal: 10.0),
             color: darkColor,
             elevation: 10,
             child: ExpansionTile(
               shape: RoundedRectangleBorder(
                   borderRadius: BorderRadius.circular(15.0)
               ),
               title: const SizedBox(),
                 leading: Text('Currency',style: GoogleFonts.poppins(
                     fontSize:14,
                     color:Colors.white
                 ),),
               trailing: SizedBox(
                 width: 45,
                 child: Row(
                   mainAxisAlignment: MainAxisAlignment.end,
                   children: [
                     Text('USD',style: GoogleFonts.poppins(
                         fontSize:12,
                         color:Colors.grey
                     ),),
                     const Icon(Icons.arrow_forward_ios_rounded, size: 15,color: Colors.red,)
                   ],
                 ),
               ),
               children: const [
                 SizedBox(height: 40,width: 200,)
               ],
             ),
           ),
            const SpaceWidget(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0),
              color: darkColor,
              elevation: 10,
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                title: const SizedBox(),
                leading: Text('Language',style: GoogleFonts.poppins(
                    fontSize:14,
                    color:Colors.white
                ),),
                trailing: SizedBox(
                  width: 70,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('English ',style: GoogleFonts.poppins(
                          fontSize:12,
                          color:Colors.grey
                      ),),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 15,color: Colors.red,)
                    ],
                  ),
                ),
                children: [
                  SizedBox(height: 40,width: 200,)
                ],
              ),
            ),
            const SpaceWidget(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0),
              color: darkColor,
              elevation: 10,
              child: ExpansionTile(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0)
                ),
                title: const SizedBox(),
                leading: Text('Theme',style: GoogleFonts.poppins(
                    fontSize:14,
                    color:Colors.white
                ),),
                trailing: SizedBox(
                  width: 50,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Dark ',style: GoogleFonts.poppins(
                          fontSize:12,
                          color:Colors.grey
                      ),),
                      const Icon(Icons.arrow_forward_ios_rounded, size: 15,color: Colors.red,)
                    ],
                  ),
                ),
                children: [
                  SizedBox(height: 40,width: 200,)
                ],
              ),
            ),
            const Padding(
              padding:  EdgeInsets.symmetric(vertical: 10.0, horizontal: 10.0),
              child: Divider(color: Colors.white,),
            ),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0),
              color: darkColor,
              elevation: 10,
              child: SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 25.0),
                  child: Row(
                    children: [
                      Icon(Icons.info_outline, size: 15,color: Colors.white,),
                      SpaceWidget(width: 20,),
                      Expanded(
                        child: Text('About ',style: GoogleFonts.poppins(
                            fontSize:12,
                            color:Colors.grey
                        ),),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 15,color: Colors.red,)
                    ],
                  ),
                ),
              ),
            ),
            const SpaceWidget(height: 10,),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(15.0)
              ),
              // margin: const EdgeInsets.symmetric(horizontal: 10.0),
              color: darkColor,
              elevation: 10,
              child: SizedBox(
                height: 55,
                child: Padding(
                  padding: const EdgeInsets.only(left: 15.0, right: 25.0),
                  child: Row(
                    children: [
                      Icon(Icons.help_outline, size: 15,color: Colors.white,),
                      SpaceWidget(width: 20,),
                      Expanded(
                        child: Text('Help ',style: GoogleFonts.poppins(
                            fontSize:12,
                            color:Colors.grey
                        ),),
                      ),
                      Icon(Icons.arrow_forward_ios_rounded, size: 15,color: Colors.red,)
                    ],
                  ),
                ),
              ),
            ),
            const SpaceWidget(height: 10,),
          ],
        ),
      ),
    );
  }
}
