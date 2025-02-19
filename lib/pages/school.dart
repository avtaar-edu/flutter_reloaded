import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:avtaar_signupotp/constants/ProfileEnums.dart';
import 'package:avtaar_signupotp/pages/board1.dart';
import 'package:avtaar_signupotp/pages/board2.dart';
import 'package:avtaar_signupotp/widgets/fwd_button.dart';
import 'package:csv/csv.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as SC;

class School extends StatefulWidget {
  
  const School({super.key});

  @override
  State<School> createState() => _SchoolState();
}

class _SchoolState extends State<School> {
  final TextEditingController SchoolController = TextEditingController();
  bool _validate = false;
  bool _submitted=false;
  String? errorText;
  List<String> schoolNames=[];
  List<String> filteredSchools=[];
  ProfileSchoolGradeEnum selectedGrade=ProfileSchoolGradeEnum();
bool showSuggestions=false;
@override
void initState(){
  super.initState();
  loadCSV();
  SchoolController.addListener(_filterSchools);
}
Future<void> loadCSV() async{
final rawData=await rootBundle.loadString('assets/schools.csv');
List<List<dynamic>> csvData=const CsvToListConverter().convert(rawData);
setState(() {
  schoolNames=csvData.map((row)=>row[0].toString()).toList();
  //extract school names
  filteredSchools=List.from(schoolNames);//initially same as actual list
});
}
void _filterSchools() {
    String query = SchoolController.text.toLowerCase();
   setState(() {
     filteredSchools=schoolNames.where((school){
return school.toLowerCase().contains(query);
     }).toList();
     showSuggestions=query.isNotEmpty;
   });
  }

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    final size = MediaQuery.of(context).size;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topLeft,
            child: SvgPicture.asset(
              'assets/profile-blob-t-left.svg',
              height: size.height * 0.34,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(height: 200.hWise, width: 200),
                Text(
                  SC.WHERE_DO_YOU_STUDY,
                  style: TextStyle(
                    fontWeight: TextStyleComponent.SOLEIL_SEMI_BOLD,
                    fontSize: size.height * 0.037,
                    color: Color(0xFF282828),
                    height: 1.2, // Line height equivalent to lineSpacingExtra in Android
                    fontFamily: TextStyleComponent.SOLEIL,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(height: 80),
                TextField(
                  controller: SchoolController,
                  onChanged: (value) {
                    setState(() {
                      _validate = value.isEmpty;
                      _submitted = false;
                    });
                  },
                  decoration: InputDecoration(
                    hintText: 'School',
                    hintStyle: TextStyle(
                      color: Color.fromARGB(255, 146, 146, 146),
                      fontSize: 17,
                      height: 1,
                      fontFamily: TextStyleComponent.SOLEIL,
                      fontWeight: FontWeight.bold,
                    ),
                    errorText: _submitted ? errorText : null,
                    contentPadding: EdgeInsets.all(0), // Adjust these values as needed
                  ),
                ),
                // Show suggestions as the user types
              if(showSuggestions)
              Container(
                height:200,
                child: ListView.builder(itemCount:filteredSchools.length,itemBuilder:(context,index){
                  return ListTile(
                    title: Text(filteredSchools[index]),
                    onTap: (){
                      setState(() {
                        SchoolController.text=filteredSchools[index];
                        showSuggestions=false;
                      });
                    },
                  );
                }),
              )
              ],
            ),
          ),
          Positioned(
            top: size.height * 0.65,
            left: 0,
            child: SvgPicture.asset(
              'assets/profile-blob-c-left.svg',
              height: size.height * 0.186,
            ),
          ),
          Positioned(
            bottom: 60,
            left: 20,
            right: 22,
            child: SizedBox(
              child: Align(
                alignment: Alignment.bottomCenter,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15),
                  child: LinearProgressIndicator(
                    backgroundColor: ColorCodes.cProgressBarGrey,
                    value: 0.67,
                    minHeight: 5,
                    valueColor: AlwaysStoppedAnimation(ColorCodes.cProgressBarYellow),
                  ),
                ),
              ),
              width: MediaQuery.of(context).size.width * 0.9,
            ),
          ),
          Positioned(
            bottom: 130,
            right: 20,
            child: Forward(
              onPressed: SchoolController.text.isEmpty
                  ? null
                  : () {
        
            Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => Board1()), // Change to Board2() if needed
  );

        
      },
            ),
          ),
          Positioned(
            bottom: 10,
            left: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-left.svg',
              height: 20.hWise,
            ),
          ),
          Positioned(
            bottom: 10,
            right: -3,
            child: SvgPicture.asset(
              'assets/profile-blob-b-right.svg',
              height: 57.hWise,
            ),
          ),
        ],
      ),
    );
  }
}

  

