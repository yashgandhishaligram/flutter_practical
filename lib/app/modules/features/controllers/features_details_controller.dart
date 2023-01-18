import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/app/models/BussinessTypeModel.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../constants/api_constants.dart';

class FeaturesDetailsController extends GetxController {
  TextEditingController searchController  = TextEditingController();
  var isLoading = false.obs;
  List<BusinessTypeModel> featuresList = [];
  var isSelectedItem = false.obs;
  var box = GetStorage();
  List tempList = [];

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    getFeatureListing();
  }

  Future<List<BusinessTypeModel>?> getFeatureListing() async {
    isLoading.value = true;
    try {
      var response = await http.get(Uri.parse(ApiConstants.FEATUREAPI));
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseBody = jsonDecode(response.body) as List;
        featuresList = responseBody.map((e) => BusinessTypeModel.fromJson(e)).toList();
        return featuresList;
      }
    } catch (e) {
      isLoading.value = false;
    }
    return null;
  }

  List insertUniqueValues(String value) {
    if(!tempList.contains(value)){
      tempList.add(value);
    }
    return tempList;
  }

}