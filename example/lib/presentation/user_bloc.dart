import 'package:example/domain/entities/entity.dart';
import 'package:example/domain/repository/user_repository.rc.dart';

class UserBloc {
  final GetDataRepo getDataRepo;

  const UserBloc(this.getDataRepo);

  Entity getDataFromRepository(String param) {
    return getDataRepo(
      GetDataRepoParams(
        param: param,
      ),
    );
  }
}
