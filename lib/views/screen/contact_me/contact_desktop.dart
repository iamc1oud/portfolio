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
                crossAxisAlignment: CrossAxisAlignment.start,
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
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(" I Need Help With...", style: GoogleFonts.robotoMono(color: Colors.white)),
                          Row(
                            children: [
                              buildHelpOptions("Web Development", FlutterIcons.web_mco),
                              buildHelpOptions("App Development", FlutterIcons.mobile1_ant)
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  Row(mainAxisSize: MainAxisSize.min, children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("More Information", style: GoogleFonts.robotoMono(color: Colors.white)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0, bottom: 8.0),
                            child: Container(
                              width: size.width * 0.3,
                              height: size.height * 0.3,
                              child: buildInputField(prefixIcon: AntDesign.info),
                            ),
                          ),
                        ],
                      ),
                    )
                  ]),
                  Padding(padding: EdgeInsets.symmetric(horizontal: size.width * 0.25), child: submitButton())
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget submitButton() {
    return Container(
      height: 40,
      child: RaisedButton(
        color: Colors.pink[500],
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 2),
          child: Text("Submit Project",
              style: GoogleFonts.robotoMono(
                color: Colors.white,
              )),
        ),
        onPressed: () {
          print("Show dialog and submit form");
        },
      ),
    );
  }

  Widget buildInputField(
      {IconData prefixIcon,
      TextInputType inputType = TextInputType.text,
      bool isEnabled = true,
      VoidCallback callOnTap,
      List<FilteringTextInputFormatter> inputFormatter,
      double height,
      String value}) {
    return TextFormField(
        enabled: isEnabled,
        keyboardType: inputType,
        // Fix bug if user already writes some text
        onTap: callOnTap,
        inputFormatters: inputFormatter,
        style: GoogleFonts.robotoMono(color: Colors.white),
        maxLines: null,
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

  Widget buildHelpOptions(String title, IconData icon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        height: 120,
        width: 220,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: Colors.white,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Icon(
                icon,
                color: Colors.black,
                size: 50,
              ),
              Text(title,
                  style: GoogleFonts.robotoMono(
                    color: Colors.black,
                  ))
            ],
          ),
        ),
      ),
    );
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
