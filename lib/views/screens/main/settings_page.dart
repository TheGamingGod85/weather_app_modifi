import 'package:flutter/material.dart';
import 'package:weather_app/views/widgets/settings_page_widgets/log_out_widget.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Wrap(
            children: [
              Text('Settings Page!'),
            ],
          ),
        ),
        floatingActionButton: LogOutWidget(),
      ),
    );
  }
}
