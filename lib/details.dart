import 'package:flutter/material.dart';

class Details extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Color(0xff131b26),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Flexible(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(15.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: <Widget>[
                    SizedBox(
                      height: 35.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "Learn 5 new words",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 31,
                            ),
                          ),
                        ),
                        Container(
                          padding: EdgeInsets.all(5.0),
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            border: Border.all(
                              color: Colors.grey[700],
                            ),
                          ),
                          child: InkWell(
                            onTap: () {},
                            child: Icon(
                              Icons.edit,
                              color: Colors.grey[600],
                            ),
                          ),
                        )
                      ],
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Text(
                      "5 from 7 this week",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(
                      height: 11.0,
                    ),
                    LinearProgressIndicator(
                      value: .71,
                      backgroundColor: Color(0xff1c232d),
                      valueColor: AlwaysStoppedAnimation(
                        Color(0xff701bff),
                      ),
                    ),
                    SizedBox(
                      height: 35.0,
                    ),
                    Text(
                      "Strength",
                      style: TextStyle(
                        color: Colors.grey[500],
                        fontSize: 21,
                      ),
                    ),
                    SizedBox(
                      height: 15.0,
                    ),
                    Row(
                      children: <Widget>[
                        Expanded(
                          child: Text(
                            "75%",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                              fontSize: 31,
                            ),
                          ),
                        ),
                        CircularProgressIndicator(
                          value: .73,
                          backgroundColor: Colors.grey[600],
                          valueColor: AlwaysStoppedAnimation(
                            Color(0xff701bff),
                          ),
                        )
                      ],
                    ),
                    SizedBox(height: 35),
                    Container(
                      color: Colors.grey[500],
                      height: 1.0,
                    ),
                    SizedBox(height: 35),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: List.generate(
                        3,
                        (f) {
                          return Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: <Widget>[
                              Text(
                                f == 0 ? "Repeat" : f==1? "Streak" : "Best",
                                style: TextStyle(
                                  color: Colors.grey[500],
                                  fontSize: 17,
                                ),
                              ),
                              SizedBox(height: 9),
                              Text(
                                f == 0 ? "Every Day" : f==1? "8 Days" : "11 Days",
                                style: TextStyle(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              )
                            ],
                          );
                        },
                      ),
                    )
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 2,
              child: Transform.rotate(
                angle: 3.14,
                child: CustomPaint(
                  child: MyBezierCurve(),
                  painter: CurvePath(),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CurvePath extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var paint = Paint();

    paint.color = Color(0xff701dff);
    paint.style = PaintingStyle.stroke;
    paint.strokeWidth = 5;

    var path = Path();

    path.moveTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);
    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);
    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);

    path.moveTo(size.width, 0);
    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class MyBezierCurve extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ClipPath(
      clipper: ClippingClass(),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Color(0xff221b4c),
              Color(0xff151b2b),
            ],
          ),
        ),
      ),
    );
  }
}

class ClippingClass extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = new Path();
    path.lineTo(0, size.height * 0.50);
    path.quadraticBezierTo(size.width * 0.10, size.height * 0.80,
        size.width * 0.15, size.height * 0.60);

    path.quadraticBezierTo(size.width * 0.20, size.height * 0.45,
        size.width * 0.27, size.height * 0.60);

    path.quadraticBezierTo(
        size.width * 0.45, size.height, size.width * 0.50, size.height * 0.80);
    path.quadraticBezierTo(size.width * 0.55, size.height * 0.45,
        size.width * 0.75, size.height * 0.75);
    path.quadraticBezierTo(
        size.width * 0.85, size.height * 0.93, size.width, size.height * 0.60);
    path.lineTo(size.width, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => true;
}
