import 'package:get/get.dart';
import 'package:purr_time/swagger_generated_code/api_json.swagger.dart';

class CatController extends GetxController {
  static CatController get to => Get.find();

  var catList = <CatDto>[].obs;

  final homeSelectedCat = Rxn<CatDto>();

  final chartSelectedCat = Rxn<CatDto>();

  final profileSelectedCat = Rxn<CatDto>();

  setCatList(List<CatDto> newCatList) {
    catList.value = newCatList;
  }

  addCat(CatDto newCat) {
    // Check if the cat already exists in the list
    if (catList.any((cat) => cat.id == newCat.id)) {
      // If it exists, remove it from the list
      catList.removeWhere((cat) => cat.id == newCat.id);
    }
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
    catList.refresh();
  }

  clearHomeSelectedCat() {
    homeSelectedCat.value = null;
  }

  setChartSelectedCat(CatDto cat) {
    chartSelectedCat.value = cat;
    catList.refresh();
  }

  clearChartSelectedCat() {
    chartSelectedCat.value = null;
  }

  setProfileSelectedCat(CatDto cat) {
    profileSelectedCat.value = cat;
    catList.refresh();
  }

  clearProfileSelectedCat() {
    profileSelectedCat.value = null;
  }
}
