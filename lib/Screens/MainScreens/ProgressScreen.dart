import 'package:flutter/material.dart';
import 'package:scrollable_positioned_list/scrollable_positioned_list.dart';
import 'package:water_time_mobile_app/model/Date.dart';
import 'package:water_time_mobile_app/Constants/constants.dart';
import 'package:intl/intl.dart';
import 'package:percent_indicator/percent_indicator.dart';

class ProgressPage extends StatefulWidget {
  const ProgressPage({Key? key}) : super(key: key);

  @override
  State<ProgressPage> createState() => _ProgressPageState();
}

class _ProgressPageState extends State<ProgressPage> {
  final ItemScrollController itemScrollController = ItemScrollController();
  final ItemPositionsListener itemPositionsListener =
      ItemPositionsListener.create();
  Date date = Date();

  @override
  void initState() {
    date.GetDates();

    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var mediaQuery = MediaQuery.of(context);
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Container(
          width: mediaQuery.size.width,
          height: mediaQuery.size.height,
          child: Column(
            children: [
              SizedBox(
                height: mediaQuery.size.height * .02,
              ),
              Center(
                child: Text(
                  "${months[date.Month]}, ${date.Year}",
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * .02,
              ),
              Container(
                margin: EdgeInsets.symmetric(horizontal: 15),
                height: mediaQuery.size.height * .14,
                width: mediaQuery.size.width * .95,
                child: ScrollablePositionedList.builder(
                  scrollDirection: Axis.horizontal,
                  itemCount: date.Days.length,
                  itemBuilder: (context, index) {
                    DateTime now = DateTime.now();
                    late DateTime lastDayOfMonth;
                    lastDayOfMonth = DateTime(now.year, now.month + 1, 0);
                    final currentDate =
                        lastDayOfMonth.add(Duration(days: index + 1));

                    final dateName = DateFormat('E').format(currentDate);
                    return GestureDetector(
                      onTap: (() {
                        setState(() {
                          date.SelectedDay = index + 1;
                        });
                      }),
                      child: Container(
                        margin: EdgeInsets.symmetric(horizontal: 7),
                        height: mediaQuery.size.height * .1,
                        width: mediaQuery.size.width * .14,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(50),
                          color: date.SelectedDay != date.Days[index]
                              ? Color.fromARGB(255, 255, 255, 255)
                              : Color.fromRGBO(35, 152, 201, 1),
                        ),
                        child: Stack(
                          children: [
                            Positioned(
                              left: 0,
                              right: 0,
                              top: mediaQuery.size.height * 0.2 * 0.04,
                              child: Container(
                                margin: EdgeInsets.only(top: 3, bottom: 3),
                                child: Container(
                                  decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    color: Colors.amber,
                                    boxShadow: [
                                      BoxShadow(
                                          blurRadius: date.SelectedDay !=
                                                  date.Days[index]
                                              ? 5
                                              : 0,
                                          color: Color.fromARGB(
                                              255, 211, 211, 211),
                                          spreadRadius: 0)
                                    ],
                                  ),
                                  child: CircleAvatar(
                                    radius: mediaQuery.size.height * 0.2 * 0.15,
                                    backgroundColor: Colors.white,
                                    child: Container(
                                      margin: EdgeInsets.all(5),
                                      child: FittedBox(
                                        fit: BoxFit.fill,
                                        child: Text(
                                          date.Days[index].toString(),
                                          textAlign: TextAlign.center,
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontSize: mediaQuery.size.height *
                                                  0.2 *
                                                  0.8 *
                                                  0.15,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            Positioned(
                              bottom: mediaQuery.size.height * 0.2 * 0.15,
                              left: 0,
                              right: 0,
                              child: Center(
                                child: Container(
                                  child: Text(
                                    dateName,
                                    style: TextStyle(
                                      overflow: TextOverflow.fade,
                                      fontWeight: FontWeight.bold,
                                      fontSize:
                                          mediaQuery.size.height * 0.2 * 0.1,
                                      color: date.SelectedDay !=
                                              date.Days[index]
                                          ? Color.fromARGB(255, 87, 87, 87)
                                          : Color.fromARGB(255, 255, 255, 255),
                                    ),
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                  itemScrollController: itemScrollController,
                  itemPositionsListener: itemPositionsListener,
                  initialScrollIndex: date.SelectedDay,
                ),
              ),
              SizedBox(
                height: mediaQuery.size.height * .04,
              ),
              CircularPercentIndicator(
                radius: mediaQuery.size.height * .155,
                lineWidth: 11.0,
                backgroundColor: Colors.white,
                rotateLinearGradient: true,
                linearGradient: LinearGradient(
                  begin: Alignment.topCenter,
                  end: Alignment.bottomCenter,
                  colors: [
                    Color.fromARGB(255, 202, 245, 253),
                    Color.fromRGBO(71, 187, 234, 1),
                    Color.fromARGB(255, 54, 129, 158)
                  ],
                ),
                animationDuration: 650,
                animation: true,
                percent: .8,
                center: Column(
                  children: [
                    SizedBox(
                      height: mediaQuery.size.height * .095,
                    ),
                    Text(
                      "100%",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: mediaQuery.size.width * .095,
                        color: Color.fromARGB(255, 14, 117, 161),
                      ),
                    ),
                    Text(
                      "1478 ml",
                      style: TextStyle(
                        fontSize: mediaQuery.size.width * .045,
                        color: Color.fromRGBO(35, 152, 201, 1),
                      ),
                    ),
                    Text(
                      "-400",
                      style: TextStyle(
                        fontSize: mediaQuery.size.width * .035,
                        color: Color.fromARGB(255, 98, 161, 189),
                      ),
                    ),
                  ],
                ),
                circularStrokeCap: CircularStrokeCap.round,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
