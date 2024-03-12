import 'dart:ffi';

import 'package:flutter/material.dart';

class SpaceWidget extends StatelessWidget {
  const SpaceWidget({super.key, this.height, this.width});

  final double? height,width;

  @override
  Widget build(BuildContext context) {
    return height != null ? SizedBox(
      height: height,
    ) : SizedBox(width: width,);
  }
}
