import 'package:build/build.dart';
import 'package:source_gen/source_gen.dart';

import './src/repo_case_generator.dart';

Builder repoCaseGenerator(BuilderOptions options) => LibraryBuilder(
      RepoCaseGenerator(),
      generatedExtension: '.rc.dart',
    );
