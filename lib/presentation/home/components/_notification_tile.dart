part of 'notifications_carousel.dart';

class _NotificationTile extends StatelessWidget {
  const _NotificationTile({super.key, required this.notification,});
final NotificationEntity notification;
  @override
  Widget build(BuildContext context) {
    return ExtendedContainer(
      height: SizesHelper.height(170),
      width: double.infinity,
      color: AppColors.white,
      margin: EdgeInsets.only(top: SizesHelper.height(14), bottom: SizesHelper.height(15), right: SizesHelper.width(10)),
      boxShadow: [
        outerShadowSmall,
      ],
      borderRadius: BorderRadius.circular(SizesHelper.radius(15)),
      child: MaterialInkWell(
        onPressed: () {},
        radius: 15,
        child: Padding(
          padding: const EdgeInsets.only(top: 8, bottom: 5, right: 5, left: 1.5),
          child: Row(
            children: [
              ExtendedContainer(
                width: SizesHelper.width(90),
                child: Image.asset(notification.illustrationLink),
              ),
              Expanded(
                  child: StretchingOverscrollIndicator(
                    axisDirection: AxisDirection.down,
                    child: SingleChildScrollView(
                      child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                       TextComponent(
                        textKey: notification.title,
                        textAlign: TextAlign.left,
                        fontSize: AppFontSizesHelper.sm,
                        fontWeight: FontWeight.bold,
                      ),
                       const Separator(value: 5),
                       TextComponent(
                        textKey: notification.content,
                        useOverFlow: false,
                        textAlign: TextAlign.left,
                        fontSize: AppFontSizesHelper.s,
                      ),
                      const Separator(value: 10),
                      const _NotificationAudioPlayer()
                ],
              ),
                    ),
                  )),
              const Align(
                alignment: Alignment.topRight,
                  child: Icon(Icons.close, color: Colors.grey,)),
            ],
          ),
        ),
      ),
    );
  }
}

class _NotificationAudioPlayer extends StatelessWidget {
  const _NotificationAudioPlayer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
         Icon(Icons.play_arrow,
          color: Colors.grey.shade300,
        ),
        Expanded(
          child: ExtendedContainer(
            height: 5,
            color: Colors.grey.shade300,
            borderRadius: BorderRadius.circular(100),
          ),
        )
      ],
    );
  }
}
