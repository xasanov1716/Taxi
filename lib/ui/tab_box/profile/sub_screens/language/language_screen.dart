import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/icons/app_icons.dart';
import 'package:taxi_app/utils/size/size_extension.dart';


class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {

  int isSelected = 0;

  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      appBar:  GlobalAppBar(title: tr('language'),onTap: (){
        Navigator.pop(context);
      },),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          24.ph,
          Padding(
            padding:  EdgeInsets.only(left: 24.w,top: 24.h,),
            child: Row(
              children: [
                Text(tr('suggested'),style: Theme.of(context).textTheme.titleMedium,),
              ],
            ),
          ),
          40.ph,
          InkWell(
          onTap: (){
            isSelected = 0;
            setState(() {
              
            });
              context.setLocale(const Locale('uz','UZ'));
          },
          child: Container(
          padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w,bottom: 20),
          child:  ListTile(
            title:  Text("O'zbek"),
            trailing: isSelected == 0 ? SvgPicture.asset(AppIcons.selected): SvgPicture.asset(AppIcons.unSelected),
          ),),
        ),
        InkWell(
          onTap: (){
            setState(() {
              isSelected = 1;
              setState(() {
                
              });
            });
              context.setLocale(const Locale('ru','RU'));
          },
          child: Container(
          padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w,bottom: 20),
          child: ListTile(
            title:  Text('Russian'),
          trailing: isSelected == 1 ? SvgPicture.asset(AppIcons.selected): SvgPicture.asset(AppIcons.unSelected),
          ),),
        ),
        InkWell(
          onTap: (){
            isSelected = 2;
            setState(() {
              
            });
              context.setLocale(const Locale('en','EN'),);
          },
          child: Container(
          padding: EdgeInsets.only(top: 20.h, left: 24.w, right: 24.w,bottom: 20),
          child: ListTile(
            title:   const Text('Узбек'),
        trailing: isSelected == 2 ? SvgPicture.asset(AppIcons.selected): SvgPicture.asset(AppIcons.unSelected),
          ),),
        ),
        ],
      ),
    );
  }
}