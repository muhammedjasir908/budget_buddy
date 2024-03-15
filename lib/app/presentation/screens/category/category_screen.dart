import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/strings.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/images.dart';
import '../../widgets/space_widget.dart';
import '../home/home_screen.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<CategoryItem> categoryList = [
      CategoryItem(id: 1, categoryName: shopping, categoryImage: shoppingIcon),
      CategoryItem(id: 2, categoryName: foodDrinks, categoryImage: foodIcon),
      CategoryItem(id: 3, categoryName: grocery, categoryImage: groceryIcon),
      CategoryItem(id: 4, categoryName: fuel, categoryImage: fuelIcon),
      CategoryItem(id: 5, categoryName: bill, categoryImage: billIcon),
      CategoryItem(id: 6, categoryName: gadgets, categoryImage: gadgetIcon),
      CategoryItem(id: 7, categoryName: homeEssentials, categoryImage: homeEssentialIcon),
      CategoryItem(id: 8, categoryName: transportation, categoryImage: transportationIcon),
      CategoryItem(id: 9, categoryName: movie, categoryImage: movieIcon),
      CategoryItem(id: 10, categoryName: creditCard, categoryImage: creditICon),
      CategoryItem(id: 11, categoryName: donation, categoryImage: donationIcon),
      CategoryItem(id: 12, categoryName: education, categoryImage: educationIcon),
      CategoryItem(id: 13, categoryName: healthCare, categoryImage: healthCareIcon),
      CategoryItem(id: 14, categoryName: investments, categoryImage: investingIcon),
      CategoryItem(id: 15, categoryName: membership, categoryImage: membershipIcon),
      CategoryItem(id: 16, categoryName: netBanking, categoryImage: netBankingIcon),
      CategoryItem(id: 17, categoryName: personalCare, categoryImage: personalCareIcon),
      CategoryItem(id: 18, categoryName: salary, categoryImage: salaryIcon),
      CategoryItem(id: 19, categoryName: savings, categoryImage: savingsIcon),
      CategoryItem(id: 20, categoryName: subscription, categoryImage: subscriptionICon)
    ];
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
                    itemCount: categoryList.length,
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
                                  Image.asset(categoryList[index].categoryImage, width: 50,height: 50,),
                                  const SpaceWidget(width: 10,),
                                  Expanded(child: Text(categoryList[index].categoryName, style: GoogleFonts.poppins(
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
