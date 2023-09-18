import 'package:audio_waveforms/audio_waveforms.dart';
import 'package:custom_timer/custom_timer.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_vofo/const/image_data.dart';
import 'package:my_vofo/view/page/post%20vofo/preview.dart';

class RecordTimer extends StatefulWidget {
  final bool isShort;
  const RecordTimer({required this.isShort, super.key});

  @override
  State<RecordTimer> createState() => _RecordTimerState();
}

class _RecordTimerState extends State<RecordTimer>
    with TickerProviderStateMixin {
  final RecorderController recorderController = RecorderController();


  String? path = '';

  bool isClick = false;

  late CustomTimerController timeController = CustomTimerController(
      vsync: this,
      begin: (widget.isShort == true)?Duration(seconds: 30):Duration(),
      end: (widget.isShort == true)?Duration(seconds: 0):Duration(hours: 24),
      initialState: CustomTimerState.reset,
      interval: CustomTimerInterval.milliseconds);

  void _startRecording() async {
    await recorderController.checkPermission();

    recorderController.androidEncoder = AndroidEncoder.aac;                  // Changing android encoder
    recorderController.androidOutputFormat = AndroidOutputFormat.mpeg4;      // Changing android output format
    recorderController.iosEncoder = IosEncoder.kAudioFormatMPEG4AAC;

    timeController.start();
    await recorderController.record(
      path: path,
      bitRate: 160,
    );
    print(recorderController.androidOutputFormat);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          iconTheme: IconThemeData(color: Color.fromRGBO(59, 59, 59, 1)),
          backgroundColor: Colors.white,
          titleSpacing: 5,
          elevation: 0,
          scrolledUnderElevation: 0,
        ),
        body: SingleChildScrollView(
          child: Center(
            child: Padding(
              padding: const EdgeInsets.all(12.0),
              child: Column(
                children: [
                  Container(
                    width: size.width * 0.8,
                    height: size.height * 0.3,
                    child: Image.asset(
                      ImageData.Timer,
                      fit: BoxFit.contain,
                    ),
                  ),
                  (widget.isShort == false)
                      ? CustomTimer(
                          controller: timeController,
                          builder: (state, time) {
                            return Text(
                              "${time.hours}:${time.minutes}:${time.seconds}",
                              style: GoogleFonts.inter(
                                textStyle: TextStyle(
                                    color: Color.fromRGBO(89, 101, 111, 1),
                                    fontWeight: FontWeight.w500,
                                    fontSize: 28.0),
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            );
                          })
                      : CustomTimer(
                          controller: timeController,
                          builder: (state, time) {
                            return CircleAvatar(
                              radius: 40,
                              backgroundColor: Color.fromRGBO(0, 159, 183, 1),
                              child: Text(
                                "${time.seconds}s",
                                style: GoogleFonts.inter(
                                  textStyle: TextStyle(
                                      color: Colors.white,
                                      fontWeight: FontWeight.w500,
                                      fontSize: 28.0),
                                ),
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                            );
                          }),
                  const SizedBox(
                    height: 50,
                  ),
                  AudioWaveforms(
                    enableGesture: true,
                    shouldCalculateScrolledPosition: true,
                    size: Size(size.width * 0.9, size.height * 0.1),
                    recorderController: recorderController,
                    waveStyle: WaveStyle(
                        waveColor: Color.fromRGBO(128, 128, 128, 1),
                        extendWaveform: true,
                        showMiddleLine: false,
                        spacing: 5.0,
                        scaleFactor: 50.0),
                  ),
                  SizedBox(
                    height: size.height * 0.15,
                  ),
                  Row(
                    children: [
                      Expanded(
                          child: Container(
                        height: 50,
                        child:
                            Image.asset(ImageData.Upload, fit: BoxFit.contain),
                      )),
                      Expanded(
                        child: CircleAvatar(
                          radius: 30,
                          backgroundColor: Color.fromRGBO(167, 29, 49, 1),
                          child: (isClick == true)
                              ? IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isClick = false;
                                    });
                                    timeController.pause();
                                    recorderController.pause();
                                  },
                                  icon: Icon(
                                    Icons.pause,
                                    color: Colors.white,
                                    size: 20,
                                  ),
                                )
                              : IconButton(
                                  onPressed: () {
                                    setState(() {
                                      isClick = true;
                                    });
                                    _startRecording();
                                  },
                                  icon: Icon(
                                    Icons.play_arrow_rounded,
                                    color: Colors.white,
                                    size: 24,
                                  ),
                                ),
                        ),
                      ),
                      Expanded(
                          child: GestureDetector(
                        onTap: (() async {
                          timeController.finish();
                          path = await recorderController.stop();
                          print(path);
                          showPreviewBottomSheet(context, widget.isShort, path);
                        }),
                        child: Container(
                            height: 50,
                            child: Image.asset(ImageData.Done,
                                fit: BoxFit.contain)),
                      )),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
