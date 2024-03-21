import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:renters/core/error/failuar.dart';

import '../../../../core/dio_helpers/dio_helpers.dart';
import '../../../../core/dio_helpers/end_points.dart';

abstract class GoldRepo {
  Future<Either<Failure, List<Map<String , dynamic>>>> getGoldData();
}
class GoldRepoImpl extends GoldRepo {
  @override
  Future<Either<Failure, List<Map<String, dynamic>>>> getGoldData() 
  async
  {
  
   try
    {
      Response response = await 
      DioHelper.getData(
        url: EndPoint.GOLD_END_POINT);

      List<Map<String, dynamic>> list = [];
      list = List<Map<String, dynamic>>.from(response.data['gold_data']);
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