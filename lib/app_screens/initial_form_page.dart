import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'form_page.dart';

class InitialFormPageView extends StatefulWidget {
  var pagesData;

  InitialFormPageView({
    Key? key,
    required this.pagesData,
  }) : super(key: key);

  @override
  State<InitialFormPageView> createState() => _InitialFormPageViewState();
}

class _InitialFormPageViewState extends State<InitialFormPageView> {
  late final PageController _pageController;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void deactivate() {
    _pageController.dispose();
    super.deactivate();
  }

  @override
  void dispose() {
    super.dispose();
  }

  List<Widget> _getFormPages(Map<String, dynamic> form) {
    List<Widget> screen = [];

    List<dynamic>? pageData = form['forms']['pages'];
    if (pageData == null) {
      return screen;
    }
    for (int i = 0; i < pageData.length; i++) {
      screen.add(
        FormPage(singlePageData: pageData[i]),
      );
    }
    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: PageView(
        scrollDirection: Axis.horizontal,
        controller: _pageController,
        children: _getFormPages(widget.pagesData),
        onPageChanged: (currentPage) {},
      ),
    );
  }
}
