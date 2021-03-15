// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: public_member_api_docs, unused_import, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies

import 'package:meta/meta.dart';

// **************************************************************************
// RepoCaseGenerator
// **************************************************************************

import 'package:example/domain/entities/entity.dart';
import 'package:example/domain/repository/user_repository.dart';

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
