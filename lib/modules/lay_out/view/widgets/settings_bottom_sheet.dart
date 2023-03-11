import 'package:eary/core/config/app_storage.dart';
import 'package:eary/core/utilites/font_manager.dart';
import 'package:eary/core/widgets/custom_text.dart';
import 'package:eary/core/widgets/theme_switch.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SettingsBottomSheet extends StatefulWidget {
  const SettingsBottomSheet({Key? key}) : super(key: key);

  @override
  State<SettingsBottomSheet> createState() => _SettingsBottomSheetState();
}

class _SettingsBottomSheetState extends State<SettingsBottomSheet> {
  final _langList = ['العربية', 'English'];

  String? _langSelected;
  @override
  void initState() {
    _langSelected = AppStorage.getLocale() == 'ar' ? 'العربية' : 'English';
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          _item(
            title: 'Language',
            icon: Icons.language,
            leading: _langButton(),
          ),
          _item(
            title: 'Theme',
            icon: Icons.dark_mode,
            leading: const ThemeSwitch(),
          ),
        ],
      ),
    );
  }

  _langButton() {
    return SizedBox(
      height: 50.h,
      width: 80.w,
      child: FormBuilderDropdown(
        initialValue: _langSelected ?? '',
        name: 'type',
        icon: const Icon(Icons.keyboard_arrow_down),
        iconSize: 18.sp,
        items: List<DropdownMenuItem>.from(
          _langList.map(
            (e) => DropdownMenuItem(
              value: e,
              child: CustomText(
                text: e,
                color: Colors.black,
                fontSize: 18.sp,
                fontWeight: FontWeight.w500,
                fontFamily: AppFontFamily.inter,
              ),
            ),
          ),
        ),
        onChanged: (value) {
          _langSelected = value;
          if (_langSelected == 'English') {
            AppStorage.setLocale('en');
            context.setLocale(const Locale('en', ''));
            debugPrint('local : ${AppStorage.getLocale()}');
          } else {
            AppStorage.setLocale('ar');
            context.setLocale(const Locale('ar', ''));
            debugPrint('local : ${AppStorage.getLocale()}');
          }
        },
      ),
    );
  }
}

Widget _item({String? title, IconData? icon, Widget? leading}) {
  return Row(
    children: [
      Icon(
        icon!,
        size: 18.h,
      ),
      const SizedBox(width: 4),
      Text(title!),
      const Spacer(),
      leading!,
    ],
  );
}
