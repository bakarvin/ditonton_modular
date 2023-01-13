import 'package:flutter/material.dart';
import 'package:shared_modul/shared_modul.dart' hide State;
import 'package:movies_modul/movies_modul.dart';
import 'package:tv_modul/tv_modul.dart';

class WatchlistPage extends StatefulWidget {
  const WatchlistPage({Key? key}) : super(key: key);

  @override
  State<WatchlistPage> createState() => _WatchlistPageState();
}

class _WatchlistPageState extends State<WatchlistPage> with RouteAware {
  @override
  void initState() {
    MovieWatchlistBloc movieWatchlistBloc =
        BlocProvider.of<MovieWatchlistBloc>(context)
          ..add(FetchWatchlistMovies());
    TvWatchlistBloc tvWatchlistBloc = BlocProvider.of<TvWatchlistBloc>(context)
      ..add(FetchWatchlistTv());
    super.initState();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
  }

  @override
  void didPopNext() {
    MovieWatchlistBloc movieWatchlistBloc =
        BlocProvider.of<MovieWatchlistBloc>(context)
          ..add(FetchWatchlistMovies());
    TvWatchlistBloc tvWatchlistBloc = BlocProvider.of<TvWatchlistBloc>(context)
      ..add(FetchWatchlistTv());
    super.didPopNext();
  }

  @override
  void dispose() {
    routeObserver.unsubscribe(this);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      initialIndex: 0,
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Watchlist'),
          bottom: const PreferredSize(
              preferredSize: Size(50, 50),
              child: TabBar(
                indicatorColor: kMikadoYellow,
                tabs: <Widget>[
                  Tab(
                    text: ("Movies"),
                  ),
                  Tab(
                    text: ("Tv Series"),
                  ),
                ],
              )),
        ),
        body: const Padding(
          padding: EdgeInsets.all(8.0),
          child: TabBarView(
              children: <Widget>[MovieWatchlistPage(), TvWatchListPage()]),
        ),
      ),
    );
  }
}
