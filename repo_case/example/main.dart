import 'package:repo_case/repo_case.dart';

@repoCase
abstract class Repository {
  String getData(int param);
}
