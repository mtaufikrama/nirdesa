import 'package:get/get.dart';
import 'package:nirdesa/app/data/services.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class SurahController extends GetxController {
  AutoScrollController autoScrollController = AutoScrollController();
  Rx<Languages> selectedMenu = Languages.id.obs;
}
