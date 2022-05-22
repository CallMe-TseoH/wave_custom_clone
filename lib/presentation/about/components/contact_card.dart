import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/controllers/contact.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
  });

  final Contact contact;

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      color: Colors.white,
      elevation: 1.5,
      borderRadius: BorderRadius.circular(SizesHelper.radius(8)),
      height: SizesHelper.height(150),
      width: SizesHelper.width(175),
      child: MaterialInkWell(
        onPressed: () async {
          try {
            await launch((Uri.tryParse(contact.link)?.toString())!);
          } catch (e) {}
        },
        radius: 8,
        splashColor: AppColors.blue,
        child: Padding(
          padding: EdgeInsets.all(SizesHelper.height(10)),
          child: Center(
            child: Stack(
              children: [
                Positioned.fill(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      ExtendedContainer(
                        height: SizesHelper.height(50),
                        width: SizesHelper.height(50),
                        shape: BoxShape.circle,
                        color: Colors.white,
                        image: DecorationImage(image: AssetImage(contact.logoLink)),
                      ),
                      const Separator(value: 10),
                      TextComponent(
                        textKey: contact.description,
                        fontSize: SizesHelper.height(13),
                        useOverFlow: false,
                        textAlign: TextAlign.center,
                      )
                    ],
                  ),
                ),
                Positioned(
                  top: SizesHelper.height(5),
                  right: SizesHelper.width(5),
                  child: Icon(
                    Icons.touch_app_outlined,
                    color: Colors.black,
                    size: SizesHelper.fontSize(15),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
