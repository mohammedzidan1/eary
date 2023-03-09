
import 'package:flutter/material.dart';

PreferredSizeWidget customAppBar(context){
  return AppBar(
    leading: IconButton(
      onPressed: () {
        Navigator.pop(context);
      },
      icon: const Icon(
        Icons.arrow_back_ios,
        color: Color(0xff998BE0),
      ),
    ),
  );
}