import 'package:flutter/material.dart';
import 'package:flutter_practical/app/components/custom/custom_appbar.dart';
import 'package:flutter_practical/app/components/widgets/custom_form_field_item.dart';
import 'package:flutter_practical/app/modules/venue_details/controllers/venue_details_controller.dart';
import 'package:flutter_practical/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VanueDetailsView extends StatelessWidget {
  VanueDetailsView({super.key});
  VenueDetailsController venueDetailsController = Get.put(VenueDetailsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Your Venue Details",
        centerTitle: true,
        button: false),
      body: GetBuilder<VenueDetailsController>(
        builder: (controller) {
          return Obx(() => SingleChildScrollView(
                  padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
                  child: Column(
                    children: [
                      CustomFormFieldItem(
                        title: "Business Type",
                        subTittle: "Select upto 2 values that reflect your business",
                        selectedValues: controller.businessTypeList.value.toString().replaceAll("[", "").replaceAll("]", ""),
                        onTap: () {
                          Get.toNamed(Routes.BUSINESSTYPEVIEW);
                        },
                      ),
                      CustomFormFieldItem(
                          title: "Services Offered",
                          subTittle: "Select the applicable services at this Venue",
                          selectedValues: "Cafe, Restaurant",
                      onTap: () {
                        showSnackBar(context,"Under Working");
                      },),
                      CustomFormFieldItem(
                          title: "Cuisense Offered",
                          subTittle: "Select the applicable cuisense served at this Venue",
                          selectedValues: "Cafe, Restaurant",
                      onTap: () {
                        showSnackBar(context,"Under Working");
                      },),
                      SizedBox(
                        height: 20,
                      ),
                      Divider(color: Colors.grey,thickness: 0.2),
                      CustomFormFieldItem(
                          title: "Features",
                          onTap: () {
                            Get.toNamed(Routes.FEATURESDETAILSVIEW);
                          },
                          selectedValues: controller.featuresList.value.toString().replaceAll("[", "").replaceAll("]", ""),),
                      CustomFormFieldItem(
                          title: "Dietary Information",
                          selectedValues: "Cafe, Restaurant",
                      onTap: () {
                        showSnackBar(context,"Under Working");
                      },),
                      CustomFormFieldItem(
                          title: "Dining Style",
                          selectedValues: "Cafe, Restaurant",
                      onTap: () {
                        showSnackBar(context,"Under Working");
                      },),
                    ],
                  ),
              ),
          );
        }
      ),
    );
  }


  showSnackBar(BuildContext context, String text) {
   return ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(content: Text(text.toString())),
    );
  }

}