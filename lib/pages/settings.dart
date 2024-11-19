
// class Settings extends StatefulWidget {
//   const Settings({super.key});

//   @override
//   State<Settings> createState() => _SettingsState();
// }

// class _SettingsState extends State<Settings> {
//   @override
//   Widget build(BuildContext context) {
//     return const Scaffold(backgroundColor: Color(0xFF121212),
//     body: ,
//     );
//   }
// }

// import 'package:shared_preferences/shared_preferences.dart';

// class SettingsScreen extends StatefulWidget {
  
//   @override
//   _SettingsScreenState createState() => _SettingsScreenState();
// }

// class _SettingsScreenState extends State<SettingsScreen> {
//   bool _isDarkMode = false;
//   bool _notificationsEnabled = true;

  
//   @override
//   void initState() {
//     super.initState();
//     _loadSettings();
//   }

//   _loadSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     setState(() {
//       _isDarkMode = prefs.getBool('darkMode') ?? false;
//       _notificationsEnabled = prefs.getBool('notificationsEnabled') ?? true;
//     });
//   }

//   _saveSettings() async {
//     SharedPreferences prefs = await SharedPreferences.getInstance();
//     prefs.setBool('darkMode', _isDarkMode);
//     prefs.setBool('notificationsEnabled', _notificationsEnabled);
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text('Settings'),
//         backgroundColor: const Color(0xFF1F1F1F),
//       ),
//       backgroundColor: const Color(0xFF121212),
//       body: Padding(
//         padding: const EdgeInsets.all(16),
//         child: ListView(
//           children: [
//             SwitchListTile(
//               title: const Text(
//                 'Dark Mode',
//                 style: TextStyle(color: Colors.white),
//               ),
//               value: _isDarkMode,
//               onChanged: (bool value) {
//                 setState(() {
//                   _isDarkMode = value;
//                 });
//                 _saveSettings();
//               },
//               activeColor: Colors.blue,
//             ),


//             SwitchListTile(
//               title: const Text(
//                 'Enable Notifications',
//                 style: TextStyle(color: Colors.white),
//               ),
//               value: _notificationsEnabled,
//               onChanged: (bool value) {
//                 setState(() {
//                   _notificationsEnabled = value;
//                 });
//                 _saveSettings();
//               },
//               activeColor: Colors.blue,
//             ),

//             ListTile(
//               title: const Text(
//                 'Language',
//                 style: TextStyle(color: Colors.white),
//               ),
//               trailing: const Icon(Icons.arrow_forward, color: Colors.white),
//               onTap: () {
  
//                 _showLanguageDialog();
//               },
//             ),

//             ElevatedButton(
//               onPressed: () {
//                 setState(() {
//                   _isDarkMode = false;
//                   _notificationsEnabled = true;
//                 });
//                 _saveSettings();
//               },
//               style: ElevatedButton.styleFrom(
//                 backgroundColor: const Color(0xFF3A86FF),
//                 padding: const EdgeInsets.symmetric(vertical: 12),
//               ),
//               child: const Text('Reset to Default'),
//             ),
//           ],
//         ),
//       ),
//     );
//   }

  
//   _showLanguageDialog() {
//     showDialog(
//       context: context,
//       builder: (context) {
//         return AlertDialog(
//           title: const Text('Select Language'),
//           content: Column(
//             mainAxisSize: MainAxisSize.min,
//             children: [
//               ListTile(
//                 title: const Text('English'),
//                 onTap: () {
        
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('Spanish'),
//                 onTap: () {
              
//                   Navigator.pop(context);
//                 },
//               ),
//               ListTile(
//                 title: const Text('French'),
//                 onTap: () {
                
//                   Navigator.pop(context);
//                 },
//               ),
//             ],
//           ),
//         );
//       },
//     );
//   }
// }
