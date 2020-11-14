library repo_case_generator;

import 'dart:async';

import 'package:analyzer/dart/element/element.dart';
import 'package:build/build.dart';
import 'package:repo_case_generator/src/class_generator.dart';
import 'package:repo_case_generator/src/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:repo_case/repo_case.dart';

class RepoCaseGenerator extends GeneratorForAnnotation<RepoCase> {
  @override
  FutureOr<String> generateForAnnotatedElement(
      Element element, ConstantReader annotation, BuildStep buildStep) async {
    // Throw if annotation is used for a none class element
    throwIf(
      element is! ClassElement,
      '${element.name} is not a class element',
      element: element,
    );

    // Throw if annotation is used for an abstract class
    throwIf(
      !(element as ClassElement).isAbstract,
      '${element.name} is not an abstract class',
      element: element,
    );

    final repoClassName = toPascalCase((element as ClassElement).name);
    final methods = (element as ClassElement).methods;

    final inputLibrary = await buildStep.inputLibrary;
    final libraries = [...inputLibrary.importedLibraries]..add(inputLibrary);
    return ClassGenerator(methods, libraries, repoClassName).generate();
  }
}
