import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:taxi_app/data/local/storage_repository/storage_repository.dart';
import 'package:taxi_app/ui/tab_box/profile/sub_screens/language/widgets/language_selector.dart';
import 'package:taxi_app/ui/widgets/global_appbar.dart';
import 'package:taxi_app/utils/constants/storage_keys.dart';
import 'package:taxi_app/utils/size/size_extension.dart';

class LanguageScreen extends StatefulWidget {
  const LanguageScreen({super.key});

  @override
  State<LanguageScreen> createState() => _LanguageScreenState();
}

class _LanguageScreenState extends State<LanguageScreen> {
  int selectedIndex = 0;

  @override
  void initState() {
    selectedIndex = StorageRepository.getInt(StorageKeys.languageKey);
    super.initState();
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: GlobalAppBar(
        title: tr('language'),
        onTap: () {
          Navigator.pop(context);
        },
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Padding(
          //   padding: EdgeInsets.symmetric(horizontal: 24.w),
          //   child: Text(
          //     tr('suggested'),
          //     style: Theme.of(context).textTheme.titleMedium,
          //   ),
          // ),
          16.ph,
          LanguageSelector(
            onTap: () {
              changeLanguage("uz");
            },
            isSelected: selectedIndex == 0,
            title: "O'zbek",
          ),
          LanguageSelector(
            onTap: () {
              changeLanguage("cyrl");
            },
            isSelected: selectedIndex == 1,
            title: "Кирилл-Лотин",
          ),
          LanguageSelector(
            onTap: () {
              changeLanguage("ru");
            },
            isSelected: selectedIndex == 2,
            title: "Русский",
          ),
        ],
      ),
    );
  }

  changeLanguage(String langCode) {
    if (langCode == "uz") {
      selectedIndex = 0;
      context.setLocale(const Locale('uz', 'UZ'));
    } else if (langCode == "cyrl") {
      selectedIndex = 1;
      context.setLocale(const Locale('uz', 'Cyrl'));
    } else {
      selectedIndex = 2;
      context.setLocale(const Locale('ru', 'RU'));
    }
    StorageRepository.putInt(StorageKeys.languageKey, selectedIndex);
    setState(() {});
  }
}
