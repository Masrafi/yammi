import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'homeContantDesktop.dart';
import 'homeContantMobile.dart';

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: HomeContentMobile(),
      tablet: HomeContentDesktop(),
    );
  }
}
