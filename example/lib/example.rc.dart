// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs, unused_import, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

// repo_case: https://github.com/SandroMaglione/repo_case.dart
// Author: Sandro Maglione
//   - https://twitter.com/SandroMaglione
//   - https://www.sandromaglione.com/

import 'package:meta/meta.dart';

// **************************************************************************
// RepoCaseGenerator
// **************************************************************************

import 'package:example/model.dart';
import 'package:injectable/injectable.dart';
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

class ModelsRepo {
  final UserRepository userRepository;

  const ModelsRepo({
    @required this.userRepository,
  });

  List<Model> call(ModelsRepoParams params) {
    return userRepository.models(
      params.model,
    );
  }
}

class ModelsRepoParams {
  final Model model;

  const ModelsRepoParams({
    @required this.model,
  });
}

class RepoMethodRepo {
  final UserRepository userRepository;

  const RepoMethodRepo({
    @required this.userRepository,
  });

  void call() {
    return userRepository.repoMethod();
  }
}
