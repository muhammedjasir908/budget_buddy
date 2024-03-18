import 'package:budget_buddy/app/presentation/controllers/category/category_controller.dart';
import 'package:budget_buddy/res/colors.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../widgets/space_widget.dart';

class CategoryScreen extends GetView<CategoryController> {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0,
                vertical: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text('Categories', style:
                      GoogleFonts.poppins(
                          fontSize:16,
                          color: Colors.white,
                        fontWeight:FontWeight.bold
                      ),),
                    ),
                    IconButton(onPressed: () {}, icon: const
                    Icon(Icons.search_outlined, size: 25,
                      color: Colors.red,))
                  ],
                ),
                const SpaceWidget(height: 10,),
                Expanded(
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    itemCount: controller.categoryList.length,
                      itemBuilder: (context, index){
                        return Card(
                          color: darkColor,
                          elevation: 15,
                          child: SizedBox(
                            width: MediaQuery.sizeOf(context).width,
                            height: 80,
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Row(
                                children: [
                                  Image.asset(controller.categoryList[index].categoryImage, width: 50,height: 50,),
                                  const SpaceWidget(width: 10,),
                                  Expanded(child: Text(controller.categoryList[index].categoryName, style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:Colors.white
                                  ),),),
                                  Text('\$ 100',style: GoogleFonts.poppins(
                                      fontSize:16,
                                      color:Colors.white,
                                      fontWeight: FontWeight.bold
                                  ),)
                                ],
                              ),
                            ),
                          ),
                        );
                      }
                  ),
                )
              ],
            ),
          )
      ),
    );
  }
}
