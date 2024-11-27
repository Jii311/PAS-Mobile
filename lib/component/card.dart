import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/favourite.controller.dart';
import 'package:pas1_mobile_11pplg2_11/controllers/post_controller.dart';
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';

class TeamCard extends StatelessWidget {
  final PostController postController = Get.put(PostController());
  final Likecontroller likeController = Get.put(Likecontroller());
  final ApiModel model;
  bool allowDeletion = false;

  TeamCard({required this.model, super.key, this.allowDeletion = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          gradient:
              LinearGradient(colors: [Color(0xff000000), Color(0xff222831)]),
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
              color: Color(0xff50222831),
              width: 1.5,
              style: BorderStyle.solid)),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Stack(
            children: [
              GestureDetector(
                onTap: () {
                  postController.detailed(model);
                },
                child: Container(
                  child: ClipRRect(
                      borderRadius: BorderRadius.circular(5),
                      child: Image.network(
                        model.strBadge,
                      )),
                ),
              ),
              Positioned(
                  bottom: 0,
                  right: 0,
                  child: Container(
                    width: 40,
                    height: 40,
                    decoration: BoxDecoration(
                      color: Color(0xff50222831),
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                      ),
                      border: Border(
                        left: BorderSide(
                          color: Color(0xff577EE1),
                          width: 1,
                        ),
                        top: BorderSide(
                          color: Color(0xff577EE1),
                          width: 1,
                        ),
                      ),
                    ),
                    child: Obx(() {
                      var isLiked =
                          likeController.getLikedById(model.idTeam).value;
                      return IconButton(
                          onPressed: () {
                            if (isLiked) {
                              if (allowDeletion) {
                                showDialog(
                                  context: context,
                                  builder: (BuildContext context) {
                                    return AlertDialog(
                                      shape: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      backgroundColor: Color(0xffEEEEEE),
                                      titleTextStyle: TextStyle(
                                        color: Color(0xff000000),
                                        fontWeight: FontWeight.bold,
                                      ),
                                      title: Text(
                                        'Remove this item from favourites?',
                                      ),
                                      actions: <Widget>[
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                            likeController
                                                .deleteTask(model.idTeam);
                                            Get.snackbar('Info',
                                                '${model.strTeam} removed from favorites.',
                                                backgroundColor: Colors.black,
                                                colorText: Colors.white);
                                          },
                                          child: Text('Yes',
                                              style: TextStyle(
                                                  color: Color(0xff000000))),
                                        ),
                                        TextButton(
                                          onPressed: () {
                                            Navigator.of(context).pop();
                                          },
                                          child: Text('No',
                                              style: TextStyle(
                                                  color: Color(0xff000000))),
                                        ),
                                      ],
                                    );
                                  },
                                );
                              } else {
                                Get.snackbar('Error',
                                    'You can only remove favorites from Library.',
                                    backgroundColor: Colors.black,
                                    colorText: Colors.white);
                              }
                            } else {
                              likeController.addTask(model);
                              Get.snackbar('Info',
                                  '${model.strTeam} added to favorites.',
                                  backgroundColor: Colors.black87,
                                  colorText: Colors.white);
                            }
                          },
                          icon: Icon(
                            isLiked
                                ? Icons.bookmark
                                : Icons.bookmark_border_outlined,
                            color: isLiked ? Colors.white : Colors.white,
                            size: 24,
                          ));
                    }),
                  ))
            ],
          ),
          Container(
            margin: EdgeInsets.all(5),
            width: 200,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Container(
                  alignment: Alignment.topLeft,
                  child: Text(
                    model.strTeam,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                        color: Color(0xffEEEEEE),
                        fontSize: 16,
                        fontWeight: FontWeight.w500),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
