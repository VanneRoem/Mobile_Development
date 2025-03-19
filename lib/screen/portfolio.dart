import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class PortfolioScreen extends StatelessWidget {
  const PortfolioScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        title: Row(
          children: [
            Image.asset(
              'assets/images/nee.png',
              height: 60,
              width: 50,
              fit: BoxFit.cover,
            ),
            const SizedBox(width: 10),
            const Text(
              'My Portfolio',
              style: TextStyle(fontSize: 20, color: Colors.white),
            ),
          ],
        ),
        actions: [
          IconButton(
            onPressed: () {
              // ignore: avoid_print
              print('Menu button pressed');
            },
            icon: const Icon(Icons.menu),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(height: 50),
            const Center(
              child: SizedBox(
                height: 350,
                width: 350,
                child: CircleAvatar(
                  backgroundImage: AssetImage('assets/images/mypic.jpg'),
                  radius: 100,
                ),
              ),
            ),
            SizedBox(height: 50),
            Column(
              children: [
                const Text(
                  'Welcome to my Portfolio',
                  style: TextStyle(fontSize: 25),
                ),
                const Text(
                  'Hi I\'m',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Vanne',
                  style: TextStyle(
                    fontSize: 50,
                    fontWeight: FontWeight.bold,
                    color: Colors.blue,
                  ),
                ),
                const Text(
                  'Flutter',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'Developer',
                  style: TextStyle(fontSize: 50, fontWeight: FontWeight.bold),
                ),
                const Text(
                  'I\'m an aspiring Flutter developer,',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'learning to build cross-platform apps.',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'I’m improving my UI design',
                  style: TextStyle(fontSize: 20),
                ),
                const Text(
                  'and state management skills.',
                  style: TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: SocialMediaButton(
                    url: 'https://www.facebook.com/vannel.roem',
                  ),
                ),

                const SizedBox(height: 20),
                SizedBox(
                  height: 50,
                  width: 300,
                  child: CVButton(
                    url: 'https://www.facebook.com/vannel.roem',
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SocialMediaButton extends StatelessWidget {
  final String url;

  const SocialMediaButton({super.key, required this.url});

  Future<void> _launchURL() async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: ElevatedButton(
        onPressed: _launchURL,
        style: ButtonStyle(
          backgroundColor: WidgetStateProperty.all(Colors.blue),
          foregroundColor: WidgetStateProperty.all(Colors.white),
        ),
        child: Text("Hire Me!"),
      ),
    );
  }
}

class CVButton extends StatelessWidget {
  final String url;

  const CVButton({super.key, required this.url});

  Future<void> _launchURL() async {
    Uri uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 50,
      width: 300,
      child: OutlinedButton(
        onPressed: _launchURL,
        style: OutlinedButton.styleFrom(
          side: BorderSide(color: Colors.blue, width: 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text("Download CV", style: TextStyle(color: Colors.blue)),
            SizedBox(width: 8),
            Icon(Icons.download, color: Colors.blue),
          ],
        ),
      ),
    );
  }
}