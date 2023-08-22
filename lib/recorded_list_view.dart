import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';

import 'Colors.dart';

class RecordListView extends StatefulWidget {
  final List<String> records;

  const RecordListView({
    Key? key,
    required this.records,
  }) : super(key: key);

  @override
  _RecordListViewState createState() => _RecordListViewState();
}

class _RecordListViewState extends State<RecordListView> {
  late int _totalDuration;
  late int _currentDuration;
  double _completedPercentage = 0.0;
  bool _isPlaying = false;
  int _selectedIndex = -1;
  AudioPlayer audioPlayer = AudioPlayer();

  @override
  Widget build(BuildContext context) {
    return widget.records.isEmpty
        ? Center(child: Text('No records yet'))
        : ListView.builder(
            physics: NeverScrollableScrollPhysics(),
            itemCount: widget.records.length,
            shrinkWrap: true,
            reverse: true,
            itemBuilder: (BuildContext context, int i) {
              return ExpansionTile(
                title: Text('Audio File${widget.records.length - i}'),
                // subtitle: Text(_getDateFromFilePatah(
                //     filePath: widget.records.elementAt(i))),
                onExpansionChanged: ((newState) {
                  if (newState) {
                    setState(() {
                      _selectedIndex = i;
                    });
                  }
                }),
                children: [
                  Container(
                    height: 100,
                    padding: const EdgeInsets.all(10),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        LinearProgressIndicator(
                          minHeight: 5,
                          backgroundColor: Colors.black,
                          valueColor:
                              AlwaysStoppedAnimation<Color>(Colors.green),
                          value: _selectedIndex == i ? _completedPercentage : 0,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            // IconButton(
                            //     onPressed: _delete,
                            //     icon: Icon(
                            //       Icons.delete_outline_outlined,
                            //       color: Colors.red,
                            //     )),
                            IconButton(
                              icon: _selectedIndex == i
                                  ? !_isPlaying
                                      ? Icon(
                                          Icons.play_circle_outline,
                                          color: CustomColors.brand,
                                        )
                                      : Icon(
                                          Icons.pause_circle_outline,
                                          color: CustomColors.brand,
                                        )
                                  : Icon(
                                      Icons.play_circle_outline,
                                      color: CustomColors.brand,
                                    ),
                              onPressed: () => _onPlay(
                                  filePath: widget.records.elementAt(i),
                                  index: i),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              );
            },
          );
  }

  void _delete() {}

  Future<void> _onPlay({required String filePath, required int index}) async {
    if (!_isPlaying) {
      audioPlayer.play(filePath, isLocal: true);
      setState(() {
        _selectedIndex = index;
        _completedPercentage = 0.0;
        _isPlaying = true;
      });

      audioPlayer.onPlayerCompletion.listen((_) {
        setState(() {
          _completedPercentage = 0.0;
        });
      });
      audioPlayer.onDurationChanged.listen((duration) {
        setState(() {
          _totalDuration = duration.inMicroseconds;
        });
      });

      audioPlayer.onAudioPositionChanged.listen((duration) {
        setState(() {
          _currentDuration = duration.inMicroseconds;
          _completedPercentage =
              _currentDuration.toDouble() / _totalDuration.toDouble();
        });
      });
    } else {
      _isPlaying = false;
      audioPlayer.pause();
    }
  }

  String _getDateFromFilePatah({required String filePath}) {
    String fromEpoch = filePath.substring(
        filePath.lastIndexOf('/') + 1, filePath.lastIndexOf('.'));

    DateTime recordedDate =
        DateTime.fromMillisecondsSinceEpoch(int.parse(fromEpoch));
    int year = recordedDate.year;
    int month = recordedDate.month;
    int day = recordedDate.day;

    return ('$day-$month-$year');
  }
}
