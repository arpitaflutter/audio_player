import 'package:assets_audio_player/assets_audio_player.dart';
import 'package:flutter/cupertino.dart';

class home_provider extends ChangeNotifier
{
  AssetsAudioPlayer? assetsAudioPlayer;
  
  void initAudio()
  {
    assetsAudioPlayer = AssetsAudioPlayer();
    assetsAudioPlayer!.open(Audio("assets/music/omw.mp3"),
      autoStart: false,showNotification: true
    );
  }
  
  Future<void> startAudio()
  async {
    await assetsAudioPlayer!.play();
  }

  Future<void> stopAudio()
  async {
    await assetsAudioPlayer!.pause();
  }
  
  void muteAudio() {
    
  }
}