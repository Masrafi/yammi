import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'order_desktop.dart';
import 'order_mobile.dart';

class Order extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: OrderMobile(),
      desktop: OrderDesktop(),
    );
  }
}
