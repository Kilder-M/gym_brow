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
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 4.0),
        child: Form(
          key: controller.formKey,
          child: SingleChildScrollView(
            child: Column(
              children: [
                // Padding(
                //   padding: const EdgeInsets.symmetric(vertical: 8),
                //   child: Column(
                //     children: [
                //       const SizedBox(
                //         height: 80,
                //         width: 80,
                //         child: CircleAvatar(
                //           child: Icon(Icons.camera_alt_outlined),
                //         ),
                //       ),
                //       Text(AppLocalizations.of(context)!.machine)
                //     ],
                //   ),
                // ),
                const SizedBox(
                  height: 4,
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
                        labelText: AppLocalizations.of(context)!.reps,
                        initialValue: controller.workoutEntity.reps != 0
                            ? controller.workoutEntity.reps.toString()
                            : null,
                        validator: controller.doubleValidator,
                        keyboardType: TextInputType.number,
                        inputFormatters: [
                          controller.intTextMask,
                        ],
                        onChanged: (value) {
                          controller.workoutEntity.reps =
                              int.tryParse(value) ?? 0;
                        },
                      ),
                    ),
                    const SizedBox(
                      width: 8,
                    ),
                    Expanded(
                      child: GBTextFormField(
                        labelText: AppLocalizations.of(context)!.sets,
                        keyboardType: TextInputType.number,
                        initialValue: controller.workoutEntity.sets != 0
                            ? controller.workoutEntity.sets.toString()
                            : null,
                        validator: controller.setsValidator,
                        inputFormatters: [
                          controller.intTextMask,
                        ],
                        onChanged: (value) {
                          controller.workoutEntity.sets =
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
                        inputFormatters: [
                          controller.doubleTextMask,
                        ],
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
                        inputFormatters: [
                          controller.doubleTextMask,
                        ],
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
