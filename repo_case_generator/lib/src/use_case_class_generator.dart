class UseCaseClassGenerator {
  final StringBuffer _stringBuffer = StringBuffer();

  void write(Object obj) => _stringBuffer.write(obj);
  void writeln([Object obj]) => _stringBuffer.writeln(obj);
  void get newLine => _stringBuffer.writeln();

  String get generate => _stringBuffer.toString();

  String capitalize(String source) =>
      '${source.substring(0, 1).toUpperCase()}${source.substring(1).toLowerCase()}';
  String capitalizeAndLower(String source) =>
      '${source.substring(0, 1).toUpperCase()}${source.substring(1).toLowerCase()}';

  String firstToLower(String source) =>
      '${source.substring(0, 1).toLowerCase()}${source.substring(1)}';
}
