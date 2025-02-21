import 'package:flutter/material.dart';

class SubscriptionScreen extends StatelessWidget {
  const SubscriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text(
          'IndiaHirings',
          style: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.blue,
          ),
        ),
        centerTitle: true,
        elevation: 1,
        actions: [
          IconButton(
            icon: const Icon(Icons.notifications, color: Colors.blue),
            onPressed: () {},
          ),
          IconButton(
            icon: const Icon(Icons.account_circle, color: Colors.blue),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // const Text(
            //   'Subscription Plans',
            //   style: TextStyle(
            //     fontSize: 28,
            //     fontWeight: FontWeight.bold,
            //     color: Colors.black,
            //   ),
            // ),
            const SizedBox(height: 16),
            _buildPlanCard(
              title: 'Basic',
              price: '\$19.99/month',
              features: [
                'Post 5 Jobs',
                'Basic Candidate Filtering',
                'Email Support',
              ],
              color: Colors.blue.shade100,
              onPressed: () {
                _showSnackbar(context, 'Basic Plan Selected');
              },
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              title: 'Standard',
              price: '\$49.99/month',
              features: [
                'Post 20 Jobs',
                'Advanced Candidate Filtering',
                'Priority Email & Chat Support',
              ],
              color: Colors.blue.shade200,
              onPressed: () {
                _showSnackbar(context, 'Standard Plan Selected');
              },
            ),
            const SizedBox(height: 16),
            _buildPlanCard(
              title: 'Premium',
              price: '\$99.99/month',
              features: [
                'Unlimited Job Posts',
                'Advanced Filtering & Analytics',
                'Dedicated Support Manager',
              ],
              color: Colors.blue.shade300,
              onPressed: () {
                _showSnackbar(context, 'Premium Plan Selected');
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildPlanCard({
    required String title,
    required String price,
    required List<String> features,
    required Color color,
    required VoidCallback onPressed,
  }) {
    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(15),
        boxShadow: [
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.1), // Soft Blue Glow
            blurRadius: 15,
            offset: const Offset(0, 1),
          ),
          BoxShadow(
            color: Colors.purpleAccent.withOpacity(0.1), // Soft Purple Glow
            blurRadius: 20,
            offset: const Offset(0, 1),
          ),
        ],
        border: Border.all(
          color: Colors.grey.shade400, // Purple from BottomNavigation
          width: 2,
        ),),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              color: Color(0xFF512DA8), // Deep Purple for Heading
            ),),
          const SizedBox(height: 4),
          Text(
            price,
            style:  TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold,
              color: Colors.green.shade200,
            ),
          ),
          const SizedBox(height: 12),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: features
                .map(
                  (feature) => Row(
                children: [
                  const Icon(Icons.check, color: Color(0xFF2196F3)), // Blue Check Icon
                  const SizedBox(width: 8),
                  Text(
                    feature,
                    style: const TextStyle(
                      color: Color(0xFF303F9F), // Blue-Gray Text Color
                    ),
                  ),
                ],
              ),
            )
                .toList(),
          ),
          const SizedBox(height: 20),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: onPressed,
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade300, // Blue Button Background
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                padding: const EdgeInsets.symmetric(vertical: 14),
                elevation: 5,
                shadowColor: Colors.purpleAccent.shade100,),
              child: const Text(
                'Choose Plan',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );

  }

  void _showSnackbar(BuildContext context, String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(backgroundColor: Colors.green.shade400,
        content: Text(message),
        duration: const Duration(seconds: 2),
      ),
    );
  }
}
