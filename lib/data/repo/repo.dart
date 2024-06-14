import 'package:dio/dio.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/core/error/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class DataCoinRepo
{
  Future<Either<Failure,Map>> getCyraptoData();
}

class DataCoinRepoImpl extends DataCoinRepo {
  @override
  Future<Either<Failure, Map>> getCyraptoData()
  async
  {
    try {
      Response response =
          await DioHelper.getData(url: "https://api.coingecko.com/api/v3/simple/price?ids=bitcoin,ethereum&vs_currencies=usd");
      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
