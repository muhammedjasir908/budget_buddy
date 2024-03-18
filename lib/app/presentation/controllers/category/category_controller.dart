import 'package:budget_buddy/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../../res/images.dart';
import '../../screens/home/home_screen.dart';

class CategoryController extends GetxController{

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

  TextEditingController searchController = TextEditingController();


}