import 'package:flutter/material.dart';
import 'package:intern_project/constants/custom_appbar.dart';
import 'package:intern_project/constants/custom_textstyles.dart';
import 'package:intern_project/constants/image_path.dart';
import 'package:intern_project/constants/string_constants.dart';

class Teammates extends StatefulWidget {
  const Teammates({super.key});

  @override
  State<Teammates> createState() => _TeammatesState();
}

class _TeammatesState extends State<Teammates> {
  static final List<String> teamMatesListItems = [
    "Allence Vakhariya",
    "Chiragkumar Gohil",
    "Jhanvi Pathar",
    "Krishna Barasara",
    "Prachi Kotak",
    "Sarvesh Savaliya",
    "Sazzadhusen Iproliya",
    "Shashank Adhatrao",
    "Sohan Bhadra",
    "Raj Shah",
    "Khush Pajwani",
    "Mileniyam Modi",
    "Palak Ramani",
    "Himanshu Jawale",
    "Anant Prajapati",
    "Sheetal Gajjar"
  ];

  String? selectedTeamMate;
  String profile = "assets/images/placeholder.png";
  String position = "not available";
  String email = "not available";
  String mobile = "not available";

  bool isVisible = false;

  teamMemberDetails() {
    switch (selectedTeamMate) {
      case StringConstants.sheetalGajjar:
        {
          sheetal();
        }
        break;
      case StringConstants.anantPrajapati:
        {
          anant();
        }
        break;

      case StringConstants.himanshuJawale:
        {
          himanshu();
        }
        break;
      case StringConstants.palakRamani:
        {
          palak();
        }
        break;
      case StringConstants.mileniyamModi:
        {
          mileniyam();
        }
        break;

      case StringConstants.rajShah:
        {
          raj();
        }
        break;

      case StringConstants.khushPajwani:
        {
          khush();
        }
        break;
      case StringConstants.sohanBhadra:
        {
          sohan();
        }
        break;
      case StringConstants.shashankAdhatRao:
        {
          shashank();
        }
        break;

      case StringConstants.sazzadhusenIproliya:
        {
          sazzadHusen();
        }
        break;
      case StringConstants.sarveshSavaliya:
        {
          sarvesh();
        }
        break;
      case StringConstants.prachiKotak:
        {
          prachi();
        }
        break;
      case StringConstants.allenceVakhariya:
        {
          allence();
        }
        break;
      case StringConstants.chiragKumarGohil:
        {
          chirag();
        }
        break;

      case StringConstants.jhanviPathar:
        {
          jhanvi();
        }
        break;
      case StringConstants.krishnaBarasara:
        {
          krishna();
        }
        break;

      default:
        {
          print("default");
        }
    }
  }

  sheetal() {
    profile = ImagesPath.sheetalGajjar;
    position = "Mobile Project Manager";
    email = "sheetal.albiorix@gmail.com";
    mobile = "9909789956";
  }

  anant() {
    profile = ImagesPath.anantPrajapati;
    position = "Software Engineer";
    email = "anantp.albiorix@gmail.com";
    mobile = "9428976681";
  }

  himanshu() {
    profile = ImagesPath.himanshuJawale;
    position = "Trainee Software Engineer";
    email = "himanshuj.albiorix@gmail.com";
    mobile = "9714160383";
  }

  palak() {
    profile = ImagesPath.palakRamani;
    position = "Software Engineer";
    email = "palakr.albiorix@gmail.com";
    mobile = "8320821187";
  }

  mileniyam() {
    profile = ImagesPath.mileniyamModi;
    position = "Software Engineer";
    email = "milenniyamm.albiorix@gmail.com";
    mobile = "88497968951";
  }

  raj() {
    profile = ImagesPath.rajShah;
    position = "Software Engineer";
    email = "rajh.albiorix@gmail.com";
    mobile = "9409136777";
  }

  khush() {
    profile = ImagesPath.khushPajwani;
    position = "Software Engineer";
    email = "khushp.albiorix@gmail.com";
    mobile = "9429108545";
  }

  sohan() {
    profile = ImagesPath.sohanBhadra;
    position = "Software Engineer";
    email = "sohanb.albiorix@gmail.com";
    mobile = "9662935949";
  }

  shashank() {
    profile = ImagesPath.shashankAdhatRao;
    position = "Software Engineer";
    email = "shashanka.albiorix@gmail.com";
    mobile = "9104077165";
  }

  sarvesh() {
    profile = ImagesPath.sarveshSavaliya;
    position = "Software Engineer";
    email = "sarveshs.albiorix@gmail.com";
    mobile = "9409684668";
  }

  sazzadHusen() {
    profile = ImagesPath.sazzadhusenIproliya;
    position = "Team Lead";
    email = "sazzadhusen.albiorix@gmail.com";
    mobile = "9925342734";
  }

  prachi() {
    profile = ImagesPath.prachiKotak;
    position = "Trainee Software Engineer";
    email = "prachik.albiorix@gmail.com";
    mobile = "7862020227";
  }

  krishna() {
    profile = ImagesPath.nullValue;
    position = "Software Engineer";
    email = "krishnab.albiorix@gmail.com";
    mobile = "9879465832";
  }

  allence() {
    profile = ImagesPath.allenceVakhariya;
    position = "Software Engineer";
    email = "allencev.albiorix@gmail.com";
    mobile = "7990116270";
  }

  chirag() {
    profile = ImagesPath.chiragKumarGohil;
    position = "Trainee Software Engineer";
    email = "chiragg.albiorix@gmail.com";
    mobile = "9978431633";
  }

  jhanvi() {
    profile = ImagesPath.jhanviPathar;
    position = "Software Engineer";
    email = "jhanvip.albiorix@gmail.com";
    mobile = "9106849593";
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: CustomAppbar.appbar("Team Mates Details", true),
        body: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            children: [
              Center(
                child: SizedBox(
                  width: 400,
                  child: DropdownButtonFormField<String>(
                    menuMaxHeight: 400,
                    elevation: 3,
                    isExpanded: true,
                    isDense: true,
                    decoration: InputDecoration(
                      hoverColor: WidgetStateColor.transparent,
                      hintText: "Select Team Member",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(15)),
                    ),
                    value: selectedTeamMate,
                    items: teamMatesListItems
                        .map((option) => DropdownMenuItem(
                              value: option,
                              child: Text(option),
                            ))
                        .toList(),
                    onChanged: (value) {
                      setState(() {
                        teamMatesListItems.sort();
                        isVisible = true;
                        selectedTeamMate = value;
                        print("selectedTeamMate : $selectedTeamMate");
                        teamMemberDetails();
                      });
                    },
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please select any team member';
                      }
                      return null;
                    },
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              SizedBox(
                width: 400,
                height: 370,
                child: Visibility(
                  visible: isVisible ? true : false,
                  child: Card(
                    elevation: 2,
                    shadowColor: Colors.blue.shade200,
                    child: Padding(
                      padding: const EdgeInsets.all(20),
                      child: Column(
                        children: [
                          Center(
                            child: CircleAvatar(
                              backgroundColor: Colors.grey.shade300,
                              backgroundImage: profile.isNotEmpty
                                  ? AssetImage(profile)
                                  : AssetImage("assets/images/placeholder.png"),
                              radius: 50,
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Member : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("$selectedTeamMate"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "position : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("$position"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Location : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("Ahmedabad"),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Department : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("Software"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Email : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("$email"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Mobile : ",
                                style: CustomTextStyles.mediumTextStyle,
                              ),
                              Text("$mobile"),
                            ],
                          ),
                          SizedBox(
                            height: 10,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
