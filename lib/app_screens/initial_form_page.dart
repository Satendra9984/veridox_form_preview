import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
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

    List<dynamic>? pageData =

        /// todo: access form through uid
        form['forms']['l2tfQZqMQ5hKpHXmoAmkYPYuj4D3']['pages'];
    if (pageData == null) {
      return screen;
    }
    for (int i = 0; i < pageData.length; i++) {
      screen.add(
        FormPage(
          singlePageData: pageData[i],
          currentPage: i,
          totalPages: pageData.length,
          pageController: _pageController,
        ),
      );
    }
    return screen;
  }

  @override
  Widget build(BuildContext context) {
    return PageView(
      scrollDirection: Axis.horizontal,
      controller: _pageController,
      children: _getFormPages(widget.pagesData),
      onPageChanged: (currentPage) {
        debugPrint('page changed --> $currentPage}');
      },
    );
  }
}

/// todo: we can transfer pagecontroller to each formpage
/// and there can make buttons for submit form
