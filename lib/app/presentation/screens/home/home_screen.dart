import 'package:budget_buddy/app/presentation/controllers/home/home_controller.dart';
import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HomeScreen extends GetView<HomeController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
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
                  const SpaceWidget(
                    width: 10,
                  ),
                  Expanded(
                    child: Text(
                      'Muhammed Jasir',
                      style: GoogleFonts.poppins(
                          fontSize: 14, color: Colors.white),
                    ),
                  ),
                  IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.notifications_none_outlined,
                        size: 25,
                        color: Colors.red,
                      ))
                ],
              ),
              const SpaceWidget(
                height: 10,
              ),
              Card(
                color: Colors.red,
                elevation: 10.0,
                child: SizedBox(
                  height: 100,
                  width: MediaQuery.sizeOf(context).width,
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Spent',
                          style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: Colors.white,
                          ),
                        ),
                        Text(
                          '\$ 10000',
                          style: GoogleFonts.poppins(
                              fontSize: 20,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'of \$ 20000',
                          style: GoogleFonts.poppins(
                              fontSize: 12, color: Colors.white),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              const SpaceWidget(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Categories',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppPages.category);
                    },
                    child: Text(
                      'See all',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SpaceWidget(
                height: 10,
              ),
              SizedBox(
                height: 250,
                width: MediaQuery.sizeOf(context).width,
                child: GridView.builder(
                    itemCount: controller.categoryList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 4,
                            mainAxisSpacing: 5,
                            crossAxisSpacing: 5,
                            mainAxisExtent: 120),
                    itemBuilder: (context, index) {
                      return Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Card(
                            color: Colors.transparent,
                            child: SizedBox(
                                width: 65,
                                height: 65,
                                child: Center(
                                    child: Image.asset(
                                  controller.categoryList[index].categoryImage,
                                  width: 45,
                                  height: 45,
                                ))),
                          ),
                          Text(
                            controller.categoryList[index].categoryName,
                            textAlign: TextAlign.center,
                            style: GoogleFonts.poppins(
                                fontSize: 10, color: Colors.white),
                          )
                        ],
                      );
                    }),
              ),
              const SpaceWidget(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Recent Transactions',
                    textAlign: TextAlign.left,
                    style: GoogleFonts.poppins(
                      fontSize: 16,
                      color: Colors.white,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.toNamed(AppPages.transaction);
                    },
                    child: Text(
                      'See all',
                      textAlign: TextAlign.left,
                      style: GoogleFonts.poppins(
                        fontSize: 12,
                        color: Colors.red,
                      ),
                    ),
                  )
                ],
              ),
              const SpaceWidget(
                height: 10,
              ),
              SizedBox(
                child: ListView.builder(
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.recentExpenseList.length,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
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
                                Image.asset(
                                  controller.recentExpenseList[index].image,
                                  width: 50,
                                  height: 50,
                                ),
                                const SpaceWidget(
                                  width: 10,
                                ),
                                Expanded(
                                    child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      controller.recentExpenseList[index].title,
                                      style: GoogleFonts.poppins(
                                          fontSize: 14, color: Colors.white),
                                    ),
                                    const SpaceWidget(
                                      height: 5,
                                    ),
                                    Text(
                                      controller.recentExpenseList[index].date,
                                      style: GoogleFonts.poppins(
                                          fontSize: 10, color: Colors.white),
                                    ),
                                  ],
                                )),
                                Text(
                                  "${controller.recentExpenseList[index].isExpense ? '-' : '+'}\$ ${controller.recentExpenseList[index].amount}",
                                  style: GoogleFonts.poppins(
                                      fontSize: 16,
                                      color: controller.recentExpenseList[index]
                                              .isExpense
                                          ? Colors.red
                                          : Colors.green,
                                      fontWeight: FontWeight.bold),
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    }),
              )
            ],
          ),
        ),
      ),
    ));
  }
}

class CategoryItem {
  int id;
  String categoryName;
  String categoryImage;

  CategoryItem(
      {required this.id,
      required this.categoryName,
      required this.categoryImage});
}

class ExpenseItem {
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
