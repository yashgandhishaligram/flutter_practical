
import 'package:flutter/material.dart';
import 'package:flutter_practical/app/components/custom/custom_appbar.dart';
import 'package:flutter_practical/app/modules/features/controllers/features_details_controller.dart';
import 'package:get/get.dart';

import '../../../constants/api_constants.dart';
import '../../venue_details/controllers/venue_details_controller.dart';

class FeaturesDetailsView extends StatelessWidget {
  FeaturesDetailsView({super.key});
  FeaturesDetailsController featuresDetailsController = Get.put(FeaturesDetailsController());
  VenueDetailsController venueDetailsController = Get.put(VenueDetailsController());
  @override
  Widget build(BuildContext context) {
    return GetBuilder<FeaturesDetailsController>(
      builder: (controller) {
        return Scaffold(
            backgroundColor: Colors.white,
            appBar: CustomAppBar(title: "Business Type", centerTitle: true, button: true,
            onTap: () {
              controller.box.write(StorageKeys.FEATURESLIST, controller.tempList);
              Get.back();
              venueDetailsController.getAllSelectedValues();
            }),
            body: Obx(() =>
            controller.isLoading.value?
            const Center(child: CircularProgressIndicator(color: Colors.green)):
            SingleChildScrollView(
              child: Column(
                children: [
                  searchBar(context,controller.searchController),
                  featuresListingView(context,controller),
                ],
              ),
            ),
            ),
        );
      },
    );
  }

  Widget featuresListingView(BuildContext context,FeaturesDetailsController controller) {
    return ListView.separated(
      padding: EdgeInsets.only(top: 20,bottom: 20),
      physics: const NeverScrollableScrollPhysics(),
      itemCount: controller.featuresList.length,
      shrinkWrap: true,
      itemBuilder: (context, index) {
        return GestureDetector(
            onTap: () {
                controller.isSelectedItem.value = !controller.isSelectedItem.value;
                controller.insertUniqueValues(controller.featuresList[index].description.toString());
                controller.featuresList[index].isSelected = !controller.featuresList[index].isSelected!;
                controller.update();
            },
            child: ListTile(
                dense: true,
                visualDensity: VisualDensity(vertical: -4),
                contentPadding: EdgeInsets.only(left: 30,right: 30),
                title: Text(controller.featuresList[index].description.toString(),
                    style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w400,
                        color: Colors.black
                    )),
                selectedTileColor: Colors.green,
                trailing:
                controller.featuresList[index].isSelected! ?
                Container(
                  height: 20,
                  width: 20,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Colors.green[400]
                  ),
                  child: const Center(child: Icon(Icons.check,size:15,color: Colors.white)),
                )
              :SizedBox(),
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
