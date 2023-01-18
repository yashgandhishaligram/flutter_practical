import 'package:flutter_practical/app/modules/bussiness_type/views/business_type_view.dart';
import 'package:flutter_practical/app/modules/features/views/features_details_view.dart';
import 'package:flutter_practical/app/modules/venue_details/views/venue_details_view.dart';
import 'package:get/get.dart';
part 'app_routes.dart';

class AppPages {
  AppPages._();

  static const INITIAL = Routes.VANUEDETAILSVIEW;

  static final routes = [
    GetPage(
      name: _Paths.VANUEDETAILSVIEW,
      page: () => VanueDetailsView(),
    ),
    GetPage(
      name: _Paths.BUSINESSTYPEVIEW,
      page: () => BusinessTypeView(),
    ),
    GetPage(
      name: _Paths.FEATURESDETAILSVIEW,
      page: () => FeaturesDetailsView(),
    ),
  ];
}
