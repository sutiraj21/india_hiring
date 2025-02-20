import 'package:flutter/material.dart';
import 'package:file_picker/file_picker.dart';
import 'package:image_picker/image_picker.dart';
import 'dart:io';
import 'Candidate_Show_profile_data.dart';

class ProfileSetupScreen1 extends StatefulWidget {
  @override
  _ProfileSetupScreen1State createState() => _ProfileSetupScreen1State();
}

class _ProfileSetupScreen1State extends State<ProfileSetupScreen1> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;
  File? _profileImage;

  // Controllers
  final Map<String, TextEditingController> controllers = {
    'dob': TextEditingController(),
    'address': TextEditingController(),
    'address2': TextEditingController(),
    'pincode': TextEditingController(),
    'experienceYears': TextEditingController(),
    'experienceMonths': TextEditingController(),
  };

  // Dropdown Values
  String? selectedGender;
  String? selectedMaritalStatus;
  String? selectedCountry;
  String? selectedState;
  String? selectedCity;
  String? activeJob;
  String? activeJobSearch;
  String? resumeFilePath;

  // Dropdown Data
  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> maritalStatuses = ["Single", "Married", "Divorced", "Widowed"];
  final List<String> countries = ["India", "USA", "UK", "Canada", "Australia"];
  final List<String> states = ["State 1", "State 2", "State 3"];
  final List<String> cities = ["City 1", "City 2", "City 3"];
  final List<String> jobStatus = ["Yes", "No"];

  // Method to pick profile image
  Future<void> _pickProfileImage() async {
    final pickedFile = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      setState(() {
        _profileImage = File(pickedFile.path);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text("Candidate Profile", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.blue)),
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
      ),
      body: Column(
        children: [
          // Profile Picture Picker
          Center(
            child: Stack(
              children: [
                CircleAvatar(
                  radius: 55,
                  backgroundColor: Colors.blue.shade100,
                  backgroundImage: _profileImage != null ? FileImage(_profileImage!) : null,
                  child: _profileImage == null
                      ? Icon(Icons.person, size: 60, color: Colors.blue.shade400)
                      : null,
                ),
                Positioned(
                  bottom: 0,
                  right: 0,
                  child: GestureDetector(
                    onTap: _pickProfileImage,
                    child: CircleAvatar(
                      radius: 20,
                      backgroundColor: Colors.blue,
                      child: Icon(Icons.camera_alt, color: Colors.white, size: 22),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(height: 20),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: _buildStepContent(_currentStep),
                  ),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: () => setState(() => _currentStep--),
                    child: Text("Back",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                    ),
                  ),
                ElevatedButton(
                 onPressed: () {
    if (_formKey.currentState!.validate()) {
    if (_currentStep < 1) {
    setState(() => _currentStep++);
    } else {
    // Collect all data into a map
    Map<String, dynamic> profileData = {
    'gender': selectedGender ?? "",
    'dob': controllers['dob']!.text,
    'maritalStatus': selectedMaritalStatus ?? "",
    'address': controllers['address']!.text,
    'country': selectedCountry ?? "",
    'state': selectedState ?? "",
    'city': selectedCity ?? "",
    'pincode': controllers['pincode']!.text,
    'activeJob': activeJob ?? "",
    'activeJobSearch': activeJobSearch ?? "",
    'experienceYears': controllers['experienceYears']!.text,
    'experienceMonths': controllers['experienceMonths']!.text,
    };

    // Navigate to ProfileSummaryScreen
    Navigator.push(
    context,
    MaterialPageRoute(
    builder: (context) => ProfileSummaryScreen(profileData: profileData),
    ),
    );
    }
    }
    },

                child: Text(_currentStep == 1 ? "Submit" : "Next",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Method to generate form fields for each step
  List<Widget> _buildStepContent(int step) {
    switch (step) {
      case 0:
        return [
          buildDropdown("Gender", genders, selectedGender, (value) => setState(() => selectedGender = value)),
          buildTextField("Date of Birth", controllers['dob']!),
          buildDropdown("Marital Status", maritalStatuses, selectedMaritalStatus, (value) => setState(() => selectedMaritalStatus = value)),
          buildTextField("Address", controllers['address']!),
          buildTextField("Address Line 2", controllers['address2']!),
          buildDropdown("Country", countries, selectedCountry, (value) => setState(() => selectedCountry = value)),
          buildDropdown("State", states, selectedState, (value) => setState(() => selectedState = value)),
          buildDropdown("City", cities, selectedCity, (value) => setState(() => selectedCity = value)),
          buildTextField("Pincode", controllers['pincode']!, keyboardType: TextInputType.number),
          buildDropdown("Active Job", jobStatus, activeJob, (value) => setState(() => activeJob = value)),
          buildDropdown("Active Job Search", jobStatus, activeJobSearch, (value) => setState(() => activeJobSearch = value)),
          buildResumeUploadButton(),
        ];
      case 1:
        return [
          buildTextField("Work Experience (Years)", controllers['experienceYears']!, keyboardType: TextInputType.number),
          buildTextField("Work Experience (Months)", controllers['experienceMonths']!, keyboardType: TextInputType.number),
        ];
      default:
        return [];
    }
  }

  // Modern Text Field Design
  Widget buildTextField(String label, TextEditingController controller, {TextInputType keyboardType = TextInputType.text}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            decoration: InputDecoration(
              labelText: label,
          
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12),),
              filled: true,
              fillColor: Colors.white,
          
            ),
          ),
        ),
      ),
    );
  }


  // Modern Dropdown Design
  Widget buildDropdown(String label, List<String> items, String? selectedValue, ValueChanged<String?> onChanged) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: DropdownButtonFormField<String>(

            decoration: InputDecoration(
              labelText: label,
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
              filled: true,
              fillColor: Colors.white,
            ),
            value: selectedValue,
            items: items.map((String item) => DropdownMenuItem(value: item, child: Text(item))).toList(),
            onChanged: onChanged,
            validator: (value) => value == null ? "$label is required" : null,
          ),
        ),
      ),
    );
  }

  // Resume Upload Button
  Widget buildResumeUploadButton() {
    return ElevatedButton.icon(
      onPressed: () async {
        FilePickerResult? result = await FilePicker.platform.pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
        if (result != null) {
          setState(() => resumeFilePath = result.files.single.name);
        }
      },
      icon: Icon(Icons.upload_file),
      label: Text(resumeFilePath ?? "Upload Resume"),
    );
  }
}
