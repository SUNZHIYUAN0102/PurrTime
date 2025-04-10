import 'package:get/get.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class CatController extends GetxController {
  static CatController get to => Get.find();

  var catList = <CatDto>[].obs;

  setCatList(List<CatDto> newCatList) {
    catList.value = newCatList;
  }

  addCat(CatDto newCat) {
    catList.add(newCat);
  }

  removeCat(CatDto cat) {
    catList.remove(cat);
  }

  clearCatList() {
    catList.clear();
  }
}
