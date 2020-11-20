/// Annotation for `repo_case` package
///
/// Annotate your repository class with `@RepoCase()` or `@repoCase`
/// to automatically generate usecase classes for each method inside the repository
///
/// **NOTE**: The repository class must be `abstract`!
///
/// ```dart
/// @repoCase
/// abstract class Repository {
///   void method1();
///   int method2(String param);
///   Future<String> method3(int param1, int param2);
/// }
///
/// class RepositoryImpl implements Repository {
///   // Concrete implementation
/// }
/// ```
/// The code example above will generate three classes,
/// each having a `call` method that calls the respective function in the repository:
/// - `Method1Repo`, which calls `repository.method1()`
/// - `Method2Repo`, which calls `repository.method2()`
/// - `Method3Repo`, which calls `repository.method3()`
///
/// Check out [the offical documentation](https://github.com/SandroMaglione/repo_case.dart)
/// for more details and examples.
///
/// Created by **Sandro Maglione**
///  - https://twitter.com/SandroMaglione
///  - https://www.sandromaglione.com/
class RepoCase {
  const RepoCase();
}

/// Annotation for `repo_case` package
///
/// Annotate your repository class with `@RepoCase()` or `@repoCase`
/// to automatically generate usecase classes for each method inside the repository
///
/// **NOTE**: The repository class must be `abstract`!
///
/// ```dart
/// @repoCase
/// abstract class Repository {
///   void method1();
///   int method2(String param);
///   Future<String> method3(int param1, int param2);
/// }
///
/// class RepositoryImpl implements Repository {
///   // Concrete implementation
/// }
/// ```
/// The code example above will generate three classes,
/// each having a `call` method that calls the respective function in the repository:
/// - `Method1Repo`, which calls `repository.method1()`
/// - `Method2Repo`, which calls `repository.method2()`
/// - `Method3Repo`, which calls `repository.method3()`
///
/// Check out [the offical documentation](https://github.com/SandroMaglione/repo_case.dart)
/// for more details and examples.
///
/// Created by **Sandro Maglione**
///  - https://twitter.com/SandroMaglione
///  - https://www.sandromaglione.com/
const repoCase = RepoCase();
