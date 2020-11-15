# Repo Case
<p>
  <img src="https://img.shields.io/badge/version-0.1.0-blue.svg" />
  <img src="https://img.shields.io/badge/flutter-v1.22.0-blue.svg" />
  <img src="https://img.shields.io/badge/dart-v2.10.0-blue.svg" />
  <a href="https://github.com/SandroMaglione">
    <img alt="GitHub: SandroMaglione" src="https://img.shields.io/github/followers/SandroMaglione?label=Follow&style=social" target="_blank" />
  </a>
  <a href="https://twitter.com/SandroMaglione">
    <img alt="Twitter: SandroMaglione" src="https://img.shields.io/twitter/follow/SandroMaglione.svg?style=social" target="_blank" />
  </a>
</p>

**Automatically generate usecase classes from your repository class definition in Dart and Flutter**.

Made by **Sandro Maglione**, check out his personal official website [sandromaglione.com](https://www.sandromaglione.com)

## Overview
1. Import the package
2. Create a repository class
3. Annotate the class with `@repoCase`
4. Run the build
5. Complete!

## Quick tutorial
Create your repository class definition in a new `repository.dart` file and annotate it with `@repoCase`:
```dart
@repoCase
abstract class UserRepository {
  String getString(int param);
}
```
Launch the build command to generate the usecase class:
```shell
flutter pub run build_runner build
```
The package will generate a usecase class for each method of the repository in a new `repository.rc.dart` file as follows:
```dart
class GetStringRepo {
  final UserRepository userRepository;

  const GetStringRepo({
    @required this.userRepository,
  });

  String call(GetStringRepoParams params) {
    return userRepository.getString(
      params.param,
    );
  }
}

class GetStringRepoParams {
  final int param;

  const GetStringRepoParams({
    @required this.param,
  });
}
```
You can now use the usecase class to access the repository:
```dart
/// Call repository with correct parameters
final String result = getStringRepo(
    GetStringRepoParams(
        param: 1,
    ),
);
```
## Motivation
This package is inspired by the by the [Flutter TDD Clean Architecture Course](https://www.youtube.com/watch?v=KjE2IDphA_U&list=PLB6lc7nQ1n4iYGE_khpXRdJkJEp9WOech) from [Reso Coder](https://www.youtube.com/channel/UCSIvrn68cUk8CS8MbtBmBkA).

Specifically, **the goal of the package is to autogenerate usecase classes**. The template for the usecase class is presented in the [2nd video of the course](https://youtu.be/lPkWX8xFthE?t=2196). 

The usecase class aims to abstract the domain layer from the presentation layer. For each method of the repository class we should write a new usecase class, which is then called from the presentation layer to access the repository.

![Repository-Usecases-Presentation diagram](https://raw.githubusercontent.com/SandroMaglione/repo_case.dart/master/docs/images/repo_usecase_presentation.png)

The template of each usecase class as presented in the course is basically always the same. The only differences are the name of the method, the parameters, and its return type. Perfect usecase for code generation!

## Import the package
Import the `repo_case` package as a normal dependencies and the `repo_case_generator` package as a dev_dependencies as well as the `build_runner` package (needed for code generation) in your `pubspec.yaml` file:
```yaml
dependencies:
  flutter:
    sdk: flutter
  repo_case: ^0.1.0

dev_dependencies:
  flutter_test:
    sdk: flutter
    
  build_runner: any
  repo_case_generator: ^0.1.0
```
## Clean Architecture
### [Entity](https://youtu.be/lPkWX8xFthE?t=350)
The entity class contains all the data exposed to the `presentation layer`, which comes from the `data layer` (database, local storage, etc.) and is accessed through the `domain layer`. The presentation layer will call the usecase class to access the entity to be displayed in the app.

We create a new `domain` folder and an `entities` folder inside it. We then create a entity class in a new [`entity.dart`](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/domain/entities/entity.dart) file inside the entities folder:
```dart
/// lib/domain/entities/entity.dart
class Entity {
  final String data;

  const Entity(this.data);
}
```
### [Model](https://youtu.be/keaTZ9M_U1A?t=1309)
The models are used to fetch and convert external raw data (json, xml, etc.) to dart objects. These classes extends the entities in order to be passed from the data layer to the presentation layer.

We create a new `data` folder and a `models` folder inside it. We then create a model class in a new [`model.dart`](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/data/models/model.dart) file inside the models folder:
```dart
/// lib/data/models/model.dart
class Model extends Entity {
  const Model(String data) : super(data);
}
```
### [Repository](https://youtu.be/m_lkZo6CYcs?t=63)
The repository contains the methods that will be called from the presentation layer to access the data from external sources. It defines all the usecases that can be accessed by the presentation layer. **The repository will fetch the `models` from the data layer and return `entities` to the presentation layer.**

We create a `repository` folder inside the domain folder. We then create a repository class in a new dart file. The file must contain an [`abstract class`](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/domain/repository/user_repository.dart) annotated with the **`@repoCase`** annotation:
```dart
/// lib/domain/repository/user_repository.dart
@repoCase
abstract class UserRepository {
  Entity getData(String param);
}
```
We can now run the build command to autogenerate the usecase classes:
```shell
flutter pub run build_runner build
```
This command will generate a new [`user_repository.rc.dart`](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/domain/repository/user_repository.rc.dart) file in the same folder of the repository class (`rc` stays for 'repo_case'):
```dart
/// lib/domain/repository/user_repository.rc.dart
class GetDataRepo {
  final UserRepository userRepository;

  const GetDataRepo({
    @required this.userRepository,
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
    @required this.param,
  });
}
```
### [Repository concrete implementation](https://youtu.be/m_lkZo6CYcs?t=123)
We must also define the concrete implementation of the repository class that will fetch the model from the data layer and return the respective entity.

We create a new `repository` folder inside the data folder. We then create a new file containing the [concrete implementation](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/data/repository/user_repository_impl.dart) of our repository:
```dart
class UserRepositoryImpl implements UserRepository {
  @override
  Entity getData(String param) {
    /// Get data from data sources (database, local storage, etc.)
    return Model(param);
  }
}
```
### Access the entity from the presentation layer
We can now call the usecase class from the presentation layer to access the entities.

For example, we could have a [`bloc`](https://github.com/SandroMaglione/repo_case.dart/blob/master/example/lib/presentation/user_bloc.dart) class that defines a method to fetch an entity to display in the app. Here below an example of how we would implement it:
```dart
class UserBloc {
  /// Usecase class generated by the repo_case package
  final GetDataRepo getDataRepo;

  const UserBloc(this.getDataRepo);

  Entity getDataFromRepository(String param) {
    return getDataRepo(
      /// Params class generated by the repo_case package
      GetDataRepoParams(
        param: param,
      ),
    );
  }
}
```
---
## Injectable
The package is designed to work with the [`injectable`](https://pub.dev/packages/injectable) package.

All the usecase classes have the `-Repo` suffix. You can therefore add the following rule to your `build.yaml` file to automatically add the usecase classes to the list of classes generated by the injectable package. Check out the [example](https://github.com/SandroMaglione/repo_case.dart/tree/master/example) for more details:
```yaml
targets:
  $default:
    builders:
      injectable_generator:injectable_builder:
        options:
          auto_register: true
          class_name_pattern: "Repo$"
```
---
## Roadmap
I am always open for suggestions and ideas for possible improvements or fixes.

Feel free to open a [**Pull Request**](https://github.com/SandroMaglione/repo_case.dart/pulls) if you would like to contribute to the project.

If you would like to have a new feature implemented, just write a new issue.

## Versioning
- v0.1.0 - 15 November 2020

## License
MIT License, see the [LICENSE.md](https://github.com/SandroMaglione/repo_case.dart/blob/master/LICENSE) file for details.