import 'dart:io';
import 'package:flutter/material.dart';

void main() {
  runApp(CryptoCoreApp());
}

class CryptoCoreApp extends StatefulWidget {
  @override
  State<CryptoCoreApp> createState() => _CryptoCoreAppState();
}

class _CryptoCoreAppState extends State<CryptoCoreApp> {
  bool _isDarkMode = true;

  ThemeData get _darkTheme => ThemeData.dark().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.black,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade800,
      foregroundColor: Colors.white,
      elevation: 4,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.white70),
      displaySmall: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.blue),
    ),
    cardColor: Colors.grey.shade900,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.black,
        backgroundColor: Colors.blue,
        elevation: 6,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  ThemeData get _lightTheme => ThemeData.light().copyWith(
    primaryColor: Colors.blue,
    scaffoldBackgroundColor: Colors.white,
    appBarTheme: AppBarTheme(
      backgroundColor: Colors.blue.shade300,
      foregroundColor: Colors.black,
      elevation: 4,
    ),
    textTheme: TextTheme(
      bodyLarge: TextStyle(fontSize: 18, color: Colors.black87),
      displaySmall: TextStyle(
          fontSize: 36, fontWeight: FontWeight.bold, color: Colors.black),
    ),
    cardColor: Colors.grey.shade200,
    elevatedButtonTheme: ElevatedButtonThemeData(
      style: ElevatedButton.styleFrom(
        foregroundColor: Colors.white,
        backgroundColor: Colors.blue.shade600,
        elevation: 6,
        padding: EdgeInsets.symmetric(horizontal: 24, vertical: 16),
        shape:
        RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      ),
    ),
  );

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'CryptoCore Stream Station',
      debugShowCheckedModeBanner: false,
      theme: _isDarkMode ? _darkTheme : _lightTheme,
      home: WelcomePage(
        toggleTheme: () => setState(() => _isDarkMode = !_isDarkMode),
        isDark: _isDarkMode,
      ),
    );
  }
}

class WelcomePage extends StatelessWidget {
  final VoidCallback toggleTheme;
  final bool isDark;

  WelcomePage({required this.toggleTheme, required this.isDark});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('CryptoCore Stream Station'),
        actions: [
          IconButton(
            icon: Icon(isDark ? Icons.light_mode : Icons.dark_mode),
            tooltip: 'Toggle Theme',
            onPressed: toggleTheme,
          )
        ],
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.sports_esports, size: 100, color: Colors.blue),
              SizedBox(height: 20),
              Text(
                'Welcome to CryptoCore',
                style: Theme.of(context).textTheme.displaySmall,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 16),
              Text(
                'Stream GPU-powered apps to your phone with Sunshine and Moonlight.',
                style: Theme.of(context).textTheme.bodyLarge,
                textAlign: TextAlign.center,
              ),
              SizedBox(height: 40),
              ElevatedButton.icon(
                icon: Icon(Icons.play_circle_fill),
                label: Text('Launch Streaming Console'),
                onPressed: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (_) => StreamingPage(),
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class StreamingPage extends StatefulWidget {
  @override
  _StreamingPageState createState() => _StreamingPageState();
}

class _StreamingPageState extends State<StreamingPage> {
  String _status = 'Idle';
  Process? _sunshineProcess;

  Future<void> _startStreaming() async {
    setState(() {
      _status = 'Launching Sunshine...';
    });

    try {
      _sunshineProcess = await Process.start(
        'D:\\Sunshine\\sunshine.exe',
        [],
        runInShell: true,
      );

      _sunshineProcess?.stdout.transform(SystemEncoding().decoder).listen(
            (data) {
          print('stdout: $data');
        },
      );

      _sunshineProcess?.stderr.transform(SystemEncoding().decoder).listen(
            (data) {
          print('stderr: $data');
        },
      );

      setState(() {
        _status = 'Sunshine launched. Waiting for client...';
      });
    } catch (e) {
      setState(() {
        _status = 'Error launching Sunshine: $e';
      });
    }
  }

  Future<void> _stopStreaming() async {
    if (_sunshineProcess != null) {
      _sunshineProcess!.kill();
      setState(() {
        _status = 'Streaming stopped.';
        _sunshineProcess = null;
      });
    } else {
      setState(() {
        _status = 'No active streaming process.';
      });
    }
  }

  @override
  void dispose() {
    _sunshineProcess?.kill();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        title: Text('Streaming Control Panel'),
        centerTitle: true,
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(32.0),
          child: Card(
            elevation: 8,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(Icons.wifi_tethering, size: 80, color: Colors.blue),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _startStreaming,
                    icon: Icon(Icons.play_arrow),
                    label: Text('Start Streaming'),
                  ),
                  SizedBox(height: 20),
                  ElevatedButton.icon(
                    onPressed: _stopStreaming,
                    icon: Icon(Icons.stop_circle),
                    label: Text('Stop Streaming'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red.shade600,
                      foregroundColor: Colors.white,
                    ),
                  ),
                  SizedBox(height: 30),
                  Text(
                    _status,
                    style: theme.textTheme.bodyLarge,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
