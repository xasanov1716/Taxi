import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/colors/app_colors.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/screen_size.dart';
import 'package:taxi_app/utils/size/size_extension.dart';
import 'package:taxi_app/utils/theme/get_theme.dart';
import 'widgets/help_taxio/person_data.dart';
class HelpCenterScreen extends StatefulWidget {
  const HelpCenterScreen({super.key});

  @override
  State<HelpCenterScreen> createState() => _HelpCenterScreenState();
}

class _HelpCenterScreenState extends State<HelpCenterScreen> {
  @override
  Widget build(BuildContext context) {
    double height=MediaQuery.of(context).size.height;
    double width=MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: getTheme(context) ? AppColors.dark2 : AppColors.greysCale,
      appBar: GlobalAppBar(
        title: "Help Center",onTap: (){},action: [
        IconButton(onPressed: (){}, icon: SvgPicture.asset(AppIcons.moreCircle )),
      ],),
      body:Container(
        margin: EdgeInsets.only(left: 24*width/figmaWidth,right: 24*width/figmaWidth, ),
        child:   ListView(
          children:  [
            231.ph,
            const Helpdata(textOne: 'What is Taxio?', texTwo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
            24.ph,
            const Helpdata(textOne: 'How to use Taxio?', texTwo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
            24.ph,
            const Helpdata(textOne: 'How do I cancel a taxi booking?', texTwo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
            24.ph,
            const Helpdata(textOne: 'Is Taxio free to use?', texTwo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
            24.ph,
            const Helpdata(textOne: 'How to add promo on Taxio?', texTwo: "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",),
          ],
        ),
      ),
    );
  }
}
