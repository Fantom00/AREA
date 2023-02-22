import 'package:flutter/material.dart';
import 'actionsreactions.dart';
import 'gestionuser.dart';

class NavBar extends StatelessWidget {
  const NavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Column(
        mainAxisSize: MainAxisSize.max,
        children: [
          Column(
            children: [
              const Padding(padding: EdgeInsets.only(top: 50)),
              Column(
                children: [
                  ListTile(
                    leading: const Icon(Icons.account_circle),
                    title: const Text('Mes Actions/Réactions'),
                    onTap: () {
                      Navigator.pop(context);
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => ActionReaction()));
                    },
                  ),
                  ListTile(
                      leading: const Icon(Icons.supervised_user_circle),
                      title: const Text('Gestion User'),
                      onTap: () {
                        Navigator.pop(context);
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) => GestionUser()));
                      }),
                  ListTile(
                    leading: const Icon(Icons.exit_to_app),
                    title: const Text('Quitter'),
                    onTap: () => null,
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    );
  }
}
