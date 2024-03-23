import 'package:flutter/material.dart';



/// NOTE!!! This widget should be wrapped with SingleChildScrollView and SCSV should
/// be wrapped with Expanded widget 
class ExpandableText extends StatefulWidget {
  ExpandableText({Key? key, required this.text}) : super(key: key);
  final String text;
  @override
  State<ExpandableText> createState() => _ExpandableTextState();
}

late String firstHalf;
late String secondHalf;
bool hiddenText = true;
///double textHeight = Dimensions.screenHeight / 5.63; //You can choose whatever you want
double textHeight = 16; //You can choose whatever you want

class _ExpandableTextState extends State<ExpandableText> {
  @override
  @override
  void initState() {
    super.initState();
    if (widget.text.length > textHeight) {
      firstHalf = widget.text.substring(0, textHeight.toInt());
      secondHalf = widget.text.substring(textHeight.toInt() + 1, widget.text.length);
    } else {
      firstHalf = widget.text;
      secondHalf = '';
    }
  }

  Widget build(BuildContext context) {
    return Container(
      child: secondHalf.isEmpty
          ? Text(firstHalf)
          : Column(
              children: [
                Text(hiddenText ? firstHalf + '...' : firstHalf + secondHalf),
                InkWell(
                  onTap: () {
                    setState(() {
                      hiddenText = !hiddenText;
                    });
                  },
                  child: Row(
                    children: [
                      Text('Show more'),
                      Icon(hiddenText?Icons.arrow_drop_down:Icons.arrow_drop_up)
                    ],
                  ),
                )
              ],
            ),
    );
  }
}
