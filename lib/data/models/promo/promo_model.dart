import 'package:taxi_app/utils/icons/app_icons.dart';

class PromoItem {
  final String icon;
  bool selected;
  String text;
  String subtitle;

  PromoItem({
    required this.icon,
    required this.selected,
    required this.text,
    required this.subtitle,
  });
}

List<PromoItem> promoItems = [
  PromoItem(
      icon: AppIcons.yellowOffer,
      selected: false,
      text: "Special 25% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.blueOffer,
      selected: false,
      text: "Discount 30% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.greenOffer,
      selected: false,
      text: "Special 20% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.purpleOffer,
      selected: false,
      text: "Discount 40% Off",
      subtitle: "Special promo only today!"),
  PromoItem(
      icon: AppIcons.redOffer,
      selected: false,
      text: "Discount 35% Off",
      subtitle: "Special promo only today!"),
];
