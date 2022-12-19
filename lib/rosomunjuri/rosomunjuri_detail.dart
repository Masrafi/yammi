import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'rosomunjuri_detail_desktop.dart';
import 'rosomunjuri_detail_mobile.dart';

class RosomunjuriDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  RosomunjuriDetail({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RosomunjuriDetailMobile(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
      desktop: RosomunjuriDetailDesktop(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
    );
  }
}
