import 'package:flutter/material.dart';
import 'package:movie_app/Constants/constants.dart';
import 'package:movie_app/Screens/detail_screen.dart';

class MovieSlider extends StatelessWidget {
  const MovieSlider({
    super.key,
    required this.snapshot,
  });

  final AsyncSnapshot snapshot;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      width: double.infinity,
      child: ListView.builder(
        itemCount: snapshot.data!.length,
        scrollDirection: Axis.horizontal,
        physics: const BouncingScrollPhysics(),
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailScreen(
                      movie: snapshot.data[index],
                    ),
                  ),
                );
              },
              child: ClipRRect(
                borderRadius: BorderRadius.circular(20),
                child: SizedBox(
                  child: Image.network(
                    '${Constants.trendingURL}${snapshot.data[index].posterPath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high,
                  ),
                  height: 200,
                  width: 150,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
