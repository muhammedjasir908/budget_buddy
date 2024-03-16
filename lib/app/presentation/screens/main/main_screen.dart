import 'package:budget_buddy/app/presentation/screens/add_transaction/add_transaction_screen.dart';
import 'package:budget_buddy/app/presentation/screens/category/category_screen.dart';
import 'package:budget_buddy/app/presentation/screens/home/home_screen.dart';
import 'package:budget_buddy/app/presentation/screens/profile/profile_screen.dart';
import 'package:budget_buddy/app/presentation/screens/statics/statistics_screen.dart';
import 'package:budget_buddy/app/presentation/screens/transactions/transactions_screen.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../controllers/main/main_controller.dart';

class MainScreen extends GetView<MainController> {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: darkColor,
      body: Stack(
        children: [
          Obx(
            () => IndexedStack(
              index: controller.currentIndex.value,
              children: const [
                HomeScreen(),
                TransactionsScreen(),
                AddTransactionScreen(),
                StatisticsScreen(),
                ProfileScreen()
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding:
                  const EdgeInsets.only(left: 10.0, right: 10.0, bottom: 5.0),
              child: Card(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(25.0)),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Obx(
                      () => IconButton(
                          onPressed: () => controller.onIndexChange(0),
                          icon: Icon(
                            Icons.home_outlined,
                            size: 25,
                            color: controller.currentIndex.value == 0
                                ? Colors.red
                                : Colors.grey,
                          )),
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () => controller.onIndexChange(1),
                          icon: Icon(
                            Icons.receipt_long_outlined,
                            size: 25,
                            color: controller.currentIndex.value == 1
                                ? Colors.red
                                : Colors.grey,
                          )),
                    ),
                    const SizedBox(
                      height: 25,
                      width: 25,
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () => controller.onIndexChange(3),
                          icon: Icon(
                            Icons.insert_chart_outlined,
                            size: 25,
                            color: controller.currentIndex.value == 3
                                ? Colors.red
                                : Colors.grey,
                          )),
                    ),
                    Obx(
                      () => IconButton(
                          onPressed: () => controller.onIndexChange(4),
                          icon: Icon(
                            Icons.person_outline_outlined,
                            size: 25,
                            color: controller.currentIndex.value == 4
                                ? Colors.red
                                : Colors.grey,
                          )),
                    )
                  ],
                ),
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: EdgeInsets.only(bottom: 30),
              child: Obx(
                () => Card(
                  shape: CircleBorder(),
                  color: Colors.red,
                  child: IconButton(
                      onPressed: () => controller.onIndexChange(2),
                      icon: const Icon(
                        Icons.add_circle_outline,
                        size: 35,
                        color: Colors.white,
                      )),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
