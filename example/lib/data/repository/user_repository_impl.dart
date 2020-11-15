import 'package:example/data/models/model.dart';
import 'package:example/domain/entities/entity.dart';
import 'package:example/domain/repository/user_repository.dart';
import 'package:injectable/injectable.dart';

@Injectable(as: UserRepository)
class UserRepositoryImpl implements UserRepository {
  @override
  Entity getData(String param) {
    /// Get data from data sources (database, local storage, etc.)
    return Model(param);
  }
}
