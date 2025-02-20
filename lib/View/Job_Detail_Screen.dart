import 'package:flutter/material.dart';
import 'package:inidiahiringg/View/home_screen.dart';

import 'My_Job_Screen.dart';
import 'OTP_Screen.dart';

class JobDetails extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Chartered Accountant", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () =>
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context)=>HomeScreen()))
        ),
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Company Info
              Row(
                children: [
                  SizedBox(width: 12),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("Tissot", style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                      SizedBox(height: 4),
                      Text("Remote • Part-time", style: TextStyle(color: Colors.grey[600])),
                    ],),
                ],),
              SizedBox(height: 16),


              Card(color: Colors.white,
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Container(width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        _buildJobDetail(" Job Shift","                             Morning Shift"),
                        _buildJobDetail(" Pay Type", "                             Not Disclosed"),
                        _buildJobDetail(" Job Type", "                             Internship"),
                        _buildJobDetail(" Age Required", "                         18-25"),
                        _buildJobDetail(" Number of Hiring", "                     15"),
                        _buildJobDetail(" Resume Required", "                    Yes"),
                        _buildJobDetail(" Department", "                       Medical & Pharma"),
                        _buildJobDetail(" Deadline", "                             2025-02-27"),
                        _buildJobDetail(" Status", "                                 Active"),
                      ],
                    ),),
                ),),
              SizedBox(height: 16),
              // Skills Section
              _buildSectionTitle("Skills Required"),
              _buildChips(["Data Science", "Laravel"]),
              // Locations
              _buildSectionTitle("Locations"),
              _buildChips(["Noida", "Hyderabad"]),
              // Education
              _buildSectionTitle("Education"),
              _buildChips(["Graduation", "Master"]),
              SizedBox(height: 24),
            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(16),
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.blueAccent,
            padding: EdgeInsets.symmetric(vertical: 14),
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
          ),
          onPressed: () {
            Navigator.push(context,
                MaterialPageRoute(builder: (context)=>ApplyJobScreen()));
          },
          child: Text("Apply Now", style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.white)),
        ),
      ),
    );
  }
  Widget _buildJobDetail(String title, String value) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 10),
      child: RichText(
        text: TextSpan(
          text: "$title: ",
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black87),
          children: [
            TextSpan(
              text: value,
              style: TextStyle(fontWeight: FontWeight.normal, color: Colors.grey[700]),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 8),
      child: Text(title, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
    );
  }

  Widget _buildChips(List<String> items) {
    return Wrap(
      spacing: 8,
      children: items.map((item) {
        return Chip(
          label: Text(
            item,
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w500,
              color: Colors.black87, // Text color
            ),
          ),
          padding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
          backgroundColor: Colors.blue[50], // Light blue background
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20), // Rounded edges
            side: BorderSide(color: Colors.white10), // Border color
          ),
          elevation: 1, // Slight shadow effect
        );

      }).toList(),
    );
  }
}
class ApplyJobScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Apply for Job",style: TextStyle(color: Colors.white),),
        centerTitle: true,
        backgroundColor: Colors.blueAccent.shade200,
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("Apply Note", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            TextField(
              maxLines: 4,
              decoration: InputDecoration(filled: true,fillColor: Colors.blue[50],
                hintText: "Write a note...",
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)
                    ,borderSide: BorderSide.none)
              ),style: TextStyle(color: Colors.black54),
            ),
            SizedBox(height: 20),

            // Upload Resume Section
            Text("Upload Resume", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500)),
            SizedBox(height: 8),
            GestureDetector(
              onTap: () {
                // Upload functionality
              },
              child: Container(
                padding: EdgeInsets.all(12),
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.upload_file, color: Colors.blueAccent),
                    SizedBox(width: 10),
                    InkWell(
                        child: Text("Upload New Resume",
                            style: TextStyle(color: Colors.blueAccent, fontSize: 16),),onTap: (){
                          Navigator.push(context,MaterialPageRoute(builder: (context)=>MobileLogin()));
                    },),
                  ],
                ),
              ),
            ),
            SizedBox(height: 30),

            // Submit Button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                 Navigator.push(context, MaterialPageRoute(builder: (context)=>MobileLogin()));
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent.shade200,
                  padding: EdgeInsets.symmetric(vertical: 14),
                  shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                ),
                child: Text("Submit Application", style: TextStyle(fontSize: 18,
                    fontWeight: FontWeight.w600,color: Colors.white)),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

