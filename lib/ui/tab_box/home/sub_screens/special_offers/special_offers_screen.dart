import 'package:flutter/material.dart';
import 'package:taxi_app/data/models/offers/offers_model.dart';
import 'package:taxi_app/ui/tab_box/home/sub_screens/special_offers/widgets/special_offer_button.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/ui_utils/utility_function.dart';

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
      appBar: GlobalAppBar(
        title: "Special Offers",
        onTap: () {
          Navigator.pop(context);
        },
        action: [
          getIcon(AppIcons.moreCircle, context: context, onTap: (){}),
        ],
      ),
      body: ListView(
        children: [
          ...List.generate(
            offers.length,
            (index) {
              OffersModel offer = offers[index];
              return SpecialOfferButton(
                title: offer.title,
                text: offer.subtitle,
                icon: offer.icon,
                desc: offer.description,
                promoCode: offer.promoCode,
              );
            },
          )
        ],
      ),
    );
  }
}
