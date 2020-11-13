import 'package:repo_case/repo_case.dart';

part 'example.g.dart';

@RepoCase()
abstract class UserRepository {
  Future<bool> postFeedback(int idWorkoutExecution, String workoutFeedback);

  Future<bool> postWellness(int wellnessFeedback);
  Future<bool> postWellnessNumber2(int wellnessFeedback);

  // Future<List<String>> getWellnessHistory();
}
