import 'about_desktop.dart';
import 'about_mobile.dart';
import 'about_tablet.dart';
import 'exports_about.dart';
import 'package:responsive_builder/responsive_builder.dart';

class About extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ScreenTypeLayout(
      tablet: AboutTabletDesktop(),
      desktop: AboutDesktop(),
      mobile: AboutMobile(),
    );
  }
}
