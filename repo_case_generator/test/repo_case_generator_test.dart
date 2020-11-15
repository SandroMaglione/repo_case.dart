@TestOn('vm')

import 'package:test/test.dart';
import 'package:path/path.dart' as path;
import 'package:repo_case_generator/src/repo_case_generator.dart';
import 'package:source_gen_test/source_gen_test.dart';
import 'src/utils_tests.dart' as utils;

Future<void> main() async {
  // Testing generation utils function
  utils.main();

  // Testing generation of usecase classes
  initializeBuildLogTracking();
  final reader = await initializeLibraryReaderForDirectory(
    path.join('test', 'src'),
    'generator_tests.dart',
  );

  testAnnotatedElements(
    reader,
    RepoCaseGenerator(),
  );
}
