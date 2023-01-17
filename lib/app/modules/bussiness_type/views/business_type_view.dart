import 'package:flutter/material.dart';
import 'package:flutter_practical/app/components/custom/custom_appbar.dart';

class BusinessTypeView extends StatelessWidget {
  const BusinessTypeView ({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(title: "Business Type",),
      body: Container(),
    );
  }
}