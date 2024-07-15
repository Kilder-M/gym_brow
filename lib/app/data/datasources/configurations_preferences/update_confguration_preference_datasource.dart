import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';

abstract class UpdateConfigurationPreferenceDataSource {
  Future<bool> call(ConfigurationPreferenceDTO configurationPreferenceDTO);
}