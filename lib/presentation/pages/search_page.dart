import 'package:flutter/material.dart';
import 'package:tv_modul/tv_modul.dart';
import 'package:movies_modul/movies_modul.dart';
import 'package:shared_modul/shared_modul.dart';

class SearchPage extends StatelessWidget {
  final String kode;
  const SearchPage({required this.kode, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Search'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              onSubmitted: (query) {
                kode == 'Movies'
                    ? BlocProvider.of<MovieSearchBloc>(context, listen: false)
                        .add(FetchSearchMovie(query: query))
                    : BlocProvider.of<TvSearchBloc>(context, listen: false)
                        .add(FetchSearchTv(query: query));
              },
              decoration: InputDecoration(
                hintText: 'Search $kode title',
                prefixIcon: const Icon(Icons.search),
                border: const OutlineInputBorder(),
              ),
              textInputAction: TextInputAction.search,
            ),
            const SizedBox(height: 16),
            Text(
              'Search Result',
              style: kHeading6,
            ),
            kode == 'Movies'
                ? BlocBuilder<MovieSearchBloc, MovieSearchState>(
                    builder: (context, state) {
                    if (state is MovieSearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is MovieSearchLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            final movie = state.result![index];
                            return MovieCard(movie: movie);
                          },
                          itemCount: state.result!.length,
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  })
                : BlocBuilder<TvSearchBloc, TvSearchState>(
                    builder: (context, state) {
                    if (state is TvSearchLoading) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    if (state is TvSearchLoaded) {
                      return Expanded(
                        child: ListView.builder(
                          padding: const EdgeInsets.all(8),
                          itemBuilder: (context, index) {
                            final tv = state.result![index];
                            return TvCard(
                              tv: tv,
                            );
                          },
                          itemCount: state.result!.length,
                        ),
                      );
                    } else {
                      return Expanded(
                        child: Container(),
                      );
                    }
                  })
          ],
        ),
      ),
    );
  }
}
