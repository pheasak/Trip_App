import 'package:get/get.dart';
import 'package:trip/screen/home/controller/repo/repo.dart';
import 'package:trip/screen/home/model/attraction_model.dart';

class HomeController extends GetxController
    with StateMixin<List<CatagoryModel>> {
  RxInt onTap = 0.obs;
  RxInt selectedIndex = 0.obs;
  CatagoryModel? catagoryModel;
  late String? snapshotId;
  List<AttractionModel> attraction = [];
  List<AttractionModel> populare = [];
  final repo = HomeRepo();
  @override
  void onInit() {
    super.onInit();
    change([], status: RxStatus.success());
    snapshotId = 'REojtjgK2SiCOBu2FdbR';
  }

  @override
  void onReady() {
    super.onReady();
    getCategory();
    getPopulare();
  }

  Future getCategory() async {
    if (status.isLoadingMore) return;
    if (!status.isLoadingMore && value!.isNotEmpty) {
      change(value, status: RxStatus.loadingMore());
    } else {
      change([], status: RxStatus.loading());
    }
    final response = await repo.getCategory();
    if (response != null) {
      value!.addAll(response);
      return change(value, status: RxStatus.success());
    }
    return change([], status: RxStatus.empty());
  }

  // Future getAttraction(String? snapshotId) async {
  //   print('Progress');
  //   update();
  //   if (status.isLoadingMore) return;
  //   if (!status.isLoadingMore && value!.isNotEmpty) {
  //     change(value, status: RxStatus.loadingMore());
  //   } else {
  //     change([], status: RxStatus.loading());
  //   }
  //   final response = await repo.getAttraction(snapshotId!);

  //   if (response.isNotEmpty) {
  //     attraction = response;
  //     update();
  //   }
  // }

  Future getPopulare() async {
    if (status.isLoadingMore) return;
    if (!status.isLoadingMore && value!.isNotEmpty) {
      change(value, status: RxStatus.loadingMore());
    } else {
      change([], status: RxStatus.loading());
    }
    final response = await repo.getPopulareDestination();
    if (response.isNotEmpty) {
      populare = response;
      update();
    }
  }
}

class HomeBindings extends Bindings {
  @override
  void dependencies() {
    Get.put(HomeController());
  }
}
