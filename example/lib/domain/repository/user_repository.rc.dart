// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs, unused_import, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, argument_type_not_assignable

import 'package:meta/meta.dart';

// **************************************************************************
// RepoCaseGenerator
// **************************************************************************

import 'package:example/domain/entities/entity.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:example/domain/repository/user_repository.dart';

/// `UserRepository`
///
/// ```dart
/// String param;
/// ```
class GetDataRepo {
  final UserRepository userRepository;

  const GetDataRepo({
    required this.userRepository,
  });

  Entity call(GetDataRepoParams params) {
    return userRepository.getData(
      params.param,
    );
  }
}

class GetDataRepoParams {
  final String param;

  const GetDataRepoParams({
    required this.param,
  });
}

/// `UserRepository`
class GetDataNullableRepo {
  final UserRepository userRepository;

  const GetDataNullableRepo({
    required this.userRepository,
  });

  Entity? call() {
    return userRepository.getDataNullable();
  }
}

/// `UserRepository`
///
/// ```dart
/// int? param;
/// ```
class GetParamNullableRepo {
  final UserRepository userRepository;

  const GetParamNullableRepo({
    required this.userRepository,
  });

  Entity call(GetParamNullableRepoParams params) {
    return userRepository.getParamNullable(
      params.param,
    );
  }
}

class GetParamNullableRepoParams {
  final int? param;

  const GetParamNullableRepoParams({
    required this.param,
  });
}

/// `UserRepository`
///
/// ```dart
/// double? param;
/// ```
class GetNullableRepo {
  final UserRepository userRepository;

  const GetNullableRepo({
    required this.userRepository,
  });

  Entity? call(GetNullableRepoParams params) {
    return userRepository.getNullable(
      params.param,
    );
  }
}

class GetNullableRepoParams {
  final double? param;

  const GetNullableRepoParams({
    required this.param,
  });
}

/// `UserRepository`
///
/// ```dart
/// dynamic appLocalizations;
/// ```
class GetLocalRepo {
  final UserRepository userRepository;

  const GetLocalRepo({
    required this.userRepository,
  });

  String call(GetLocalRepoParams params) {
    return userRepository.getLocal(
      params.appLocalizations,
    );
  }
}

class GetLocalRepoParams {
  final dynamic appLocalizations;

  const GetLocalRepoParams({
    required this.appLocalizations,
  });
}

/// `UserRepository`
///
/// ```dart
/// Generic generic;
/// ```
class GetParamGenericRepo {
  final UserRepository userRepository;

  const GetParamGenericRepo({
    required this.userRepository,
  });

  int call<Generic>(GetParamGenericRepoParams<Generic> params) {
    return userRepository.getParamGeneric(
      params.generic,
    );
  }
}

class GetParamGenericRepoParams<Generic> {
  final Generic generic;

  const GetParamGenericRepoParams({
    required this.generic,
  });
}

/// `UserRepository`
///
/// ```dart
/// int param;
/// ```
class GetReturnGenericRepo {
  final UserRepository userRepository;

  const GetReturnGenericRepo({
    required this.userRepository,
  });

  Generic call<Generic>(GetReturnGenericRepoParams params) {
    return userRepository.getReturnGeneric(
      params.param,
    );
  }
}

class GetReturnGenericRepoParams {
  final int param;

  const GetReturnGenericRepoParams({
    required this.param,
  });
}

/// `UserRepository`
///
/// ```dart
/// A a;
/// C c;
/// ```
class GetFullGenericRepo {
  final UserRepository userRepository;

  const GetFullGenericRepo({
    required this.userRepository,
  });

  B call<A, B, C>(GetFullGenericRepoParams<A, C> params) {
    return userRepository.getFullGeneric(
      params.a,
      params.c,
    );
  }
}

class GetFullGenericRepoParams<A, C> {
  final A a;
  final C c;

  const GetFullGenericRepoParams({
    required this.a,
    required this.c,
  });
}
