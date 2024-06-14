import 'package:get_it/get_it.dart';
import 'package:renters/core/services/firebase_auth_service/firebase_auth_service.dart';
import 'package:renters/core/services/firebase_firestore_service/firebase_firestore_service.dart';
import 'package:renters/core/services/firebase_storage_service/firebase_storage_service.dart';
import 'package:renters/view/auth/login/data/repo_impl/repo_impl.dart';
import 'package:renters/view/auth/register/presentation_layer/controller/register_cubit/cubit/register_cubit.dart';
import 'package:renters/view/profile/data/profile_repo.dart';
import '../../view/auth/login/presentation_layer/controller/cubit/cubit/login_cubit.dart';
import '../../view/auth/register/data/repo_impl/register_repo_impl.dart';
import '../../view/profile/view/controllers/cubit/profile_cubit.dart';

final getIt = GetIt.instance;
void setup() 
{
  // serives 
  getIt.registerSingleton<FirebaseAuthService>(FirebaseAuthService());
  getIt.registerSingleton<CloudFirebaseService>(CloudFirebaseService());
  getIt.registerSingleton<FirebaseStorageService>(FirebaseStorageService());


  getIt.registerSingleton<LoginRepoImpl>(LoginRepoImpl(firebaseAuth: getIt<FirebaseAuthService>()));
    getIt.registerSingleton<RegisterRepoImpl>(RegisterRepoImpl(firebaseAuth: getIt<FirebaseAuthService>()));
        getIt.registerSingleton<ProfileRepoImpl>(ProfileRepoImpl(
          cloudFirebaseService: getIt<CloudFirebaseService>(),
          firebaseStorageService: getIt<FirebaseStorageService>()
        ));


  // cubit
  getIt.registerFactory<LoginCubit>(() => LoginCubit(loginRepo: getIt<LoginRepoImpl>()));
  getIt.registerFactory<RegisterCubit>(() =>
   RegisterCubit(getIt<RegisterRepoImpl>()));
  getIt.registerFactory<ProfileCubit>(() => ProfileCubit(getIt<ProfileRepoImpl>()));


}