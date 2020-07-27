import 'package:flutter/material.dart';
 
void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Material App',
      theme: ThemeData(
        primarySwatch: Colors.blue
      ),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  Offset _offset = Offset(0, 0);
  GlobalKey globalKey = GlobalKey();
  List<double> limits = [];

  bool isMenuOpen = false;

  @override
  void initState() {
    limits = [0, 0, 0, 0, 0, 0];
    WidgetsBinding.instance.addPostFrameCallback(getPosition);
    super.initState();
  }

  getPosition(duration){
    RenderBox renderBox = globalKey.currentContext.findRenderObject();
    final position = renderBox.localToGlobal(Offset.zero);
    double start = position.dy - 20;
    double contLimit = position.dy + renderBox.size.height - 20;
    double step = (contLimit - start) / 5;
    limits = [];
    for(double x = start; x <= contLimit; x = x + step){
      limits.add(x);
    }
    setState(() {
      limits = limits;
    });
  }

  double getSize(int x){
    double size = (_offset.dy > limits[x] && _offset.dy < limits[x + 1]) ? 25 : 20;
    return size;
  }

  @override
  Widget build(BuildContext context) {

    Size mediaQuery = MediaQuery.of(context).size;
    double sizedbarSize = mediaQuery.width * 0.65;
    double menuContainerHeight = mediaQuery.height / 2;

    return SafeArea(
      child: Scaffold(
        body: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(colors: [
              Color.fromRGBO(255, 65, 108, 1.0),
              Color.fromRGBO(255, 75, 73, 1.0)  
            ])
          ),
          width: mediaQuery.width,
          child: Stack(
            children: [
              Center(
                child: MaterialButton(
                  color: Colors.white,
                  child: Text(
                    'Hello World',
                    style: TextStyle(color: Colors.black),
                  ),
                  onPressed: (){},
                ),
              ),
              AnimatedPositioned(
                duration: Duration(milliseconds: 1500),
                left: isMenuOpen?0: - sizedbarSize + 20,
                top: 0,
                curve: Curves.elasticOut,
                child: SizedBox(
                  width: sizedbarSize,
                  child: GestureDetector(
                    onPanUpdate: (details) {
                      if(details.localPosition.dx <= sizedbarSize){
                        setState(() {
                          _offset = details.localPosition;
                        });
                      }
                      if(details.localPosition.dx>sizedbarSize-20 && details.delta.distanceSquared > 2){
                        setState(() {
                          isMenuOpen = true;
                        });
                      }
                    },
                    onPanEnd: (details) {
                      setState(() {
                        _offset = Offset(0, 0);
                      });
                    },
                    child: Stack(
                      children: [
                        CustomPaint(
                          size: Size(sizedbarSize, mediaQuery.height),
                          painter: DrawerPainter(offset: _offset),
                        ),
                        Container(
                          height: mediaQuery.height,
                          width: sizedbarSize,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                height: mediaQuery.height * 0.25,
                                child: Center(
                                  child: Column(
                                    children: [
                                      Image.asset('assets/dp_default.png', width: sizedbarSize/2),
                                      Text('RetroPortal Studio', style: TextStyle(color: Colors.black45))
                                    ],
                                  ),
                                ),
                              ),
                              Divider(thickness: 1),
                              Container(
                                key: globalKey,
                                width: double.infinity,
                                height: menuContainerHeight,
                                child: Column(
                                  children: [
                                    MyButton(
                                      text: "Profile",
                                      iconData: Icons.person,
                                      textSize: getSize(0),
                                      height: (menuContainerHeight) /5,
                                    ),
                                    MyButton(
                                      text: "Payments",
                                      iconData: Icons.payment,
                                      textSize: getSize(1),
                                      height: (menuContainerHeight) / 5,
                                    ),
                                    MyButton(
                                      text: "Notifications",
                                      iconData: Icons.notifications,
                                      textSize: getSize(2),
                                      height: (mediaQuery.height/2) / 5
                                    ),
                                    MyButton(
                                      text: "Settings",
                                      iconData: Icons.settings,
                                      textSize: getSize(3),
                                      height: (menuContainerHeight) / 5
                                    ),
                                    MyButton(
                                      text: "My Files",
                                      iconData: Icons.attach_file,
                                      textSize: getSize(4),
                                      height: (menuContainerHeight) / 5
                                    ),
                                  ],
                                ),
                              )
                            ],
                          ),
                        ),
                        AnimatedPositioned(
                          duration: Duration(milliseconds: 400),
                          right: (isMenuOpen) ? 10 : sizedbarSize,
                          bottom: 30.0,
                          child: IconButton(
                            enableFeedback: true,
                            icon: Icon(
                              Icons.keyboard_backspace,
                              color: Colors.black45,
                              size: 30,
                            ),
                            onPressed: (){
                              this.setState(() {
                                isMenuOpen = false;
                              });
                            },
                          ),
                        )
                      ],
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class MyButton extends StatelessWidget {

  final String text;
  final IconData iconData;
  final double textSize;
  final double height;

  MyButton({
    this.text, 
    this.iconData, 
    this.textSize, 
    this.height
  }); 

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      height: height,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        mainAxisSize: MainAxisSize.max,
        children: [
          Icon(
            iconData,
            color: Colors.black45,
          ),
          SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: TextStyle(
              color: Colors.black45,
              fontSize: textSize
            ),
          )
        ],
      ),
      onPressed: (){},
    );
  }
}

class DrawerPainter extends CustomPainter{

  final Offset offset;

  DrawerPainter({
    this.offset
  });

  double getControlPonitX(double width){
    if(offset.dx == 0){
      return width;
    }else{
      return offset.dx>width?offset.dx:width+75;
    }
  }

  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = Paint()..color = Colors.white
                         ..style = PaintingStyle.fill;
    Path path = Path();
    path.moveTo(-size.width, 0);
    path.lineTo(size.width, 0);
    path.quadraticBezierTo(getControlPonitX(size.width), offset.dy, size.width, size.height);
    path.lineTo(-size.width, size.height);
    path.close();

    canvas.drawPath(path, paint);
  }
  
  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return true;
  }

}