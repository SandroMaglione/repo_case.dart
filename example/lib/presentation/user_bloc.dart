import 'package:example/domain/entities/entity.dart';
import 'package:example/domain/repository/user_repository.rc.dart';

class UserBloc {
  final GetDataRepo getDataRepo;
  final GetNullableRepo nullableRepo;
  final GetParamGenericRepo genericRepo;
  final GetReturnGenericRepo returnGenericRepo;
  final GetFullGenericRepo fullGenericRepo;

  const UserBloc(
    this.getDataRepo,
    this.nullableRepo,
    this.genericRepo,
    this.returnGenericRepo,
    this.fullGenericRepo,
  );

  // Required parameters
  Entity getDataFromRepository(String param) {
    return getDataRepo(
      GetDataRepoParams(
        param: param,
      ),
    );
  }

  // Nullable type
  Entity? getNullable(double? param) {
    return nullableRepo(
      GetNullableRepoParams(param: param),
    );
  }

  // Generic types
  int getGeneric(String param) {
    return genericRepo<String>(
      GetParamGenericRepoParams(generic: param),
    );
  }

  double getReturnGeneric(int param) {
    return returnGenericRepo<double>(
      GetReturnGenericRepoParams(param: param),
    );
  }

  double getFullGeneric(String a, int c) {
    return fullGenericRepo<String, double, int>(
      GetFullGenericRepoParams(a: a, c: c),
    );
  }
}
