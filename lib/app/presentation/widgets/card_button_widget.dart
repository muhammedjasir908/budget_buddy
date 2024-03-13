import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class CardButtonWidget extends StatelessWidget {
  const CardButtonWidget({super.key,required this.buttonColor, required this.text, required this.onTap});

  final String text;
  final Color buttonColor;

  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: () => onTap(),
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          fixedSize: Size(MediaQuery.sizeOf(context).width - 60, 50),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0)
          )
        ),
        child: Text(text, textAlign: TextAlign.center,
          style: GoogleFonts.poppins(
          fontSize: 14,
          fontWeight: FontWeight.bold,
          color: Colors.white
        ),));
  }
}
