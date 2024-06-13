import 'package:flutter_gen/gen_l10n/app_localization.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gymbrow/app/presentation/bases/gb_base_view.dart';
import 'package:gymbrow/app/presentation/widgets/gb_text_field_widget.dart';
import 'package:gymbrow/app/presentation/workout/controllers/workout_form_view_controller.dart';

class WorkoutFormView extends GBBaseView<WorkoutFormViewController> {
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
          key: controller.formKey,
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
                GBTextFormField(
                  labelText: AppLocalizations.of(context)!.name,
                  initialValue: controller.workoutEntity.name.isNotEmpty
                      ? controller.workoutEntity.name
                      : null,
                  validator: controller.nameValidator,
                  onChanged: (value) {
                    controller.workoutEntity.name = value;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GBTextFormField(
                        labelText: AppLocalizations.of(context)!.series,
                        initialValue: controller.workoutEntity.series != 0
                            ? controller.workoutEntity.series.toString()
                            : null,
                        validator: controller.doubleValidator,
                        onChanged: (value) {
                          controller.workoutEntity.series =
                              int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextFormField(
                        labelText: AppLocalizations.of(context)!.repetitions,
                        initialValue: controller.workoutEntity.repetitions != 0
                            ? controller.workoutEntity.repetitions.toString()
                            : null,
                        validator: controller.repetitionsValidator,
                        onChanged: (value) {
                          controller.workoutEntity.repetitions =
                              int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                Row(
                  children: [
                    Expanded(
                      child: GBTextFormField(
                        labelText: AppLocalizations.of(context)!.weight,
                        initialValue: controller.workoutEntity.weight != 0
                            ? controller.workoutEntity.weight.toString()
                            : null,
                        onChanged: (value) {
                          controller.workoutEntity.weight =
                              double.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextFormField(
                        labelText: AppLocalizations.of(context)!.rest_time,
                        initialValue: controller.workoutEntity.restTime != 0
                            ? controller.workoutEntity.restTime.toString()
                            : null,
                        keyboardType: TextInputType.number,
                        onChanged: (value) {
                          controller.workoutEntity.restTime =
                              double.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 8,
                ),
                GBTextFormField(
                  labelText: AppLocalizations.of(context)!.observations,
                  initialValue: controller.workoutEntity.observations,
                  maxLines: 4,
                  onChanged: (value) {
                    controller.workoutEntity.observations = value;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 16.0),
                  child: SizedBox(
                    width: double.infinity,
                    child: FilledButton(
                      onPressed: () {
                        if (controller.formKey.currentState!.validate()) {
                          if (controller.workoutEntity.id != null) {
                            controller.updateWorkoutUsecase();
                            Get.back();
                          } else {
                            controller.saveWorkoutUsecase();
                            Get.back();
                          }
                        }
                      },
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
