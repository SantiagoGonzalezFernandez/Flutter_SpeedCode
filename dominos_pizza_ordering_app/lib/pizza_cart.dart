import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class PizzaCart extends StatefulWidget {
  @override
  _PizzaCartState createState() => _PizzaCartState();
}

class _PizzaCartState extends State<PizzaCart> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          elevation: 0.0,
          leading: Icon(Icons.arrow_back_ios),
          title: Text(
            'PIZZAS',
            style: TextStyle(color: Colors.white),
          ),
          actions: [
            IconButton(
              onPressed: (){},
              icon: Icon(Icons.menu),
            )
          ],
          backgroundColor: Color(0xfff42b51),
        ),
        body: SafeArea(
          child: Container(
            height: double.infinity,
            color: Colors.black87,
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Cart(),
                  Padding(
                    padding: const EdgeInsets.only(left: 20.0, top: 10.0),
                    child: Text(
                      'Selected Sized',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 20.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Size(
                        title: 'Small',
                        quantity: '-6,90',
                        iconColor: Colors.grey,
                        icons: FontAwesomeIcons.user,
                      ),
                      Size(
                        title: 'Medium',
                        quantity: '____',
                        iconColor: Colors.white,
                        icons: Icons.supervisor_account,
                        color: Color(0xfff42b51),
                      ),
                      Size(
                        title: 'Large',
                        quantity: '+6,90',
                        iconColor: Colors.grey,
                        icons: FontAwesomeIcons.users,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 100.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              border: Border.all(
                                color: Colors.blue,
                                width: 3.0
                              ),
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage('assets/images/pizza3.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Positioned(
                            left: 70.0,
                            child: Container(
                              height: 40.0,
                              width: 40.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                color: Colors.blue
                              ),
                              child: Icon(
                                Icons.check,
                                color: Colors.white,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70.0,
                            left: 10.0,
                            child: Text(
                              'Classic Edge',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          )
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 100.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage('assets/images/img2.jpg'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70.0,
                            left: 10.0,
                            child: Text(
                              'Classic Edge',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                      Stack(
                        children: [
                          Container(
                            height: 100.0,
                            width: 110.0,
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              image: DecorationImage(
                                image: AssetImage('assets/images/img3.png'),
                                fit: BoxFit.cover
                              ),
                            ),
                          ),
                          Positioned(
                            top: 70.0,
                            left: 10.0,
                            child: Text(
                              'Classic Edge',
                              style: TextStyle(
                                color: Colors.white,
                                fontWeight: FontWeight.bold
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          color: Colors.blueAccent,
          backgroundColor: Color(0x000000),
          buttonBackgroundColor: Colors.green[400],
          height: 70.0,
          items: [
            Icon(
              Icons.home,
              size: 30.0,
              color: Colors.white,
            ),
            Icon(
              Icons.check,
              size: 30.0,
              color: Colors.white,
            ),
            Icon(
              Icons.location_on,
              size: 30.0,
              color: Colors.white,
            ),
          ],
        ),
      ),
    );
  }
}

class Size extends StatelessWidget {
  
  Size({
    this.title,
    this.quantity,
    this.icons,
    this.color,
    this.iconColor
  });

  final String title;
  final String quantity;
  final IconData icons;
  final Color color;
  final Color iconColor;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
          height: 110.0,
          width: 110.0,
          decoration: BoxDecoration(
            color: color,
            borderRadius: BorderRadius.circular(10.0)
          ),
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Icon(
                  icons,
                  color: iconColor,
                  size: 40.0,
                ),
                SizedBox(
                  height: 10.0,
                ),
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                ),
                Text(
                  quantity,
                  style: TextStyle(
                    fontWeight: FontWeight.w600,
                    fontSize: 15.0,
                    color: Colors.white
                  ),
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}

class Cart extends StatelessWidget {


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Stack(
          children: [
            Container(
              color: Color(0xfff42b51),
              height: 100.0,
            ),
            Container(
              margin: EdgeInsets.fromLTRB(20.0, 5.0, 20.0, 5.0),
              height: 305.0,
              width: double.infinity,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20.0)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  ClipRRect(
                    child: Image(
                      width: 420.0,
                      image: AssetImage('assets/images/img1.jpg'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 8.0),
                    child: Center(
                      child: Text(
                        'ITALIANO PIZZA',
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: 20.0
                        ),
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(
                        Icons.arrow_back_ios,
                        color: Colors.grey,
                      ),
                      Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.grey,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 100.0, right: 20.0),
                    child: Row(
                      children: [
                        Icon(
                          FontAwesomeIcons.minusCircle,
                          color: Color(0xfff42b51),
                          size: 40.0,
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Text(
                          '2',
                          style: TextStyle(
                            fontSize: 20.0
                          ),
                        ),
                        SizedBox(
                          width: 15.0,
                        ),
                        Icon(
                          FontAwesomeIcons.plusCircle,
                          color: Color(0xfff42b51),
                          size: 40.0,
                        ),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ],
        )
      ],
    );
  }
}