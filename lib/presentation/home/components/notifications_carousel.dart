import 'package:flutter/material.dart';
import 'package:wave_custom_clone/config/theme/app_colors.dart';
import 'package:wave_custom_clone/core/constant/constant.dart';
import 'package:wave_custom_clone/core/constant/shadow.dart';
import 'package:wave_custom_clone/core/helpers/helpers.dart';
import 'package:wave_custom_clone/presentation/components/components.dart';

part '_notification_tile.dart';
final List<NotificationEntity> _notifications = [
  const NotificationEntity(content: kWavePromotionText1, title: 'Une chic promo !', illustrationLink: 'assets/images/wave_promotion.png'),
  const NotificationEntity(content: kWavePromotionText2, title: 'Gagnez 2000F !', illustrationLink: 'assets/images/send_wave_campaign.png'),
];
class NotificationsCarousel extends StatelessWidget {
  const NotificationsCarousel({super.key});

  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      color: Colors.grey.shade100,
      width: double.infinity,
      size: SizesHelper.height(200),
      child: PageView(
        controller: PageController(viewportFraction: .935),
        children: List.generate(_notifications.length, (index){
          return _NotificationTile(notification: _notifications[index]);
        }),
      ),
    );
  }
}
class NotificationEntity{

  const NotificationEntity({
    required this.content,
    required this.title,
    required this.illustrationLink,
  });
  final String content;
  final String title;
  final String illustrationLink;
}
