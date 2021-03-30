import 'package:example/domain/entities/entity.dart';
import 'package:repo_case/repo_case.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

@repoCase
abstract class UserRepository {
  // Required parameters
  Entity getData(String param);

  // Nullable types
  Entity? getDataNullable();
  Entity getParamNullable(int? param);
  Entity? getNullable(double? param);
  String getLocal(AppLocalizations? appLocalizations);

  // Generic types
  int getParamGeneric<Generic>(Generic generic);
  Generic getReturnGeneric<Generic>(int param);
  B getFullGeneric<A, B, C>(A a, C c);
}
