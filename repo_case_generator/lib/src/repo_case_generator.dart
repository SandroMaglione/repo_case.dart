library repo_case_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:analyzer/dart/element/visitor.dart';
import 'package:analyzer/dart/element/type.dart';
import 'package:build/build.dart';
import 'package:repo_case_generator/src/use_case_class_generator.dart';
import 'package:source_gen/source_gen.dart';
import 'package:repo_case/repo_case.dart';

class RepoCaseGenerator extends GeneratorForAnnotation<RepoCase> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) {
    // print(annotation.read('isFuture').boolValue);

    return _generate(element);
  }

  String _generate(Element element) {
    final UseCaseClassGenerator useCaseClassGenerator = UseCaseClassGenerator();
    final ModelVisitor modelVisitor = ModelVisitor();
    element.visitChildren(modelVisitor);

    for (var met in modelVisitor.methods.keys) {
      final currMethod = modelVisitor.methods[met];
      final dartType = currMethod.left;
      final className = '${useCaseClassGenerator.capitalizeAndLower(met)}Repo';
      final repoType = modelVisitor.classNameString;
      final repoName = useCaseClassGenerator.firstToLower(repoType);

      // Usecase class
      useCaseClassGenerator.writeln("class $className {");
      // useCaseClassGenerator.writeln(
      //     "class $className extends UseCase<${dartType},${className}Params> {");
      useCaseClassGenerator.writeln("final $repoType $repoName;");
      useCaseClassGenerator.newLine;
      useCaseClassGenerator.writeln("const $className({");
      useCaseClassGenerator.writeln("@required this.$repoName,");
      useCaseClassGenerator.writeln("});");
      useCaseClassGenerator.newLine;
      useCaseClassGenerator.writeln("@override");
      useCaseClassGenerator.writeln(
          "Future<Either<Failure, bool>> call(${className}Params params) async {");
      useCaseClassGenerator.writeln(
          "return $repoName.${useCaseClassGenerator.firstToLower(met)}(");
      currMethod.right.forEach((element) {
        final typeToDisplay = element.displayName;
        useCaseClassGenerator.writeln("params.$typeToDisplay,");
      });
      useCaseClassGenerator.writeln(");");
      useCaseClassGenerator.writeln("}");
      useCaseClassGenerator.writeln("}");
      useCaseClassGenerator.newLine;

      final paramsClassName = '${className}Params';
      useCaseClassGenerator
          .writeln("class $paramsClassName extends Equatable {");
      currMethod.right.forEach((element) {
        final typeToDisplay = element.getDisplayString(withNullability: false);
        useCaseClassGenerator.writeln("final $typeToDisplay;");
      });
      useCaseClassGenerator.newLine;

      // Params class
      useCaseClassGenerator.writeln("const $paramsClassName ({");
      currMethod.right.forEach((element) {
        final typeToDisplay = element.displayName;
        useCaseClassGenerator.writeln("@required $typeToDisplay,");
      });
      useCaseClassGenerator.writeln("});");
      useCaseClassGenerator.newLine;
      useCaseClassGenerator.writeln("@override");
      useCaseClassGenerator.writeln("List<Object> get props => [");
      currMethod.right.forEach((element) {
        final typeToDisplay = element.displayName;
        useCaseClassGenerator.writeln("$typeToDisplay,");
      });
      useCaseClassGenerator.writeln("];");
      useCaseClassGenerator.writeln("}");
    }
    return useCaseClassGenerator.generate;
  }
}

class ModelVisitor extends SimpleElementVisitor {
  DartType className;
  String classNameString;
  Map<String, Tuple<DartType, List<ParameterElement>>> methods = Map();

  @override
  visitConstructorElement(ConstructorElement element) {
    if (element != null) {
      print('Const ${element.name}');
      print('Const ${element.displayName}');
      print('Const ${element.runtimeType}');
      print('Const ${element.type}');
      // print('Const ${element.type.element.displayName}');
      // print('Const ${element.type.returnType}');
      // print('Const ${element.type.runtimeType}');
      className = element.type.returnType;
      classNameString =
          element.type.returnType.getDisplayString(withNullability: false);
      print('Res: $className');
      print('Res: $classNameString');
    }
    return super.visitConstructorElement(element);
  }

  @override
  visitFunctionElement(FunctionElement element) {
    if (element != null) {
      print('Func ${element.name}');
      print('Func ${element.displayName}');
      print('Func ${element.runtimeType}');
    }
    return super.visitFunctionElement(element);
  }

  @override
  visitClassElement(ClassElement element) {
    if (element != null) {
      print('Class ${element.name}');
      print('Class ${element.displayName}');
      print('Class ${element.isAbstract}');
    }
    return super.visitClassElement(element);
  }

  @override
  visitMethodElement(MethodElement element) {
    if (element != null) {
      print('Method ${element.displayName}');
      print('Method ${element.parameters}');
      methods[element.displayName] =
          Tuple(element.type.returnType, element.type.parameters);
    }
    return super.visitMethodElement(element);
  }

  @override
  visitFieldElement(FieldElement element) {
    if (element != null) {
      print('Field ${element.displayName}');
    }
    return super.visitFieldElement(element);
  }
}
