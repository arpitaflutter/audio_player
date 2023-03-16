import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class home_provider extends ChangeNotifier
{
  AssetsAudioPlayer? assetsAudioPlayer;
  bool isMute = false;
  Duration totalDuration = Duration(seconds: 0);

  List<Audio> AudioList = [
    Audio("assets/music/omw.mp3"),
    Audio("assets/music/Jeena Jeena.mp3"),
    Audio("assets/music/Jeene Laga Hoon.mp3"),
  ];
  
  void initAudio()
  {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Playlist(audios: AudioList),
      autoStart: false,showNotification: true
    );

    totalDurationAudio();
  }
  
  Future<void> startAudio()
  async {
    await assetsAudioPlayer!.play();
  }

  Future<void> stopAudio()
  async {
    await assetsAudioPlayer!.pause();
  }
  
  Future<void> muteAudio() async {
    await assetsAudioPlayer!.setVolume(isMute?1:0);
    isMute = !isMute;
    notifyListeners();
  }

  void totalDurationAudio()
  {
    assetsAudioPlayer!.current.listen((event) {
      totalDuration = event!.audio.duration;
      notifyListeners();
    });
  }

  Future<void> previousSong()
  async {
    await assetsAudioPlayer!.previous();
    notifyListeners();
  }

  Future<void> nextSong()
  async {
    await assetsAudioPlayer!.next();
    notifyListeners();
  }
}