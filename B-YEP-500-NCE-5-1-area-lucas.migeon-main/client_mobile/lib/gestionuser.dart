import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:flutter_svg/svg.dart';
import 'navbar.dart';
import 'area.service.dart';
import 'User.model.dart';
// import 'Role.model.dart';
import 'main.dart';

// class User {
//   final String name;
//   final String password;
//   final String role;

//   const User({
//     required this.name,
//     required this.password,
//     required this.role,
//   });

//   factory User.fromJson(Map<String, dynamic> json) {
//     return User(
//       name: json['name'],
//       password: json['password'],
//       role: json['role'],
//     );
//   }
// }

// List<User> users = [
//   const User(
//     name: "test@test.test",
//     password: "Test0000&",
//     role: "user",
//   ),
//   const User(
//     name: "test2@test.test",
//     password: "Test0000&",
//     role: "admin",
//   ),
// ];

Map<String, List<User>> users = {
  'gods': [],
  'plebs': [],
};

class GestionUser extends StatefulWidget {
  GestionUser({Key? key}) : super(key: key);
  @override
  State<GestionUser> createState() => GestionUserState();
}

class GestionUserState extends State<GestionUser> {
  List<Widget> createUsersList() {
    List<Widget> tmp = [];

    for (var element in users['gods'] as List<User>) {
      tmp.add(Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      element.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      'god',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => users.remove(element));
                      },
                      child: Container(
                        // margin:
                        //     const EdgeInsets.only(left: 15),
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Color(0x00000000),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("images/trash.svg"),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ));
    }
    for (var element in users['plebs'] as List<User>) {
      tmp.add(Row(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.only(top: 10, bottom: 10),
            child: Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(10),
              ),
              padding: const EdgeInsets.only(left: 25, right: 25),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      element.name,
                      style: const TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    const Text(
                      'pleb',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 15,
                          fontWeight: FontWeight.w300),
                    ),
                    GestureDetector(
                      onTap: () {
                        setState(() => users.remove(element));
                      },
                      child: Container(
                        // margin:
                        //     const EdgeInsets.only(left: 15),
                        height: 15,
                        width: 15,
                        decoration: const BoxDecoration(
                          color: Color(0x00000000),
                          shape: BoxShape.circle,
                        ),
                        child: SvgPicture.asset("images/trash.svg"),
                      ),
                    ),
                  ]),
            ),
          ),
        ],
      ));
    }

    return tmp;
  }

  State<GestionUser> createState() => GestionUserState();

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getUsers().then((data) => setState(() {
          users.clear();
          users.addAll(data);
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const NavBar(),
      // extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('Utilisateurs'),
        actions: <Widget>[
          IconButton(
            icon: const Icon(Icons.add),
            tooltip: 'Add a user',
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => AddUser()));
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
              Row(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.only(top: 0),
                    child: Container(
                      width: 350,
                      height: 50,
                      decoration: BoxDecoration(
                        color: Colors.white30,
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: const EdgeInsets.only(left: 25, right: 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: const <Widget>[
                          Text(
                            "Name",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Padding(padding: EdgeInsets.only(left: 20)),
                          Text(
                            "Role",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                          Text(
                            "Suppr",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 15,
                                fontWeight: FontWeight.w600),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10.0),
                child: Center(
                  child: Column(
                    children: createUsersList(),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AddUser extends StatefulWidget {
  AddUser({Key? key}) : super(key: key);
  @override
  State<AddUser> createState() => AddUserState();
}

class AddUserState extends State<AddUser> {
  State<AddUser> createState() => AddUserState();

  String valueChoose = "User";

  List listitem = ["User", "Admin"];

  TextEditingController name = TextEditingController();
  TextEditingController mail = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController role = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const NavBar(),
        // extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: const Text('Nouvel Utilisateur'),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.keyboard_return),
              onPressed: () {
                Navigator.pop(context);
              },
            ),
          ],
        ),
        body: MaterialApp(
            debugShowCheckedModeBanner: false,
            home: Material(
                color: const Color(0xFF606060),
                child: ListView(children: <Widget>[
                  Container(
                      margin: const EdgeInsets.symmetric(
                          horizontal: 30.0, vertical: 10.0),
                      child: Column(children: <Widget>[
                        TextField(
                          controller: name,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                              hintText: "Nom de l'utilisateur",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              filled: false),
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                        TextField(
                          controller: mail,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                              hintText: "Mail de l'utilisateur",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              filled: false),
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                        TextField(
                          controller: password,
                          textAlign: TextAlign.left,
                          decoration: const InputDecoration(
                              hintText: "Mot de passe de l'utilisateur",
                              hintStyle: TextStyle(color: Colors.white),
                              fillColor: Colors.white,
                              filled: false),
                          style: GoogleFonts.raleway(
                            textStyle: const TextStyle(
                                color: Colors.white, fontSize: 22.0),
                          ),
                        ),
                        DropdownButton(
                          dropdownColor: Colors.grey,
                          icon: const Icon(Icons.arrow_drop_down),
                          iconSize: 36,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 18,
                          ),
                          value: valueChoose,
                          onChanged: (newValue) {
                            setState(() => valueChoose = newValue as String);
                          },
                          items: listitem.map((valueItem) {
                            return DropdownMenuItem(
                              value: valueItem,
                              child: Text(valueItem),
                            );
                          }).toList(),
                        ),
                        const Padding(padding: EdgeInsets.only(bottom: 20)),
                        ElevatedButton(
                          child: const Text(
                            "Envoyer",
                            style: TextStyle(
                              fontSize: 20.0,
                            ),
                          ),
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => GestionUser()));
                          },
                        )
                      ]))
                ]))));
  }
}
