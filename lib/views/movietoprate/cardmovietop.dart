import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class CardmovieTop extends StatelessWidget {
    static final DateFormat formatter = DateFormat('yyyy-MM-dd');
  String title;
  DateTime date;
  String overview;
  CardmovieTop(
      {Key? key,
      required this.title,
      required this.date,
      required this.overview})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          clipBehavior: Clip.antiAlias,
          child: Column(
            children: [
              Image.network(
                "https://huckfinnsmoneytree.com/wp-content/uploads/2021/06/how-customize-the-52D96.png",
                fit: BoxFit.fill,
              ),
              ListTile(
                title: Text(title),
                subtitle: Text(
                  "publish : "+formatter.format(date).toString(),
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(right: 12, left: 12, bottom: 12),
                child: Text(
                  overview,
                  style: TextStyle(color: Colors.black.withOpacity(0.6)),
                  maxLines: 2,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
