// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'example.dart';

// **************************************************************************
// RepoCaseGenerator
// **************************************************************************

class PostfeedbackRepo {
  final UserRepository userRepository;

  const PostfeedbackRepo({
    @required this.userRepository,
  });

  @override
  Future<Either<Failure, bool>> call(PostfeedbackRepoParams params) async {
    return userRepository.postFeedback(
      params.idWorkoutExecution,
      params.workoutFeedback,
    );
  }
}

class PostfeedbackRepoParams extends Equatable {
  final int idWorkoutExecution;
  final String workoutFeedback;

  const PostfeedbackRepoParams({
    @required idWorkoutExecution,
    @required workoutFeedback,
  });

  @override
  List<Object> get props => [
        idWorkoutExecution,
        workoutFeedback,
      ];
}

class PostwellnessRepo {
  final UserRepository userRepository;

  const PostwellnessRepo({
    @required this.userRepository,
  });

  @override
  Future<Either<Failure, bool>> call(PostwellnessRepoParams params) async {
    return userRepository.postWellness(
      params.wellnessFeedback,
    );
  }
}

class PostwellnessRepoParams extends Equatable {
  final int wellnessFeedback;

  const PostwellnessRepoParams({
    @required wellnessFeedback,
  });

  @override
  List<Object> get props => [
        wellnessFeedback,
      ];
}

class Postwellnessnumber2Repo {
  final UserRepository userRepository;

  const Postwellnessnumber2Repo({
    @required this.userRepository,
  });

  @override
  Future<Either<Failure, bool>> call(
      Postwellnessnumber2RepoParams params) async {
    return userRepository.postWellnessNumber2(
      params.wellnessFeedback,
    );
  }
}

class Postwellnessnumber2RepoParams extends Equatable {
  final int wellnessFeedback;

  const Postwellnessnumber2RepoParams({
    @required wellnessFeedback,
  });

  @override
  List<Object> get props => [
        wellnessFeedback,
      ];
}
