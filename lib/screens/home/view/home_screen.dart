import 'package:audio_player/screens/home/provider/home_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class home_screen extends StatefulWidget {
  const home_screen({Key? key}) : super(key: key);

  @override
  State<home_screen> createState() => _home_screenState();
}

class _home_screenState extends State<home_screen> {

  home_provider? homepProvider_false;
  home_provider? homepProvider_true;

  @override
  void initState() {
    super.initState();

    Provider.of<home_provider>(context,listen: false).initAudio();
  }

  @override
  Widget build(BuildContext context) {

    homepProvider_false = Provider.of<home_provider>(context,listen: false);
    homepProvider_true = Provider.of<home_provider>(context,listen: true);

    return SafeArea(
      child: Scaffold(
        body: Stack(
          children: [
            Image.network(
              "https://png.pngtree.com/thumb_back/fh260/background/20210101/pngtree-double-row-tree-path-with-yellow-deciduous-autumn-leaves-image_519106.jpg",
              height: 850,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
            Container(
              height: double.infinity,width: double.infinity,color: Colors.black45,
            ),
            Align(
              alignment: Alignment.center,
              child: ClipRRect(
                child: Image.asset("assets/music/photo.webp",width: 200,height: 200,fit: BoxFit.cover),
                borderRadius: BorderRadius.circular(20),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 70),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(onPressed: () {
                      homepProvider_false!.startAudio();
                    }, icon: Icon(Icons.play_circle,color: Colors.white,size: 35,)),
                    IconButton(onPressed: () {
                      homepProvider_false!.stopAudio();
                    }, icon: Icon(Icons.pause_circle,color: Colors.white,size: 35,)),
                    IconButton(onPressed: () {

                    }, icon: Icon(Icons.volume_mute,color: Colors.white,size: 35,))
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
