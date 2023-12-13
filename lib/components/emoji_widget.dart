import 'package:flutter/material.dart';
import 'package:ionicons/ionicons.dart';
import 'package:tab_indicator_styler/tab_indicator_styler.dart';

class EmojiWidget extends StatefulWidget {
  final Function addEmojiToTextController;

  const EmojiWidget({super.key, required this.addEmojiToTextController});

  @override
  State<EmojiWidget> createState() => _EmojiWidgetState();
}

class _EmojiWidgetState extends State<EmojiWidget>
    with SingleTickerProviderStateMixin {
  TabController? tabController;
  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        right: 5,
        left: 5,
        bottom: 5,
      ),
      child: Container(
          height: MediaQuery.of(context).size.height * 0.4,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
          ),
          child: Column(
            children: [
              TabBar(
                controller: tabController,
                isScrollable: false,
                labelColor: Colors.blue,
                indicator: MaterialIndicator(
                  color: Colors.blue,
                  bottomRightRadius: 5,
                  bottomLeftRadius: 5,
                  topLeftRadius: 5,
                  topRightRadius: 5,
                ),
                indicatorSize: TabBarIndicatorSize.label,
                labelPadding: const EdgeInsets.all(5),
                unselectedLabelColor: Colors.black.withOpacity(.4),
                tabs: const [
                  Icon(Icons.emoji_emotions),
                  Icon(Ionicons.paw),
                  Icon(Ionicons.fast_food),
                  Icon(Ionicons.football),
                  Icon(Ionicons.boat),
                  Icon(Ionicons.bulb),
                  Icon(Icons.emoji_symbols_rounded),
                  Icon(Ionicons.flag),
                ],
              ),
            ],
          )),
    );
  }
}
