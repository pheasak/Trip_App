import 'package:get/get.dart';
import 'package:get/get_navigation/src/routes/get_route.dart';
import 'package:trip/navigation/rout_name.dart';
import 'package:trip/screen/home/controller/home_controller.dart';
import 'package:trip/screen/home/view/detail_screen.dart';
import 'package:trip/screen/home/view/home_main.dart';
import 'package:trip/util/google_map.dart';

class GetRout extends RouteName {
  List<GetPage> get route => [
        // home page
        GetPage(
            name: homeScreen,
            page: () => const MainScreen(),
            bindings: [LocationBindings(), HomeBindings()]),
        GetPage(
          name: detailScreen,
          page: () => const DetailScreen(),
        )
      ];
}
