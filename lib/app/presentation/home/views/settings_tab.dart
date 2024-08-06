import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/core/utils/l10n/l10n.dart';
import 'package:gymbrow/app/presentation/bases/gb_base_view.dart';
import 'package:gymbrow/app/presentation/home/controllers/home_controller.dart';

class SettingsTab extends GBBaseView<HomeController> {
  const SettingsTab({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.settings),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 4.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ListTile(
              trailing: Obx(
                () => Switch(
                  value: controller.isDarkTheme.value,
                  onChanged: (bool value) {
                    controller.isDarkTheme.value = value;
                    controller.changeThemeMode();
                  },
                ),
              ),
              title: const Row(
                children: [
                  Expanded(
                    child: Text(
                      //Internacionalizar
                      'Dark mode',
                      maxLines: 2,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ),
                ],
              ),
              leading: const CircleAvatar(
                child: Icon(
                  Icons.dark_mode,
                ),
              ),
            ),
            ListTile(
              leading: const CircleAvatar(
                child: Icon(
                  Icons.language,
                ),
              ),
              title: DropdownButton<String>(
                value: controller.locale,
                items: L10n.allLanguage
                    .map(
                      (Locale e) => DropdownMenuItem<String>(
                        value: e.languageCode,
                        child: Text(
                          e.languageCode.toUpperCase(),
                        ),
                      ),
                    )
                    .toList(),
                onChanged: (value) {
                  if (value != null) {
                    controller.changeLocale(value);
                  }
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
