import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/core/dio_helpers/end_points.dart';
import 'package:renters/core/error/failuar.dart';

abstract class CurrencyRepo 
{
  Future<Either<Failure , 
        List<Map<String,dynamic>>>> getCryptoData();
}

class CurrencyRepoImpl 
      extends CurrencyRepo
{
  @override
  Future<Either<Failure, 
  List<Map<String, dynamic>>>> 
  getCryptoData() 
  async
  {
    try
    {
      Response response = await 
      DioHelper.getData(
        url: EndPoint.CURRENCY_END_POINT);

      List<Map<String, dynamic>> list = [];
      list = List<Map<String, dynamic>>.from(response.data);
      return Right(list);

    } on DioException catch(e)
    {
     return Left(ServerFailure.fromDioError(e)); 
    }catch(e)
    {
           return Left(FailureLocal(message: e.toString() )); 

    }
  }

}