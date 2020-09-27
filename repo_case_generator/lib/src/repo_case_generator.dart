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
    return _generate(element);
  }

  String _generate(Element element) {
    final UseCaseClassGenerator useCaseClassGenerator = UseCaseClassGenerator();
    final ModelVisitor modelVisitor = ModelVisitor();
    element.visitChildren(modelVisitor);

    for (var met in modelVisitor.methods.keys) {
      final dartType = modelVisitor.methods[met];
      final className = '${useCaseClassGenerator.capitalizeAndLower(met)}Repo';
      final repoType = modelVisitor.className.toString();
      final repoName =
          useCaseClassGenerator.firstToLower(modelVisitor.className.toString());

      useCaseClassGenerator.writeln(
          "class $className extends UseCase<${dartType},${className}Params> {");
      useCaseClassGenerator.writeln("final $repoType $repoName;");
      useCaseClassGenerator.newLine;
      useCaseClassGenerator.writeln("const $className({");
      useCaseClassGenerator.writeln("@required this.$repoName,");
      useCaseClassGenerator.writeln("});");
      useCaseClassGenerator.newLine;
      useCaseClassGenerator.writeln("}");
      useCaseClassGenerator.newLine;
    }
    return useCaseClassGenerator.generate;
  }
}

class ModelVisitor extends SimpleElementVisitor {
  DartType className;
  Map<String, DartType> methods = Map();

  @override
  visitConstructorElement(ConstructorElement element) {
    print('Const ${element.name}');
    print('Const ${element.displayName}');
    print('Const ${element.runtimeType}');
    print('Const ${element.type.element.displayName}');
    print('Const ${element.type.returnType}');
    print('Const ${element.type.runtimeType}');
    className = element.type.returnType;
    return super.visitConstructorElement(element);
  }

  @override
  visitFunctionElement(FunctionElement element) {
    print('Func ${element.name}');
    print('Func ${element.displayName}');
    print('Func ${element.runtimeType}');
    return super.visitFunctionElement(element);
  }

  @override
  visitClassElement(ClassElement element) {
    print('Class ${element.name}');
    print('Class ${element.displayName}');
    print('Class ${element.isAbstract}');
    return super.visitClassElement(element);
  }

  @override
  visitMethodElement(MethodElement element) {
    print('Method ${element.displayName}');
    methods[element.displayName] = element.type.returnType;
    return super.visitMethodElement(element);
  }

  @override
  visitFieldElement(FieldElement element) {
    print('Field ${element.displayName}');
    return super.visitFieldElement(element);
  }
}
