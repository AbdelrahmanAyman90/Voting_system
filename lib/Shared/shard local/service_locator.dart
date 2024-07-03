import 'package:get_it/get_it.dart';
import 'package:voting/Shared/network/api_service.dart';
import 'package:voting/data/repository/preparapp/prepar_app_repo_implment.dart';

final getIt = GetIt.instance;

void setupGetIt() {
  getIt.registerSingleton<ApiServes>(
    ApiServes(
      dio: creatdio(),
    ),
  );
  getIt.registerSingleton<PreparAppRepoImplemnt>(
    PreparAppRepoImplemnt(apiServes: getIt.get<ApiServes>()),
  );
}
