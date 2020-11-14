// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// RepoCaseGenerator
// **************************************************************************

// ignore_for_file: public_member_api_docs
import 'package:meta/meta.dart';
import 'package:example/model.dart';
import 'package:example/example.dart';

class PostFeedbackRepo {
  final UserRepository userRepository;

  const PostFeedbackRepo({
    @required this.userRepository,
  });

  Future<bool> call(PostFeedbackRepoParams params) async {
    return userRepository.postFeedback(
      params.idWorkoutExecution,
      params.workoutFeedback,
    );
  }
}

class PostFeedbackRepoParams {
  final int idWorkoutExecution;
  final String workoutFeedback;

  const PostFeedbackRepoParams({
    @required this.idWorkoutExecution,
    @required this.workoutFeedback,
  });
}

class PostWellnessRepo {
  final UserRepository userRepository;

  const PostWellnessRepo({
    @required this.userRepository,
  });

  bool call(PostWellnessRepoParams params) {
    return userRepository.postWellness(
      params.model,
    );
  }
}

class PostWellnessRepoParams {
  final Model model;

  const PostWellnessRepoParams({
    @required this.model,
  });
}

class PostWellnessNumber2Repo {
  final UserRepository userRepository;

  const PostWellnessNumber2Repo({
    @required this.userRepository,
  });

  Future<bool> call(PostWellnessNumber2RepoParams params) async {
    return userRepository.postWellnessNumber2(
      params.wellnessFeedback,
    );
  }
}

class PostWellnessNumber2RepoParams {
  final int wellnessFeedback;

  const PostWellnessNumber2RepoParams({
    @required this.wellnessFeedback,
  });
}

class GetWellnessHistoryRepo {
  final UserRepository userRepository;

  const GetWellnessHistoryRepo({
    @required this.userRepository,
  });

  Future<List<String>> call() async {
    return userRepository.getWellnessHistory();
  }
}
