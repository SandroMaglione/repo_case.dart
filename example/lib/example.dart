import 'package:example/model.dart';
import 'package:repo_case/repo_case.dart';

@repoCase
abstract class UserRepository {
  Future<bool> postFeedback(int idWorkoutExecution, String workoutFeedback);

  bool postWellness(Model model);
  Future<bool> postWellnessNumber2(int wellnessFeedback);

  Future<List<String>> getWellnessHistory();
}
