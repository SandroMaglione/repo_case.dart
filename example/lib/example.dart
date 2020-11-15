import 'package:example/model.dart';
import 'package:injectable/injectable.dart';
import 'package:repo_case/repo_case.dart';

@repoCase
abstract class UserRepository {
  Future<bool> postFeedback(int idWorkoutExecution, String workoutFeedback);

  bool postWellness(Model model);
  Future<bool> postWellnessNumber2(int wellnessFeedback);

  Future<List<String>> getWellnessHistory();

  List<Model> models(Model model);

  void repoMethod();
}

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Future<List<String>> getWellnessHistory() {
    throw UnimplementedError();
  }

  @override
  List<Model> models(Model model) {
    throw UnimplementedError();
  }

  @override
  Future<bool> postFeedback(int idWorkoutExecution, String workoutFeedback) {
    throw UnimplementedError();
  }

  @override
  bool postWellness(Model model) {
    throw UnimplementedError();
  }

  @override
  Future<bool> postWellnessNumber2(int wellnessFeedback) {
    throw UnimplementedError();
  }

  @override
  void repoMethod() {}
}
