import 'package:ditonton_modular/presentation/pages/about_page.dart';
import 'package:ditonton_modular/presentation/pages/home_page.dart';
import 'package:ditonton_modular/presentation/pages/search_page.dart';
import 'package:ditonton_modular/presentation/pages/watchlist_page.dart';
import 'package:flutter/material.dart';
import 'package:shared_modul/shared_modul.dart' hide State;
import 'package:movies_modul/movies_modul.dart';
import 'package:tv_modul/tv_modul.dart';

class AppView extends StatefulWidget {
  const AppView({Key? key}) : super(key: key);

  @override
  State<AppView> createState() => _AppViewState();
}

class _AppViewState extends State<AppView> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData.dark().copyWith(
        colorScheme: kColorScheme,
        primaryColor: kRichBlack,
        scaffoldBackgroundColor: kRichBlack,
        textTheme: kTextTheme,
      ),
      home: const HomePage(),
      navigatorObservers: [routeObserver],
      onGenerateRoute: (RouteSettings settings) {
        switch (settings.name){
          case homeScreen:
            return MaterialPageRoute(builder: (_) => const HomePage());
          case searchScreen:
            final kode = settings.arguments as String;
            return MaterialPageRoute(
              builder: (_) => SearchPage(kode: kode),
            settings: settings);
          case aboutScreen:
            return MaterialPageRoute(builder: (_) => const AboutPage());
          case watchlistScreen:
            return MaterialPageRoute(builder: (_) => const WatchlistPage());
          case moviePlayingScreen:
            return MaterialPageRoute(builder: (_) => const NowPlayingMoviesPage());
          case moviePopularScreen:
            return MaterialPageRoute(builder: (_) => const PopularMoviesPage());
          case movieTopRatedScreen:
            return MaterialPageRoute(builder: (_) => const TopRatedMoviesPage());
          case movieDetailScreen:
            final id = settings.arguments as int;
            return MaterialPageRoute(
                builder: (_) => MovieDetailPage(id: id,),
            settings: settings);
          case tvPlayingScreen:
            return MaterialPageRoute(builder: (_) => const NowPlayingTvSeriesPage());
          case tvPopularScreen:
            return MaterialPageRoute(builder: (_) => const PopularTvSeriesPage());
          case tvTopRatedScreen:
            return MaterialPageRoute(builder: (_) => const TopRatedTvPage());
          case tvDetailScreen:
            final id = settings.arguments as int;
            return MaterialPageRoute(builder: (_) => TvDetailPage(id: id,),
            settings: settings);
          default:
            return MaterialPageRoute(builder: (_) {
              return const Scaffold(
                body: Center(
                  child: Text('Page not found :('),
                ),
              );
            });
        }
      },
    );
  }
}
