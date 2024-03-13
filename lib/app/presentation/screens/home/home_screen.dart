import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
  List<CategoryItem> categoryList = [
    CategoryItem(id: 1, categoryName: 'Shopping', categoryImage: shoppingIcon),
    CategoryItem(id: 2, categoryName: 'Food & Drinks', categoryImage: foodIcon),
    CategoryItem(id: 3, categoryName: 'Grocery', categoryImage: groceryIcon),
    CategoryItem(id: 4, categoryName: 'Fuel', categoryImage: fuelIcon),
    CategoryItem(id: 5, categoryName: 'Bill', categoryImage: billIcon),
    CategoryItem(id: 6, categoryName: 'Gadgets', categoryImage: gadgetIcon),
    CategoryItem(id: 7, categoryName: 'Home Essentials', categoryImage: homeEssentialIcon),
    CategoryItem(id: 8, categoryName: 'Transportation', categoryImage: transportationIcon)
  ];
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: true,
      body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundImage: AssetImage(appImage),
                      radius: 20,
                    ),
                    const SpaceWidget(width: 10,),
                    Expanded(
                      child: Text('Muhammed Jasir', style: GoogleFonts.poppins(
                        fontSize:14,
                        color: Colors.white
                      ),),
                    ),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.notifications_none_outlined, size: 25,color: Colors.red,))
                  ],
                ),
                const SpaceWidget(height: 10,),
                Card(
                  color: Colors.red,
                  elevation: 10.0,
                  child: SizedBox(
                    height: 100,
                    width: MediaQuery.sizeOf(context).width,
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical: 10.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Spent', style: GoogleFonts.poppins(
                            fontSize:12,
                            color:Colors.white,
                          ),),
                          Text('\$ 10000', style: GoogleFonts.poppins(
                            fontSize:20,
                            color:Colors.white,
                            fontWeight: FontWeight.bold
                          ),),
                          Text('of \$ 20000', style: GoogleFonts.poppins(
                            fontSize:12,
                            color:Colors.white
                          ),)
                        ],
                      ),
                    ),
                  ),
                ),
                const SpaceWidget(height: 10,),
                Text('Categories',
                  textAlign: TextAlign.left,
                  style: GoogleFonts.poppins(
                  fontSize:16,
                  color:Colors.white,
                ),),
                const SpaceWidget(height: 10,),
                SizedBox(
                  height: 250,
                  width: MediaQuery.sizeOf(context).width,
                  child: GridView.builder(
                    itemCount: categoryList.length,
                      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 4,
                          mainAxisSpacing: 5,crossAxisSpacing: 5, mainAxisExtent: 120),
                      itemBuilder: (context,index){
                        return Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Card(
                              child: SizedBox(
                                width: 65,
                                  height: 65,
                                  child: Center(child: Image.asset(categoryList[index].categoryImage, width: 45,height: 45,))),
                            ),
                            Text(categoryList[index].categoryName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.poppins(
                              fontSize:10,
                              color:Colors.white
                            ),)
                          ],
                        );
                      }),
                )
              ],
            ),
          )
      ),
    );
  }
}

class CategoryItem{
  int id;
  String categoryName;
  String categoryImage;

  CategoryItem({
    required this.id,
    required this.categoryName,
    required this.categoryImage
});
}