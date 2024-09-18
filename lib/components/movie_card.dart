// import 'package:flutter/material.dart';
// import 'package:bilheteria_panucci/screens/movie_screen.dart';

// import '../models/movie.dart';

// class MovieCard extends StatelessWidget {
//   const MovieCard({Key? key, required this.movie}) : super(key: key);
//   final Movie movie;

//   @override
//   Widget build(BuildContext context) {
//     return Column(
//       children: [
//         Card(
//             clipBehavior: Clip.hardEdge,
//             child: ConstrainedBox(
//               constraints: const BoxConstraints(minHeight: 200),
//               child: InkWell(
//                   onTap: () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (context) => MovieScreen(movie: movie),
//                       ),
//                     );
//                   },
//                   child: movie.imageURI != null
//                       ? Ink(
//                           width: double.infinity,
//                           decoration: BoxDecoration(
//                             image: DecorationImage(
//                                 image: NetworkImage(movie.imageURI!),
//                                 fit: BoxFit.cover),
//                           ),
//                         )
//                       : Ink(
//                           child: const Center(
//                             child: Icon(Icons.error),
//                           ),
//                         )),
//             )),
//         Text(
//           movie.name,
//           style: Theme.of(context).textTheme.displaySmall,
//         )
//       ],
//     );
//   }
// }

import 'package:flutter/material.dart';
import 'package:bilheteria_panucci/screens/movie_screen.dart';

import '../models/movie.dart';

class MovieCard extends StatelessWidget {
  const MovieCard({Key? key, required this.movie}) : super(key: key);
  final Movie movie;

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Column(
        children: [
          InkWell(
              child: Card(
                child: movie.imageURI != null
                    ? Image.network(
                        movie.imageURI.toString(),
                        fit: BoxFit.cover,
                      )
                    : const Center(
                        child: Icon(Icons.error),
                      ),
              ),
              onTap: () => Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => MovieScreen(movie: movie),
                    ),
                  )),
          Text(
            movie.name,
            style: Theme.of(context).textTheme.displaySmall,
          )
        ],
      ),
    );
  }
}
