import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_practical/app/constants/api_constants.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:http/http.dart' as http;

import '../../../models/BussinessTypeModel.dart';

class BusinessTypeController extends GetxController {
  TextEditingController searchController  = TextEditingController();
  var isLoading = false.obs;
  List<BusinessTypeModel> businessTypeList = [];
  var isSelectedItem = false.obs;
  var box = GetStorage();
  List tempList = [];

  @override
  void onInit() {
    super.onInit();
    getBusinessTypeListing();
  }


  Future<List<BusinessTypeModel>?> getBusinessTypeListing() async {
    isLoading.value = true;
    try {
      var response = await http.get(Uri.parse(ApiConstants.BUSINESSTYPEAPI));
      if (response.statusCode == 200) {
        isLoading.value = false;
        final responseBody = jsonDecode(response.body) as List;
        businessTypeList = responseBody.map((e) => BusinessTypeModel.fromJson(e)).toList();
        return businessTypeList;
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