import 'package:repo_case/repo_case.dart';

part 'example.g.dart';

@RepoCase()
class UserRepository {
  final String play;
  final int nummm;

  const UserRepository(this.play, this.nummm);

  void open() {}
  void ending() {}
}
