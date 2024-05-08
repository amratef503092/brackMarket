import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:renters/view/news/controller/cubit/news_cubit.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => NewsCubit()..getNews(),
      child: BlocConsumer<NewsCubit, NewsState>(
        listener: (context, state) {
          // TODO: implement listener
        },
        builder: (context, state) {
          if (state is NewsLoading) {
            return Center(child: CircularProgressIndicator());
          } else if (state is NewsError) {
            return Center(child: Text('Error'));
          } else if (state is NewsLoaded) {
            return Scaffold(
                body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView.separated(
                  itemCount: state.news.data!.length,
                  separatorBuilder: (context, index) {
                    return SizedBox(height: 10);
                  },
                  itemBuilder: (context, index) {
                    return Container(
                      padding: const EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.grey),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        children: [
                          Container(
                              height: 200,
                              width: double.infinity,
                              // color: Colors.grey,

                              decoration: BoxDecoration(
                                image: DecorationImage(
                                  image: NetworkImage(
                                      state.news.data![index].image!),
                                  fit: BoxFit.cover,
                                ),
                              )),
                          ListTile(
                            title: Text(state.news.data![index].title!),
                            // subtitle: Text('Subtitle'),
                          ),
                        ],
                      ),
                    );
                  }),
            ));
          } else {
            return Container();
          }
        },
      ),
    );
  }
}
