import 'package:get/get.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class CatController extends GetxController {
  static CatController get to => Get.find();

  var catList = <CatDto>[].obs;

  final homeSelectedCat = Rxn<CatDto>();

  final profileSelectedCat = Rxn<CatDto>();

  setCatList(List<CatDto> newCatList) {
    catList.value = newCatList;
  }

  addCat(CatDto newCat) {
    catList.add(newCat);
  }

  updateCat(CatDto updatedCat) {
    int index = catList.indexWhere((cat) => cat.id == updatedCat.id);
    if (index != -1) {
      catList[index] = updatedCat;
    }

    if (homeSelectedCat.value != null &&
        homeSelectedCat.value!.id == updatedCat.id) {
      homeSelectedCat.value = updatedCat;
    }
    if (profileSelectedCat.value != null &&
        profileSelectedCat.value!.id == updatedCat.id) {
      profileSelectedCat.value = updatedCat;
    }
  }

  removeCat(CatDto cat) {
    catList.remove(cat);
  }

  clearCatList() {
    catList.clear();
  }

  setHomeSelectedCat(CatDto cat) {
    homeSelectedCat.value = cat;
  }

  clearHomeSelectedCat() {
    homeSelectedCat.value = null;
  }

  setProfileSelectedCat(CatDto cat) {
    profileSelectedCat.value = cat;
  }

  clearProfileSelectedCat() {
    profileSelectedCat.value = null;
  }
}
