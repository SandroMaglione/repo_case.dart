// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'example.rc.dart';
import 'example.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<UserRepository>(() => UserRepositoryImpl());
  gh.factory<GetWellnessHistoryRepo>(
      () => GetWellnessHistoryRepo(userRepository: get<UserRepository>()));
  gh.factory<ModelsRepo>(
      () => ModelsRepo(userRepository: get<UserRepository>()));
  gh.factory<PostFeedbackRepo>(
      () => PostFeedbackRepo(userRepository: get<UserRepository>()));
  gh.factory<PostWellnessNumber2Repo>(
      () => PostWellnessNumber2Repo(userRepository: get<UserRepository>()));
  gh.factory<PostWellnessRepo>(
      () => PostWellnessRepo(userRepository: get<UserRepository>()));
  gh.factory<RepoMethodRepo>(
      () => RepoMethodRepo(userRepository: get<UserRepository>()));
  return get;
}
