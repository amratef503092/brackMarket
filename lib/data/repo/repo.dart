import 'package:dio/dio.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/core/dio_helpers/end_points.dart';
import 'package:renters/core/error/failuar.dart';
import 'package:dartz/dartz.dart';

abstract class DataCoinRepo
{
  Future<Either<Failure,List>> getCyraptoData();
}

class DataCoinRepoImpl extends DataCoinRepo {
  @override
  Future<Either<Failure, List>> getCyraptoData()
  async
  {
    try {
      Response response =
          await DioHelper.getData(url: EndPoint.CYRAPTO_END_POINT);
      return Right(response.data);
    } on DioException catch (e) {
      return Left(ServerFailure.fromDioError(e));
    } catch (e) {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}
