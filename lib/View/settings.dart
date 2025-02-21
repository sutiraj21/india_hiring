
import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  @override
  _SettingsPageState createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  String selectedLanguage = 'English';
  String selectedEnvironment = 'Production';
  bool isCustomThemeEnabled = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Settings')),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            _buildSettingTile(
              icon: Icons.language,
              title: 'Language',
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                items: ['English', 'Spanish', 'French']
                    .map((lang) => DropdownMenuItem(value: lang, child: Text(lang)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedLanguage = value!);
                },
              ),
            ),
            _buildSettingTile(
              icon: Icons.settings,
              title: 'Environment',
              trailing: DropdownButton<String>(
                value: selectedEnvironment,
                items: ['Development', 'Staging', 'Production']
                    .map((env) => DropdownMenuItem(value: env, child: Text(env)))
                    .toList(),
                onChanged: (value) {
                  setState(() => selectedEnvironment = value!);
                },
              ),
            ),
            _buildSettingTile(
              icon: Icons.devices,
              title: 'Platform',
              trailing: Text('Mobile'),
            ),
            _buildSettingTile(
              icon: Icons.palette,
              title: 'Enable Custom Theme',
              trailing: Switch(
                value: isCustomThemeEnabled,
                onChanged: (value) {
                  setState(() => isCustomThemeEnabled = value);
                },
              ),
            ),
            Divider(),
            _buildSettingTile(
              icon: Icons.phone,
              title: 'Phone Number',
              trailing: Text('+1234567890'),
            ),
            _buildSettingTile(
              icon: Icons.email,
              title: 'Email',
              trailing: Text('you@example.com'),
            ),
            SizedBox(height: 20),
            ElevatedButton.icon(
              icon: Icon(Icons.logout, color: Colors.white),
              label: Text('Sign Out', style: TextStyle(color: Colors.white)),
              style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
              onPressed: () {
                // Handle sign out logic here
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSettingTile({required IconData icon, required String title, required Widget trailing}) {
    return ListTile(
      leading: Icon(icon),
      title: Text(title),
      trailing: trailing,
    );
  }
}
