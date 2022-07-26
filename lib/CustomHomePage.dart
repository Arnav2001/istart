import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:ui';
import 'package:slimy_card/slimy_card.dart';
class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late Animation<double> _animation2;
  late AnimationController _controller2;
  late Animation<double> _nav_animation1;
  late Animation<double> _nav_animation2;
  late Animation<double> _nav_animation3;
  late bool _bool = true;
  @override
  void initState() {
    super.initState();
    _controller2 =
        AnimationController(vsync: this, duration: Duration(milliseconds: 600));

     _nav_animation1 = Tween<double>(begin: 0, end: 20).animate(CurvedAnimation(
      parent: _controller2,
      curve: Curves.easeOut,
      reverseCurve: Curves.easeIn,
    ))
      ..addListener(() {
        setState(() {});
      })
      ..addStatusListener((status) {
        if (status == AnimationStatus.dismissed) {
          _bool = true;
        }
      });
    _nav_animation2 = Tween<double>(begin: 0, end: .3).animate(_controller2)
      ..addListener(() {
        setState(() {});
      });
    _nav_animation3 = Tween<double>(begin: .9, end: 1).animate(CurvedAnimation(
        parent: _controller2,
        curve: Curves.fastLinearToSlowEaseIn,
        reverseCurve: Curves.ease))
      ..addListener(() {
        setState(() {});
      });
    _controller = AnimationController(
      vsync: this,
      duration: Duration(seconds: 1),
    );

    _animation = Tween<double>(begin: 0, end: 1)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut))
      ..addListener(() {
        setState(() {});
      });

    _animation2 = Tween<double>(begin: -30, end: 0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeOut));

    _controller.forward();
    _controller.forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _controller.dispose();
    _controller2.dispose();
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Colors.white,
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        brightness: Brightness.dark,
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(Icons.menu_rounded),
          splashColor: Colors.transparent,
          color: Colors.black,
          onPressed: () {
            if (_bool == true) {
              _controller2.forward();
            } else {
              _controller2.reverse();
            }
            _bool = false;
          },
        ),
      ),
      body: Stack(
        children: [
          ListView(
            physics:
            BouncingScrollPhysics(parent: AlwaysScrollableScrollPhysics()),
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(_w / 17, _w / 20, 0, _w / 10),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 100,
                      height: 100,

                      decoration: BoxDecoration(
                          image: DecorationImage(
                              fit: BoxFit.fill,
                              image: AssetImage("assets/main_logo.png"))
                      ),
                    ),
                    SizedBox(height: _w/20,),
                    Padding(
                      padding: EdgeInsets.only(right: _w/10),
                      child: Text(
                        'It is the flagship program by the Department of Information Technology & Communication, Government of Rajasthan to foster innovation, create jobs and facilitate investment in the State.',

                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,

                        ),
                        textAlign: TextAlign.start,
                      ),
                    ),

                    Padding(
                      padding: EdgeInsets.only(right: _w/10,top: _w/10),
                      child: Text(
                        'Additional Services That Will Grow Your Business',


                        style:TextStyle(
                          fontSize: 18,
                          color: Colors.black.withOpacity(.5),
                          fontWeight: FontWeight.w500,

                        ),
                        textAlign: TextAlign.center,
                       )

                    )
                  ],
                ),
              ),


            Padding(
              padding: EdgeInsets.only(bottom: _w / 17),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  homePageCard(
                    'assets/start-up.png',
                    'Startup',
                    context,
                    RouteWhereYouGo(),
                  ),
                  homePageCard(
                    'assets/rural_startup.png',
                    'Rural Startup',
                    context,
                    RouteWhereYouGo(),
                  ),
                ],
              ),
            ),
              Padding(
                padding: EdgeInsets.only(bottom: _w / 17),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    homePageCard(
                      'assets/challenges.png',
                      'Challenges',
                      context,
                      RouteWhereYouGo(),
                    ),
                    homePageCard(
                      'assets/school_startup.png',
                      'School Startup',
                      context,
                      RouteWhereYouGo(),
                    ),
                  ],
                ),
              ),



              SizedBox(height: _w / 20),

              Padding(
                   padding: EdgeInsets.only(top: _w/12,bottom: _w/10),
                   child: Text(
                              'We have achieved some great for experiences',
                     style:TextStyle(
                       fontSize: 17,
                       color: Colors.black.withOpacity(.5),
                       fontWeight: FontWeight.w500,

                     ),
                     textAlign: TextAlign.center,
                   )
              ),

              Padding(
                padding: EdgeInsets.only(left: _w/15,right: _w/15),
                child: SlimyCard(
                  width: _w,
                  color: Colors.orange,
                  topCardHeight: 150,
                  bottomCardHeight: 300,
                  topCardWidget: topCardWidget('Startups','assets/start_up.png',context),
                  bottomCardWidget: bottomCardWidget(context, 'Startups', 'Rural Startup', 'Total Visitors','1749','348','1,529,360'),
                ),
              ),
              SizedBox(height: _w / 20),
              Padding(
                padding: EdgeInsets.only(left: _w/15,right: _w/15),
                child: SlimyCard(
                  width: _w,
                  color: Colors.blueAccent,
                  topCardHeight: 150,
                  bottomCardHeight: 300,
                  topCardWidget: topCardWidget('Beneficiaries','assets/beneficiary.png',context),
                  bottomCardWidget: bottomCardWidget(context, 'Total Jobs', 'Total Investment', 'Total Challenges','20,451','185 Cr','34'),
                ),
              ),
              SizedBox(height: _w / 20),
              Padding(
                padding: EdgeInsets.only(left: _w/15,right: _w/15),
                child: SlimyCard(
                  width: _w,
                  color: Colors.amber,
                  topCardHeight: 150,
                  bottomCardHeight: 300,
                  topCardWidget: topCardWidget('School Startups','assets/School_Startup.png',context),
                  bottomCardWidget: bottomCardWidget(context, 'Total Schools', 'Total Students', 'Total Teachers','1,714','29,333','612'),
                ),
              ),
              SizedBox(height: _w / 20),
              Padding(
                padding: EdgeInsets.only(left: _w/15,right: _w/15),
                child: SlimyCard(
                  width: _w,
                  color: Colors.redAccent,
                  topCardHeight: 150,
                  bottomCardHeight: 300,
                  topCardWidget: topCardWidget('Others','assets/more.png',context),
                  bottomCardWidget: bottomCardWidget(context, 'Events', 'Virtual Sessions', 'Total Mentors','213','17','10'),
                ),
              ),
              SizedBox(height: _w / 20),
            ],
          ),

          /// SETTING ICON
          Padding(
            padding: EdgeInsets.fromLTRB(0, _w / 9.5, _w / 15, 0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                InkWell(
                  highlightColor: Colors.transparent,
                  splashColor: Colors.transparent,
                  onTap: () {
                    HapticFeedback.lightImpact();
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) {
                          return RouteWhereYouGo();
                        },
                      ),
                    );
                  },
                  child: ClipRRect(
                    borderRadius: BorderRadius.all(Radius.circular(99)),
                    child: BackdropFilter(
                      filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
                      child: Container(
                        height: _w / 8.5,
                        width: _w / 8.5,
                        decoration: BoxDecoration(
                          color: Colors.black.withOpacity(.05),
                          shape: BoxShape.circle,
                        ),
                        child: Center(
                          child: Icon(
                            Icons.settings,
                            size: _w / 17,
                            color: Colors.black.withOpacity(.6),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // Blur the Status bar
          blurTheStatusBar(context),
          CustomNavigationDrawer(),
        ],
      ),
    );
  }

  Widget homePageCard( String imgPath, String title,
      BuildContext context, Widget route) {
    double _w = MediaQuery.of(context).size.width;
    return Opacity(
      opacity: _animation.value,
      child: Transform.translate(
        offset: Offset(0, _animation2.value),
        child: InkWell(
          highlightColor: Colors.transparent,
          splashColor: Colors.transparent,
          onTap: () {
            HapticFeedback.lightImpact();
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) {
                  return route;
                },
              ),
            );
          },
          child: Container(
            padding: EdgeInsets.all(15),
            height: _w / 2,
            width: _w / 2.4,
            decoration: BoxDecoration(
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Color(0xff040039).withOpacity(.15),
                  blurRadius: 99,
                ),
              ],
              borderRadius: BorderRadius.all(
                Radius.circular(25),
              ),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                SizedBox(),
                Container(
                  height: _w / 8,
                  width: _w / 8,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                  ),
                  child: Image(image: AssetImage(imgPath)),
                ),
                Text(
                  title,
                  maxLines: 4,
                  softWrap: true,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black.withOpacity(.5),
                    fontWeight: FontWeight.w700,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget blurTheStatusBar(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    return ClipRRect(
      child: BackdropFilter(
        filter: ImageFilter.blur(sigmaY: 5, sigmaX: 5),
        child: Container(
          height: _w / 18,
          color: Colors.transparent,
        ),
      ),
    );
  }

  Widget CustomNavigationDrawer() {
    double _height = MediaQuery.of(context).size.height;
    double _width = MediaQuery.of(context).size.width;
    return BackdropFilter(
      filter: ImageFilter.blur(
          sigmaY: _nav_animation1.value, sigmaX: _nav_animation1.value),
      child: Container(
        height: _bool ? 0 : _height,
        width: _bool ? 0 : _width,
        color: Colors.transparent,
        child: Center(
          child: Transform.scale(
            scale: _nav_animation3.value,
            child: Container(
              width: _width * .9,
              height: _width * 1.3,
              decoration: BoxDecoration(
                color: Colors.blue.withOpacity(0.5),
                borderRadius: BorderRadius.circular(30),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                    backgroundColor: Colors.black12,
                    radius: 35,
                    child: Icon(
                      Icons.person_outline_rounded,
                      size: 30,
                      color: Colors.white,
                    ),
                  ),
                  Column(
                    children: [
                      MyTile(Icons.settings_outlined, 'Settings', () {
                        HapticFeedback.lightImpact();

                      }),
                      MyTile(Icons.info_outline_rounded, 'About', () {
                        HapticFeedback.lightImpact();

                      }),
                      MyTile(Icons.feedback_outlined, 'Feedback', () {
                        HapticFeedback.lightImpact();

                      }),
                      MyTile(Icons.find_in_page_outlined, 'Privacy Policy', () {
                        HapticFeedback.lightImpact();

                      }),
                    ],
                  ),
                  SizedBox(),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }


  Widget MyTile(
      IconData icon,
      String title,
      VoidCallback voidCallback,
      ) {
    return Column(
      children: [
        ListTile(
          tileColor: Colors.black.withOpacity(.08),
          leading: CircleAvatar(
            backgroundColor: Colors.black12,
            child: Icon(
              icon,
              color: Colors.white,
            ),
          ),
          onTap: voidCallback,
          title: Text(
            title,
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 1),
          ),
          trailing: Icon(
            Icons.arrow_right,
            color: Colors.white,
          ),
        ),
        divider()
      ],
    );
  }

  Widget divider() {
    return Container(
      height: 5,
      width: MediaQuery.of(context).size.width,
    );
  }
}

class RouteWhereYouGo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        brightness: Brightness.light,
        backgroundColor: Colors.white,
        elevation: 50,
        centerTitle: true,
        shadowColor: Colors.black.withOpacity(.5),
        title: Text(
          'EXAMPLE  PAGE',
          style: TextStyle(
              color: Colors.black.withOpacity(.7),
              fontWeight: FontWeight.w600,
              letterSpacing: 1),
        ),
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back,
            color: Colors.black.withOpacity(.8),
          ),
          onPressed: () => Navigator.maybePop(context),
        ),
      ),
    );
  }
}
Widget topCardWidget(String text,String image,BuildContext context){
  return
      Text(
        text,
        maxLines: 4,
        softWrap: true,
        overflow: TextOverflow.ellipsis,
        style: TextStyle(
          fontSize: 18,
          color: Colors.white,
          fontWeight: FontWeight.w700,
        ),
        textAlign: TextAlign.center,
  );
}
Widget bottomCardWidget(BuildContext context,String s1,String s2,String s3,String v1,String v2,String v3){
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  child: Text(v1,
                    textAlign: TextAlign.center,
                    style: TextStyle(fontSize: 16),),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(s1,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          ),
          SizedBox(
            width: 20,
          ),
          Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  alignment: Alignment.center,
                  width: 70,
                  height: 70,
                  child: Text(v2,
                    style: TextStyle(fontSize: 16),),
                  decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.white
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(s2,
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.bold
                  ),),
              ),
            ],
          )
        ],
      ),
      SizedBox(
        height: 20,
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Container(
          alignment: Alignment.center,
          width: 70,
          height: 70,
          child: Text(v3,
            textAlign: TextAlign.center,
            style: TextStyle(fontSize: 16),),
          decoration: BoxDecoration(
              shape: BoxShape.circle,
              color: Colors.white
          ),
        ),
      ),
      Padding(
        padding: const EdgeInsets.all(8.0),
        child: Text(s3,
          style: TextStyle(
              color: Colors.white,
              fontWeight: FontWeight.bold
          ),),
      ),
    ],
  );

}
