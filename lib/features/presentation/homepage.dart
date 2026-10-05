import 'package:delivery_traky/features/AppRoute.dart';
import 'package:flutter/material.dart';
import 'package:delivery_traky/features/widget/userLocation.dart';

class Homepage extends StatelessWidget {
  Homepage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(onPressed: () {}, icon: Icon(Icons.arrow_back_ios)),
        title: Row(
          children: [
            Container(
              height: 50,
              width: 50,
              child: Image.asset('assets/logo.png'),
            ),
            SizedBox(width: MediaQuery.of(context).size.width * 0.02),
            Column(
              children: [
                Text(
                  'Delivery Traky',
                  style: TextStyle(color: Color(0xff185061), fontSize: 18),
                ),
                Text(
                  'live Tracking',
                  style: TextStyle(color: Colors.black12, fontSize: 14),
                ),
              ],
            ),
          ],
        ),
        actions: [
          Icon(Icons.person_4_outlined, color: Color(0xff185061), size: 30),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          color: Color(0xffF7FBFC),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Column(
                      children: [
                        Text(
                          'Where should we deliver your order?',

                          maxLines: 3,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 25,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height * 0.01,
                        ),
                        Text(
                          "select where you'd like your order delivered",
                          maxLines: 2,
                          style: TextStyle(color: Colors.black38, fontSize: 18),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: MediaQuery.of(context).size.width * 0.01),
                  Container(
                    height: 150,
                    width: 120,
                    child: Image.asset('assets/imageHome.png'),
                  ),
                ],
              ),
              SizedBox(height: MediaQuery.of(context).size.height * 0.08),
              Container(
                height: 120,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,

                                decoration: BoxDecoration(
                                  color: Color(0xff185061),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.gps_fixed_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'Use my current location',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),
                          Container(
                            width: 170,
                            height: 20,
                            decoration: BoxDecoration(
                              color: Color(0xffE8F5F6),
                              borderRadius: BorderRadius.circular(20),
                            ),
                            child: Row(
                              children: [
                                Icon(
                                  Icons.av_timer_outlined,
                                  color: Color(0xff185061),
                                  size: 18,
                                ),
                                SizedBox(
                                  width:
                                      MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  '25-35 min delivery',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                    color: Color(0xff185061),
                                    fontSize: 14,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                      IconButton(
                        onPressed: () =>
                            handleLocation().handleCurrentLocation(context),
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff185061),
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: MediaQuery.of(context).size.height * 0.04),
              Container(
                height: 120,
                width: double.infinity,

                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16),
                  child: Row(
                    children: [
                      Column(
                        children: [
                          Row(
                            children: [
                              Container(
                                height: 40,
                                width: 40,

                                decoration: BoxDecoration(
                                  color: Color(0xff185061),
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Icon(
                                  Icons.search_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              SizedBox(
                                width: MediaQuery.of(context).size.width * 0.02,
                              ),
                              Text(
                                'choose anther address',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontSize: 18,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: MediaQuery.of(context).size.height * 0.02,
                          ),

                          Text(
                            'search for home, office or any place',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              color: Color(0xff185061),
                              fontSize: 14,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: MediaQuery.of(context).size.width * 0.06),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, Approute.searchPage);
                        },
                        icon: Icon(
                          Icons.arrow_forward_ios_rounded,
                          color: Color(0xff185061),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
