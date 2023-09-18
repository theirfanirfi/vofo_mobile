import 'dart:convert';
import 'dart:io';

import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class AudioWave extends StatefulWidget {
  final String path;
  final bool isBase64;
  const AudioWave(this.isBase64, {required this.path, super.key});

  @override
  State<AudioWave> createState() => _AudioWaveState();
}

class _AudioWaveState extends State<AudioWave> {
  PlayerController controller = PlayerController();


  @override
  void dispose() {
    super.dispose();
    controller.stopPlayer();
    controller.stopAllPlayers();
    controller.dispose();
    print('disposed');
  }


  @override
  void initState() {
    print('init');

  }

  Future<String> decodeBase64ToCache(String base64String, String fileName) async {
    // Decode the base64 string
    List<int> decodedBytes = base64.decode(base64String);

    // Get the cache directory
    Directory cacheDirectory = await getTemporaryDirectory();

    // Create the file path in the cache directory
    String filePath = '${cacheDirectory.path}/$fileName';

    // Write the decoded bytes to the cache file
    File file = File(filePath);
    await file.writeAsBytes(decodedBytes);

    print('Decoded data has been written to cache: $filePath');
    return filePath;
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Row(
      children: [
        Flexible(
            child: IconButton(
                onPressed: () async {
                  // controller.startPlayer();
                  // controller.stopAllPlayers();
                  // print(widget.path);
                  if(widget.isBase64){
                    var filePath  = await decodeBase64ToCache(widget.path,"vofo.m4a");
                    print(filePath);
                    await controller.preparePlayer(path: filePath);
                    await controller.startPlayer(finishMode: FinishMode.stop, forceRefresh: false);


                  }else {
                    await controller.preparePlayer(path: widget.path);
                    await controller.startPlayer(finishMode: FinishMode.stop, forceRefresh: false);

                  }

                  print('pressed ');


                 // await controller.stopPlayer();

                },
                icon: Icon(
                  Icons.play_arrow_rounded,
                  color: Color.fromRGBO(89, 101, 111, 1),
                ))),
        Flexible(
          flex: 4,
          child: AudioFileWaveforms(
            size: Size(size.width * 0.6, 30.0),
            playerController: controller,
            enableSeekGesture: true,
            waveformType: WaveformType.fitWidth,
            waveformData: [
              0.2,
              0.4,
              0.5,
              0.4,
              0.2,
              0.1,
              0.2,
              0.09,
              0.5,
              0.4,
              0.2,
              0.1,
              0.2,
              0.4,
              0.5,
              0.4,
              0.3,
              0.2,
              0.1,
              0.09,
              0.1,
              0.2,
              0.4,
              0.5,
              0.4,
              0.3,
              0.2,
              0.2,
              0.4,
              0.5,
              0.2,
              0.3,
              0.2,
              0.4,
              0.5,
              0.4,
              0.2,
              0.1,
            ],
            playerWaveStyle: const PlayerWaveStyle(
              fixedWaveColor: Color.fromRGBO(89, 101, 111, 1),
              liveWaveColor: Color.fromRGBO(89, 101, 111, 1),
              scaleFactor: 20,
              spacing: 7,
              // ...
            ),
            // ...
          ),
        ),
      ],
    );
  }
}
