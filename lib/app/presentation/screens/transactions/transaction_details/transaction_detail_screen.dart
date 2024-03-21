import 'package:budget_buddy/app/presentation/widgets/card_button_widget.dart';
import 'package:budget_buddy/app/presentation/widgets/space_widget.dart';
import 'package:budget_buddy/res/colors.dart';
import 'package:budget_buddy/res/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class TransactionDetailScreen extends StatelessWidget {
  const TransactionDetailScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: darkColor,
      resizeToAvoidBottomInset: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        title: Text('Transaction Details',style: GoogleFonts.poppins(
          fontSize:16,
          color: Colors.white,
          fontWeight: FontWeight.bold
        ),),
        leading: IconButton(onPressed: () {},
            icon: const Icon(Icons.arrow_back_rounded, size: 25,color: Colors.white,)),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0,vertical:20.0),
        child: Column(
          children: [
            Image.asset(shoppingIcon, width: 100,height: 100,),
            const SpaceWidget(height: 10,),
            Container(
              decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(15.0)
              ),
              padding: const EdgeInsets.all(5.0),
              child: Text('Income', style: GoogleFonts.poppins(
                fontSize:14,
                color:Colors.white
              ),),
            ),
            const SpaceWidget(height: 10,),
            Text('\$ 1000.0', style: GoogleFonts.poppins(
              fontSize:18,
              color:Colors.white,
              fontWeight:FontWeight.bold
            ),),
            const SpaceWidget(height: 20,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Status',style: GoogleFonts.poppins(
                  fontSize:12,
                  color:Colors.white
                ),),
                Text('Income', style: GoogleFonts.poppins(
                  fontSize:12,
                  color:Colors.green
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('From',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('Shopping', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Time',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('12:30 am', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Date',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('01-03-2024', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            const Divider(color: Colors.white,),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Earnings',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('\$ 870.0', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Fee',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('\$ 20.0', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            const Divider(color: Colors.white,),
            const SpaceWidget(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text('Total',style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),),
                Text('\$ 850.0', style: GoogleFonts.poppins(
                    fontSize:12,
                    color:Colors.white
                ),)
              ],
            ),
            const SpaceWidget(height: 10,),
            CardButtonWidget(isLoading: false,buttonColor: Colors.red, text: 'Download Receipt', onTap: () {})
          ],
        ),
      )
    );
  }
}
