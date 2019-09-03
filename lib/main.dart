import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter_custom_clippers/flutter_custom_clippers.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
        backgroundColor: Color(0xff8ce2ff),
        body: Center(
          child: Stack(
            children: <Widget>[
              Padding(
                // padding: const EdgeInsets.all(32),
                padding: const EdgeInsets.only(top: 120, right: 32, left: 32),
                child: ClipPath(
                  clipper: RoundedDiagonalPathClipper(),
                  child: Container(
                    height: size.height - (0.4 * size.height),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(50.0)),
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top: 290, right: 64, left: 64),
                child: Column(
                  children: <Widget>[
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Votre email",
                          prefixIcon: Icon(
                            Icons.mail,
                            color: Colors.blue,
                            size: 32,
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    TextField(
                      decoration: InputDecoration(
                          hintText: "Mot de passe",
                          prefixIcon: Icon(
                            Icons.lock,
                            color: Colors.blue,
                            size: 32,
                          )),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    // Padding(
                    // padding: const EdgeInsets.only(left: 160),
                    RichText(
                      textAlign: TextAlign.right,
                      textDirection: TextDirection.rtl,
                      text: TextSpan(
                          text: 'mot de passe oublié',
                          style: TextStyle(color: Colors.grey)),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    RaisedButton(
                      color: Colors.blue,
                      onPressed: () {},
                      child: Text('Login',
                          style: TextStyle(color: Colors.white70)),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(20)),
                    )
                    // )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 115, right: 60, top: 110),
                child: Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.blue,
                      borderRadius: BorderRadius.circular(90)),
                  child: Icon(
                    Icons.person,
                    color: Colors.white70,
                    size: 40,
                  ),
                ),
              )
            ],
          ),
        ));
  }
}

class PaintCurve extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    Paint paint = new Paint()
      ..style = PaintingStyle.fill
      ..isAntiAlias = true
      ..color = Colors.purple[700];

    Offset topLeft = Offset(size.width, 0);
    Offset bottomLeft = Offset(0, size.height - (size.height * 0.7));
    Offset topRight = Offset(0, size.height);
    Offset bottomRight = Offset(size.width, size.height);

    Path path = Path()
      ..moveTo(topLeft.dx,
          topLeft.dy) // this move isn't required since the start point is (0,0)
      ..lineTo(bottomLeft.dx, bottomLeft.dy)
      ..lineTo(topRight.dx, topRight.dy)
      ..lineTo(bottomRight.dx, bottomRight.dy)
      ..close();

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class CurvedShape extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 500,
      child: CustomPaint(
        painter: PaintCurve(),
      ),
    );
  }
}
