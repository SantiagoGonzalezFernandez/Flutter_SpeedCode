import 'package:dominos_pizza_ordering_app/pizza_cart.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';

void main(){
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> with TickerProviderStateMixin{

  TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(vsync: this, length: 4);
    super.initState();
  }

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
            color: Colors.black87,
            height: double.infinity,
            child: SingleChildScrollView(
              child: Column(
                children: <Widget>[
                  Material(
                    color: Color(0xfff42b51),
                    child: TabBar(
                      controller: _tabController,
                      unselectedLabelColor: Colors.deepOrange,
                      isScrollable: true,
                      indicator: BoxDecoration(
                        color: Color(0xfff42b51),
                      ),
                      tabs: <Widget>[
                        Tab(
                          text: "Popular Pizza",
                        ),
                        Tab(
                          text: "Popular Pizza",
                        ),
                        Tab(
                          text: "Popular Pizza",
                        ),
                        Tab(
                          text: "Popular Pizza",
                        )
                      ],
                    ),
                  ),
                  Pizza_card(image: 'assets/images/img1.jpg',),
                  Pizza_card(image: 'assets/images/img2.jpg'),
                  Pizza_card(image: 'assets/images/img3.png'),
                  Pizza_card(image: 'assets/images/pizza3.png'),
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
              Icons.shopping_cart,
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

class Pizza_card extends StatelessWidget {

  Pizza_card({
    this.image
  });

  final String image;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        GestureDetector(
          onTap: () => Navigator.push(context, MaterialPageRoute(builder: (_) => PizzaCart())),
          child: Container(
            margin: EdgeInsets.fromLTRB(10.0, 5.0, 20.0, 5.0),
            height: 170.0,
            width: double.infinity,
            decoration: BoxDecoration(
              color: Colors.black54,
              borderRadius: BorderRadius.circular(20.0)
            ),
            child: Padding(
              padding: const EdgeInsets.fromLTRB(
                160,
                10,
                10,
                20
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        width: 120.0,
                        child: Text(
                          'Pizza with ginger',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 20.0,
                            fontWeight: FontWeight.w600
                          ),
                          overflow: TextOverflow.ellipsis,
                          maxLines: 2,
                        ),
                      ),
                      Icon(FontAwesomeIcons.heart, color: Colors.white)
                    ],
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Text(
                    'Medium',
                    style: TextStyle(
                      color: Colors.white70
                    ),
                  ),
                  SizedBox(
                    height: 10.0,
                  ),
                  Row(
                    children: [
                      Container(
                        width: 70.0,
                        child: Text(
                          '24,90',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontSize: 18.0
                          ),
                        ),
                      ),
                      Container(
                        width: 90.0,
                        height: 30.0,
                        decoration: BoxDecoration(
                          color: Color(0xfff42b51),
                          borderRadius: BorderRadius.circular(30.0)
                        ),
                        alignment: Alignment.center,
                        child: Text(
                          'Order Now',
                          style: TextStyle(
                            fontSize: 12.0,
                            color: Colors.white,
                            fontWeight: FontWeight.bold
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
        Positioned(
          left: 10.0,
          top: 5.0,
          bottom: 12.0,
          child: ClipRRect(
            child: Image(
              width: 150.0,
              image: AssetImage(image),
              fit: BoxFit.cover,
            ),
          ),
        )
      ],
    );
  }
}