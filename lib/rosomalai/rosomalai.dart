import 'package:flutter/material.dart';
import 'package:responsive_builder/responsive_builder.dart';
import 'package:yammi/rosomalai/rosomalai_desktop.dart';
import 'package:yammi/rosomalai/rosomalai_mobile.dart';

class Rosomalai extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      mobile: RosomalaiMobile(),
      desktop: RosomalaiDesktop(),
    );
  }
}
