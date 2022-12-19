import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'doi_detail_desktop.dart';
import 'doi_detail_mobile.dart';

class CookieDetail extends StatelessWidget {
  final assetPath, cookieprice, cookiename;

  CookieDetail({this.assetPath, this.cookieprice, this.cookiename});
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CookieDetailMobile(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
      tablet: CookieDetailDesktop(assetPath: assetPath, cookiename: cookiename, cookieprice: cookieprice,),
    );
  }
}
