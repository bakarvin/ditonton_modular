import 'package:ditonton_modular/launcher/app_view.dart';
import 'package:ditonton_modular/launcher/injection.dart';
import 'package:movies_modul/movies_modul.dart';
import 'package:tv_modul/tv_modul.dart';
import 'package:shared_modul/shared_modul.dart';
import 'package:flutter/material.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Movies
    final movieDetailBloc = locator<MovieDetailBloc>();
    final moviePlayingBloc = locator<MoviePlayingBloc>()..add(FetchNowPlayingMovie());
    final moviePopularBloc = locator<MoviePopularBloc>()..add(FetchPopularMovie());
    final movieTopratedBloc = locator<MovieTopratedBloc>()..add(FetchTopRatedMovie());
    final movieSearchBloc = locator<MovieSearchBloc>();
    final movieWatchlistBloc = locator<MovieWatchlistBloc>();
    final movieWatchlistStatusBloc = locator<MovieWatchlistStatusBloc>();
    //Tv Series
    final tvDetailBloc = locator<TvDetailBloc>();
    final tvOnAirBloc = locator<TvOnairBloc>()..add(FetchOnAirTv());
    final tvPopularBloc = locator<TvPopularBloc>()..add(FetchPopularTv());
    final tvTopRatedBloc = locator<TvTopratedBloc>()..add(FetchTopRatedTv());
    final tvSearchBloc = locator<TvSearchBloc>();
    final tvWatchlistBloc = locator<TvWatchlistBloc>();
    final tvWatchlistStatusBloc = locator<TvWatchlistStatusBloc>();


    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => movieDetailBloc),
          BlocProvider(create: (_) => moviePlayingBloc),
          BlocProvider(create: (_) => moviePopularBloc),
          BlocProvider(create: (_) => movieTopratedBloc),
          BlocProvider(create: (_) => movieSearchBloc),
          BlocProvider(create: (_) => movieWatchlistBloc),
          BlocProvider(create: (_) => movieWatchlistStatusBloc),
          BlocProvider(create: (_) => tvDetailBloc),
          BlocProvider(create: (_) => tvOnAirBloc),
          BlocProvider(create: (_) => tvPopularBloc),
          BlocProvider(create: (_) => tvTopRatedBloc),
          BlocProvider(create: (_) => tvSearchBloc),
          BlocProvider(create: (_) => tvWatchlistBloc),
          BlocProvider(create: (_) => tvWatchlistStatusBloc),
        ], child: const AppView()
    );
  }
}
