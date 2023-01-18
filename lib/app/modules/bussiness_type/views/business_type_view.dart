import 'package:flutter/material.dart';
import 'package:flutter_practical/app/components/custom/custom_appbar.dart';
import 'package:flutter_practical/app/constants/api_constants.dart';
import 'package:flutter_practical/app/models/BussinessTypeModel.dart';
import 'package:get/get.dart';
import '../../venue_details/controllers/venue_details_controller.dart';
import '../controllers/business_type_controller.dart';

class BusinessTypeView extends StatelessWidget {
   BusinessTypeView({super.key});
   BusinessTypeController dashboardController = Get.put(BusinessTypeController());
   VenueDetailsController venueDetailsController = Get.put(VenueDetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<BusinessTypeController>(
    builder: (controller) {
      return Scaffold(
        backgroundColor: Colors.white,
        appBar: CustomAppBar(title: "Business Type", centerTitle: true, button: true,
        onTap: () {
          controller.box.write(StorageKeys.BUSSINESSTYPELIST, controller.tempList);
          Get.back();
          venueDetailsController.update();
          venueDetailsController.getAllSelectedValues();
          },
        ),
        body: Obx(() =>
        controller.isLoading.value?
        const Center(child: CircularProgressIndicator(color: Colors.green)):
        SingleChildScrollView(
          child: Column(
            children: [
              searchBar(context,controller.searchController),
              businessTypeListingView(context, controller),
            ],
          ),
        ),
        ),
      );
    });
  }

  Widget businessTypeListingView(BuildContext context,BusinessTypeController controller) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20,bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.businessTypeList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            controller.isSelectedItem.value = !controller.isSelectedItem.value;
            controller.insertUniqueValues(controller.businessTypeList[index].description.toString());
            controller.update();
            controller.businessTypeList[index].isSelected = !controller.businessTypeList[index].isSelected!;
            controller.box.write(StorageKeys.BUSSINESSTYPELIST, controller.tempList);
          },
          child: ListTile(
            dense: true,
            visualDensity: VisualDensity(vertical: -4),
            contentPadding: EdgeInsets.only(left: 30,right: 30),
            title: Text(controller.businessTypeList[index].description.toString(),
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.w400,
                    color: Colors.black
                )),
            selectedTileColor: Colors.green,
            trailing:
            controller.businessTypeList[index].isSelected! ?
            Container(
              height: 20,
              width: 20,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(100),
                  color: Colors.green[400]
              ),
              child: const Center(child: Icon(Icons.check,size:15,color: Colors.white)),
            ) : SizedBox(),
          )
        );
      },
      separatorBuilder: (context, index) => Divider(
        color: Colors.grey,
        thickness: 1.0,
      ),

    );
  }

  Widget searchBar(BuildContext context,searchController) {
    return Padding(
      padding: const EdgeInsets.only(top:15,left: 15,right: 15),
      child: TextFormField(
        controller: searchController,
        textInputAction: TextInputAction.search,
        decoration: InputDecoration(
          hintText: "Search By typing a business type",
          contentPadding: const EdgeInsets.all(15),
          border: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(width: 1.0),
            borderRadius: BorderRadius.circular(25),
          ),
        ),
      ),
    );
  }
}
