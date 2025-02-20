import 'package:flutter/material.dart';
import 'fade.dart';
class ProfileSetupScreen extends StatefulWidget {
  @override
  _ProfileSetupScreenState createState() => _ProfileSetupScreenState();
}
class _ProfileSetupScreenState extends State<ProfileSetupScreen> {
  final _formKey = GlobalKey<FormState>();
  int _currentStep = 0;


  final Map<String, TextEditingController> controllers = {
    'dob': TextEditingController(),
    'address': TextEditingController(),
    'pincode': TextEditingController(),
    'about': TextEditingController(),
    'education': TextEditingController(),
    'skills': TextEditingController(),
    'experience': TextEditingController(),
    'jobPreference': TextEditingController(),
    'languages': TextEditingController(),
  };

  String? selectedCountry;
  String? selecteddepartment;
  String? jobtitle;
  String? employe;
  String? startyear;
  String? endyear;
  String? startmonth;
  String? endmonth;
  String? company;
  String? selectedState;
  String? selectedCity;
  String? selectedCurrency;
  String? selectedGender;
  String? selectedMaritalStatus;
  String? jobPreferenceCountry;

  final List<String> countries = ["India", "USA", "UK", "Canada", "Australia"];
  final List<String> startyears = ["2020", "2019", "2000", "2012", "2024"];
  final List<String> startmonths = ["jan", "feb", "aug", "dec", "jul"];
  final List<String> endmonths = ["jan", "feb", "aug", "dec", "jul"];
  final List<String> endtyears = ["jan", "feb", "aug", "dec", "jul"];
  final List<String> employetype = ["India", "USA", "UK", "Canada", "Australia"];
  final List<String> department = ["1", "2", "3", "5", "7"];
  final List<String> currentcompany = ["1", "2", "3", "5", "7"];
  final List<String> titlejobs = ["fresher", "not", "not", "5", "7"];
  final List<String> states = ["State 1", "State 2", "State 3"];
  final List<String> cities = ["City 1", "City 2", "City 3"];
  final List<String> currencies = ["INR", "USD", "EUR", "GBP"];
  final List<String> genders = ["Male", "Female", "Other"];
  final List<String> maritalStatuses = ["Single", "Married", "Divorced", "Widowed"];

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: FadeAnimation(
          delay: 1,
          translateX: 50,
          child: Text(
            "Profile Setup",
            style: TextStyle(
              fontSize: screenWidth * 0.07,
              fontWeight: FontWeight.bold,
              color: Colors.blue,
            ),
          ),),
        backgroundColor: Colors.white,
        elevation: 0,
      ),
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(12.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: List.generate(
                6,
                    (index) => CircleAvatar(
                  backgroundColor: Colors.transparent, // Remove background color
                  radius: 25, // Adjust size
                  child: ClipOval(
                    child: Image.asset(
                      "assets/assets${index + 1}.jpg", // Dynamic image loading
                      width: 50,
                      height: 50,
                      fit: BoxFit.cover,
                    ),),
                ),),
            ),),
          Expanded(
            child: SingleChildScrollView(
              child: Padding(
                padding: EdgeInsets.all(screenWidth * 0.05),
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
          // Navigation Buttons with rounded buttons and improved styling
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (_currentStep > 0)
                  ElevatedButton(
                    onPressed: () {
                      setState(() {
                        _currentStep--;
                      });
                      },
                    child: Text("Back",style: TextStyle(color: Colors.white),),
                    style: ElevatedButton.styleFrom(
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),),
                ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      if (_currentStep < 5) {
                        setState(() {
                          _currentStep++;
                        });
                      } else {
                      }}
                  },
                  child: Text(_currentStep == 5 ? "Submit" : "Next",style: TextStyle(color: Colors.white),),
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(horizontal: 40, vertical: 12),
                    backgroundColor: Colors.blue,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),),
              ],),
          ),],
      ),);
  }
  List<Widget> _buildStepContent(int step) {
    switch (step) {
      case 0:
        return [
          buildDropdown("Country", countries, selectedCountry, (value) {
            setState(() {
              selectedCountry = value;
            });
          }),
          buildDropdown("State", states, selectedState, (value) {
            setState(() {
              selectedState = value;
            });
          }),
          buildDropdown("City", cities, selectedCity, (value) {
            setState(() {
              selectedCity = value;
            });
          }),
          buildTextField("Date of Birth", controllers['dob']!, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Date of birth is required";
            // }
            return null;
          }),
          buildTextField("Address", controllers['address']!, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Address is required";
            // }
            return null;
          }),
          buildTextField("Pincode", controllers['pincode']!, keyboardType: TextInputType.number, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Pincode is required";
            // } else if (value.length != 6) {
            //   return "Enter a valid pincode";
            // }
            return null;
          }),
          buildTextField("Highest Education", controllers['education']!, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Education is required";
            // }
            return null;
          }),
          buildTextField("Specialization", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Specialization is required";
            // }
            return null;
          }),
          buildTextField("University/College", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "University/College is required";
            // }
            return null;
          }),
          buildTextField("Skills", controllers['skills']!, maxLines: 3, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Skills are required";
            // }
            return null;
          }),
          buildTextField("Experience (Years)", controllers['experience']!, keyboardType: TextInputType.number, validate: (value) {

            return null;
          }),
          buildTextField("Previous Job Title", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Previous Job Title is required";
            // }
            return null;
          }),
          buildTextField("Company Name", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Company Name is required";
            // }
            return null;
          }),
          buildDropdown("Job Preference Country", countries, jobPreferenceCountry, (value) {
            setState(() {
              jobPreferenceCountry = value;
            });
          }),
          buildDropdown("Currency", currencies, selectedCurrency, (value) {
            setState(() {
              selectedCurrency = value;
            });
          }),
          buildTextField("Languages Known", controllers['languages']!, maxLines: 2, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Languages are required";
            // }
            return null;
          }),
          buildDropdown("Marital Status", maritalStatuses, selectedMaritalStatus, (value) {
            setState(() {
              selectedMaritalStatus = value;
            });
          }),
          buildDropdown("Gender", genders, selectedGender, (value) {
            setState(() {
              selectedGender = value;
            });
          }),
        ];
      case 1:
        return [
          buildDropdown("Department", department, selecteddepartment, (value) {
            setState(() {
              selecteddepartment = value;
            });
          }),
          // buildDropdown("Job title", titlejobs, jobtitle, (value) {
          //   setState(() {
          //     jobtitle = value;
          //   });
          // }),
          buildDropdown("Current Company",  currentcompany, company, (value) {
            setState(() {
              company = value;
            });
          }),
          buildDropdown("Emoployement Type",  employetype, employe, (value) {
            setState(() {
              employe = value;
            });
          }),
          buildTextField("Experience", controllers['experience']!, keyboardType: TextInputType.number, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "experience is required";
            // } else if (value.length != 1) {
            //   return "Enter experience";
            // }
            return null;
          }),
          buildTextField("Experience Months", controllers['education']!, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Education is required";
            // }
            return null;
          }),
          buildDropdown("Start Year", startyears, startyear, (value) {
            setState(() {
              startyear = value;
            });
          }),
          buildDropdown("End Year", endtyears, endyear, (value) {
            setState(() {
              endyear = value;
            });
          }),
          buildDropdown("Start Month", startmonths, startmonth, (value) {
            setState(() {
              startmonth = value;
            });
          }),
          buildDropdown("End Month", endmonths, endmonth, (value) {
            setState(() {
              endmonth = value;
            });
          }),
          buildTextField("Current Salary Amount", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Salary is required";
            // }
            return null;
          }),
          buildTextField("Job Profile", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Job Propfile is required";
            // }
            return null;
          }),
          buildTextField("Notice Period", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Notice Period+ is required";
            // }
            return null;
          }),
          buildTextField("Skills", controllers['skills']!, maxLines: 3, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Skills are required";
            // }
            return null;
          }),
          buildTextField("Experience (Years)", controllers['experience']!, keyboardType: TextInputType.number, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Experience is required";
            // }
            return null;
          }),
          buildTextField("Previous Job Title", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Previous Job Title is required";
            // }
            return null;
          }),
          buildTextField("Company Name", TextEditingController(), validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Company Name is required";
            // }
            return null;
          }),
          buildDropdown("Job Preference Country", countries, jobPreferenceCountry, (value) {
            // setState(() {
            //   jobPreferenceCountry = value;
            // });
          }),
          buildDropdown("Currency", currencies, selectedCurrency, (value) {
            setState(() {
              selectedCurrency = value;
            });
          }),
        ];
      case 2:
        return [
          buildDropdown("Skill",  employetype, employe, (value) {
            setState(() {
              employe = value;
            });
          }),
          buildTextField("Expperience", controllers['pincode']!, keyboardType: TextInputType.number, validate: (value) {
            // if (value == null || value.isEmpty) {
            //   return "Pincode is required";
            // } else if (value.length != 6) {
            //   return "Enter a valid pincode";
            // }
            return null;
          }),
        ];
      case 3:
        return [
          buildDropdown("Language", currencies, selectedCurrency, (value) {
            setState(() {
              selectedCurrency = value;
            });

          }),
          buildDropdown("Language", currencies, selectedCurrency, (value) {
            setState(() {
              selectedCurrency = value;
            });
          }),
        ];
      default:
        return [];
    }
  }
  // Reusable method to build a dropdown with better design and validation
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
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
            value: selectedValue,
            items: items.map((String item) {
              return DropdownMenuItem(value: item, child: Text(item),);
            }).toList(),
            onChanged: onChanged,
            validator: (value) {
              if (value == null || value.isEmpty) {
                return "$label is required";
              }
              return null;
            },
          ),),
      ),);
  }
  // Reusable method to build a text field with card styling and validation
  Widget buildTextField(String label, TextEditingController controller,
      {TextInputType keyboardType = TextInputType.text, int maxLines = 1, String? Function(String?)? validate}) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: Card(elevation: 2,
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,border: Border.all(color: Colors.blue.shade100),
            borderRadius: BorderRadius.circular(10),
          ),
          child: TextFormField(
            controller: controller,
            keyboardType: keyboardType,
            maxLines: maxLines,
            decoration: InputDecoration(
              labelText: label,
              border: InputBorder.none,
              contentPadding: EdgeInsets.symmetric(horizontal: 15),
            ),
            validator: validate,
          ),),
      ),);
  }
}