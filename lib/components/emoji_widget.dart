import 'package:chat_app/components/emoji_service.dart';
import 'package:emoji_picker_flutter/emoji_picker_flutter.dart';
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
  EmojiServices emojiServices = EmojiServices();
  List<Emoji> smileyEmojis = [];
  List<Emoji> petEmojis = [];
  List<Emoji> foodEmojis = [];
  List<Emoji> sportsEmojis = [];
  List<Emoji> vehiclesEmojis = [];
  List<Emoji> toolsEmojis = [];
  List<Emoji> objectsEmojis = [];
  List<Emoji> flagsEmojis = [];
  @override
  void initState() {
    tabController = TabController(length: 8, vsync: this);
    for (var emojiSet in defaultEmojiSet) {
      emojiServices.getCategoryEmojis(category: emojiSet).then(
            (e) async => await emojiServices
                .filterUnsupportedEmoji(data: [e]).then((filterd) {
              for (var element in filterd) {
                switch (emojiSet.category) {
                  case Category.SMILEYS:
                    setState(() {
                      smileyEmojis = element.emoji;
                    });
                    break;
                  case Category.ANIMALS:
                    setState(() {
                      petEmojis = element.emoji;
                    });
                    break;
                  case Category.FOODS:
                    setState(() {
                      foodEmojis = element.emoji;
                    });
                    break;
                  case Category.ACTIVITIES:
                    setState(() {
                      sportsEmojis = element.emoji;
                    });
                    break;
                  case Category.TRAVEL:
                    setState(() {
                      vehiclesEmojis = element.emoji;
                    });
                    break;
                  case Category.OBJECTS:
                    setState(() {
                      objectsEmojis = element.emoji;
                    });
                    break;
                  case Category.SYMBOLS:
                    setState(() {
                      toolsEmojis = element.emoji;
                    });
                    break;
                  case Category.FLAGS:
                    setState(() {
                      flagsEmojis = element.emoji;
                    });
                    break;
                  default:
                }
              }
            }),
          );
    }
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
          height: MediaQuery.of(context).size.height * 0.2,
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
              Expanded(
                  child: TabBarView(controller: tabController, children: [
                buildEmojis(emojis: smileyEmojis),
                buildEmojis(emojis: petEmojis),
                buildEmojis(emojis: foodEmojis),
                buildEmojis(emojis: sportsEmojis),
                buildEmojis(emojis: vehiclesEmojis),
                buildEmojis(emojis: objectsEmojis),
                buildEmojis(emojis: toolsEmojis),
                buildEmojis(emojis: flagsEmojis),
              ]))
            ],
          )),
    );
  }

  Widget buildEmojis({required List<Emoji> emojis}) {
    return emojis.isEmpty
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : GridView.builder(
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 8),
            itemBuilder: (context, index) {
              Emoji emoji = emojis[index];
              return Center(
                child: GestureDetector(
                  onTap: () {
                    widget.addEmojiToTextController(emoji: emoji);
                  },
                  child: Text(
                    emoji.emoji,
                    style: const TextStyle(color: Colors.black, fontSize: 32),
                  ),
                ),
              );
            },
          );
  }
}
