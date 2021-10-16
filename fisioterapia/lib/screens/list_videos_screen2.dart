import 'dart:convert';
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:video_player/video_player.dart';
import '../theme/colors.dart' as color;

class ListVideosScreen2 extends StatefulWidget {
  ListVideosScreen2({Key? key}) : super(key: key);

  @override
  _ListVideosScreen2State createState() => _ListVideosScreen2State();
}

class _ListVideosScreen2State extends State<ListVideosScreen2> {

  List videoInfo = [];
  bool _playArea = false;
  VideoPlayerController? _controller;
  bool _isPlaying = false;
  bool _disposed = false;
  int _isPlayingIndex = -1;

  _initData() async{
    await DefaultAssetBundle.of(context).loadString("json/videoinfo.json").then((value) {
      setState(() {
        videoInfo = json.decode(value);
        videoInfo = videoInfo[1];
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
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: _playArea==false?BoxDecoration(
          gradient: LinearGradient(
            colors: [
              color.AppColor.gradientFirst.withOpacity(0.9),
              color.AppColor.gradientSecond,

            ],
            begin: FractionalOffset(0.0, 0.4),
            end: Alignment.topRight,
          ),
        ):BoxDecoration(
          color: color.AppColor.gradientSecond,
        ),
        
        child: Column(
          children: [

            _playArea==false?Container(// cabecera Legs Toning
              padding: EdgeInsets.only(top: 40, left: 30, right: 38),
              width: MediaQuery.of(context).size.width,
              height: 220,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [

                  Row(
                    children: [
                      InkWell(
                        // onTap: () {Get.back();},
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Icon(Icons.arrow_back_ios, size: 15,//20
                         color: color.AppColor.secondPageIconColor,
                        ),
                      ),
                      Expanded(child: Container()),
                      Icon(Icons.info_outline, size: 15,
                       color: color.AppColor.secondPageIconColor,
                      ),
                    ],
                  ),
                  SizedBox(height: 15,),
                  Text('Nivel 2',
                    style: TextStyle(
                      fontSize: 18,
                      color: color.AppColor.secondPageTitleColor,
                    ),
                  ),
                  SizedBox(height: 5,),
                  Text('Ejercicios acostados',
                    style: TextStyle(
                      fontSize: 25,
                      color: color.AppColor.secondPageTitleColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),

                  SizedBox(height: 30,),

                  Row(
                    children: [
                      Container(
                        width: 90,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              color.AppColor.secondPageContainerGradient1stColor,
                              color.AppColor.secondPageContainerGradient2ndColor,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.timer,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ), SizedBox(width: 5,),
                            Text(
                              '68 min',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),

                      ),

                      SizedBox(width: 20,),

                      Container(
                        width: 180,
                        height: 30,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          gradient: LinearGradient(
                            colors: [
                              Colors.blue.shade900,
                              Colors.blueAccent,
                            ],
                            begin: Alignment.bottomLeft,
                            end: Alignment.topRight,
                          )
                        ),

                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.handyman_outlined,
                              size: 20,
                              color: color.AppColor.secondPageIconColor,
                            ), SizedBox(width: 5,),
                            Text(
                              'Resistend band',
                              style: TextStyle(
                                fontSize: 16,
                                color: color.AppColor.secondPageIconColor,
                              ),
                            )
                          ],
                        ),

                      )
                    ],
                  ),

                  
                ],
              ),
            ):Container(
              child: Column(
                children: [
                  Container(
                    height: 100,
                    padding: EdgeInsets.only(top: 20, left: 30, right: 30),
                    child: Row(
                      children: [
                        
                        InkWell(
                          onTap: () {
                            Navigator.pop(context);
                            debugPrint('tapped');
                          },
                          child: Icon(Icons.arrow_back_ios,
                            size: 20,
                            color: color.AppColor.secondPageTopIconColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Icon(Icons.info_outline,
                          size: 20,
                          color: color.AppColor.secondPageTopIconColor,
                        )

                        
                      ],
                    ),
                  ),
                  _playView(context),
                  _controlView(context),
                ],
              ),
            ),

            Expanded( // Lista de videos
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    topRight: Radius.circular(70),
                  )
                ),
                child: Column(

                  children: [

                    SizedBox(height: 30,),

                    Row( //Circuit 1
                      children: [
                        SizedBox(width: 30,),
                        Text(
                          'Nivel 2: ',
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                            color: color.AppColor.circuitsColor,
                          ),
                        ),
                        Expanded(child: Container()),
                        Row(
                          children: [
                            Icon(Icons.loop, size: 30, color: color.AppColor.loopColor,),
                            SizedBox(width: 10),
                            Text(
                              '3 sets',
                              style: TextStyle(
                                fontSize: 15,
                                color: color.AppColor.setsColor,
                              ),
                            ),

                          ],
                        ),
                        SizedBox(width: 20,),
                      ],
                    ),

                    SizedBox(height: 20,),
                    Expanded(
                      child: _listView(),
                    ),


                  ],
                ),
              )
            )


          ],
        ),
     ),
    );
  }

  String convertTwo(int value) {
    return value < 10 ? "0$value" : "$value";
  }


  Widget _controlView(BuildContext context) {
    final noMute = (_controller?.value?.volume??0)>0;
    final duration = _duration?.inSeconds ?? 0; // if isseconds  is null
    final head = _position?.inSeconds ?? 0;
    final remained = max(0, duration - head);
    final mins = convertTwo(remained ~/ 60.0); // 22 ~/ 7 = 3
    final secs = convertTwo(remained % 60); //22 % 7 = 1 

    return Column(

      mainAxisSize: MainAxisSize.min,
      children: [
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            activeTrackColor: Colors.red[700],
            inactiveTrackColor: Colors.red[100],
            trackShape: RoundedRectSliderTrackShape(),
            trackHeight: 2.0,
            thumbShape: RoundSliderThumbShape(enabledThumbRadius: 12.0),
            thumbColor: Colors.redAccent,
            overlayColor: Colors.red.withAlpha(32),
            overlayShape: RoundSliderOverlayShape(overlayRadius: 28.0),
            tickMarkShape: RoundSliderTickMarkShape(),
            activeTickMarkColor: Colors.red[700],
            inactiveTickMarkColor: Colors.red[100],
            valueIndicatorShape: PaddleSliderValueIndicatorShape(),
            valueIndicatorColor: Colors.redAccent,
            valueIndicatorTextStyle: TextStyle(
              color: Colors.white,
            )

            
          ),
          child: Slider(
            value: max(0, min(_progress * 100, 100)),
            min: 0,
            max: 100,
            divisions: 100,
            label: _position?.toString().split(".")[0],
            onChanged: (value) {
              setState(() {
                _progress = value * 0.01;
              });
            },
            onChangeStart: (value) {
              _controller?.pause();
            },
            onChangeEnd: (value) {
              final duration = _controller?.value?.duration;
              if(duration != null) {
                var newValue = max(0, min(value, 99)) * 0.01;
                var millis = (duration.inMilliseconds * newValue).toInt();
                _controller?.seekTo(Duration(milliseconds: millis));
                _controller?.play();
              }
            },


          )
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
                child: Padding(
                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 8),
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          offset: Offset(0.0, 0.0),
                          blurRadius: 4.0,
                          color: Color.fromARGB(50, 0, 0, 0),
                        )
                      ]
                    ),
                    child: Icon(
                      noMute?Icons.volume_up:Icons.volume_off,
                      color: Colors.white,
                    ),
                  ),
                ),
                onTap: () {
                  if(noMute) {
                    _controller?.setVolume(0);
                  }else {
                    _controller?.setVolume(1.0);
                  }
                  setState(() {
                    
                  });
                },
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex -1;
                  if(index >= 0 && videoInfo.length >= 0 ) {
                    _initializeVideo(index);
                  }else {
                    Get.snackbar("Video", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        'No hay videos por detras',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                      
                    );
                  }
                }, 
                child: Icon(
                  Icons.fast_rewind,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  if(_isPlaying) {
                    setState(() {
                      _isPlaying = false;
                    });
                    _controller?.pause();
                  }else {
                    setState(() {
                      _isPlaying = true;
                    });
                    _controller?.play();
                  }
                }, 
                child: Icon(
                  _isPlaying?Icons.pause:Icons.play_arrow,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              TextButton(
                onPressed: () async {
                  final index = _isPlayingIndex + 1;
                  if(index <= videoInfo.length - 1) {
                    _initializeVideo(index);
                  }else {
                    Get.snackbar("Video List", "",
                      snackPosition: SnackPosition.BOTTOM,
                      icon: Icon(Icons.face,
                        size: 30,
                        color: Colors.white,
                      ),
                      backgroundColor: color.AppColor.gradientSecond,
                      colorText: Colors.white,
                      messageText: Text(
                        'Has terminado de ver todos los videos',
                        style: TextStyle(
                          fontSize: 20,
                          color: Colors.white,
                        ),
                      )
                    );
                  }
                }, 
                child: Icon(
                  Icons.fast_forward,
                  size: 36,
                  color: Colors.white,
                ),
              ),
              Text(
                "$mins:$secs",
                style: TextStyle(
                  color: Colors.white,
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(0.0, 1.0),
                      blurRadius: 4.0,
                      color: Color.fromARGB(150, 0, 0, 0),
                    )
                  ]
                ),
              )
            ],  
          ),
        ),
      ],
    );
  }

  Widget _playView(BuildContext context) {
    final controller = _controller;
    if(controller!=null&&controller.value.isInitialized) {
      return AspectRatio(
        aspectRatio: 16/9,
        child: VideoPlayer(controller),
      );
    }else {
      return AspectRatio(
        aspectRatio: 16/9,
        child: Center(
          child: Text("Preparing...",
          style: TextStyle(
            fontSize: 20,
            color: Colors.white,
          ),
          
          ),
        )
      );
    }
  }


  var _onUpdateCotrollerTime;
  Duration? _duration;
  Duration? _position;
  var _progress = 0.0;
  void _onControllerUpdate() async {
    if(_disposed) {
      return;
    }

    _onUpdateCotrollerTime = 0;
    final now = DateTime.now().millisecondsSinceEpoch;

    if(_onUpdateCotrollerTime > now) {
      return;
    }

    _onUpdateCotrollerTime = now + 500;
    final controller = _controller;
    if(controller == null) {
      debugPrint("Controller is null");
      return;
    }
    if(!controller.value.isInitialized) {
      debugPrint("Controller can not be initialized");
      return;
    }

    if(_duration == null) {
      _duration = _controller?.value.duration;
    }

    var duration = _duration;
    if(duration == null) return;

    var position = await controller.position;
    _position = position;

    final playing = controller.value.isPlaying;

    if(playing) {
      // handle progress indicator
      if(_disposed) return;
      setState(() {
        // 60 30 // 45/60 = 0.75(0, 1)
        _progress = position!.inMilliseconds.ceilToDouble() / duration.inMilliseconds.ceilToDouble();
      });
    }
    _isPlaying=playing;
  }

  _initializeVideo(int index) async {
    final controller = VideoPlayerController.network(videoInfo[index]["videoUrl"]);
    final old = _controller;
    _controller = controller;

    if( old != null) {
      old.removeListener(_onControllerUpdate);
      old.pause();
    }
    setState(() {
      
    });

    controller
      ..initialize().then((_) {
        old?.dispose();
        _isPlayingIndex = index;
        controller.addListener(_onControllerUpdate);
        controller.play();
        setState(() {
        
      });
    });

  }

  _onTapVideo(int index) {
    _initializeVideo(index);
    
  }

  _listView() {
    return ListView.builder(
      padding: EdgeInsets.symmetric(horizontal: 30, vertical: 8),
      itemCount: videoInfo.length,
      itemBuilder: (_, int index) {
        return GestureDetector(
          onTap: () {
            _onTapVideo(index);
            debugPrint(index.toString());
            setState(() {
              if(_playArea == false) {
                _playArea = true;
              }
            });
          },
          child: _buildCard(index,)
        );
      }
    );
  }
  
  _buildCard(int index) {
    return Container(
      height: 135,
      // color: Colors.redAccent,
      child: Column(
        children: [
          
          Row(//tarjeta de los videos
            children: [
              Container( // imagen de video
                width: 80,
                height: 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: NetworkImage(
                      videoInfo[index]["thumbnail"],

                    ), 
                    // AssetImage(
                    //   videoInfo[index]["thumbnail"],
                    // ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              SizedBox(width: 10,),

              Column( //Descripcion del video
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    videoInfo[index]["title"],
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 10,),
                  Padding(
                    padding: EdgeInsets.only(top: 3),
                    child: Text(
                      videoInfo[index]["time"],
                      style: TextStyle(
                        color: Colors.grey[500],
                      ),
                    ),
                  )
                ],
              ),
            ],
          ),
          SizedBox(height: 18,),
          Row(
            children: [
              Container( // tiempo restante del video
                width: 80,
                height: 20,
                decoration: BoxDecoration(
                  color: Color(0xFFeaeefc),
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Center(
                  child: Text(
                    '15s rest', style: TextStyle(
                      color: Color(0xFF839fed),
                    ),
                  ),
                ),
              ),
              Row(
                children: [
                  for(int i = 0; i<70; i++)
                  i.isEven?Container(
                    width: 3,
                    height: 1,
                    decoration: BoxDecoration(
                      color: Color(0xFF839fed),
                      borderRadius: BorderRadius.circular(2),
                    ),
                  ):Container(
                    width: 3,
                    height: 1,
                    color: Colors.white,
                  )
                ],
              )

            ],
          )
        ],
      ),
    );
  }
}