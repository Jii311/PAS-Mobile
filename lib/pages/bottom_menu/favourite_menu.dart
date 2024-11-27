import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/component/card.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/favourite.controller.dart';

class FavouriteMenu extends StatelessWidget {
  final Likecontroller likecontroller = Get.put(Likecontroller());
  FavouriteMenu({super.key});

  @override
  Widget build(BuildContext context) {
    likecontroller.loadTasks();
    return Scaffold(
      body: Obx(() {
        if (likecontroller.tasks.isEmpty) {
          return Center(
            child: Text('Tidak ada Club yang disukai',
                style: TextStyle(color: Colors.black)),
          );
        }
        return GridView.builder(
          padding: EdgeInsets.symmetric(horizontal: 10),
          shrinkWrap: true,
          physics: BouncingScrollPhysics(),
          itemCount: likecontroller.tasks.length,
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            mainAxisExtent: 250,
          ),
          itemBuilder: (context, index) {
            return TeamCard(
              model: likecontroller.tasks[index],
              allowDeletion: true,
            );
          },
        );
      }),
    );
  }
}
