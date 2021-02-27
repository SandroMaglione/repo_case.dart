// @dart=2.9
import 'package:repo_case/repo_case.dart';
import 'package:source_gen_test/annotations.dart';

@ShouldGenerate(
  r'''

''',
)
@repoCase
abstract class TestClass {}

@ShouldThrow('repo_case: foo is not a class element')
@repoCase
const foo = 'bar';

@ShouldThrow('repo_case: NotAbstractClass is not an abstract class')
@repoCase
class NotAbstractClass {}

// @ShouldGenerate(
//   r'''
// class RepoMethodRepo {
//   final Repository repository;

//   const RepoMethodRepo({
//     @required this.repository,
//   });

//   void call() {
//     return repository.repoMethod();
//   }
// }
// ''',
// )
// @repoCase
// abstract class Repository {
//   void repoMethod();
// }
