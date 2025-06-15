import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:flutter_l10n_localization/routes/app_route.dart';


class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;

    return Scaffold(
      appBar: AppBar(title: Text(loc.appTitle)),
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(child: Text(loc.appTitle)),
            ListTile(
              title: Text(loc.settings),
              onTap: () => Navigator.pushNamed(context, RouteNames.settings),
            ),
            ListTile(
              title: Text(loc.about),
              onTap: () => Navigator.pushNamed(context, RouteNames.about),
            ),
          ],
        ),
      ),
      body: Center(
        child: Semantics(
          label: loc.greeting,
          child: Text(
            loc.greeting,
            style: TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
          ),
        ),
      ),
    );
  }
}
