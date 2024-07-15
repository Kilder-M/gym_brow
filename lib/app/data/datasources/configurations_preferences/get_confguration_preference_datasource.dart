import 'package:gymbrow/app/data/dtos/configuration_preference_dto.dart';

abstract class GetConfigurationPreferenceDataSource {
  Future<ConfigurationPreferenceDTO?> call();
}
