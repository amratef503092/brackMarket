

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:renters/core/dio_helpers/dio_helpers.dart';
import 'package:renters/view/news/data/news_model.dart';

import '../../../core/error/failuar.dart';

abstract class NewsRepo 
{
   Future<Either<Failure, News>> getNews();
}

class NewsRepoImpl extends NewsRepo 
{
  @override
  Future<Either<Failure, News>> getNews() async 
  {
    try 
    {
      final Response response = await DioHelper.getData(url: 'get_phalstine_news');
      return Right(News.fromJson(response.data));
    } 
    on DioException catch (e) 
    {
      return Left(ServerFailure.fromDioError(e));
    } 
    catch (e) 
    {
      return Left(FailureLocal(message: e.toString()));
    }
  }
}