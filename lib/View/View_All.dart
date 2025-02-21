import 'package:flutter/material.dart';

class JobListingScreen extends StatelessWidget {
  final List<Map<String, String>> jobs = [
    {"title": "Jr Developer", "company": "Google", "location": "Madhya Pradesh, India"},
    {"title": "Frontend Developer", "company": "MyJob", "location": "Madhya Pradesh, India"},
    {"title": "HR Manager", "company": "JCJC", "location": "Goa, India"},
    {"title": "Flutter Developer", "company": "Startup", "location": "Delhi, India"},
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("India Hiring Jobs",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade200,
      ),
      body: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            // Search Bar
            Container(
              padding: EdgeInsets.symmetric(horizontal: 12),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
              ),
              child: TextField(
                decoration: InputDecoration(
                  hintText: "Search jobs...",
                  border: InputBorder.none,
                  icon: Icon(Icons.search, color: Colors.grey),
                ),
              ),),
            SizedBox(height: 16),

            Expanded(
              child: ListView.builder(
                itemCount: jobs.length,
                itemBuilder: (context, index) {
                  final job = jobs[index];
                  return JobCard(
                    title: job["title"]!,
                    company: job["company"]!,
                    location: job["location"]!,
                  );},
              ),),
          ],),
      ),);
  }}
class JobCard extends StatelessWidget {
  final String title;
  final String company;
  final String location;

  JobCard({required this.title, required this.company, required this.location});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      margin: EdgeInsets.only(bottom: 12),
      child: Padding(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Job Title & Favorite Button
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  title,
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                Icon(Icons.favorite_border, color: Colors.redAccent),
              ],
            ),
            SizedBox(height: 4),

            // Company Name
            Text(
              "Company: $company",
              style: TextStyle(fontSize: 14, color: Colors.grey[700]),
            ),
            SizedBox(height: 4),

            // Location
            Row(
              children: [
                Icon(Icons.location_on, size: 16, color: Colors.blueAccent),
                SizedBox(width: 4),
                Text(location, style: TextStyle(color: Colors.grey[700])),
              ],
            ),
            SizedBox(height: 12),

            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  // Navigate to Apply Job Screen
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade200,
                  padding: EdgeInsets.symmetric(vertical: 12),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                ),
                child: Text("Apply Now", style: TextStyle(fontSize: 16,
                    fontWeight: FontWeight.w600,color: Colors.white)),
              ),
            ),],
        ),),
    );}
}
