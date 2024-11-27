import 'package:get/get.dart';
import 'package:pas1_mobile_11pplg2_11/models/api_model.dart';
import 'package:pas1_mobile_11pplg2_11/services/api_service.dart';


class PostController extends GetxController {
  var isLoading = true.obs;
  var postList = <ApiModel>[].obs;

  void detailed(ApiModel apiModel){
    Get.toNamed('/detailed', arguments: apiModel);
  }

  @override
  void onInit() {
    fetchPosts();
    super.onInit();
  }

  void fetchPosts() async {
    try {
      isLoading(true);
      var posts = await ApiService().fetchPosts();
      postList.assignAll(posts);
    } finally {
      isLoading(false);
    }
  }
}