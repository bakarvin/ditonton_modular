import 'package:shared_modul/shared_modul.dart';
import 'package:movies_modul/movies_modul.dart';
import 'package:tv_modul/tv_modul.dart';

final locator = GetIt.instance;

Future<void> init(String baseUrl) async {
  //Movies bloc
  locator.registerFactory(() => MovieDetailBloc(locator(), locator(), locator()));
  locator.registerFactory(() => MoviePlayingBloc(locator()));
  locator.registerFactory(() => MoviePopularBloc(locator()));
  locator.registerFactory(() => MovieTopratedBloc(locator()));
  locator.registerFactory(() => MovieSearchBloc(locator()));
  locator.registerFactory(() => MovieWatchlistBloc(locator()));
  locator.registerFactory(() => MovieWatchlistStatusBloc(locator(), locator()));
  //Tv Bloc
  locator.registerFactory(() => TvDetailBloc(locator(), locator(), locator()));
  locator.registerFactory(() => TvOnairBloc(locator()));
  locator.registerFactory(() => TvPopularBloc(locator()));
  locator.registerFactory(() => TvTopratedBloc(locator()));
  locator.registerFactory(() => TvSearchBloc(locator()));
  locator.registerFactory(() => TvWatchlistBloc(locator()));
  locator.registerFactory(() => TvWatchlistStatusBloc(locator(), locator()));

  //Movies usecase
  locator.registerLazySingleton(() => GetMovieDetail(locator()));
  locator.registerLazySingleton(() => GetNowPlayingMovies(locator()));
  locator.registerLazySingleton(() => GetPopularMovies(locator()));
  locator.registerLazySingleton(() => GetMovieRecommendations(locator()));
  locator.registerLazySingleton(() => GetTopRatedMovies(locator()));
  locator.registerLazySingleton(() => GetWatchListMoviesStatus(locator()));
  locator.registerLazySingleton(() => GetWatchlistMovies(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistMovies(locator()));
  locator.registerLazySingleton(() => SaveWatchlistMovies(locator()));
  locator.registerLazySingleton(() => SearchMovies(locator()));
  //Tv usecase
  locator.registerLazySingleton(() => GetTvDetail(locator()));
  locator.registerLazySingleton(() => GetOnAirTv(locator()));
  locator.registerLazySingleton(() => GetPopularTvSeries(locator()));
  locator.registerLazySingleton(() => GetTvRecommendations(locator()));
  locator.registerLazySingleton(() => GetTopRatedTv(locator()));
  locator.registerLazySingleton(() => GetWatchListTvStatus(locator()));
  locator.registerLazySingleton(() => GetWatchlistTv(locator()));
  locator.registerLazySingleton(() => RemoveWatchlistTv(locator()));
  locator.registerLazySingleton(() => SaveWatchlistTv(locator()));
  locator.registerLazySingleton(() => SearchTvSeries(locator()));


  //Movies Repository
  locator.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
        remoteDataSource: locator(),
        localDataSource: locator()
    )
  );
  //Tv Repository
  locator.registerLazySingleton<TvRepository>(
    () => TvRepositoryImpl(
          remoteDataSource: locator(),
          localDataSource: locator()
      )
  );

  //helper
  locator.registerLazySingleton<DatabaseHelper>(() => DatabaseHelper());

  //Movies Datasource
  locator.registerLazySingleton<MovieRemoteDataSource>(
          () => MovieRemoteDataSourceImpl());
  locator.registerLazySingleton<MovieLocalDataSource>(
          () => MovieLocalDataSourceImpl(databaseHelper: locator()));
  //Tv Datasource
  locator.registerLazySingleton<TvRemoteDataSource>(
          () => TvRemoteDataSourceImpl());
  locator.registerLazySingleton<TvLocalDataSource>(
          () => TvLocalDataSourceImpl(databaseHelper: locator()));
}