import 'package:flutter/material.dart';
class StartupPage extends StatefulWidget {
  const StartupPage({Key? key}) : super(key: key);

  @override
  State<StartupPage> createState() => _StartupPageState();
}

class _StartupPageState extends State<StartupPage> {
  @override
  Widget build(BuildContext context) {
    double _w = MediaQuery.of(context).size.width;
    double _h = MediaQuery.of(context).size.height;
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [

            Image.asset('assets/startups_banner.jpg'),

            Padding(
              padding: EdgeInsets.only(top: _h/30),
              child: Text(
                'Definition',
                  style: TextStyle(
                    fontSize: 30,
                    color: Colors.blue,
                    fontWeight: FontWeight.bold,
                  )

              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: _h/70),
              child: Text(
                'Startup',
                style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                )
              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:_h/80 ,bottom:_h/300 ,left:_w/30 ,right:_w/50 ),
              child: Text(
                'Startup is an entity that develops a business model based on some innovation and makes it scalable for achieving commercial success. The turnover of the entity for any of the financial years since incorporation/ registration should not exceed one hundred crore rupees.',
             textAlign:TextAlign.left,
              style: TextStyle(
              fontSize: 15,
              fontFamily: 'Roboto',
              color: Colors.black54,
              fontWeight: FontWeight.normal,
                )
              ),
            ),
            divider(),

           Padding(
             padding: EdgeInsets.only(top:_h/80),
             child: Text(
               'Women Entrepreneur',
                 textAlign:TextAlign.left,
                 style: TextStyle(
                   fontSize: 18,
                   color: Colors.black,
                   fontWeight: FontWeight.bold,
                 )

             ),
           ),

            Padding(
              padding: EdgeInsets.only(top:_h/80 ,bottom:_h/300 ,left:_w/30 ,right:_w/20 ),
              child: Text(
                'The Government of India (GOI2006) has defined Women entrepreneur as “an enterprise owned and controlled by women having a minimum financial interest of 51% of capital and giving at least 51% of employment generated in the enterprise for women”.',
                  textAlign:TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  )
              ),
            ),
            divider(),

            Padding(
              padding: EdgeInsets.only(top:_h/80),
              child: Text(
                  'Grassroot Innovations',
                  textAlign:TextAlign.left,
                  style: TextStyle(
                    fontSize: 18,
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  )

              ),
            ),

            Padding(
              padding: EdgeInsets.only(top:_h/80 ,bottom:_h/300 ,left:_w/30 ,right:_w/20 ),
              child: Text(
                  'Grassroot Innovations can be understood as products and processes that have been developed in response to challenges and opportunities in a local context. These grassroots innovations often have the potential to be turned into entrepreneurial ventures and generate a livelihood for the innovator as well as others in the community.',
                  textAlign:TextAlign.left,
                  style: TextStyle(
                    fontSize: 15,
                    fontFamily: 'Roboto',
                    color: Colors.black54,
                    fontWeight: FontWeight.normal,
                  )
              ),
            ),


          ],
        ),
      ),
    );
  }



  Widget divider() {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        height: 2,
        width: MediaQuery.of(context).size.width,
        color: Colors.blueGrey,
      ),
    );
  }
}
