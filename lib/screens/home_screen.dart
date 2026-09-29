import 'package:flutter/material.dart';
import '../data/movies_data.dart';
import 'details_screen.dart';

//this helps show the list 
class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
//this is the title. i kept it basic and kept the scrolling even tho i have few movies. 
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Movie Watchlist'),
        elevation: 2,
      ),
      body: ListView.builder(
        padding: const EdgeInsets.all(8.0),
        itemCount: sampleMovies.length,
        itemBuilder: (context, index) {
          final movie = sampleMovies[index];
          return Card(
            margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
            elevation: 3,
            shape: RoundedRectangleBorder(
              
              borderRadius: BorderRadius.circular(12),
            ), //Round corners on the movie images for a nice look to the left.
            child: ListTile(
              contentPadding: const EdgeInsets.all(8.0),
              leading: ClipRRect(
                borderRadius: BorderRadius.circular(8.0),
                child: Image.asset(
                  movie.posterPath,
                  width: 90,
                  height: 90,
                  fit: BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) => Container(
                    width: 90,
                    height: 90,
                    color: Colors.grey[300],
                    child: const Icon(Icons.movie, size: 30),
                  ),
                ),
              ),
              title: Text(
                movie.title,
                style: const TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              subtitle: Text(
                'Cast: ${movie.cast.take(2).join(", ")}...',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
              ),
              trailing: const Icon(Icons.chevron_right, color: Colors.pink),
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => DetailsScreen(movie: movie),
                  ),
                );
              },
            ),
          );
        },
      ),
    );
  }
}