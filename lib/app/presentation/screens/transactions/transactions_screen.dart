import 'package:budget_buddy/app/presentation/route/app_pages.dart';
import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/images.dart';
import '../home/home_screen.dart';

class TransactionsScreen extends StatefulWidget {
  const TransactionsScreen({super.key});

  @override
  State<TransactionsScreen> createState() => _TransactionsScreenState();
}

class _TransactionsScreenState extends State<TransactionsScreen> with TickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 3, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
    TextEditingController searchController = TextEditingController();
    List<ExpenseItem> transactionList =[
      ExpenseItem(id: 1, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
      ExpenseItem(id: 2, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
      ExpenseItem(id: 3, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
      ExpenseItem(id: 21, image: salaryIcon, title: 'Salary', date: '01-03-2024 10:00 am', amount: 10000.0,isExpense: false),
      ExpenseItem(id: 4, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
      ExpenseItem(id: 5, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 6, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
      ExpenseItem(id: 7, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
      ExpenseItem(id: 8, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
      ExpenseItem(id: 9, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
      ExpenseItem(id: 10, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 11, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
      ExpenseItem(id: 12, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
      ExpenseItem(id: 13, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
      ExpenseItem(id: 14, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
      ExpenseItem(id: 15, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 16, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
      ExpenseItem(id: 17, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
      ExpenseItem(id: 18, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
      ExpenseItem(id: 19, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
      ExpenseItem(id: 20, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 21, image: salaryIcon, title: 'Salary', date: '01-03-2024 10:00 am', amount: 5000.0,isExpense: false),
      ExpenseItem(id: 22, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 23, image: shoppingIcon,title: 'Shopping', date: '14-03-2024 10:15 am', amount: 100.0,isExpense: true),
      ExpenseItem(id: 24, image: foodIcon,title: 'Food & Drinks', date: '13-03-2024 12:00 am', amount: 50.0, isExpense: true),
      ExpenseItem(id: 25, image: fuelIcon,title: 'Fuel', date: '10-03-2024 10:00 pm', amount: 20.0, isExpense: true),
      ExpenseItem(id: 26, image: gadgetIcon,title: 'Gadgets', date: '05-03-2024 11:00 am', amount: 1000.0,isExpense: true),
      ExpenseItem(id: 27, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 28, image: salaryIcon, title: 'Salary', date: '01-03-2024 10:00 am', amount: 5000.0,isExpense: false),
      ExpenseItem(id: 29, image: billIcon, title: 'Bill', date: '01-03-2024 02:25 pm', amount: 2000.0,isExpense: true),
      ExpenseItem(id: 30, image: salaryIcon, title: 'Salary', date: '01-03-2024 10:00 am', amount: 5000.0,isExpense: false)
    ];
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: true,
      appBar: PreferredSize(
          preferredSize: Size(MediaQuery.sizeOf(context).width, 150),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SpaceWidget(height: 30,),
                Text('Transactions', style: GoogleFonts.poppins(
                    fontSize:16,
                    color:Colors.white,
                    fontWeight: FontWeight.bold
                ),),
                const SpaceWidget(height: 10,),
                Row(
                  children: [
                    Expanded(child: SizedBox(
                      height: 50,
                      child: TextFormField(
                        controller: searchController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(
                                color: Colors.white
                            ),
                          ),
                          prefixIcon: const Icon(
                            Icons.search_outlined,
                            size: 15,
                            color: Colors.grey,
                          ),
                          hintText: 'Search here',
                          hintStyle: GoogleFonts.poppins(
                              fontSize: 12,
                              color: Colors.grey
                          ),
                          focusedBorder: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(8.0),
                            borderSide: const BorderSide(color: Colors.white),
                          ),
                        ),
                      ),
                    ),),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.sort, size: 25,color: Colors.red,)),
                    const SpaceWidget(width: 10.0,),
                    IconButton(onPressed: () {}, icon: const Icon(Icons.tune_outlined, size: 25,color: Colors.red,)),
                  ],
                ),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  child: TabBar(
                    dividerColor: Colors.transparent,
                    indicatorColor: Colors.red,
                    splashFactory: NoSplash.splashFactory,
                    labelColor: Colors.red,
                    splashBorderRadius: BorderRadius.zero,
                    unselectedLabelColor: Colors.white,
                    controller: _tabController,
                      labelStyle: GoogleFonts.poppins(
                        fontSize:14,
                      ),
                      tabs: const [
                        Tab(text: 'All',),
                        Tab(text: 'Expense',),
                        Tab(text: 'Income',),
                      ]
                  ),
                )
              ],
            ),
          )
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 10.0,right: 10.0,top: 10.0,bottom: 30.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                itemCount: transactionList.length,
                  physics: const BouncingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (context,index){
                  return InkWell(
                    onTap: () {
                      Get.toNamed(AppPages.transactionDetails);
                    },
                    child: Card(
                      color: darkColor,
                      elevation: 15,
                      child: SizedBox(
                        width: MediaQuery.sizeOf(context).width,
                        height: 80,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Row(
                            children: [
                              Image.asset(transactionList[index].image, width: 50,height: 50,),
                              const SpaceWidget(width: 10,),
                              Expanded(child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(transactionList[index].title, style: GoogleFonts.poppins(
                                      fontSize: 14,
                                      color:Colors.white
                                  ),),
                                  const SpaceWidget(height: 5,),
                                  Text(transactionList[index].date, style: GoogleFonts.poppins(
                                      fontSize:10,
                                      color:Colors.white
                                  ),),
                                ],
                              )),
                              Text("${transactionList[index].isExpense ? '-': '+'}\$ ${transactionList[index].amount}",style: GoogleFonts.poppins(
                                  fontSize:16,
                                  color:transactionList[index].isExpense ? Colors.red : Colors.green,
                                  fontWeight: FontWeight.bold
                              ),)
                            ],
                          ),
                        ),
                      ),
                    ),
                  );
                  }
              ),
            ),
          ],
        ),
      ),
    );
  }
}
