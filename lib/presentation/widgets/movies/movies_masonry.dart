import 'package:flutter/material.dart';
import 'package:cinemapedia/domain/entities/movie.dart';
import 'package:cinemapedia/presentation/widgets/widgets.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class MoviesMasonry extends StatefulWidget {

  final List<Movie> movies;
  final VoidCallback? loandNextPage;

  const MoviesMasonry({
    super.key,
    required this.movies,
    this.loandNextPage
  });

  @override
  State<MoviesMasonry> createState() => _MoviesMasonryState();
}

class _MoviesMasonryState extends State<MoviesMasonry> {

  final scrollController = ScrollController();

  @override
  void initState() {
    super.initState();

    scrollController.addListener(() {
      if(widget.loandNextPage == null) return;
    
      if((scrollController.position.pixels + 150) >= scrollController.position.maxScrollExtent){
        return widget.loandNextPage!();
      }
    
    });
  }

  @override
  void dispose() {
    scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: MasonryGridView.count(
        controller: scrollController,
        crossAxisCount: 3,
        itemCount: widget.movies.length,
        mainAxisSpacing: 10,
        crossAxisSpacing: 10,
        
        itemBuilder: (context, index) {
    
          final movie = widget.movies[index];
    
          if (index == 1){
            return Column(
              children: [
                const SizedBox(height: 30),
                MoviePosterLink(movie: movie),
              ],
            );
          }
      
          return MoviePosterLink(movie: movie);
       
        },
      ),
    );
  }
}

