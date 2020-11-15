// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart';
import 'package:injectable/injectable.dart';

import 'domain/repository/user_repository.rc.dart';
import 'domain/repository/user_repository.dart';
import 'data/repository/user_repository_impl.dart';

/// adds generated dependencies
/// to the provided [GetIt] instance

GetIt $initGetIt(
  GetIt get, {
  String environment,
  EnvironmentFilter environmentFilter,
}) {
  final gh = GetItHelper(get, environment, environmentFilter);
  gh.factory<UserRepository>(() => UserRepositoryImpl());
  gh.factory<GetDataRepo>(
      () => GetDataRepo(userRepository: get<UserRepository>()));
  return get;
}
