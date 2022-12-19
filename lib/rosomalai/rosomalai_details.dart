import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yammi/rosomalai/rosomal_details_mobile.dart';
import 'package:yammi/rosomalai/rosomalai_details_desktop.dart';

class RosomalaiDetails extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  RosomalaiDetails({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RosomalaiDetailMobile(
        assetPath: assetPath,
        cookiename: cookiename,
        cookieprice: cookieprice,
      ),
      desktop: RosomalaiDetailDesktop(
        assetPath: assetPath,
        cookiename: cookiename,
        cookieprice: cookieprice,
      ),
    );
  }
}
