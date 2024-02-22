import 'package:geocoding/geocoding.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';

class LocationController extends GetxController {
  Position? currentPosition;
  String? currentLocal;
  RxBool isLoading = false.obs;
  @override
  void onInit() {
    super.onInit();
    getCurrentLocat();
  }

  Future<void> getaddressFromLatlang(
      {required double latitude, required double longitude}) async {
    try {
      List<Placemark> placemark =
          await placemarkFromCoordinates(latitude, longitude);
      Placemark place = placemark[0];
      currentLocal =
          " ${place.name},${place.subAdministrativeArea},${place.country}";
      update();
    } catch (e) {
      // ignore: avoid_print
      print(e);
    }
  }

  void getCurrentLocat() async {
    try {
      isLoading(true);
      update();
      currentPosition = await getPos();
      getaddressFromLatlang(
          latitude: currentPosition!.latitude,
          longitude: currentPosition!.longitude);
      isLoading(false);
      update();
    } catch (e) {
      print(e);
    }
  }

  Future<Position> getPos() async {
    LocationPermission? permission;
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permission are denied');
      }
    }
    return await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);
  }
}

class LocationBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(
      () => LocationController(),
    );
  }
}
