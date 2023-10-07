import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:movie_app/widgets/MovieSlider.dart';
import 'package:movie_app/widgets/TrendingSlider.dart';
import '../Api/api.dart';
import '../Model/movie.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

late Future<List<Movie>> _trendingMovies;
late Future<List<Movie>> _topRatedMovies;
late Future<List<Movie>> _upcomingMovies;

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    _trendingMovies = Api().getTrendingMovies();
    _topRatedMovies = Api().getTopRatedMovies();
    _upcomingMovies = Api().getUpcomingMovies();
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Image.asset(
          'assets/img.png',
          height: 50,
          fit: BoxFit.cover,
          filterQuality: FilterQuality.high,
        ),
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Trending Movies',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              SizedBox(height: 18),
              ////////

              // start of treanding part
              SizedBox(
                child: FutureBuilder(
                  future: _trendingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return TrendingSlider(snapshot: snapshot);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              //end of treanding part

              const SizedBox(height: 18),
              // start of top rated movies
              Text(
                'Top Rated Movies',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),

              SizedBox(
                child: FutureBuilder(
                  future: _topRatedMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),

              const SizedBox(height: 18),

              //end of top rated movies

              //upcomming movies
              Text(
                'Upcoming Movies',
                style: GoogleFonts.poppins(
                  fontSize: 20,
                  fontWeight: FontWeight.w600,
                ),
              ),
              const SizedBox(height: 18),
              SizedBox(
                child: FutureBuilder(
                  future: _upcomingMovies,
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      return MovieSlider(snapshot: snapshot);
                    } else if (snapshot.hasError) {
                      return Text('${snapshot.error}');
                    } else {
                      return const Center(child: CircularProgressIndicator());
                    }
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
