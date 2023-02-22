import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'navbar.dart';
import 'area.service.dart';
import 'Data.model.dart';
import 'dart:convert';
import 'package:tuple/tuple.dart';

// void main() => runApp(const myApp());

// class myApp extends StatelessWidget {
//   const myApp({Key? key}) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     return const MaterialApp(
//       title: "Action Reaction page",
//       home: ActionReaction(),
//     );
//   }
// }

List<Data> tmp = <Data>[];

class ActionReaction extends StatefulWidget {
  ActionReaction({Key? key}) : super(key: key);
  @override
  State<ActionReaction> createState() => ActionReactionState();
}

class ActionReactionState extends State<ActionReaction> {
  State<ActionReaction> createState() => ActionReactionState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getData().then((data) => setState(() {
          tmp.clear();
          tmp.addAll(data);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Mes Actions/Réaction'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add action/reaction',
            onPressed: () {
              Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => NouvelleActionReaction()));
            },
          ),
        ],
        // backgroundColor: Colors.transparent,
        // elevation: 0,
      ),
      body: MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
          color: const Color(0xFF606060),
          child: ListView(
            children: <Widget>[
              Container(
                padding: const EdgeInsets.symmetric(
                    horizontal: 35.0, vertical: 20.0),
                child: Center(
                  child: Column(
                    children: <Widget>[
                      for (var element in tmp)
                        Row(
                          children: <Widget>[
                            Padding(
                              padding:
                                  const EdgeInsets.only(top: 15, bottom: 25),
                              child: Container(
                                  width: 250,
                                  height: 150,
                                  decoration: BoxDecoration(
                                    color: Colors.white30,
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  padding: const EdgeInsets.only(
                                      left: 25, right: 25),
                                  child: Stack(
                                    children: <Widget>[
                                      Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: <Widget>[
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  Text(
                                                    element.title,
                                                    style: const TextStyle(
                                                        color: Colors.white,
                                                        fontSize: 20,
                                                        fontWeight:
                                                            FontWeight.w600),
                                                  ),
                                                  Container(
                                                      child: element
                                                                  .action
                                                                  .title
                                                                  .length >=
                                                              25
                                                          ? Text(
                                                              element
                                                                  .action.title
                                                                  .substring(
                                                                      0, 25),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          : Text(
                                                              element
                                                                  .action.title,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )),
                                                  Container(
                                                      child: element
                                                                  .reaction
                                                                  .title
                                                                  .length >=
                                                              25
                                                          ? Text(
                                                              element.reaction
                                                                  .title
                                                                  .substring(
                                                                      0, 25),
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )
                                                          : Text(
                                                              element.reaction
                                                                  .title,
                                                              style: const TextStyle(
                                                                  color: Colors
                                                                      .white,
                                                                  fontSize: 10,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .w600),
                                                            )),
                                                ]),
                                            Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .spaceAround,
                                                children: <Widget>[
                                                  Image.asset(
                                                      "images/" +
                                                          element
                                                              .actionService +
                                                          ".png",
                                                      width: 70,
                                                      height: 70),
                                                  Image.asset(
                                                      "images/discord.png",
                                                      width: 70,
                                                      height: 70),
                                                ])
                                          ]),
                                    ],
                                  )),
                            ),
                            Expanded(
                                child: Column(children: <Widget>[
                              GestureDetector(
                                onTap: () {
                                  deleteData(element.title)
                                      .then((_) =>
                                          setState(() => tmp.remove(element)))
                                      .catchError((err) => print(err));
                                },
                                child: Container(
                                  margin: const EdgeInsets.only(left: 15),
                                  height: 25,
                                  width: 25,
                                  decoration: const BoxDecoration(
                                    color: Color(0x00000000),
                                    shape: BoxShape.circle,
                                  ),
                                  child: SvgPicture.asset("images/trash.svg"),
                                ),
                              ),
                              // const SizedBox(height: 15),
                              // Row(
                              //   mainAxisAlignment:
                              //       MainAxisAlignment.spaceBetween,
                              //   children: <Widget>[
                              //     Text(
                              //       "\$ ", //+
                              //       //pd.products[element.id - 1].price
                              //       //  .toString(),
                              //       style: const TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //     Text(
                              //       "x ", // + element.quantity.toString(),
                              //       style: const TextStyle(
                              //           fontSize: 15,
                              //           fontWeight: FontWeight.w500),
                              //     ),
                              //   ],
                              // )
                            ])),
                          ],
                        ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class NouvelleActionReaction extends StatefulWidget {
  NouvelleActionReaction({Key? key}) : super(key: key);
  @override
  State<NouvelleActionReaction> createState() => NouvelleActionReactionState();
}

class Service {
  final String name;
  final List<SubData> areaData;

  const Service({
    required this.name,
    required this.areaData,
  });

  factory Service.fromJson(Map<String, dynamic> json) => Service(
      name: json['name'],
      areaData: (json['areaData'] as List<dynamic>).fold<List<SubData>>([],
          (value, element) {
        value.add(SubData.fromJson(element));
        return value;
      }));
}

class NouvelleActionReactionState extends State<NouvelleActionReaction> {
  Service? action;
  SubData? actionData;
  Service? reaction;
  SubData? reactionData;

  List<Service> actions = [
    Service.fromJson(<String, dynamic>{
      "name": "discord",
      "areaData": [
        // {
        //   "id": 1,
        //   "title": "New pinned message in channel",
        //   "description":
        //       "This trigger fires when a new message is pinned in a channel you select."
        // },
        {
          "id": 2,
          "title": "New message in channel",
          "description":
              "This trigger fires when a new message is pinned in a channel you select."
        },
      ]
    }),
    Service.fromJson(<String, dynamic>{
      "name": "youtube",
      "areaData": [
        {
          "id": 1,
          "title": "New subscribption",
          "description":
              "This trigger fires when you have a new subscriber"
        }
      ]
    }),
    Service.fromJson(<String, dynamic>{
      "name": "randomUser",
      "areaData": [
        {
          "id": 1,
          "title": "Create a random user",
          "description":
              "This trigger when a new random user has been created"
        }
      ]
    }),
    Service.fromJson(<String, dynamic>{
      "name": "timer",
      "areaData": [
        {
          "id": 1,
          "title": "Every minute",
          "description": "This trigger fires every minute"
        }
      ]
    }),
    Service.fromJson(<String, dynamic>{
      "name": "weather",
      "areaData": [
        {
          "id": 1,
          "title": "temperature lesser than 10 degree",
          "description":
              "This trigger when the temperature of the city is less than 10 degree"
        },
        {
          "id": 2,
          "title": "temperature superior than 10 degree",
          "description":
              "This trigger when the temperature of the city is superior than 10 degree"
        }
      ]
    }),
  ];
  List<Service> reactions = [
    Service.fromJson(<String, dynamic>{
      "name": "discord",
      "areaData": [
        {
          "id": 1,
          "title": "Post a message to a channel",
          "description":
              "This action will send a message with your discord bot to the channel you specify."
        },
        {
          "id": 2,
          "title": "React with an emote",
          "description": "React with an emote to a specific message"
        },
        {
          "id": 3,
          "title": "Reply to message",
          "description": "Reply to the message of an user"
        }
      ]
    }),
  ];

  TextEditingController title = TextEditingController();

  State<NouvelleActionReaction> createState() => NouvelleActionReactionState();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Ajouter une Action/Réaction'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.keyboard_return),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
          // backgroundColor: Colors.transparent,
          // elevation: 0,
        ),
        body: Material(
          color: const Color(0xFF606060),
          child: Container(
            margin:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 70.0),
            child: ListView(children: <Widget>[
              Column(
                children: <Widget>[
                  TextField(
                    controller: title,
                    textAlign: TextAlign.left,
                    decoration: const InputDecoration(
                        hintText: "Nom de l'action/récation",
                        hintStyle: TextStyle(color: Colors.white70),
                        fillColor: Colors.white,
                        filled: false),
                    style: GoogleFonts.raleway(
                      textStyle:
                          const TextStyle(color: Colors.white, fontSize: 22.0),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 20.0),
                  ),
                  DropdownButton<String>(
                    hint: const Text(
                      "Action service",
                      style: TextStyle(color: Colors.white70),
                    ),
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    value: action?.name,
                    onChanged: (newValue) => setState(() => action = actions
                        .singleWhere((element) => element.name == newValue)),
                    items: actions
                        .map((item) => DropdownMenuItem(
                            child: Text(item.name), value: item.name))
                        .toList(),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    value: actionData?.title,
                    onChanged: action == null
                        ? null
                        : (newValue) => setState(() => actionData =
                            action?.areaData.singleWhere(
                                (element) => element.title == newValue)),
                    items: action?.areaData
                        .map((item) => DropdownMenuItem(
                            value: item.title, child: Text(item.title)))
                        .toList(),
                  ),
                  DropdownButton(
                    hint: const Text(
                      "Reaction service",
                      style: TextStyle(color: Colors.white70),
                    ),
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    value: reaction?.name,
                    onChanged: (newValue) => setState(() => reaction = reactions
                        .singleWhere((element) => element.name == newValue)),
                    items: reactions
                        .map((item) => DropdownMenuItem(
                              value: item.name,
                              child: Text(item.name),
                            ))
                        .toList(),
                  ),
                  DropdownButton(
                    dropdownColor: Colors.grey,
                    icon: const Icon(Icons.arrow_drop_down),
                    iconSize: 36,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                    ),
                    value: reactionData?.title,
                    onChanged: reaction == null
                        ? null
                        : (newValue) => setState(() => reactionData =
                            reaction?.areaData.singleWhere(
                                (element) => element.title == newValue)),
                    items: reaction?.areaData
                        .map((item) => DropdownMenuItem(
                              value: item.title,
                              child: Text(item.title),
                            ))
                        .toList(),
                  ),
                  ElevatedButton(
                    child: const Text(
                      "Envoyer",
                      style: TextStyle(
                        fontSize: 20.0,
                      ),
                    ),
                    onPressed: () {
                      try {
                        postData(Data(
                                title: title.value.text,
                                actionService: action!.name,
                                action: actionData!,
                                reactionService: reaction!.name,
                                reaction: reactionData!))
                            .then((value) {
                          Navigator.of(context).pop();
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ActionReaction()));
                        });
                      } catch (err) {
                        print(err);
                      }
                    },
                  )
                ],
              ),
            ]),
          ),
        ));
  }
}
