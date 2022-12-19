import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'kacagolla_detail_desktop.dart';
import 'kacagolla_detail_mobile.dart';

class KacagollaDetails extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  KacagollaDetails({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: KacagollaDetailMobile(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
      tablet: KacagollaDetailDesktop(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
    );
  }
}
