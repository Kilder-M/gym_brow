import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
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
      body: ListTile(
        contentPadding: const EdgeInsets.symmetric(horizontal: 8),
        trailing: Obx(
          () => Switch(
            value: controller.isDarkTheme.value,
            onChanged: (bool value) {
              controller.isDarkTheme.value = value;
              Get.changeTheme(
                controller.isDarkTheme.value
                    ? ThemeData.dark()
                    : ThemeData.light(),
              );
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
            size: 12,
          ),
        ),
      ),
    );
  }
}
