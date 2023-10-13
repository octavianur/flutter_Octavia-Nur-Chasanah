import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:project/constants/text_style.dart';
import 'package:project/model/data_list.dart';

// ignore: must_be_immutable
class buildCard extends StatelessWidget {
  buildCard({
    super.key,
  });

  var itemList = data;
  var listScrollController = new ScrollController();
  var scrollDirection = ScrollDirection.idle;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 370,
      padding: const EdgeInsets.symmetric(vertical: 16),
      child: ListView(
        controller: listScrollController,
        scrollDirection: Axis.horizontal,
        children: data.map((item) {
          return Container(
            width: 250,
            margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 16),
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                      color: Colors.black.withOpacity(0.6),
                      offset: Offset(-6, 4),
                      blurRadius: 10)
                ]),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Center(
                  child: Text(
                    item["title"]!,
                    style: ThemeTextStyle()
                        .bodyLarge
                        .copyWith(fontWeight: FontWeight.bold),
                  ),
                ),
                Center(
                  child: Image.asset(
                    item["image"]!,
                    height: 100,
                  ),
                ),
                Padding(padding: EdgeInsets.symmetric(vertical: 8)),
                Text(
                  item["description"]!,
                  style: ThemeTextStyle().bodySmall,
                  textAlign: TextAlign.justify,
                  maxLines: 6,
                  overflow: TextOverflow.ellipsis,
                )
              ],
            ),
          );
        }).toList(),
      ),
    );
  }
}
