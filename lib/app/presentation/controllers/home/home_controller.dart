import 'package:get/get.dart';

import '../../../../res/images.dart';
import '../../screens/home/home_screen.dart';



class HomeController extends GetxController{

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


}