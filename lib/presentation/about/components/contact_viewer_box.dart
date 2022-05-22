import 'package:flutter/material.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/about/components/contact_card.dart';
import 'package:wave_custom_clone/presentation/about/controllers/contact.dart';
import 'package:wave_custom_clone/presentation/about/helpers/assets_helper.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

const _contacts = [
  Contact(
    logoLink: AssetsHelper.linkedin,
    description: "Follow & Message Me\non Linkedin",
    link: "https://www.linkedin.com/in/kevin-s-assi-b49065160",
  ),
  Contact(
    logoLink: AssetsHelper.gmail,
    description: "Send Me\nan Email",
    link: "mailto:assikevin10@gmail.com",
  ),
  Contact(
    logoLink: AssetsHelper.github,
    description: "Follow Me\non GitHub",
    link: "https://github.com/CallMe-TseoH/",
  ),
  Contact(
    logoLink: AssetsHelper.githubStar,
    description: "Star this project\non GitHub",
    link: "https://github.com/CallMe-TseoH/wave_custom_clone",
  ),
];

class ContactViewerBox extends StatelessWidget {
  const ContactViewerBox({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      borderRadius: BorderRadius.circular(SizesHelper.radius(12)),
      margin: EdgeInsets.all(SizesHelper.height(8)),
      child: Center(
        child: Wrap(
          alignment: WrapAlignment.spaceBetween,
          runAlignment: WrapAlignment.spaceBetween,
          children: _contacts
              .map((e) => ContactCard(
                    contact: e,
                  ),)
              .toList(),
        ),
      ),
    );
  }
}
