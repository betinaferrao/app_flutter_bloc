import 'package:bilheteria_panucci/models/movie.dart';
import 'package:bilheteria_panucci/services/movies_api.dart';
import 'package:bloc/bloc.dart';

part 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());
  HomeService homeService = HomeService();

  Future<void> getMovies() async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMovies();
      emit(HomeSucess(movies));
    } catch (e) {
      emit(HomeError('Não foi possível carregar!'));
    }
  }

  Future<void> getMoviesByGender(String genre) async {
    emit(HomeLoading());
    try {
      final movies = await homeService.fetchMoviesByGenre(genre);
      emit(HomeSucess(movies));
    } catch (e) {
      emit(HomeError('Não foi possível os filmes desse gênero!'));
    }
  }
}
