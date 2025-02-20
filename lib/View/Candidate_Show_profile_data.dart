import 'dart:io';
import 'package:flutter/material.dart';

class ProfileSummaryScreen extends StatelessWidget {
  final Map<String, dynamic> profileData;
  final File? profileImage;

  ProfileSummaryScreen({required this.profileData, this.profileImage});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(
          "Profile Summary",
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue),
        ),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Profile Picture Display
              Center(
                child: Stack(
                  children: [
                    CircleAvatar(
                      radius: 55,
                      backgroundColor: Colors.blue.shade100,
                      backgroundImage: profileImage != null ? FileImage(profileImage!) : null,
                      child: profileImage == null
                          ? Icon(Icons.person, size: 60, color: Colors.blue.shade400)
                          : null,
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),

              // Profile Details
              _buildTitle("Personal Details"),
              _buildProfileItem("Gender", profileData['gender']),
              _buildProfileItem("Date of Birth", profileData['dob']),
              _buildProfileItem("Marital Status", profileData['maritalStatus']),
              _buildProfileItem("Address", profileData['address']),
              _buildProfileItem("Country", profileData['country']),
              _buildProfileItem("State", profileData['state']),
              _buildProfileItem("City", profileData['city']),
              _buildProfileItem("Pincode", profileData['pincode']),

              SizedBox(height: 10),
              _buildTitle("Job Details"),
              _buildProfileItem("Active Job", profileData['activeJob']),
              _buildProfileItem("Active Job Search", profileData['activeJobSearch']),
              _buildProfileItem("Work Experience (Years)", profileData['experienceYears']),
              _buildProfileItem("Work Experience (Months)", profileData['experienceMonths']),

              SizedBox(height: 20),
              // Edit Button
              Center(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context); // Go back to edit
                  },
                  child: Text("Edit Profile", style: TextStyle(color: Colors.white)),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ),],
          ),),
      ),
    );
  }

  // Section Title
  Widget _buildTitle(String title) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: Text(
        title,
        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold, color: Colors.blue),
      ),
    );
  }

  // Profile Info Card
  Widget _buildProfileItem(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 6.0),
      child: Card(
        elevation: 2,
        child: Container(
          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: Colors.blue.shade100),
          ),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(label, style: TextStyle(fontSize: 16, fontWeight: FontWeight.w500, color: Colors.black)),
              Text(value, style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold, color: Colors.blue.shade400)),
            ],
          ),
        ),
      ),
    );
  }
}
