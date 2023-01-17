import 'package:flutter/material.dart';
import 'package:flutter_practical/app/components/custom/custom_appbar.dart';
import 'package:flutter_practical/app/components/widgets/custom_form_field_item.dart';
import 'package:flutter_practical/app/routes/app_pages.dart';
import 'package:get/get.dart';

class VanueDetailsView extends StatelessWidget {
  const VanueDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: CustomAppBar(
        title: "Your Venue Details"),
      body: SingleChildScrollView(
        padding: const EdgeInsets.only(left: 15,right: 15,bottom: 15),
        child: formFieldView()
      ),
    );
  }

  formFieldView() {
    return Column(
          children: [
              CustomFormFieldItem(
                  title: "Business Type",
                  subTittle: "Select upto 2 values that reflect your business",
                  selectedValues: ["Cafe, Restaurant"],
                  onTap: () {
                    Get.toNamed(Routes.BUSINESSTYPEVIEW);
                  },
                  ),
            CustomFormFieldItem(
                title: "Services Offered",
                subTittle: "Select the applicable services at this Venue",
                selectedValues: ["Cafe, Restaurant"]),
            CustomFormFieldItem(
                title: "Cuisense Offered",
                subTittle: "Select the applicable cuisense served at this Venue",
                selectedValues: ["Cafe, Restaurant"]),
                SizedBox(
              height: 20,
            ),
            Divider(color: Colors.grey,thickness: 0.2),
            CustomFormFieldItem(
                title: "Features",
                selectedValues: ["Cafe, Restaurant"]),
            CustomFormFieldItem(
                title: "Dietary Information",
                selectedValues: ["Cafe, Restaurant"]),
            CustomFormFieldItem(
                title: "Dining Style",
                selectedValues: ["Cafe, Restaurant"]),
          ],

        );

  }
}