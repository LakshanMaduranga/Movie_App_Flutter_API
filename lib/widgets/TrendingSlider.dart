import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:movie_app/Constants/constants.dart';
import 'package:movie_app/Screens/detail_screen.dart';

class TrendingSlider extends StatelessWidget {
  const TrendingSlider({super.key, required this.snapshot});

  final AsyncSnapshot snapshot;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: CarouselSlider.builder(
        itemCount: snapshot.data!.length,
        options: CarouselOptions(
          height: 250,
          autoPlay: true,
          viewportFraction: 0.55,
          enlargeCenterPage: true,
          pageSnapping: true,
          autoPlayCurve: Curves.fastOutSlowIn,
          autoPlayAnimationDuration: const Duration(seconds: 3),
        ),
        itemBuilder: (context, itemIndex, pageViewIndex) {
          return GestureDetector(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => DetailScreen(
                    movie: snapshot.data[itemIndex],
                  ),
                ),
              );
            },
            child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: SizedBox(
                height: 300,
                width: 200,
                child: Image.network(
                    '${Constants.trendingURL}${snapshot.data[itemIndex].posterPath}',
                    fit: BoxFit.cover,
                    filterQuality: FilterQuality.high),
              ),
            ),
          );
        },
      ),
    );
  }
}
