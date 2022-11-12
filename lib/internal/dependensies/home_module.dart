import 'package:clean_arch_study_1/domain/state/home_state.dart';
import 'package:clean_arch_study_1/internal/dependensies/repository_module.dart';

class HomeModule {
  static HomeState get homeState => HomeState(RepositoryModule.dayRepository);
}