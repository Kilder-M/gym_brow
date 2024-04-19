import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:google_nav_bar/google_nav_bar.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Scaffold(
        // appBar: AppBar(
        //   title: const Text('Gymbrow'),
        // ),
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            color: context.theme.colorScheme.background,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                color: Colors.black.withOpacity(.1),
              ),
            ],
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: GNav(
              gap: 4,
              selectedIndex: controller.selectedItem.value,
              padding: const EdgeInsets.all(16),
              tabBackgroundColor: context.theme.splashColor,
              tabMargin: const EdgeInsets.all(2),
              onTabChange: (value) => controller.selectedItem.value = value,
              tabs: [
                GButton(
                  icon: Icons.fitness_center_rounded,
                  text: AppLocalizations.of(context)!.workout,
                ),
                GButton(
                  icon: Icons.person_rounded,
                  text: AppLocalizations.of(context)!.profile,
                ),
                GButton(
                  icon: Icons.settings_rounded,
                  text: AppLocalizations.of(context)!.settings,
                ),
              ],
            ),
          ),
        ),
        body: controller.tabs.elementAt(controller.selectedItem.value),
      ),
    );
  }
}
