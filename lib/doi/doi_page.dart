import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'doi_page_desktop.dart';
import 'doi_page_mobile.dart';

class Doi extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: CookiePageMobile(),
      desktop: CookiePageDesktop(),
    );
  }
}
