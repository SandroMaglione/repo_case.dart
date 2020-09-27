import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';
import 'package:repo_case_generator/src/repo_case_generator.dart';

Builder repoCaseGenerator(BuilderOptions options) =>
    SharedPartBuilder([RepoCaseGenerator()], 'repo_case');
