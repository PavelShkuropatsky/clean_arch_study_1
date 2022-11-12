import 'package:clean_arch_study_1/data/repository/day_data_repository.dart';
import 'package:clean_arch_study_1/domain/repository/day_repository.dart';
import 'package:clean_arch_study_1/internal/dependensies/api_module.dart';

class RepositoryModule {
  static DayRepository? _dayRepository;

  static DayRepository get dayRepository {
    _dayRepository ??= DayDataRepository(ApiModule.apiUtil);

    return _dayRepository!;
  }
}