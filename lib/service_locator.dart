import 'package:music_lyrics_app/repositories/saved_songs_repository.dart';
import 'package:music_lyrics_app/repositories/songs_repository.dart';
import 'package:get_it/get_it.dart';
import 'package:music_lyrics_app/repositories/local_storage_repository.dart';

Future<void> setupServiceLocator() async {
  LocalStorageRepository localStorageRepository = LocalStorageRepository();
  await localStorageRepository.init();
  serviceLocator
      .registerSingleton<LocalStorageRepository>(localStorageRepository);

  serviceLocator.registerSingleton<SongsRepository>(APISongsRepository());

  serviceLocator.registerSingleton<SavedSongsRepository>(
    SavedSongsRepository(serviceLocator.get<LocalStorageRepository>()),
  );
}

final serviceLocator = GetIt.instance;
