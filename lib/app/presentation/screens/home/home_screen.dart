import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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

  List<ExpenseItem> recentExpenseList =[
    ExpenseItem(id: 1, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
    ExpenseItem(id: 2, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
    ExpenseItem(id: 3, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
    ExpenseItem(id: 4, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
    ExpenseItem(id: 5, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
    ExpenseItem(id: 6, image: salaryIcon, title: 'Salary', date: '01-03-2024 10:00 am', amount: 5000.0,isExpense: false)
  ];

    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
          child: SizedBox(
            width: MediaQuery.sizeOf(context).width,
            height: MediaQuery.sizeOf(context).height,
            child: SingleChildScrollView(
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Categories',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize:16,
                          color:Colors.white,
                        ),),
                      TextButton(onPressed: () {
                        Get.toNamed(AppPages.category);
                      }, child: Text('See all',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize:12,
                          color:Colors.red,
                        ),),)
                    ],
                  ),
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
                                color:Colors.transparent,
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
                  ),
                  const SpaceWidget(height: 10,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('Recent Transactions',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize:16,
                          color:Colors.white,
                        ),),
                      TextButton(onPressed: () {
                        Get.toNamed(AppPages.transaction);
                      }, child: Text('See all',
                        textAlign: TextAlign.left,
                        style: GoogleFonts.poppins(
                          fontSize:12,
                          color:Colors.red,
                        ),),)
                    ],
                  ),
                  const SpaceWidget(height: 10,),
                  SizedBox(
                    child: ListView.builder(
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: recentExpenseList.length,
                        shrinkWrap: true,
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
                                    Image.asset(recentExpenseList[index].image, width: 50,height: 50,),
                                    const SpaceWidget(width: 10,),
                                    Expanded(child: Column(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.start,
                                      children: [
                                        Text(recentExpenseList[index].title, style: GoogleFonts.poppins(
                                            fontSize: 14,
                                            color:Colors.white
                                        ),),
                                        const SpaceWidget(height: 5,),
                                        Text(recentExpenseList[index].date, style: GoogleFonts.poppins(
                                            fontSize:10,
                                            color:Colors.white
                                        ),),
                                      ],
                                    )),
                                    Text("${recentExpenseList[index].isExpense ? '-': '+'}\$ ${recentExpenseList[index].amount}",style: GoogleFonts.poppins(
                                        fontSize:16,
                                        color:recentExpenseList[index].isExpense ? Colors.red : Colors.green,
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
            ),
          ),
        )
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

class ExpenseItem{
  int id;
  String image;
  String title;
  String date;
  double amount;
  bool isExpense;

  ExpenseItem({
    required this.id,
    required this.image,
    required this.title,
    required this.date,
    required this.amount,
    required this.isExpense,
});
}