
import 'package:flutter/material.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/components/page_structure.dart';

import '../components/contact_viewer_box.dart';
import '../components/profile_card.dart';
import '../components/project_info_card.dart';

class AboutPage extends StatelessWidget {
  const AboutPage({super.key});

  @override
  Widget build(BuildContext context) {
    return PageStructure(
      backgroundColor: ColorsHelper.softGrey,
        body: SafeArea(
      child: StretchingOverscrollIndicator(
        axisDirection: AxisDirection.down,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: const [
              ProfileCard(),
              ProjectInfoCard(),
              ContactViewerBox(),
            ],),
        ),
      ),
    ));
  }
}

