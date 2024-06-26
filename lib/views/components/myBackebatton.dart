import 'package:flutter/material.dart';

SnackBar mySnackBar({required String text, required Color color}) {
  return SnackBar(
    duration: Duration(seconds: 3),
    behavior: SnackBarBehavior.floating,
    backgroundColor: color,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(30),
    ),
    content: Text(text),
    showCloseIcon: true,
  );
}

class MyBackButton extends StatelessWidget {
  const MyBackButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return IconButton(
      onPressed: () {
        Navigator.of(context).pop();
      },
      icon: Icon(
        Icons.arrow_back_ios,
        // color: Colors.grey,
      ),
    );
  }
}
