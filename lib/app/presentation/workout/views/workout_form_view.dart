import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:gymbrow/app/presentation/widgets/gb_text_field_widget.dart';

class WorkoutFormView extends StatelessWidget {
  const WorkoutFormView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.new_workout),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0),
        child: Form(
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 8),
                  child: GestureDetector(
                    onTap: () {},
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 80,
                          width: 80,
                          child: CircleAvatar(
                            child: Icon(Icons.camera_alt_outlined),
                          ),
                        ),
                        Text(AppLocalizations.of(context)!.machine)
                      ],
                    ),
                  ),
                ),
                GBTextField(labelText: AppLocalizations.of(context)!.name),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GBTextField(
                        labelText: AppLocalizations.of(context)!.series,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextField(
                        labelText: AppLocalizations.of(context)!.repetitions,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextField(
                        labelText: AppLocalizations.of(context)!.weight,
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextField(
                        labelText: AppLocalizations.of(context)!.rest_time,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                GBTextField(
                  labelText: AppLocalizations.of(context)!.observations,
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {},
                      child: Text(AppLocalizations.of(context)!.save),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
