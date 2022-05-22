import 'package:flutter/material.dart';
import 'package:wave_custom_clone/core/constant/constant.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/helpers/about_text_key.dart';
import 'package:wave_custom_clone/presentation/about/helpers/assets_helper.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class ProjectInfoCard extends StatelessWidget {
  const ProjectInfoCard({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      color: Colors.white,
      elevation: 2,
      borderRadius: BorderRadius.circular(SizesHelper.radius(12)),
      margin: EdgeInsets.all(SizesHelper.height(8)),
      child: MaterialInkWell(
        onPressed: () {},
        radius: 12,
        splashColor: Colors.black,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Separator(value: 15),
              ExtendedContainer(
                height: SizesHelper.height(60),
                width: SizesHelper.height(60),
                shape: BoxShape.circle,
                child: ClipOval(child: Image.asset('assets/images/wave_logo_transparent.png')),
              ),
              const Separator(value: 15),
              TextComponent(
                textKey: "Wave Custom Clone",
                useOverFlow: false,
                fontWeight: FontWeight.bold,
                fontSize: SizesHelper.fontSize(17),
                textAlign: TextAlign.center,
              ),
              const Separator(value: 5),
              TextComponent(
                textKey: kAppDescription,
                useOverFlow: false,
                fontSize: SizesHelper.fontSize(13),
                textAlign: TextAlign.center,
              ),
              const Separator(value: 20),
              TextComponent(
                textKey: "Made with ❤️ by Kevin'S Assi\nfrom Lavigne Inc",
                useOverFlow: false,
                textAlign: TextAlign.center,
                fontSize: SizesHelper.fontSize(13),
                color: Colors.grey.shade300,
              ),
              const Separator(value: 5),
            ],
          ),
        ),
      ),
    );
  }
}
