import 'package:flutter/material.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:provider/provider.dart';
import '../core/localization_provider.dart';
import '../core/theme_provider.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    final loc = AppLocalizations.of(context)!;
    final locProvider = Provider.of<LocalizationProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);

    return Scaffold(
      appBar: AppBar(title: Text(loc.settings)),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          children: [
            Text(loc.changeLanguage, style: const TextStyle(fontSize: 18)),
            const SizedBox(height: 10),
            Row(
              children: [
                ElevatedButton(
                  onPressed: () => locProvider.setLocale(const Locale('en')),
                  child: const Text('English'),
                ),
                const SizedBox(width: 10),
                ElevatedButton(
                  onPressed: () => locProvider.setLocale(const Locale('bn')),
                  child: const Text('বাংলা'),
                ),
              ],
            ),
            const SizedBox(height: 20),
            SwitchListTile(
              value: themeProvider.themeMode == ThemeMode.dark,
              onChanged: themeProvider.toggleTheme,
              title: Text("Dark Mode"),
            )
          ],
        ),
      ),
    );
  }
}
