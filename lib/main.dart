import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        scaffoldBackgroundColor: Colors.grey[200],
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  Future<void> _navigateToHome() async { // async는 비동기 함수를 선언할 때 사용
    await Future.delayed(const Duration(seconds: 3)); // 3초간 기다림
    Navigator.of(context).pushReplacement(
      MaterialPageRoute(
        builder: (context) => const MyHomePage(),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: Colors.blueAccent,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(Icons.computer, size: 100.0, color: Colors.white,),
            SizedBox(height: 20.0),
            Text(
              'Project UI',
              style: TextStyle(
                fontSize: 24.0,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            )
          ],
        ),
      )
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  void _navigateToReservationPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const ReservationPage()),
    );
  }

  void _navigateToOrderPage() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const OrderPage()),
    );
  }
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Row(
          children: [
            Image.asset(
              'assets/images/hansung.PNG',
              height: 30,
            ),
            const SizedBox(width: 10.0),
            const Text(
              'HS COMPUTER',
              style: TextStyle(fontWeight: FontWeight.bold),
            )
          ],
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {
              // 동작
            },
          )
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            _buildSection(
              icon: Icons.people,
              title: '팀원 모집 게시판',
              children: [
                _buildCard(
                  title: '- 캡스톤 프론트엔드 팀원 구해요',
                  subtitle: '#캡스톤 #프론트앤드'
                ),
                 _buildCard(
                  title: '- 자바 소모임 인원 구해봅니다',
                  subtitle: '#자바 #소모임'
                ),
                _buildCard(
                  title: '- 프로젝트 같이 하실분',
                  subtitle: '#프로젝트 #팀원'
                ),
                const Text(
                  '[더보기]',
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
            const SizedBox(height: 20.0),
            _buildListTile(
              icon: Icons.announcement,
              title: '회의실 예약',
              subtitle: '회의실 예약 페이지로 이동',
              onTap: _navigateToReservationPage,
            ),
            const SizedBox(height: 20.0),
            _buildListTile(
              icon: Icons.local_cafe,
              title: '교내 카페 오더',
              subtitle: '교내 카페 오더 페이지로 이동',
              onTap: _navigateToOrderPage,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSection({
    required IconData icon,
    required String title,
    required List<Widget> children,
  }) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.2),
            spreadRadius: 2,
            blurRadius: 5,
            offset: const Offset(0, 2),
          ),
        ]
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12.0),
            decoration: BoxDecoration(
              color: Colors.blueAccent,
              borderRadius: BorderRadius.circular(8.0),
            ),
            child: Row(
              children: [
                Icon(icon, size: 24.0, color: Colors.white,),
                const SizedBox(width: 10.0),
                Text(
                  title,
                  style: const TextStyle(fontSize: 20, color: Colors.white),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10.0),
          ...children, // children 리스트의 모든 요소를 펼쳐서 반환
        ],
      )
    );
  }

  Widget _buildCard({
    required String title,
    required String subtitle,
  }) {
    return Card(
      elevation: 3,
      margin: const EdgeInsets.symmetric(vertical: 4.0),
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(fontSize: 16.0, fontWeight: FontWeight.w500), // w500은 글씨 굵기
            ),
            const SizedBox(height: 5),
            Text(
              subtitle,
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(8.0),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 5,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28.0),
            const SizedBox(width: 12.0),
            Expanded( // Expanded는 Row, Column, Flex의 자식 위젯이 가지는 크기를 확장
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18.0, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.grey),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward_ios, size: 20.0), 
          ],
        ),
      ),
    );
  }
}

class ReservationPage extends StatelessWidget {
  const ReservationPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Row(
          children: [
            Icon(Icons.announcement, size: 28.0),
            SizedBox(width: 8.0),
            Text('회의실 예약'),
          ],
        )
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: double.infinity,
                child: Image.asset(
                  'assets/images/image2.PNG',
                  fit: BoxFit.cover,
                  height: 350.0,
                ),
              ),
              const SizedBox(height: 16.0),
              _buildListTile(
                icon: Icons.schedule,
                title: '상상베이스 예약 현황',
                subtitle: '캘린더 및 장소로 확인',
                onTap: () {
                  // 예약 현황 페이지로 이동
                },
              ),
              const SizedBox(height: 16.0),
              _buildListTile(
                icon: Icons.schedule,
                title: '학술정보관 예약 현황',
                subtitle: '캘린더로 확인',
                onTap: () {
                  // 예약 현황 페이지로 이동
                },
              ),
              const SizedBox(height: 16.0),
              _buildListTile(
                icon: Icons.list,
                title: '추가 예정',
                subtitle: '추가 예정',
                onTap: () {
                  // 페이지로 이동
                },
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildListTile({
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: double.infinity,
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.black),
          borderRadius: BorderRadius.circular(8.0),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 28.0),
            const SizedBox(width: 8.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
            const Icon(Icons.arrow_forward), // 화살표 아이콘
          ],
        ),
      ),
    );
  }
}

class OrderPage extends StatelessWidget {
  const OrderPage({super.key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('교내 카페 오더'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Image.asset(
                    'assets/images/image3.PNG',
                    fit: BoxFit.cover,
                    height: 370.0,
                  ),
                ),
                const SizedBox(height: 8.0),
                const Text(
                  '오늘의 추천 메뉴',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
                const SizedBox(height: 5.0),
              ],
            ),
            _buildMenuItem(context, '아메리카노', '2,500원'),
            _buildMenuItem(context, '카페라떼', '3,000원'),
            _buildMenuItem(context, '카푸치노', '3,500원'),
            _buildMenuItem(context, '카페모카', '4,000원'),

            const SizedBox(height: 10.0),
            ElevatedButton(
              onPressed: () {

              },
              child: Text('AI 추천 메뉴'),
            )
          ],
        ),
      )
    );
  }

  Widget _buildMenuItem(BuildContext context, String name, String price){
    return ListTile(
      title: Text(name),
      trailing: Text(price),
    );
  } 
}