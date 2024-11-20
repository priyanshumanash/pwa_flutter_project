import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import 'package:fl_chart/fl_chart.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Dashboard',
      theme: ThemeData(
        primarySwatch: Colors.indigo,
        textTheme: GoogleFonts.robotoTextTheme(),
      ),
      home: DashboardPage(),
    );
  }
}

class DashboardPage extends StatelessWidget {
  DashboardPage({super.key});

  final PageController _pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        backgroundColor: Colors.indigo,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.indigo,
              ),
              child: Text(
                'Menu',
                style: GoogleFonts.roboto(
                  color: Colors.white,
                  fontSize: 24,
                ),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.dashboard),
              title: const Text('Dashboard'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.settings),
              title: const Text('Settings'),
              onTap: () {
                // Handle navigation
              },
            ),
            ListTile(
              leading: const Icon(Icons.logout),
              title: const Text('Logout'),
              onTap: () {
                // Handle navigation
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Header Section
              Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.indigo,
                  borderRadius: BorderRadius.circular(16),
                ),
                child: Center(
                  child: Text(
                    'Welcome to Your Dashboard!',
                    style: GoogleFonts.roboto(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20),

              // Dashboard Widgets
              Row(
                children: [
                  buildStatCard('Total Trades', '320', Icons.bar_chart, Colors.blue),
                  const SizedBox(width: 16),
                  buildStatCard('Profit', '\$12,400', Icons.attach_money, Colors.green),
                ],
              ),
              const SizedBox(height: 20),

              // Chart Section
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: const [
                    BoxShadow(
                      color: Colors.black12,
                      blurRadius: 8,
                      offset: Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Performance Overview',
                      style: GoogleFonts.roboto(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.indigo[900],
                      ),
                    ),
                    const SizedBox(height: 16),
                    SizedBox(
                      height: 200,
                      child: LineChart(
                        LineChartData(
                          gridData: FlGridData(show: true),
                          borderData: FlBorderData(show: true),
                          titlesData: FlTitlesData(show: true),
                          lineBarsData: [
                            LineChartBarData(
                              isCurved: true,
                              spots: [
                                FlSpot(0, 3),
                                FlSpot(1, 1.5),
                                FlSpot(2, 4),
                                FlSpot(3, 3.5),
                                FlSpot(4, 5),
                                FlSpot(5, 6),
                              ],
                              colors: [Colors.indigo],
                              barWidth: 4,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),

              // Smooth Page Indicator Section
              Text(
                'Quick Highlights',
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.indigo[900],
                ),
              ),
              const SizedBox(height: 16),
              SizedBox(
                height: 180,
                child: PageView(
                  controller: _pageController,
                  children: [
                    buildPage('Fast Performance', 'Optimized for speed.', Icons.speed),
                    buildPage('Cross-Platform', 'Runs on all devices.', Icons.devices),
                    buildPage('Customizable Design', 'Tailor the UI.', Icons.brush),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              SmoothPageIndicator(
                controller: _pageController,
                count: 3,
                effect: const ExpandingDotsEffect(
                  dotColor: Colors.grey,
                  activeDotColor: Colors.indigo,
                  dotHeight: 8,
                  dotWidth: 8,
                  expansionFactor: 3,
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildStatCard(String title, String value, IconData icon, Color color) {
    return Expanded(
      child: Container(
        padding: const EdgeInsets.all(16),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16),
          boxShadow: const [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 8,
              offset: Offset(0, 4),
            ),
          ],
        ),
        child: Column(
          children: [
            Icon(icon, size: 40, color: color),
            const SizedBox(height: 10),
            Text(
              value,
              style: GoogleFonts.roboto(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: color,
              ),
            ),
            const SizedBox(height: 5),
            Text(
              title,
              style: GoogleFonts.roboto(
                fontSize: 14,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage(String title, String description, IconData icon) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 16),
      decoration: BoxDecoration(
        color: Colors.indigo[50],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(icon, size: 80, color: Colors.indigo),
          const SizedBox(height: 16),
          Text(
            title,
            style: GoogleFonts.roboto(
              fontSize: 22,
              fontWeight: FontWeight.bold,
              color: Colors.indigo[900],
            ),
          ),
          const SizedBox(height: 10),
          Text(
            description,
            style: GoogleFonts.roboto(
              fontSize: 16,
              color: Colors.grey[700],
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
