import 'package:example/data/models/model.dart';
import 'package:example/domain/entities/entity.dart';
import 'package:example/domain/repository/user_repository.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Entity getData(String param) {
    /// Get data from data sources (database, local storage, etc.)
    return Model(param);
  }

  @override
  Entity? getDataNullable() {
    // TODO: implement getDataNullable
    throw UnimplementedError();
  }

  @override
  Entity? getNullable(double? param) {
    // TODO: implement getNullable
    throw UnimplementedError();
  }

  @override
  Entity getParamNullable(int? param) {
    // TODO: implement getParamNullable
    throw UnimplementedError();
  }

  @override
  String getLocal(AppLocalizations? appLocalizations) {
    // TODO: implement getLocal
    throw UnimplementedError();
  }

  @override
  int getParamGeneric<Generic>(Generic generic) {
    // TODO: implement getParamGeneric
    throw UnimplementedError();
  }

  @override
  B getFullGeneric<A, B, C>(A a, C c) {
    // TODO: implement getFullGeneric
    throw UnimplementedError();
  }

  @override
  Generic getReturnGeneric<Generic>(int param) {
    // TODO: implement getReturnGeneric
    throw UnimplementedError();
  }
}
