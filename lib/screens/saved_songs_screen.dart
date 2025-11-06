import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:music_lyrics_app/models/song_data.dart';
import 'package:music_lyrics_app/models/song_search_result.dart';
import 'package:music_lyrics_app/repositories/saved_songs_repository.dart';
import 'package:music_lyrics_app/screens/search_screen/song_list_item_widget.dart';
import 'package:music_lyrics_app/screens/song_screen/song_screen.dart';
import 'package:music_lyrics_app/service_locator.dart';
import 'package:music_lyrics_app/utils/navigation.dart';

class SavedSongsScreen extends StatefulWidget {
  @override
  _SavedSongsScreenState createState() => _SavedSongsScreenState();
}

class _SavedSongsScreenState extends State<SavedSongsScreen> {
  late List<SongData> songs;

  @override
  void initState() {
    super.initState();
    updateSongs();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Saved Songs: ${songs.length}"),
      ),
      body: Center(
        child: Builder(
          builder: (context) {
            if (songs.isEmpty) {
              return _buildNoSavedSongsWidget();
            }
            return _buildSavedSongsWidget();
          },
        ),
      ),
    );
  }

  Widget _buildNoSavedSongsWidget() {
    return Column(
      children: [
        Spacer(),
        Container(
          height: MediaQuery.of(context).size.height / 3,
          child: Lottie.asset(
            "assets/lottie_animations/empty_State.json",
            alignment: Alignment.center,
            fit: BoxFit.contain,
            repeat: true,
          ),
        ),
        Opacity(
          opacity: 0.8,
          child: Text(
            "No Saved Songs",
            textAlign: TextAlign.center,
            overflow: TextOverflow.ellipsis,
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ),
        Spacer(),
      ],
    );
  }

  Widget _buildSavedSongsWidget() {
    return ListView.builder(
        itemCount: songs.length,
        itemBuilder: (context, index) {
          var song = songs[index];
          return InkWell(
            onTap: () {
              onSongClicked(song);
            },
            child: getItemWidget(song, context),
          );
        });
  }

  void updateSongs() {
    var savedSongsRepo = serviceLocator.get<SavedSongsRepository>();
    songs = savedSongsRepo.getSavedSongs();
  }

  Widget getItemWidget(SongData songData, BuildContext context) {
    return SongListItemWidget(SongDetails.fromSongData(songData));
  }

  void onSongClicked(SongData songLyrics) {
    goToScreen(context, SongScreen(songLyrics), onReturn: onScreenPoped);
  }

  void onScreenPoped() {
    setState(() {
      updateSongs();
    });
  }
}
