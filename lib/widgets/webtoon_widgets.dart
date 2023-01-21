import 'package:flutter/material.dart';
import 'package:flutter_webtoonpedia/screens/detail_screen.dart';

class Webtoon extends StatelessWidget {
  final String title, thumb, id;

  const Webtoon({
    super.key,
    required this.title,
    required this.thumb,
    required this.id,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: ((context) => DetailScreen(
                  title: title,
                  thumb: thumb,
                  id: id,
                )),
            fullscreenDialog: true,
          ),
        );
      },
      child: Column(
        children: [
          Container(
            width: 250,
            clipBehavior: Clip.hardEdge,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              boxShadow: [
                BoxShadow(
                    blurRadius: 15,
                    offset: const Offset(10, 10),
                    color: Colors.black.withOpacity(0.3)),
              ], // advice: when you are building Shadows, always start with an ugly color(ex. red) and then make it pretty cuz the red allows you to see basically everything of your shadow and you can modify the sizes and the offsets and everything and then when u r sure of the position, u change the color
            ),
            child: Image.network(thumb),
          ),
          const SizedBox(
            height: 10,
          ),
          Text(
            title,
            style: const TextStyle(
              fontSize: 22,
            ),
          )
        ],
      ),
    );
  }
}
