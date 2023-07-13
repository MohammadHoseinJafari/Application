import 'package:flutter/material.dart';

class EachPage extends StatelessWidget {
  final String message1;
  final String message2;
  final String image;
  final String back;

  EachPage(this.message1, this.message2, this.image, this.back);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white ,
        child: Center(
          child: Stack(
            children: [
              Align(
                alignment: Alignment.center,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    ShakeWidget(
                      child: Stack(
                        children : [
                          Positioned(
                            child: Image(
                              alignment: Alignment.topCenter,
                              image: AssetImage(image),
                              width: 250,
                              height: 250,
                          ),
                          )
                        ]
                      )
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      message1,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          color: Color(0xFF222A3B),
                          fontFamily: 'isans',
                          fontSize: 22,
                        fontWeight: FontWeight.bold
                        ),
                    ),
                    SizedBox(
                      height: 30,
                    ),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 60),
                      child: Text(
                        message2,
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            color: Color(0xFF222A3B),
                            fontFamily: 'isans',
                            fontSize: 16),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              Positioned(
                bottom: 0,
                child: Image(
                  image: AssetImage(back),
                  width: MediaQuery.of(context).size.width,
                  fit: BoxFit.fitWidth,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ShakeWidget extends StatefulWidget {
  const ShakeWidget({
    Key? key,
    this.duration = const Duration(seconds: 10),
    this.deltaY = 50,
    this.curve = Curves.ease,
    required this.child,
  }) : super(key: key);

  final Duration duration;
  final double deltaY;
  final Widget child;
  final Curve curve;

  @override
  _ShakeWidgetState createState() => _ShakeWidgetState();
}

class _ShakeWidgetState extends State<ShakeWidget>
    with SingleTickerProviderStateMixin {
  late AnimationController controller;

  @override
  void initState() {
    super.initState();
    controller = AnimationController(
      duration: widget.duration,
      vsync: this,
    )
      ..forward()
      ..addListener(() {
        if (controller.isCompleted) {
          controller.repeat();
        }
      });
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  /// convert 0-1 to 0-1-0
  double shake(double value) =>
      2 * (0.5 - (0.5 - widget.curve.transform(value)).abs());

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
      animation: controller,
      builder: (context, child) => Transform.translate(
        offset: Offset(0, widget.deltaY * shake(controller.value)),
        child: child,
      ),
      child: widget.child,
    );
  }
}
