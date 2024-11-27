import 'package:flutter/material.dart';
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';
import 'package:get/get.dart';

class TeamDetailed extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final ApiModel model = Get.arguments;

    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  margin: EdgeInsets.only(top: 150),
                  height: 150,
                  decoration: BoxDecoration(
                      gradient: LinearGradient(
                    colors: [Color(0xff222831), Colors.transparent],
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
              decoration: BoxDecoration(color: Color(0xff222831)),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Name : ${model.strTeam}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Alternate Name : ${model.strTeamAlternate}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Stadium : ${model.strStadium}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Address : ${model.strLocation}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                  Container(
                    alignment: Alignment.topLeft,
                    child: Text(
                      'Description : ${model.strDescriptionEN}',
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
