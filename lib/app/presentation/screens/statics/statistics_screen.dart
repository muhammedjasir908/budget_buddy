import 'package:budget_buddy/app/presentation/widgets/line_chart_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../../res/colors.dart';
import '../../../../res/images.dart';
import '../home/home_screen.dart';

class StatisticsScreen extends StatefulWidget {
  const StatisticsScreen({super.key});

  @override
  State<StatisticsScreen> createState() => _StatisticsScreenState();
}

class _StatisticsScreenState extends State<StatisticsScreen> with TickerProviderStateMixin {

  TabController? _tabController;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _tabController = TabController(length: 4, vsync: this,initialIndex: 0);
  }

  @override
  Widget build(BuildContext context) {
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
    ];
    return SafeArea(
        child: Padding(
          padding: const EdgeInsets.only(left: 10.0, right: 10.0,top: 10.0,bottom: 20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Statistics', style: GoogleFonts.poppins(
                fontSize:16,
                fontWeight: FontWeight.bold,
                color:Colors.white
              ),),
              const SpaceWidget(height: 10,),
              Expanded(
                flex: 0,
                child: SizedBox(
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
                        Tab(text: 'Today',),
                        Tab(text: 'Weekly',),
                        Tab(text: 'Monthly',),
                        Tab(text: 'Yearly',),
                      ]
                  ),
                ),
              ),
              const SpaceWidget(height: 10,),
              Card(
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width,
                  height: 250,
                  child: const LineChartWidget(),
                ),
              ),
              const SpaceWidget(height: 10,),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  TextButton(onPressed: () {}, child: Text('Category',
                  style: GoogleFonts.poppins(
                    fontSize:14,
                    color:Colors.white
                  ),)),
                  TextButton(onPressed: () {}, child: Text('Top Spending',
                    style: GoogleFonts.poppins(
                        fontSize:14,
                        color:Colors.white
                    ),)),
                  TextButton(onPressed: () {}, child: Text('Top Income',
                    style: GoogleFonts.poppins(
                        fontSize:14,
                        color:Colors.white
                    ),))
                ],
              ),
              const SpaceWidget(height: 10,),
              Expanded(child: SizedBox(
                child: ListView.builder(
                    itemCount: transactionList.length,
                    physics: const BouncingScrollPhysics(),
                    shrinkWrap: true,
                    itemBuilder: (context,index){
                      return InkWell(
                        onTap: () {
                          // Get.toNamed(AppPages.transactionDetails);
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
              ))
            ],
          ),
        ));
  }
}
