import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:movie_app/views/movie/list_movie.dart';
import 'package:movie_app/views/movietoprate/list_movie_top.dart';
import 'package:movie_app/views/tv/list_tv.dart';
import 'package:movie_app/views/tvrate/list_ratetv.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("MY TOP"),
            Text(
              "List Top Movie and Tv show",
              style: TextStyle(fontSize: 10),
            ),
          ],
        ),
        backgroundColor: Colors.black,
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text(
                  "Popular movies",
                  style: TextStyle(fontWeight: FontWeight.bold),
                )
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(ListMovie());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.amber,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(
                        "https://huckfinnsmoneytree.com/wp-content/uploads/2021/06/how-customize-the-52D96.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Movie Populers",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Popular TV shows",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(ListTv());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.amber,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(
                        "https://huckfinnsmoneytree.com/wp-content/uploads/2021/06/how-customize-the-52D96.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Popular TV shows",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Top rated Movie",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(ListMovieTop());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.amber,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(
                        "https://huckfinnsmoneytree.com/wp-content/uploads/2021/06/how-customize-the-52D96.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Top rated Movie",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                Text("Top rated TV shows",
                    style: TextStyle(fontWeight: FontWeight.bold))
              ],
            ),
          ),
          InkWell(
            onTap: () {
              Get.to(ListTvRate());
            },
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height / 4,
                color: Colors.amber,
                child: Stack(
                  children: [
                    Container(
                      width: MediaQuery.of(context).size.width,
                      height: MediaQuery.of(context).size.height / 4,
                      child: Image.network(
                        "https://huckfinnsmoneytree.com/wp-content/uploads/2021/06/how-customize-the-52D96.png",
                        fit: BoxFit.fill,
                      ),
                    ),
                    Center(
                      child: Text(
                        "Top rated TV shows",
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
