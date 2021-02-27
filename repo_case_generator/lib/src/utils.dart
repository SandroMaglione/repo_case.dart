// @dart=2.9
import 'package:analyzer/dart/element/element.dart';
import 'package:source_gen/source_gen.dart';

/// Convert [String] with first character lower case
String toLowerCamelCase(String s) {
  if (s.length < 2) return s.toLowerCase();
  return s[0].toLowerCase() + s.substring(1);
}

/// Convert [String] with first character upper case
String toPascalCase(String s) {
  if (s.length < 2) return s.toUpperCase();
  return s[0].toUpperCase() + s.substring(1);
}

/// Throw [InvalidGenerationSourceError] if [condition] is true
void throwIf(bool condition, String message, {Element element, String todo}) {
  if (condition) {
    throwError(message, todo: todo, element: element);
  }
}

/// Throw [InvalidGenerationSourceError]
void throwError(String message, {Element element, String todo}) {
  throw InvalidGenerationSourceError(
    'repo_case: $message',
    todo: todo,
    element: element,
  );
}
