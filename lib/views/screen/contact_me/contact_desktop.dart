import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:myapp/views/screen/about/exports_about.dart';

class ContactDesktop extends StatefulWidget {
  @override
  _ContactDesktopState createState() => _ContactDesktopState();
}

class _ContactDesktopState extends State<ContactDesktop> {
  String dateRangeValue;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            color: Colors.white,
            child: CustomPaint(
              painter: EdgePainter(),
            ),
          ),
          Center(
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Full name", style: GoogleFonts.robotoMono(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: SizedBox(
                              width: size.width * 0.3,
                              child: buildInputField(prefixIcon: AntDesign.team),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Email Address", style: GoogleFonts.robotoMono(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: SizedBox(
                                width: size.width * 0.3,
                                child:
                                    buildInputField(prefixIcon: AntDesign.mail, inputType: TextInputType.emailAddress)),
                          ),
                        ],
                      ),
                    )
                  ]),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Timeline", style: GoogleFonts.robotoMono(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: SizedBox(
                              width: size.width * 0.3,
                              child: buildInputField(
                                  // Prevents the user from writing any text in Timeline field 👻
                                  inputFormatter: [new FilteringTextInputFormatter.deny(RegExp("[a-zA-Z0-9]"))],
                                  prefixIcon: FlutterIcons.timeline_text_outline_mco,
                                  inputType: TextInputType.datetime,
                                  isEnabled: true,
                                  value: dateRangeValue,
                                  callOnTap: () async {
                                    DateTimeRange range = await showDateRangePicker(
                                      context: context,
                                      firstDate: DateTime.now(),
                                      lastDate: DateTime(DateTime.now().year + 5),
                                      initialDateRange: DateTimeRange(
                                        end: DateTime(
                                            DateTime.now().year, DateTime.now().month, DateTime.now().day + 13),
                                        start: DateTime.now(),
                                      ),
                                    );
                                    setState(() {
                                      dateRangeValue = range.toString();
                                    });
                                  }),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Budget",
                              style: GoogleFonts.robotoMono(
                                color: Colors.white,
                              )),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: SizedBox(
                                width: size.width * 0.3,
                                child: buildInputField(inputFormatter: [
                                  new FilteringTextInputFormatter(RegExp("[a-zA-Z]"), allow: false),
                                ], prefixIcon: FlutterIcons.attach_money_mdi, inputType: TextInputType.number)),
                          ),
                        ],
                      ),
                    )
                  ]),
                  Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [],
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget buildInputField(
      {IconData prefixIcon,
      TextInputType inputType = TextInputType.text,
      bool isEnabled = true,
      VoidCallback callOnTap,
      List<FilteringTextInputFormatter> inputFormatter,
      String value}) {
    return TextFormField(
        enabled: isEnabled,
        keyboardType: inputType,
        // Fix bug if user already writes some text
        onTap: callOnTap,
        inputFormatters: inputFormatter,
        style: GoogleFonts.robotoMono(color: Colors.white),
        decoration: InputDecoration(
            hintText: value,
            hintStyle: GoogleFonts.ubuntu(color: Colors.white),
            prefixIcon: Icon(prefixIcon, color: Colors.white),
            border: new OutlineInputBorder(
              gapPadding: 25,
              borderRadius: new BorderRadius.circular(10.0),
              borderSide: BorderSide.none,
            ),
            fillColor: Colors.black26,
            filled: true,
            hoverColor: Colors.black38,
            labelStyle: TextStyle(color: Colors.white)));
  }
}

class EdgePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    var rect = Offset.zero & size;

    var paint = Paint();
    paint.color = Colors.green[800];
    paint.style = PaintingStyle.fill; // Change this to fill
    paint.shader = LinearGradient(
      begin: Alignment.topRight,
      end: Alignment.bottomLeft,
      colors: [
        Colors.blue[900],
        Colors.blue[500],
      ],
    ).createShader(rect);
    var path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    canvas.drawPath(path, paint);
  }

  @override
  bool shouldRepaint(covariant CustomPainter oldDelegate) {
    return true;
  }
}
