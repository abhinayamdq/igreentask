import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_audio_recorder2/flutter_audio_recorder2.dart';
import 'package:path_provider/path_provider.dart';
import 'package:social_media_recorder/audio_encoder_type.dart';
import 'package:social_media_recorder/screen/social_media_recorder.dart';

import 'Colors.dart';

class RecorderView extends StatefulWidget {
  final Function onSaved;

  const RecorderView({Key? key, required this.onSaved}) : super(key: key);

  @override
  _RecorderViewState createState() => _RecorderViewState();
}

enum RecordingState {
  UnSet,
  Set,
  Recording,
  Stopped,
}

class _RecorderViewState extends State<RecorderView> {
  IconData _recordIcon = Icons.mic_none;
  String _recordText = 'Click To Start';
  RecordingState _recordingState = RecordingState.UnSet;
  late Timer _timer;
  bool isLongPressed = false;

  // Recorder properties
  late FlutterAudioRecorder2 audioRecorder;

  @override
  void initState() {
    super.initState();

    FlutterAudioRecorder2.hasPermissions.then((hasPermision) {
      if (hasPermision!) {
        _recordingState = RecordingState.Set;
        _recordText = 'Record';
      }
    });
  }

  @override
  void dispose() {
    _recordingState = RecordingState.UnSet;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        // Container(
        //   alignment: Alignment.center,
        //   width: 40,
        //   height: 40,
        //   child: GestureDetector(
        //     child: Padding(
        //       padding: EdgeInsets.symmetric(vertical: 6.0, horizontal: 18.0),
        //       child: Icon(
        //         Icons.mic,
        //       ),
        //     ),
        //     // onTap: () {
        //     //   increment(1);
        //     // },
        //     onLongPressStart: (_) async {
        //       if (isLongPressed) {
        //         _onRecordButtonPressed();
        //       } else {
        //         isLongPressed = false;
        //       }
        //     },
        //   ),
        // ),
        Padding(
          padding: const EdgeInsets.only(top: 25, left: 10, right: 10),
          child: Align(
            alignment: Alignment.centerRight,
            child: SocialMediaRecorder(
              backGroundColor: CustomColors.lightviolet,
              recordIconBackGroundColor: CustomColors.brand,
              recordIconWhenLockBackGroundColor: CustomColors.brand,
              radius: BorderRadius.circular(15),
              sendRequestFunction: (soundFile) {
                _onRecordButtonPressed();
                // print("the current path is ${soundFile.path}");
              },
              encode: AudioEncoderType.AAC,
            ),
          ),
        ),
        const Padding(
          padding: EdgeInsets.only(left: 10, right: 15, bottom: 10, top: 6),
          child: Align(
            alignment: Alignment.centerRight,
            child: Text(
              "Hold",
              style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  fontWeight: FontWeight.bold),
            ),
          ),
        ),
      ],
    );
  }

  Future<void> _onRecordButtonPressed() async {
    _timer = Timer(const Duration(milliseconds: 200), () async {
      print('LongPress Event');
      isLongPressed = true;
      switch (_recordingState) {
        case RecordingState.Set:
          await _recordVoice();
          break;

        case RecordingState.Recording:
          await _stopRecording();
          _recordingState = RecordingState.Stopped;
          _recordIcon = Icons.fiber_manual_record;
          _recordText = 'Record new one';
          break;

        case RecordingState.Stopped:
          await _recordVoice();
          break;

        case RecordingState.UnSet:
          ScaffoldMessenger.of(context).hideCurrentSnackBar();

          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text('Please allow recording from settings.'),
          ));
          break;
      }
    });
  }

  _initRecorder() async {
    Directory appDirectory = await getApplicationDocumentsDirectory();
    String filePath = appDirectory.path +
        '/' +
        DateTime.now().millisecondsSinceEpoch.toString() +
        '.aac';

    audioRecorder =
        FlutterAudioRecorder2(filePath, audioFormat: AudioFormat.AAC);
    await audioRecorder.initialized;
  }

  _startRecording() async {
    await audioRecorder.start();
    // await audioRecorder.current(channel: 0);
  }

  _stopRecording() async {
    await audioRecorder.stop();

    widget.onSaved();
  }

  Future<void> _recordVoice() async {
    final hasPermission = await FlutterAudioRecorder2.hasPermissions;
    if (hasPermission ?? false) {
      await _initRecorder();

      await _startRecording();
      _recordingState = RecordingState.Recording;
      _recordIcon = Icons.stop;
      _recordText = 'Recording';
    } else {
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Please allow recording from settings.'),
      ));
    }
  }
}
