import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import 'color.dart' as color;

class VedioInfo extends StatefulWidget {
  const VedioInfo({Key? key}) : super(key: key);

  @override
  State<VedioInfo> createState() => _VedioInfoState();
}

class _VedioInfoState extends State<VedioInfo> {
  List vedioInfo = [];
  bool _playArea = false;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;
  VideoPlayerController? _controller;
  _initData() async {
    await DefaultAssetBundle.of(context)
        .loadString("json/vedioinfo.json")
        .then((value) {
      setState(() {
        vedioInfo = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  void dispose() {
    _disposed = true;
    _controller?.pause();
    _controller?.dispose();
    _controller = null;
    // TODO: implement dispose
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst,
              color.AppColor.gradientSecond,
            ],
            begin: const FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ),
        child: Column(
          children: [
            _playArea == false
                ? Container(
                    //color: Colors.red,
                    padding: EdgeInsets.only(top: 70, left: 30, right: 30),
                    height: 300,
                    width: MediaQuery.of(context).size.width,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {
                                Get.back();
                              },
                              child: Icon(
                                Icons.arrow_back_ios,
                                size: 20,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            ),
                            Icon(
                              Icons.info_outline,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 30,
                        ),
                        Text(
                          "Legs Toning",
                          style: TextStyle(
                              color: color.AppColor.secondPageTitleColor,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "and Glutes WorkOut",
                          style: TextStyle(
                              color: color.AppColor.secondPageTitleColor,
                              fontSize: 25),
                        ),
                        SizedBox(
                          height: 50,
                        ),
                        Row(
                          children: [
                            Container(
                              height: 30,
                              width: 90,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  color.AppColor
                                      .secondPageContainerGradient1stColor,
                                  color.AppColor
                                      .secondPageContainerGradient2ndColor,
                                ]),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.timer,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "60 min",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 30,
                              width: 230,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: LinearGradient(colors: [
                                  color.AppColor
                                      .secondPageContainerGradient1stColor,
                                  color.AppColor
                                      .secondPageContainerGradient2ndColor,
                                ]),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(
                                    Icons.handyman_rounded,
                                    size: 20,
                                    color: color.AppColor.secondPageIconColor,
                                  ),
                                  SizedBox(
                                    width: 5,
                                  ),
                                  Text(
                                    "Resistent band, kettebell",
                                    style: TextStyle(
                                        fontSize: 16,
                                        color:
                                            color.AppColor.secondPageIconColor),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  )
                : Container(
                    child: Column(
                      children: [
                        Container(
                          height: 100,
                          padding:
                              EdgeInsets.only(top: 50, left: 30, right: 30),
                          child: Row(
                            children: [

                              InkWell(
                                onTap: () {},
                                child: Icon(
                                  Icons.arrow_back_ios,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor,
                                ),
                              ),
                              Expanded(child: Container()),
                              Icon(Icons.info_outline,
                                  size: 20,
                                  color: color.AppColor.secondPageIconColor),
                            ],
                          ),
                        ),
                        _playView(context),
                        _controlView(context),
                      ],
                    ),
                  ),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  ),
                ),
                child: Column(
                  children: [
                    SizedBox(
                      height: 30,
                    ),
                    Row(
                      children: [
                        SizedBox(
                          width: 30,
                        ),
                        Text(
                          "Circuit 1 : Legs Toning",
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(
                          child: Container(),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.loop,
                              size: 30,
                              color: color.AppColor.loopColor,
                            ),
                            SizedBox(
                              width: 10,
                            ),
                            Text(
                              "3 sets",
                              style: TextStyle(
                                  fontSize: 15,
                                  color: color.AppColor.setsColor),
                            ),
                            SizedBox(
                              width: 20,
                            ),
                          ],
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Expanded(
                      child: _listView(),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  String convertTow(int value){
    return value < 10 ? "0$value" : '$value';
  }

  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume??0)>0;
    final duration = _duration?.inSeconds ?? 0;
    final head = _position?.inSeconds ?? 0;
    final remained = max(0,duration - head);
    final mins = convertTow(remained ~/60.0);
    final secs = convertTow(remained % 60);
    return Column(
      children: [
        Slider(
            value: max(0,min(_progress * 100,100)),
            min: 0,
            max: 100,
            label: _position?.toString().split('.')[0],
            onChanged: (value){
              setState(() {
                _progress = value * 0.01;
              });
            },
         onChangeStart:(value){
              _controller?.pause();
    },

    onChangeEnd:(value){
              final duration = _controller?.value?.duration;
              if(duration != null){
                var newValue = max (0,min(value ,99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
    }

        ),
        Container(
          height: 40,
          width: MediaQuery.of(context).size.width,
          margin: EdgeInsets.only(bottom: 5),
          color: color.AppColor.gradientSecond,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              InkWell(
                onTap: (){
                  if(noMute){
                    _controller?.setVolume(0);
                  }else{
                    _controller?.setVolume(1.0);
                  }
                  setState(() {

                  });
                },
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12,vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,

                    ),
                    child: Icon(noMute? Icons.volume_up:Icons.volume_off,color: Colors.white,),
                  ),
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex - 1;
                  if (index >= 0 && vedioInfo.length >= 0) {
                    _initializeVedio(index);
                  } else {
                    Get.snackbar('vedio list', " ",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: Icon(
                          Icons.face,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: Text(
                          "no more earlier vedio ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: Icon(
                  Icons.fast_rewind,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if (_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller!.pause();
                  } else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                },
                child: Icon(
                  _isPlaying ? Icons.pause : Icons.play_arrow,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if (index <= vedioInfo.length - 1) {
                    _initializeVedio(index);
                  } else {
                    Get.snackbar('vedio list', "no more vidio in the list ",
                        snackPosition: SnackPosition.BOTTOM,
                        icon: Icon(
                          Icons.face,
                          color: Colors.white,
                          size: 30,
                        ),
                        backgroundColor: color.AppColor.gradientSecond,
                        colorText: Colors.white,
                        messageText: Text(
                          "no more vedio in the list ",
                          style: TextStyle(fontSize: 20, color: Colors.white),
                        ));
                  }
                },
                child: Icon(
                  Icons.fast_forward,
                  color: Colors.white,
                ),
              ),
              Text("$mins : $secs",style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;

    if (controller != null && controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16 / 9,
        child: VideoPlayer(controller),
      );
    } else {
      return AspectRatio(
          aspectRatio: 16 / 9,
          child: Center(
              child: Text(
            "being started plaease waite",
            style: TextStyle(color: Colors.white),
          )));
    }
  }

  var _onUpdateControllerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  Future<void> _onControllerUpdate() async {
    if (_disposed) {
      return;
    }
    _onUpdateControllerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;
    if (_onUpdateControllerTime > now) {
      return;
    }
    _onUpdateControllerTime = now + 500;
    final controller = _controller;
    if (controller == null) {
      debugPrint("controller is null ");
      return;
    }
    if (!controller.value.isInitialized) {
      debugPrint("controller can not be initielized");
      return;
    }

    if(_duration == null){
      _duration == _controller?.value.duration;
    }
    var duration = _duration;
    if(duration == null) return;

    var position = await controller.position;
    _position = position;
    final playing = controller.value.isPlaying;

    if(playing){
      if(_disposed) return ;

      setState(() {
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });

    }

    _isPlaying = playing;
  }

  _initializeVedio(int index) {
    final controller =
        VideoPlayerController.network(vedioInfo[index]['videoUrl']);
    final old = _controller;
    _controller = controller;
    if (old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {});

    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        _controller!.play();
      });

    setState(() {});
  }

  _onTapVedio(int index) {
    _initializeVedio(index);
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: vedioInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            _onTapVedio(index);
            debugPrint(index.toString());
            setState(() {
              if (_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index),
        );
      },
    );
  }

  _buildCard(int index) {
    return Container(
      height: 135,
      width: 200,
      //  color: Colors.red,
      child: Column(
        children: [
          Row(
            children: [
              Container(
                height: 80,
                width: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(vedioInfo[index]['thumbnail']),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              SizedBox(
                width: 10,
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    vedioInfo[index]['title'],
                    style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      vedioInfo[index]['time'],
                      style: TextStyle(color: Colors.grey[500]),
                    ),
                  ),
                ],
              )
            ],
          ),
          SizedBox(
            height: 18,
          ),
          Row(
            children: [
              Container(
                height: 20,
                width: 80,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    "15s rest",
                    style: TextStyle(
                      color: Color(0xFF830fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for (int i = 1; i < 80; i++)
                    i.isEven
                        ? Container(
                            height: 1,
                            width: 3,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(2),
                              color: Color(0xFF839fed),
                            ),
                          )
                        : Container(
                            height: 1,
                            width: 3,
                            color: Colors.white,
                          ),
                ],
              )
            ],
          )
        ],
      ),
    );
  }
}
