import 'package:flutter/material.dart';

class IconCardButtonWidget extends StatelessWidget {
  const IconCardButtonWidget({super.key,required this.size,required this.image});

  final String image;
  final double size;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(25.0),
            side: const BorderSide(color: Colors.white)
          )
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Image.asset(image, width: size,height: size,),),
        ));
  }
}
