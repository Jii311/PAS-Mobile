import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/component/card.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/post_controller.dart';

class HomeMenu extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  HomeMenu({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Obx(() {
              if (postController.isLoading.value) {
                return Center(child: CircularProgressIndicator());
              }
              return GridView.builder(
                padding: EdgeInsets.symmetric(horizontal: 10),
                shrinkWrap: true,
                physics: BouncingScrollPhysics(),
                itemCount: postController.postList.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  mainAxisExtent: 250,
                ),
                itemBuilder: (context, index) {
                  return TeamCard(
                    model: postController.postList[index],
                  );
                },
              );
            }),
          ],
        ),
      ),
    );
  }
}
