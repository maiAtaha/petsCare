import 'package:flutter/material.dart';

class Mainclinicscreen extends StatefulWidget {
  const Mainclinicscreen({super.key});

  @override
  State<Mainclinicscreen> createState() => _MainclinicscreenState();
}

class _MainclinicscreenState extends State<Mainclinicscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          "Clinic Details",
          style: TextStyle(
            color: Colors.black,
            fontSize: 18,
            fontFamily: 'Poppins3',
            fontWeight: FontWeight.w500,
            letterSpacing: 1.08,
          ),
        ),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          // Background Image
          Container(
            height: MediaQuery.of(context).size.height * 0.4,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                  'assets/images/clicniphoto3.jpg',
                ),
                fit: BoxFit.cover,
              ),
            ),
          ),

          // Content
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: MediaQuery.of(context).size.height * 0.3),

                // Clinic Card
                Container(
                  padding: const EdgeInsets.all(20),
                  decoration: const BoxDecoration(
                    color: Colors.white,
                    borderRadius:
                        BorderRadius.vertical(top: Radius.circular(30)),
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Clinic Avatar and Name
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage(
                              'assets/images/photocli.jpg',
                            ),
                          ),
                          const SizedBox(height: 16),
                          Text(
                            'VetCave',
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                          const SizedBox(height: 8),
                          Text(
                            'Kmagzan',
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color: Colors.grey,
                                ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Rating
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(Icons.star, color: Colors.amber, size: 24),
                          Icon(Icons.star, color: Colors.amber, size: 24),
                          Icon(Icons.star, color: Colors.amber, size: 24),
                          Icon(Icons.star, color: Colors.amber, size: 24),
                          Icon(Icons.star_outline,
                              color: Colors.amber, size: 24),
                          const SizedBox(width: 8),
                          Text(
                            '4 Stars',
                            style: Theme.of(context).textTheme.titleMedium,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Address Section
                      Text(
                        'Address',
                        style: Theme.of(context).textTheme.titleLarge?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        '123 Veterinary Street, Pet City, PC 12345',
                        style: Theme.of(context).textTheme.bodyLarge,
                      ),

                      const SizedBox(height: 40),

                      // Book Appointment Button
                      SizedBox(
                        width: double.infinity,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.blueAccent,
                            padding: const EdgeInsets.symmetric(vertical: 16),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            // Handle booking appointment
                          },
                          child: const Text(
                            'Book Appointment',
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
