import 'package:analyzer/dart/element/element.dart';
import 'package:repo_case_generator/src/utils.dart';

class ClassGenerator {
  final StringBuffer _stringBuffer = StringBuffer();
  final List<MethodElement> methods;
  final List<LibraryElement> libraries;
  final String repoClassName;

  ClassGenerator(this.methods, this.libraries, this.repoClassName);

  void _write(Object obj) => _stringBuffer.write(obj);

  void _writeln([Object obj]) => _stringBuffer.writeln(obj);

  void _newLine() => _stringBuffer.writeln();

  String generate() {
    // Ignores and imports
    _writeln("// ignore_for_file: public_member_api_docs");
    // _writeln("// ignore_for_file: unused_import");
    _writeln("import 'package:meta/meta.dart';");

    libraries.forEach((library) {
      final libraryName = library.source.uri;
      if (!_isCoreDartTypeOrRepoCase(libraryName)) {
        _writeln("import '$libraryName';");
      }
    });

    methods.forEach((method) {
      _generateUsecaseClassFromMethod(method);
    });

    return _stringBuffer.toString();
  }

  void _generateUsecaseClassFromMethod(MethodElement methodElement) {
    final methodName = methodElement.name;
    final methodClassName = _methodRepoClassName(methodName);
    final repoParamsClassName = _repoParamsClassName(methodClassName);
    final methodParameters = methodElement.parameters;
    final hasMethodParameters = methodParameters.isNotEmpty;
    final methodReturnType =
        methodElement.returnType.getDisplayString(withNullability: false);
    final isMethodAsync = methodElement.returnType.isDartAsyncFuture;

    // 1. Class definition
    _writeln('class $methodClassName {');

    // 2. Inject repo class as parameter
    _writeln('final $repoClassName $_repoClassNameParameter;');
    _newLine();

    // 3. Const class constructor
    _writeln('const $methodClassName({');

    // 4. Required repo class parameter
    _writeln('@required this.$_repoClassNameParameter,');

    // 5. Close constructor
    _writeln('});');
    _newLine();

    // 6. Defintion of 'call' function
    _write(methodReturnType);
    _write(' call(');
    if (hasMethodParameters) {
      _write('$repoParamsClassName params');
    }
    _write(') ');
    _writeln(isMethodAsync ? 'async {' : '{');

    // 7. 'call' function body
    _writeln('return $_repoClassNameParameter.$methodName(');
    methodParameters.forEach((parameter) {
      final parameterName = parameter.name;
      _writeln('params.$parameterName,');
    });
    _writeln(');');

    // 7. Close 'call' function definition
    _writeln('}');

    // 8. Close usecase class
    _writeln('}');
    _newLine();

    // 9. Generate params class
    if (hasMethodParameters) {
      _generateParamsClass(repoParamsClassName, methodParameters);
    }
  }

  void _generateParamsClass(
      String repoParamsClassName, List<ParameterElement> parameters) {
    // 1. Class definition
    _writeln('class $repoParamsClassName {');

    // 2. Class parameters from method definition
    parameters.forEach((parameter) {
      final parameterName = parameter.name;
      final parameterReturnType =
          parameter.type.getDisplayString(withNullability: false);
      _writeln('final $parameterReturnType $parameterName;');
    });
    _newLine();

    // 3. Class constructor
    _writeln('const $repoParamsClassName ({');

    // 4. Required parameters
    parameters.forEach((parameter) {
      final parameterName = parameter.name;
      _writeln('@required this.$parameterName,');
    });

    // 5. Close constructor
    _writeln('});');

    // 6. Close params class
    _writeln('}');
  }

  /// Name of the repo source class with first lower case letter
  String get _repoClassNameParameter => toLowerCamelCase(repoClassName);

  /// Append suffix `Repo` to pascal case method name
  String _methodRepoClassName(String methodName) =>
      '${toPascalCase(methodName)}Repo';

  /// Parameters class for the usecase, given method name **already pascal
  String _repoParamsClassName(String methodName) => '${methodName}Params';

  /// Check if library import is `dart:core` of `repo_case/repo_case.dart`
  bool _isCoreDartTypeOrRepoCase(Uri uri) =>
      uri.toString().startsWith('dart') || uri.toString().contains('repo_case');
}
