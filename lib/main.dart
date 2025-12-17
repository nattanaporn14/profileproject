import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});
       
  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  // ฟังก์ชันเปิดลิงก์
  Future<void> _launchUrl(String url) async {
    final uri = Uri.parse(url);
    if (!await launchUrl(uri, mode: LaunchMode.externalApplication)) {
      throw 'ไม่สามารถเปิดลิงก์ได้';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('My Profile'),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // รูปโปรไฟล์
                const CircleAvatar(
                  radius: 60,
                  backgroundImage: NetworkImage('https://scontent-bkk1-1.xx.fbcdn.net/v/t39.30808-1/469926130_2340101489657726_6255201476460214633_n.jpg?stp=dst-jpg_s200x200_tt6&_nc_cat=106&ccb=1-7&_nc_sid=e99d92&_nc_ohc=cvAa5Dlfs2AQ7kNvwEQIqSq&_nc_oc=AdlHpqx1xZp5JKyBb1FR15Ujb1BmaQwvKiJ_EocKUpkHN6HRcWMrpr2Kz2kXJBtssAQ&_nc_zt=24&_nc_ht=scontent-bkk1-1.xx&_nc_gid=qmvHZM0N_PtPB0rsXwU7KQ&oh=00_Aflx5-DiEWIaGXb_cF8D2g7ijSNe823d0z-4QI4r1iXvbQ&oe=69470736'),
                ),

                const SizedBox(height: 16),

                // ชื่อ
                const Text(
                  'ณัฐธนาภรณ์ อุ้ยเพชร',
                  style: TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                const SizedBox(height: 8),

                // รหัสนักศึกษา
                const Text(
                  'รหัสนักศึกษา: 663450309-4',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 4),

                // หลักสูตร
                const Text(
                  'หลักสูตร: วิทยาการคอมพิวเตอร์',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 4),

                // มหาวิทยาลัย
                const Text(
                  'มหาวิทยาลัย: มหาวิทยาลัยขอนแก่น',
                  style: TextStyle(fontSize: 16),
                ),

                const SizedBox(height: 20),

                // ปุ่มลิงก์
                ElevatedButton.icon(
                  onPressed: () =>
                      _launchUrl('https://github.com/nattanaporn14'),
                  icon: const Icon(Icons.code),
                  label: const Text('GitHub'),
                ),

                const SizedBox(height: 8),

                ElevatedButton.icon(
                  onPressed: () =>
                      _launchUrl('https://www.facebook.com/share/17r8WvCcqC/?mibextid=wwXIfr'),
                  icon: const Icon(Icons.facebook),
                  label: const Text('Facebook'),
                ),

                const SizedBox(height: 8),

                ElevatedButton.icon(
                  onPressed: () =>
                      _launchUrl('https://www.instagram.com/natty._.ntnpr_a?igsh=MXUzdGJzamJmMTM0Yg=='),
                  icon: const Icon(Icons.camera_alt),
                  label: const Text('Instagram'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
