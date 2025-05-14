import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> with TickerProviderStateMixin {
  late AnimationController _controller;
  final ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      duration: const Duration(seconds: 3),
      vsync: this,
    )..forward();
  }

  @override
  void dispose() {
    _controller.dispose();
    _scrollController.dispose();
    super.dispose();
  }

  Widget buildStatItem(int end, String label) {
    return TweenAnimationBuilder<int>(
      tween: IntTween(begin: 0, end: end),
      duration: const Duration(seconds: 3),
      builder: (context, value, child) {
        return Column(
          children: [
            Text(
              "$value+",
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(5),
            Text(
              label,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        );
      },
    );
  }

  Widget buildFeatureCard(IconData icon, String title, String description) {
    return Card(
      elevation: 4,
      margin: const EdgeInsets.all(16),
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Icon(icon, size: 40, color: Colors.blue),
            const Gap(15),
            Text(
              title,
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
            const Gap(10),
            Text(
              description,
              style: TextStyle(
                fontSize: 16,
                color: Colors.grey[700],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final screenHeight = MediaQuery.of(context).size.height;
    final screenWidth = MediaQuery.of(context).size.width;
    final isMobile = screenWidth < 600;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Privatily'),
        elevation: 0,
        actions: [
          IconButton(
            icon: const Icon(Icons.menu),
            onPressed: () {},
          ),
        ],
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          controller: _scrollController,
          child: Column(
            children: [
              // 💬 Top Text
              Container(
                width: double.infinity,
                color: Colors.white,
                padding: EdgeInsets.symmetric(
                  horizontal: isMobile ? 20 : 40,
                  vertical: 40,
                ),
                child: Column(
                  children: [
                    Text(
                      'Form your company\nfrom anywhere.',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 50,
                        fontWeight: FontWeight.bold,
                        height: 1.2,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Text(
                      'Join the thousands of entrepreneurs using our platform to incorporate their\ncompanies and unlock premium payment & banking options.',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 17,
                        fontWeight: FontWeight.bold,
                        color: Colors.black87,
                        height: 1.5,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Wrap(
                      alignment: WrapAlignment.center,
                      crossAxisAlignment: WrapCrossAlignment.center,
                      children: [
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        const Icon(Icons.star, color: Colors.amber, size: 20),
                        Container(
                          margin: const EdgeInsets.symmetric(horizontal: 10),
                          height: 20,
                          width: 1,
                          color: Colors.grey[400],
                        ),
                        Text(
                          'Rated 4.9/5 by entrepreneurs worldwide',
                          style: TextStyle(
                            fontSize: isMobile ? 12 : 14,
                            fontWeight: FontWeight.bold,
                            color: Colors.black,
                          ),
                        ),
                      ],
                    ),
                    const Gap(30),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 40, vertical: 15),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get Started',
                        style: TextStyle(fontSize: 18),
                      ),
                    ),
                  ],
                ),
              ),

              // 🖼️ Image Section
              Container(
                width: screenWidth,
                height: isMobile ? screenHeight * 0.5 : screenHeight * 0.8,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(
                      'https://images.unsplash.com/photo-1522071820081-009f0129c71c?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                    ),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // 🔢 Stats with Count-Up Animation
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: Colors.white,
                child: isMobile
                    ? Column(
                  children: [
                    buildStatItem(23000, "Clients"),
                    const Gap(30),
                    buildStatItem(28000, "Companies formed"),
                    const Gap(30),
                    buildStatItem(150, "Countries served"),
                    const Gap(30),
                    buildStatItem(6, "Years of experience"),
                  ],
                )
                    : Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildStatItem(23000, "persons"),
                    buildStatItem(28000, "Companies formed"),
                    buildStatItem(150, "Countries served"),
                    buildStatItem(6, "months of experience"),
                  ],
                ),
              ),

              // Why Privatily Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: Colors.white,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Why Privatily Section
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Text(
                        'Why Privatily?',
                        style: TextStyle(
                          fontSize: isMobile ? 36 : 48,
                          fontWeight: FontWeight.bold,
                          color: Colors.grey[800],
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(20),
                      child: isMobile
                          ? Column(
                        children: [
                          Image.network(
                            'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                            fit: BoxFit.cover,
                          ),
                          const Gap(20),
                          Text(
                            'We know how to take the complexity out of forming your company because we\'ve been in your shoes. Privatily was born because we struggled ourselves—facing a complicated, lengthy process when trying to set up our own company in a supported country. Since 2019, we\'ve been committed to providing unmatched expertise, affordable prices, and the fastest turnaround time to help entrepreneurs like you start your business journey smoothly and confidently.',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.grey[700],
                            ),
                          ),
                        ],
                      )
                          : Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Expanded(
                            flex: 2,
                            child: Text(
                              'We know how to take the complexity out of forming your company because we\'ve been in your shoes. Privatily was born because we struggled ourselves—facing a complicated, lengthy process when trying to set up our own company in a supported country. Since 2019, we\'ve been committed to providing unmatched expertise, affordable prices, and the fastest turnaround time to help entrepreneurs like you start your business journey smoothly and confidently.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[700],
                              ),
                            ),
                          ),
                          const Gap(20),
                          Expanded(
                            flex: 3,
                            child: Image.network(
                              'https://images.unsplash.com/photo-1551288049-bebda4e38f71?ixlib=rb-1.2.1&auto=format&fit=crop&w=1350&q=80',
                              fit: BoxFit.contain,
                            ),
                          ),
                        ],
                      ),
                    ),
                    // Features
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 20),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Gap(20),
                          const Row(
                            children: [
                              Icon(Icons.verified_user, color: Colors.blue),
                              Gap(8),
                              Text(
                                'Expert guidance since 2019',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const Gap(15),
                          const Row(
                            children: [
                              Icon(Icons.attach_money, color: Colors.green),
                              Gap(8),
                              Text(
                                'Affordable, no hidden fees',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const Gap(15),
                          const Row(
                            children: [
                              Icon(Icons.speed, color: Colors.orange),
                              Gap(8),
                              Text(
                                'Fastest turnaround time',
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Colors.black87,
                                ),
                              ),
                            ],
                          ),
                          const Gap(40),
                          Text(
                            'Our Services',
                            style: TextStyle(
                              fontSize: isMobile ? 36 : 48,
                              fontWeight: FontWeight.bold,
                              color: Colors.grey[800],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // Features Grid
              GridView.count(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                crossAxisCount: isMobile ? 1 : 2,
                childAspectRatio: isMobile ? 1.5 : 1.8,
                children: [
                  buildFeatureCard(
                    Icons.business,
                    'Company Formation',
                    'We handle all the paperwork and legal requirements to get your business registered quickly and efficiently.',
                  ),
                  buildFeatureCard(
                    Icons.account_balance,
                    'Banking Solutions',
                    'Get access to premium banking options and payment processing tailored for your business needs.',
                  ),
                  buildFeatureCard(
                    Icons.people,
                    'Team Expansion',
                    'Easily add team members and manage your company structure as your business grows.',
                  ),
                  buildFeatureCard(
                    Icons.language,
                    'Global Support',
                    'We support company formation in multiple countries with local expertise in each region.',
                  ),
                ],
              ),

              // Testimonials
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 60),
                color: Colors.grey[100],
                child: Column(
                  children: [
                    Text(
                      'What Our Clients Say',
                      style: TextStyle(
                        fontSize: isMobile ? 36 : 48,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey[800],
                      ),
                    ),
                    const Gap(40),
                    SizedBox(
                      width: isMobile ? screenWidth * 0.9 : screenWidth * 0.7,
                      child: const Column(
                        children: [
                          TestimonialCard(
                            name: 'Sarah Johnson',
                            role: 'Founder, TechStart',
                            text:
                            'Privatily made the entire process of setting up my company seamless. What would have taken me weeks of research and paperwork was done in just a few days!',
                            rating: 5,
                          ),
                          Gap(30),
                          TestimonialCard(
                            name: 'Michael Chen',
                            role: 'CEO, Global Ventures',
                            text:
                            'The banking solutions they provided saved us countless hours of frustration. Highly recommend their services to any entrepreneur looking to expand internationally.',
                            rating: 5,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // CTA Section
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 80),
                color: Colors.blue[800],
                child: Column(
                  children: [
                    Text(
                      'Ready to Start Your Business Journey?',
                      style: TextStyle(
                        fontSize: isMobile ? 28 : 40,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(20),
                    Text(
                      'Join thousands of entrepreneurs who trust Privatily for their company formation needs.',
                      style: TextStyle(
                        fontSize: isMobile ? 16 : 18,
                        color: Colors.white70,
                      ),
                      textAlign: TextAlign.center,
                    ),
                    const Gap(40),
                    ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 20),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(30),
                        ),
                      ),
                      child: const Text(
                        'Get Started Today',
                        style: TextStyle(
                          fontSize: 18,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              // Footer
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(vertical: 40),
                color: Colors.grey[900],
                child: Column(
                  children: [
                    isMobile
                        ? Column(
                      children: [
                        const Text(
                          'Privatily',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                        const Gap(20),
                        Text(
                          'Simplifying company formation for entrepreneurs worldwide since 2019.',
                          style: TextStyle(
                            fontSize: 16,
                            color: Colors.grey[400],
                          ),
                          textAlign: TextAlign.center,
                        ),
                      ],
                    )
                        : Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Privatily',
                              style: TextStyle(
                                fontSize: 24,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(10),
                            Text(
                              'Simplifying company formation for\nentrepreneurs worldwide since 2019.',
                              style: TextStyle(
                                fontSize: 16,
                                color: Colors.grey[400],
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Services',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(10),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Company Formation',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Banking Solutions',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Legal Support',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Company',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(10),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'About Us',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Contact',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Careers',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                        Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Text(
                              'Legal',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                            const Gap(10),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Terms of Service',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: const Text(
                                'Privacy Policy',
                                style: TextStyle(color: Colors.white70),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const Gap(40),
                    const Divider(color: Colors.grey),
                    const Gap(20),
                    Text(
                      '© 2023 Privatily. All rights reserved.',
                      style: TextStyle(
                        fontSize: 14,
                        color: Colors.grey[500],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class TestimonialCard extends StatelessWidget {
  final String name;
  final String role;
  final String text;
  final int rating;

  const TestimonialCard({
    super.key,
    required this.name,
    required this.role,
    required this.text,
    required this.rating,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 4,
      child: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                for (int i = 0; i < rating; i++)
                  const Icon(Icons.star, color: Colors.amber, size: 20),
                for (int i = rating; i < 5; i++)
                  const Icon(Icons.star_border, color: Colors.grey, size: 20),
              ],
            ),
            const Gap(15),
            Text(
              text,
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black87,
                height: 1.5,
              ),
            ),
            const Gap(20),
            Text(
              name,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              role,
              style: TextStyle(
                fontSize: 14,
                color: Colors.grey[600],
              ),
            ),
          ],
        ),
      ),
    );
  }
}