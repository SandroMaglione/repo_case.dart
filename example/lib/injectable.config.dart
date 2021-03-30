// GENERATED CODE - DO NOT MODIFY BY HAND

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

import 'package:get_it/get_it.dart' as _i1;
import 'package:injectable/injectable.dart' as _i2;

import 'data/repository/user_repository_impl.dart' as _i4;
import 'domain/repository/user_repository.dart' as _i3;
import 'domain/repository/user_repository.rc.dart'
    as _i5; // ignore_for_file: unnecessary_lambdas

// ignore_for_file: lines_longer_than_80_chars
/// initializes the registration of provided dependencies inside of [GetIt]
_i1.GetIt $initGetIt(_i1.GetIt get,
    {String? environment, _i2.EnvironmentFilter? environmentFilter}) {
  final gh = _i2.GetItHelper(get, environment, environmentFilter);
  gh.factory<_i3.UserRepository>(() => _i4.UserRepositoryImpl());
  gh.factory<_i5.GetDataNullableRepo>(
      () => _i5.GetDataNullableRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetDataRepo>(
      () => _i5.GetDataRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetFullGenericRepo>(
      () => _i5.GetFullGenericRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetLocalRepo>(
      () => _i5.GetLocalRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetNullableRepo>(
      () => _i5.GetNullableRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetParamGenericRepo>(
      () => _i5.GetParamGenericRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetParamNullableRepo>(() =>
      _i5.GetParamNullableRepo(userRepository: get<_i3.UserRepository>()));
  gh.factory<_i5.GetReturnGenericRepo>(() =>
      _i5.GetReturnGenericRepo(userRepository: get<_i3.UserRepository>()));
  return get;
}
