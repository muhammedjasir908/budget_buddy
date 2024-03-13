import 'dart:io';

import 'package:flutter/material.dart';

class ProfilePicWidget extends StatelessWidget {
  const ProfilePicWidget({super.key, required this.imagePath, this.isEdit = false,required this.onClick});

  final String imagePath;
  final bool isEdit;
  final VoidCallback onClick;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Stack(
        children: [
          _buildImage(),
          Positioned(
            bottom: 0,
              right: 4,
              child: _buildEditIcon(Colors.grey),
          )
        ],
      ),
    );
  }

  Widget _buildImage(){
    final image = imagePath.contains('https://')
    ? NetworkImage(imagePath)
        : FileImage(File(imagePath));

    return ClipOval(
      child: Material(
        color: Colors.white,
        child: Ink.image(
          image: image as ImageProvider,
          fit: BoxFit.cover,
          width: 128,
          height: 128,
          child: InkWell(onTap: onClick,),
        ),
      ),
    );
  }

  Widget _buildEditIcon(Color color) => _buildCircle(
    color: Colors.white,
    all: 3,
    child: _buildCircle(
        child: Icon(isEdit ? Icons.add_a_photo : Icons.edit, color: Colors.white,size: 20,),
        all: 8,
        color: color)
  );

  Widget _buildCircle({
    required Widget child,
    required double all,
    required Color color}) => ClipOval(
    child: Container(
      padding: EdgeInsets.all(all),
      color: color,
      child: child,
    ),
  );
}
