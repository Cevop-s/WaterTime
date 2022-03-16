import 'package:flutter/material.dart';
import 'package:percent_indicator/percent_indicator.dart';
import 'package:wave/config.dart';
import 'package:wave/wave.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';

import '../api/notification.dart';

late BannerAd _bannerAd;
bool _isBannerAdReady = false;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  NotificationApi noti = new NotificationApi();

  @override
  void initState() {
    MobileAds.instance.initialize();
    _bannerAd = BannerAd(
      adUnitId: "ca-app-pub-3940256099942544/6300978111",
      request: AdRequest(),
      size: AdSize.banner,
      listener: BannerAdListener(
        onAdLoaded: (_) {
          setState(() {
            _isBannerAdReady = true;
          });
        },
        onAdFailedToLoad: (ad, err) {
          print('Failed to load a banner ad: ${err.message}');
          _isBannerAdReady = false;
          ad.dispose();
        },
      ),
    );

    _bannerAd.load();
    super.initState();
  }

  @override
  void dispose() {
    // TODO: Dispose a BannerAd object
    _bannerAd.dispose();

    super.dispose();
  }

  double waterLevel = 100;
  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () => noti.sendNotification(
            body: "Hello man how are you",
            title: "Siros",
            schedualeDate: DateTime.now().add(Duration(seconds: 10))),
      ),
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          height: mediaQuery.size.height,
          width: mediaQuery.size.width,
          child: Stack(
            children: [
              Positioned(
                bottom: 0,
                child: Container(
                  width: mediaQuery.size.width,
                  height: waterLevel,
                  color: Colors.white,
                  child: WaveWidget(
                    //user Stack() widget to overlap content and waves
                    config: CustomConfig(
                      colors: [
                        Color.fromRGBO(71, 187, 234, 0.6),
                        Color.fromRGBO(71, 187, 234, 0.7),
                        Color.fromRGBO(71, 187, 234, 1),
                        //the more colors here, the more wave will be
                      ],
                      durations: [4000, 5000, 7000],
                      //durations of animations for each colors,
                      // make numbers equal to numbers of colors
                      heightPercentages: [0.001, 0.005, 0.003],
                      //height percentage for each colors.
                      blur: MaskFilter.blur(BlurStyle.solid, 2),
                      //blur intensity for waves
                    ),
                    waveAmplitude: 3.00, //depth of curves
                    waveFrequency: 3, //number of curves in waves
                    backgroundColor: Colors.white, //background colors
                    size: Size(
                      mediaQuery.size.width,
                      mediaQuery.size.height,
                    ),
                  ),
                ),
              ),
              Positioned(
                bottom: mediaQuery.size.height * .27,
                right: 0,
                left: 0,
                child: Container(
                  child: Column(
                    children: [
                      Text(
                        "1,470 ml",
                        style: waterLevel >= 240
                            ? GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: mediaQuery.size.width * .09,
                                color: Colors.white,
                              )
                            : GoogleFonts.roboto(
                                fontWeight: FontWeight.bold,
                                fontSize: mediaQuery.size.width * .09),
                      ),
                      Text(
                        "900 ml Remaining",
                        style: waterLevel > 180
                            ? GoogleFonts.roboto(
                                fontSize: mediaQuery.size.width * .027,
                                color: Colors.white,
                              )
                            : GoogleFonts.roboto(
                                fontSize: mediaQuery.size.width * .027,
                              ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned.fill(
                child: CircularPercentIndicator(
                  radius: mediaQuery.size.width * .17,
                  lineWidth: 7.0,
                  backgroundColor: Colors.white,
                  rotateLinearGradient: true,
                  linearGradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      Color.fromARGB(255, 202, 245, 253),
                      waterLevel >= 300
                          ? Color.fromRGBO(71, 187, 234, 1)
                          : Color.fromARGB(255, 148, 225, 255),
                      waterLevel >= 400
                          ? Color.fromARGB(255, 54, 129, 158)
                          : Color.fromRGBO(30, 108, 140, 1),
                    ],
                  ),
                  animationDuration: 650,
                  animation: true,
                  percent: .8,
                  center: new Text(
                    "100%",
                    style: new TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.size.width * .06,
                        color: waterLevel >= 350 ? Colors.white : Colors.black),
                  ),
                  circularStrokeCap: CircularStrokeCap.round,
                ),
              ),
              Positioned.fill(
                top: mediaQuery.size.height * .2,
                child: Align(
                  alignment: Alignment.topCenter,
                  //dragtarget
                  child: Container(
                    width: mediaQuery.size.width * .8,
                    height: mediaQuery.size.height * 0.09,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(15),
                      color: Colors.white,
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey, //New
                          blurRadius: 20.0,
                          offset: Offset(0, 5),
                        )
                      ],
                    ),
                    child: Row(
                      children: [],
                    ),
                  ),
                ),
              ),
              Positioned.fill(
                top: mediaQuery.size.height * .03,
                child: _isBannerAdReady
                    ? Align(
                        alignment: Alignment.topCenter,
                        child: Container(
                          width: mediaQuery.size.width * .8,
                          height: mediaQuery.size.height * 0.09,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.grey,
                          ),
                          child: AdWidget(
                            ad: _bannerAd,
                          ),
                        ),
                      )
                    : Container(),
              )
            ],
          ),
        ),
      ),
    );
  }
}
