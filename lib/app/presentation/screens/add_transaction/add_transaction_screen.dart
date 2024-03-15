import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/strings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AddTransactionScreen extends StatelessWidget {
  const AddTransactionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> categoryList = [
      shopping,
      foodDrinks,
      grocery,
      fuel,
      bill,
      gadgets,
      homeEssentials,
      transportation,
      movie,
      creditCard,
      donation,
      education,
      healthCare,
      investments,
      membership,
      netBanking,
      personalCare,
      salary,
      savings,
      subscription
    ];
    List<String> paymentModeList = [
      'Bank',
      'Card',
      'Online',
      'UPI',
      'Cheque',
      'Net Banking',
      'CDM'
    ];
    String? selectedCategory;
    String? selectedMode;
    TextEditingController amountController = TextEditingController();
    TextEditingController descriptionController = TextEditingController();
    bool isExpense = true;
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text(
          'Add Transaction',
          style: GoogleFonts.poppins(
              fontSize: 16, color: Colors.white, fontWeight: FontWeight.bold),
        ),
        leading: IconButton(
            onPressed: () {},
            icon: const Icon(
              Icons.arrow_back_rounded,
              size: 25,
              color: Colors.white,
            )),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20.0),
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                  child: OutlinedButton(onPressed: () {}, child: Text('Income', style: GoogleFonts.poppins(
                      fontSize:14,
                      color:Colors.white
                  ),)),
                ),
                const SpaceWidget(width: 10,),
                Expanded(
                  child: OutlinedButton(
                    style: ButtonStyle(
                      backgroundColor: MaterialStateProperty.all(isExpense ? Colors.red : Colors.transparent)
                    ),
                      onPressed: () {}, 
                      child: Text('Expense', style: GoogleFonts.poppins(
                      fontSize:14,
                      color: Colors.white
                  ),)),
                ),
              ],
            ),
            const SpaceWidget(
              height: 10,
            ),
            TextFormField(
              controller: amountController,
              keyboardType: TextInputType.number,
              validator: (value){
                if(value == null || value.isNotEmpty){
                  return 'Please enter a valid amount.';
                }
                return null;
              },
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Colors.white
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.money,
                  size: 15,
                  color: Colors.grey,
                ),
                hintText: 'Please enter amount here',
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
            const SpaceWidget(
              height: 10,
            ),
            DropdownButtonFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                ),
              ),
                hint: Text(
                  'Please select a category',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
                value: selectedCategory,
                items: categoryList.map((value) {
                  return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  selectedCategory = newValue;
                }),
            const SpaceWidget(height: 10,),
            TextFormField(
              controller: descriptionController,
              keyboardType: TextInputType.text,
              decoration: InputDecoration(
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(8.0),
                  borderSide: const BorderSide(
                      color: Colors.white
                  ),
                ),
                prefixIcon: const Icon(
                  Icons.note_add_outlined,
                  size: 15,
                  color: Colors.grey,
                ),
                hintText: 'Please enter Description here',
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
            const SpaceWidget(height: 10,),
            DropdownButtonFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(8.0),
                  ),
                ),
                hint: Text(
                  'Please select a payment mode',
                  style: GoogleFonts.poppins(fontSize: 14, color: Colors.white),
                ),
                value: selectedMode,
                items: paymentModeList.map((value) {
                  return DropdownMenuItem(
                      value: value,
                      child: Text(
                        value,
                        style: GoogleFonts.poppins(
                            fontSize: 14, color: Colors.black),
                      ));
                }).toList(),
                onChanged: (newValue) {
                  selectedMode = newValue;
                }),
            const SpaceWidget(height: 10,),
            CardButtonWidget(buttonColor: Colors.red, text: 'Add', onTap: () {}),
            const SpaceWidget(height: 10,)
          ],
        ),
      ),
    );
  }
}
