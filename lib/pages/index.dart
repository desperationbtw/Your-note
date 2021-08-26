import 'dart:ui';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:your_note/models/note.dart';
import '../utils.dart';

class MainPage extends StatefulWidget {
  MainPage({Key? key}) : super(key: key);

  @override
  _MainPageState createState() => _MainPageState();
}

class _MainPageState extends State<MainPage> {
  Note note_0 = Note(
      0,
      "Заманчивые предложения",
      "У меня таких к сожалению нет :(",
      Colors.red,
      true,
      false,
      DateTime.now(),
      DateTime.now());

  Note note_1 = Note(
      0,
      "Section 1.10.32 of 'de Finibus Bonorum et Malorum', written by Cicero in 45 BC",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      Colors.green,
      true,
      false,
      DateTime.now(),
      DateTime.now());

  Note note_2 = Note(
      0,
      "Тут типа под паролем",
      "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s, when an unknown printer took a galley of type and scrambled it to make a type specimen book. It has survived not only five centuries, but also the leap into electronic typesetting, remaining essentially unchanged. It was popularised in the 1960s with the release of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker including versions of Lorem Ipsum.",
      Colors.blue,
      false,
      true,
      DateTime.now(),
      DateTime.now());

  Note note_3 = Note(0, "Душнила", "Мультилайн\nноут\nблин", Colors.deepOrange,
      false, false, DateTime.now(), DateTime.now());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Заметки"),
        actions: [
          IconButton(
              onPressed: () => setState(() => Get.changeThemeMode(
                  Get.isDarkMode ? ThemeMode.light : ThemeMode.dark)),
              icon: !Get.isDarkMode
                  ? SvgPicture.asset(
                      "assets/svg/day.svg",
                      color: Colors.yellow,
                    )
                  : SvgPicture.asset(
                      "assets/svg/night.svg",
                      color: Colors.white,
                    )),
          IconButton(
              onPressed: () {},
              icon: SvgPicture.asset(
                "assets/svg/sort.svg",
                color: Colors.white,
              ))
        ],
      ),
      body: Container(
        child: ListView(
          children: [
            note_0,
            note_1,
            note_3,
            note_2,
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
            Note.initialState(),
          ]
              .map((Note e) => Container(
                    child: NoteWidget(e),
                  ))
              .toList(),
        ),
      ),
    );
  }
}

class NoteWidget extends StatelessWidget {
  final Note note;
  final double border = 8;
  NoteWidget(this.note, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final time = new DateFormat('HH:mm');
    final date = new DateFormat('dd/MM');
    return Container(
      margin: EdgeInsets.only(top: 8, right: 8, left: 8),
      width: Get.width,
      decoration: BoxDecoration(
        color: Colors.black12,
        borderRadius: BorderRadius.circular(border),
        //border: Border.all(color: note.color, width: 0.4), Такое себе решение
      ),
      child: Column(
        children: [
          Container(
            width: Get.width,
            height: border * 1.1,
            decoration: BoxDecoration(
                color: note.color,
                borderRadius:
                    BorderRadius.vertical(top: Radius.circular(border))),
          ),
          Container(
            padding: EdgeInsets.symmetric(vertical: border),
            width: Get.width,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.symmetric(horizontal: border),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Flexible(
                          child: Text(
                        note.title,
                        overflow: TextOverflow.ellipsis,
                        style: Theme.of(context).textTheme.subtitle1,
                      )),
                      Row(
                        children: [
                          note.isFavorite
                              ? Container(
                                  margin: EdgeInsets.symmetric(horizontal: 4),
                                  child: SvgPicture.asset(
                                    "assets/svg/star.svg",
                                    height: 16,
                                    width: 16,
                                    color: Colors.white,
                                  ),
                                )
                              : Container(),
                          RichText(
                              text: TextSpan(
                                  style: Theme.of(context).textTheme.caption,
                                  children: [
                                note.updatedAt.millisecond <=
                                        note.createdAt.millisecond
                                    ? TextSpan()
                                    : TextSpan(text: 'изм.'),
                                TextSpan(
                                    text: '${time.format(note.updatedAt)} '),
                                TextSpan(
                                    text: date.format(note.updatedAt),
                                    style: TextStyle(fontSize: 10))
                              ])),
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  indent: border,
                  endIndent: border,
                ),
                note.isLocked
                    ? Stack(
                        children: [
                          Container(
                            constraints: BoxConstraints(maxHeight: 100),
                            child: Container(
                              padding: EdgeInsets.symmetric(horizontal: 20),
                              child: Text(
                                note.content,
                                maxLines: 4,
                                overflow: TextOverflow.ellipsis,
                                style: Theme.of(context).textTheme.caption,
                              ),
                            ),
                          ),
                          Positioned(
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(0),
                                child: BackdropFilter(
                                  filter: ImageFilter.blur(
                                    sigmaX: 6.0,
                                    sigmaY: 0.0,
                                  ),
                                  child: Container(
                                    width: Get.width,
                                    height: 100,
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 4),
                                          child: SvgPicture.asset(
                                            "assets/svg/lock.svg",
                                            height: 30,
                                            width: 30,
                                            color: Colors.white,
                                          ),
                                        )
                                      ],
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      )
                    : Container(
                        constraints: BoxConstraints(maxHeight: 100),
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: border),
                          child: Text(
                            note.content,
                            maxLines: 4,
                            overflow: TextOverflow.ellipsis,
                            style: Theme.of(context).textTheme.caption,
                          ),
                        ),
                      )
              ],
            ),
          )
        ],
      ),
    );
  }
}
