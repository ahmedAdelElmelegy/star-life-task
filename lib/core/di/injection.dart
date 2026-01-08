import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:starlife_task/core/network/data_source/remote/dio/api_services.dart';
import 'package:starlife_task/core/utils/dio_factory.dart';
import 'package:starlife_task/feature/login/data/repo/login_repo.dart';
import 'package:starlife_task/feature/login/presentation/view_model/cubit/login_cubit.dart';

final getIt = GetIt.instance;
Future<void> init() async {
  final sharedPreferences = await SharedPreferences.getInstance();
  final dio = DioFactory.getDio();
  getIt.registerLazySingleton<Dio>(() => dio);

  getIt.registerLazySingleton<SharedPreferences>(() => sharedPreferences);

  getIt.registerLazySingleton<ApiService>(
    () => ApiService(dio, sharedPreferences),
  );

  getIt.registerLazySingleton<LoginRepo>(() => LoginRepo(getIt<ApiService>()));

  getIt.registerLazySingleton<LoginCubit>(() => LoginCubit(getIt<LoginRepo>()));
}
