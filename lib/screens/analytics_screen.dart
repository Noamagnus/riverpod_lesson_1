import 'package:flutter/material.dart';
import 'package:my_first_riverpod/widgets/calendar_widget.dart';
import 'package:my_first_riverpod/widgets/page_view.dart';

class AnalyticsScreen extends StatelessWidget {
  const AnalyticsScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Analytics'),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.menu),
          onPressed: () {},
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      backgroundColor: Colors.white70,
      body: PageViewWidget(),
    );
  }
}
