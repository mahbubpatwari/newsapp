import 'package:flutter/material.dart';
import 'package:newsapp/components/news_item_List.dart';
import 'package:newsapp/model/news_model.dart';
import 'package:newsapp/service/api_service.dart';

class AllNews extends StatefulWidget {
  const AllNews({super.key});

  @override
  State<AllNews> createState() => _AllNewsState();
}

class _AllNewsState extends State<AllNews> {
  ApiService apiService = ApiService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiService.getAllNews(),
        builder: (context,snapshot){
          if(snapshot.hasData){
            List<NewsModel>articlelist = snapshot.data??[];
            return ListView.builder(
              itemBuilder: (context,index){

                return NewsItemList(newsModel: articlelist[index],);

              },
              itemCount: articlelist.length,

            );
          }
          return const Center(
            child: CircularProgressIndicator(),
          );
        },

      ),
    );
  }
}
