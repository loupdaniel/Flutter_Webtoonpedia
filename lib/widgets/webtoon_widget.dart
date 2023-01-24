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
          /*MaterialPageRoute(
            builder: ((context) => DetailScreen(
                  title: title,
                  thumb: thumb,
                  id: id,
                )),
            fullscreenDialog: true,
          ),MaterialPageRoute에는 특별한 애니메이션 옵션은 없는 거 같고, 플랫폼 환경/빌드 환경에 종속된 default 방식대로 동작하는 거 같네요. https://g-y-e-o-m.tistory.com/165
https://medium.com/flutter-community/everything-you-need-to-know-about-flutter-page-route-transition-9ef5c1b32823
*/
          PageRouteBuilder(
            transitionsBuilder:
                (context, animation, secondaryAnimation, child) {
              var begin = const Offset(0.0, 1.0);
              var end = Offset.zero;
              var curve = Curves.ease;
              var tween =
                  Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
              return SlideTransition(
                position: animation.drive(tween),
                child: child,
              );
            },
            pageBuilder: (context, anmation, secondaryAnimation) =>
                DetailScreen(id: id, title: title, thumb: thumb),
          ),
        );
      },
      child: Column(
        children: [
          Hero(
            tag: id,
            child: Container(
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
