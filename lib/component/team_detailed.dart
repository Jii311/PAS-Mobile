import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';
import 'package:get/get.dart';

class TeamDetailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiModel model = Get.arguments;

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(
              height: 50,
            ),
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150),
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Colors.black, Colors.transparent],
                    begin: Alignment.bottomCenter,
                    end: Alignment.topCenter,
                  )),
                ),
                Container(
                  alignment: Alignment.center,
                  child: Image.network(
                    model.strBadge,
                    height: 300,
                  ),
                ),
              ],
            ),
            Container(
              alignment: Alignment.topLeft,
              width: MediaQuery.of(context).size.width,
              height: 1500,
              decoration: BoxDecoration(color: Colors.black),
              child: Text(
                'Name : ${model.strTeam}',
                style: TextStyle(color: Colors.white),
              ),
            )
          ],
        ),
      ),
    );
  }
}
