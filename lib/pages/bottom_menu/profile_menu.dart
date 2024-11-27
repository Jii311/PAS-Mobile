import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/username_controller.dart';
import 'package:pas1_mobile_11pplg2_11/widgets/listtile.dart';

class ProfileMenu extends StatelessWidget {
  final UserController usercontroller = Get.put(UserController());
  ProfileMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(color: Color(0xff222831)),
        child: Column(
          children: [
            Container(
              padding: EdgeInsets.all(20),
              decoration: BoxDecoration(
                  color: Color(0xff222831),
                  borderRadius: BorderRadius.only(
                      bottomLeft: Radius.circular(15),
                      bottomRight: Radius.circular(15))),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person,
                    color: Colors.white,
                    size: 100,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Hello, ${usercontroller.username.value}',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            MyListTile(
              leadingIcon: Icons.person,
              title: 'Edit Profile',
              onTap: () {},
            ),
            MyListTile(
              leadingIcon: Icons.settings,
              title: 'Settings',
              onTap: () {},
            ),
            MyListTile(
              leadingIcon: Icons.notifications,
              title: 'Notification',
              onTap: () {},
            ),
            MyListTile(
              leadingIcon: Icons.mark_unread_chat_alt_rounded,
              title: 'FAQ',
              onTap: () {},
            ),
            MyListTile(
              leadingIcon: Icons.info,
              title: 'About App',
              onTap: () {},
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class MyButton {}
