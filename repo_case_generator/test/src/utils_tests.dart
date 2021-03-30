import 'package:repo_case_generator/src/utils.dart';
import 'package:source_gen/source_gen.dart';
import 'package:test/test.dart';

void main() {
  // String formatting
  group('The format of the string', () {
    final String tLowerCamelCase = 'nameOfTheRepository';
    final String tPascal = 'NameOfTheRepository';

    test('should be pascal case', () {
      expect(toPascalCase(tLowerCamelCase), tPascal);
    });

    test('should be lower camel case', () {
      expect(toLowerCamelCase(tPascal), tLowerCamelCase);
    });
  });

  // Throw errors
  group('When the function is called', () {
    final String tErrorMessage = 'message';
    final String tCompleteErrorMessage = 'repo_case: $tErrorMessage';

    test(
        'should throw a InvalidGenerationSourceError error with the correct message',
        () {
      expect(
        () => throwError(tErrorMessage),
        throwsA(
          allOf(
            TypeMatcher<InvalidGenerationSourceError>(),
            predicate<InvalidGenerationSourceError>(
              (e) => e.message == tCompleteErrorMessage,
            ),
          ),
        ),
      );
    });

    test(
      'should not throw any error when the condition is false',
      () {
        expect(
          () => throwIf(false, tErrorMessage),
          returnsNormally,
        );
      },
    );

    test(
      'should throw same error as throwError when the condition is true',
      () {
        expect(
          () => throwIf(true, tErrorMessage),
          throwsA(
            allOf(
              TypeMatcher<InvalidGenerationSourceError>(),
              predicate<InvalidGenerationSourceError>(
                (e) => e.message == tCompleteErrorMessage,
              ),
            ),
          ),
        );
      },
    );
  });
}
