import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'kreMotamot_mobile.dart';
import 'kremotamot_desktop.dart';

class KreMotamot extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: KreMotamotMobile(),
      desktop: KreMotamotDesktop(),
    );
  }
}
