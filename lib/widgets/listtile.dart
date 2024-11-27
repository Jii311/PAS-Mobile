import 'package:flutter/material.dart';

class MyListTile extends StatelessWidget {
  final IconData leadingIcon;
  final String title;

  final VoidCallback onTap;

  const MyListTile({
    Key? key,
    required this.leadingIcon,
    required this.title,
    required this.onTap,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 2, horizontal: 10),
        padding: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
        decoration: BoxDecoration(
          color: Color(0xff393E46),
          borderRadius: BorderRadius.circular(5),
          border: Border(bottom: BorderSide(color: Color(0xff222831))),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.max,
          children: [
            Icon(leadingIcon, color: Color(0xffEEEEEE)),
            SizedBox(width: 15),
            Expanded(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    title,
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0xffEEEEEE)),
                  ),
                  SizedBox(height: 5),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
