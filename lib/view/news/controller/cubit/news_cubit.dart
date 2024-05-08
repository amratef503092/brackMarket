import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:renters/view/news/data/news_repo.dart';

import '../../data/news_model.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> 
{
  NewsCubit() : super(NewsInitial());

  NewsRepo newsRepo = NewsRepoImpl();

  Future<void> getNews() async 
  {
    emit(NewsLoading());
    try 
    {
      final news = await newsRepo.getNews();
      news.fold(
        (l) => emit(NewsError()),
        (r) => emit(NewsLoaded(r)),
      );
    } 
    catch (e) 
    {
      emit(NewsError());
    }
  }

}
