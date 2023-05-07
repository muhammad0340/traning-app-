import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:traning_app/vedio_info.dart';
import 'color.dart' as color;

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List info = [];
  _initData() {
    DefaultAssetBundle.of(context).loadString("json/info.json").then((value) {
      setState(() {
        info = json.decode(value);
      });
    });
  }

  @override
  void initState() {
    super.initState();
    _initData();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: color.AppColor.homePagebackground,
      body: Padding(
        padding: const EdgeInsets.only(top: 70.0, left: 30, right: 30),
        child: Container(
          // color: Colors.green,
          child: Column(
            children: [
              Row(
                children: [
                  Text(
                    "Traning",
                    style: TextStyle(
                        color: color.AppColor.homePageTitle,
                        fontSize: 30,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Icon(
                    Icons.arrow_back_ios,
                    size: 20,
                    color: color.AppColor.homePageIcon,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.calendar_today_outlined,
                    size: 20,
                    color: color.AppColor.homePageIcon,
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    size: 20,
                    color: color.AppColor.homePageIcon,
                  ),
                ],
              ),
              SizedBox(
                height: 30,
              ),
              Row(
                children: [
                  Text(
                    "Your Program",
                    style: TextStyle(
                        color: color.AppColor.homePageSubtitle,
                        fontSize: 20,
                        fontWeight: FontWeight.w700),
                  ),
                  Expanded(child: Container()),
                  Text(
                    "Details",
                    style: TextStyle(
                      color: color.AppColor.homePageDetail,
                      fontSize: 20,
                    ),
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  InkWell(
                    onTap: () {
                      Get.to(() => VedioInfo());
                    },
                    child: Icon(
                      Icons.arrow_forward,
                      size: 20,
                      color: color.AppColor.homePageIcon,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                height: 220,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    colors: [
                      color.AppColor.gradientFirst,
                      color.AppColor.gradientSecond,
                    ],
                    begin: Alignment.bottomLeft,
                    end: Alignment.centerRight,
                  ),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(10),
                    bottomLeft: Radius.circular(10),
                    bottomRight: Radius.circular(10),
                    topRight: Radius.circular(80),
                  ),
                  boxShadow: [
                    BoxShadow(
                      offset: Offset(5, 10),
                      blurRadius: 10,
                      color: color.AppColor.gradientSecond.withOpacity(0.2),
                    ),
                  ],
                ),
                child: Padding(
                  padding: const EdgeInsets.only(
                    left: 20.0,
                    top: 25,
                    right: 20,
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Next WorkOut",
                        style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontSize: 16),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "Legs Toning",
                        style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 5,
                      ),
                      Text(
                        "and Glutes WorkOut",
                        style: TextStyle(
                            color: color.AppColor.homePageContainerTextSmall,
                            fontSize: 25),
                      ),
                      SizedBox(
                        height: 25,
                      ),
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.timer,
                                size: 20,
                                color:
                                    color.AppColor.homePageContainerTextSmall,
                              ),
                              SizedBox(
                                width: 10,
                              ),
                              Text(
                                "60 min",
                                style: TextStyle(
                                  fontSize: 14,
                                  color:
                                      color.AppColor.homePageContainerTextSmall,
                                ),
                              ),
                            ],
                          ),
                          Expanded(child: Container()),
                          Icon(
                            Icons.play_circle_fill,
                            size: 60,
                            color: Colors.white,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 5,
              ),
              Container(
                // color: Colors.red,
                height: 180,
                width: MediaQuery.of(context).size.width,
                child: Stack(
                  children: [
                    Container(
                      margin: const EdgeInsets.only(top: 30),
                      width: MediaQuery.of(context).size.width,
                      height: 120,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: Colors.blue,
                          image: DecorationImage(
                            image: AssetImage("assets/card.jpg"),
                            fit: BoxFit.fill,
                          ),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40,
                              offset: Offset(8, 10),
                              color: color.AppColor.gradientSecond
                                  .withOpacity(0.3),
                            )
                          ]),
                    ),
                    Container(
                      height: 200,
                      width: MediaQuery.of(context).size.width,
                      margin: EdgeInsets.only(right: 200, bottom: 30),
                      decoration: BoxDecoration(
                        //  color: Colors.blue.withOpacity(0.6),
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage("assets/figure.png"),
                          // fit: BoxFit.fill,
                        ),
                      ),
                    ),
                    Container(
                      width: double.maxFinite,
                      height: 100,
                      //color: Colors.black.withOpacity(0.3),
                      margin: EdgeInsets.only(left: 150, top: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "You are doing great",
                            style: TextStyle(
                              color: color.AppColor.homePageDetail,
                              fontWeight: FontWeight.bold,
                              fontSize: 18,
                            ),
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          RichText(
                            text: TextSpan(
                                text: "Keep it up\n",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: color.AppColor.homePagePlanColor,
                                ),
                                children: [
                                  TextSpan(text: "stick to your plan"),
                                ]),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Row(
                children: [
                  Text(
                    "Area of focus",
                    style: TextStyle(
                      color: color.AppColor.homePageTitle,
                      fontSize: 25,
                      fontWeight: FontWeight.w500,
                    ),
                  )
                ],
              ),
              Expanded(
                child: OverflowBox(
                  maxWidth: MediaQuery.of(context).size.width,
                  child: ListView.builder(
                      itemCount: (info.length.toDouble() / 2).toInt(),
                      itemBuilder: (_, i) {
                        int a = 2 * i;
                        int b = 2 * i + 1;
                        return Row(
                          children: [
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin: EdgeInsets.only(left: 30, bottom: 30),
                              padding: EdgeInsets.only(bottom: 5),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  // "Glues",
                                  info[a]['title'],
                                  style: TextStyle(
                                    color: color.AppColor.homePageDetail,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(info[a]['img']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 170,
                              width:
                                  (MediaQuery.of(context).size.width - 90) / 2,
                              margin: EdgeInsets.only(left: 30, bottom: 30),
                              padding: EdgeInsets.only(bottom: 5),
                              child: Align(
                                alignment: Alignment.bottomCenter,
                                child: Text(
                                  // "Glues",
                                  info[b]['title'],
                                  style: TextStyle(
                                    color: color.AppColor.homePageDetail,
                                    fontSize: 20,
                                  ),
                                ),
                              ),
                              decoration: BoxDecoration(
                                color: Colors.white,
                                image: DecorationImage(
                                  image: AssetImage(info[b]['img']),
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(5, 5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                  BoxShadow(
                                    blurRadius: 3,
                                    offset: Offset(-5, -5),
                                    color: color.AppColor.gradientSecond
                                        .withOpacity(0.1),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        );
                      }),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
