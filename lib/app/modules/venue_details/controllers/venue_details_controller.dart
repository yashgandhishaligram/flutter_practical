import 'package:flutter_practical/app/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class VenueDetailsController extends GetxController {
  var businessTypeList = [].obs;
  var featuresList = [].obs;
  var box = GetStorage();

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getAllSelectedValues();
  }

  void getAllSelectedValues() {
    if (box.read(StorageKeys.BUSSINESSTYPELIST) != null &&
        box.read(StorageKeys.FEATURESLIST) != null) {
      businessTypeList.value = box.read(StorageKeys.BUSSINESSTYPELIST);
      featuresList.value = box.read(StorageKeys.FEATURESLIST);
    }
  }
}
