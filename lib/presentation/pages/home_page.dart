import 'package:flutter/material.dart';
import 'package:movies_modul/movies_modul.dart';
import 'package:tv_modul/tv_modul.dart';
import 'package:shared_modul/shared_modul.dart' hide State;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeState state = HomeState.Movies;

  int selectedPage = 0;

  static const List _pages = [
    MovieHomePage(),
    TvHomePage()
  ];

  void _onItemTapped(int index) {
    setState(() {
      selectedPage = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: drawer(),
      appBar: AppBar(
        title: const Text('Ditonton'),
        actions: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, searchScreen,
                  arguments: state.name);
            },
            icon: const Icon(Icons.search),
          )
        ],
      ),
      body: _pages.elementAt(selectedPage),
      bottomNavigationBar: bottomAppBar(),
    );
  }

  Widget drawer() {
    return Drawer(
      child: Column(
        children: [
          const UserAccountsDrawerHeader(
            currentAccountPicture: CircleAvatar(
              backgroundImage: AssetImage('assets/circle-g.png'),
            ),
            accountName: Text('Ditonton'),
            accountEmail: Text('ditonton@dicoding.com'),
          ),
          ListTile(
            leading: const Icon(Icons.movie),
            title: const Text('Movies'),
            onTap: () {
              setState(() {
                state = HomeState.Movies;
                selectedPage = 0;
              });
              debugPrint(state.toString());
              state == HomeState.Movies
                  ? Navigator.pop(context)
                  : Future.microtask(() {
                BlocProvider.of<MoviePlayingBloc>(context, listen: true).add(FetchNowPlayingMovie());
                BlocProvider.of<MoviePopularBloc>(context, listen: true).add(FetchPopularMovie());
                BlocProvider.of<MovieTopratedBloc>(context, listen: true).add(FetchTopRatedMovie());
              }).whenComplete(() => Navigator.pop(context));
            },
          ),
          ListTile(
            leading: const Icon(Icons.live_tv),
            title: const Text('Tv Series'),
            onTap: () {
              setState(() {
                state = HomeState.TvSeries;
                selectedPage = 1;
              });
              debugPrint(state.toString());
              state == HomeState.TvSeries
                  ? Navigator.pop(context)
                  : Future.microtask(() {
                BlocProvider.of<TvOnairBloc>(context, listen: true).add(FetchOnAirTv());
                BlocProvider.of<TvPopularBloc>(context, listen: true).add(FetchPopularTv());
                BlocProvider.of<TvTopratedBloc>(context, listen: true).add(FetchTopRatedTv());
              }).whenComplete(() => Navigator.pop(context));
            },
          ),
          ListTile(
            leading: const Icon(Icons.save_alt),
            title: const Text('Watchlist'),
            onTap: () {
              Navigator.pushNamed(context, watchlistScreen);
            },
          ),
          ListTile(
            onTap: () {
              Navigator.pushNamed(context, aboutScreen);
            },
            leading: const Icon(Icons.info_outline),
            title: const Text('About'),
          ),
        ],
      ),
    );
  }

  Widget bottomAppBar() {
    return BottomAppBar(
      color:
      // state.color,
      kRichBlack,
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 16),
        height: 80,
        width: MediaQuery.of(context).size.width,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            InkWell(
              onTap: () {
                _onItemTapped(0);
                state =  HomeState.Movies;
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Icon(
                          Icons.movie_filter_outlined,
                          color: (selectedPage == 0)
                              ? kMikadoYellow
                              : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Movies',
                      style: TextStyle(
                        color: (selectedPage == 0)
                            ? kMikadoYellow
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            InkWell(
              onTap: () {
                _onItemTapped(1);
                state = HomeState.TvSeries;
              },
              child: SizedBox(
                width: MediaQuery.of(context).size.width / 5,
                child: Column(
                  children: [
                    Expanded(
                      child: FittedBox(
                        fit: BoxFit.fitHeight,
                        child: Icon(
                          Icons.history,
                          color: (selectedPage == 1)
                              ? kMikadoYellow
                              : Colors.white,
                        ),
                      ),
                    ),
                    Text(
                      'Tv Series',
                      style: TextStyle(
                        color: (selectedPage == 1)
                            ? kMikadoYellow
                            : Colors.white,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      )
    );
  }

}
