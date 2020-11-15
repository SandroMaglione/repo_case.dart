import 'package:example/domain/entities/entity.dart';
import 'package:repo_case/repo_case.dart';

@repoCase
abstract class UserRepository {
  Entity getData(String param);
}
