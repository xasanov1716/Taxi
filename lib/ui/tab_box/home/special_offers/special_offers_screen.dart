import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/data/models/icon/icon_type.dart';
import 'package:taxi_app/data/models/offers/offers_model.dart';
import 'package:taxi_app/ui/tab_box/home/special_offers/widgets/special_offer_button.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';

class SpecialOffersScreen extends StatefulWidget {
  const SpecialOffersScreen({super.key});

  @override
  State<SpecialOffersScreen> createState() => _SpecialOffersScreenState();
}

class _SpecialOffersScreenState extends State<SpecialOffersScreen> {
  List<OffersModel> offers = [
    OffersModel(
        title: "Discount 35% Off",
        icon: AppIcons.yellowOffer,
        promoCode: "GH637JHAK",
        subtitle: "Special promo only valid for today!"),
    OffersModel(
      title: "Special 25% Off",
      icon: AppIcons.purpleOffer,
      promoCode: "GH635KASD",
      subtitle: "Special Weekend Deals Promo",
    ),
    OffersModel(
        title: "Special 20% Off",
        icon: AppIcons.redOffer,
        promoCode: "JS358JHAK",
        subtitle: "Special promo only valid for today!"),
    OffersModel(
        title: "Cashback 15%",
        icon: AppIcons.greenOffer,
        promoCode: "DK200WFAK",
        subtitle: "Special Week Promo"),
    OffersModel(
        title: "Discount 35% Off",
        icon: AppIcons.yellowOffer,
        promoCode: "GH637JHAK",
        subtitle: "Special promo only valid for today!"),
    OffersModel(
        title: "Cashback 15%",
        icon: AppIcons.blueOffer,
        promoCode: "OP247MAAK",
        subtitle: "New user special promo"),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Special Offers",
          style: Theme.of(context).textTheme.headlineMedium,
        ),
        actions: [
          IconButton(
            onPressed: () {},
            icon: SvgPicture.asset(
              AppIcons.getSvg(
                  name: AppIcons.moreCircle, iconType: IconType.lightBorder),
            ),
          )
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            offers.length,
            (index) {
              OffersModel offer = offers[index];
              return SpecialOfferButton(
                  title: offer.title, text: offer.subtitle, icon: offer.icon,desc: offer.description,promoCode: offer.promoCode,);
            },
          )
        ],
      ),
    );
  }
}
