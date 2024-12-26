import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  final String username = "Devansh Kapoor";

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      bottomNavigationBar: Container(
        decoration: BoxDecoration(
          boxShadow: [
            BoxShadow(
              color: Colors.grey.shade200,
              blurRadius: 30,
            ),
          ],
        ),
        child: BottomNavigationBar(
          landscapeLayout: BottomNavigationBarLandscapeLayout.spread,
          type: BottomNavigationBarType.fixed,
          items: [
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: SvgPicture.asset(
                  'assets/home-active.svg',
                  height: size.height * 0.0375,
                ),
              ),
              label: '',
            ),
            BottomNavigationBarItem(
              icon: Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: Icon(
                  Icons.person,
                  size: size.height * 0.0375,
                ),
              ),
              label: '',
            ),
          ],
        ),
      ),
      body: Stack(
        alignment: Alignment.center,
        clipBehavior: Clip.hardEdge,
        children: [
          Align(
            alignment: Alignment.topCenter,
            child: Container(
              height: size.height * 0.25,
              width: double.infinity,
              child: SvgPicture.asset(
                'assets/ProfileBg.svg',
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
            top: size.height * 0.12,
            left: size.width * 0.06,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 17,
                      child: Text(
                        username
                            .trim()
                            .split(' ')
                            .map((part) => part[0].toUpperCase())
                            .join(),
                        style: TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: ColorCodes.cBluePurple,
                        ),
                      ),
                    ),
                    SizedBox(width: 20),
                    Text(
                      "Hello, " +
                          username.substring(0, username.lastIndexOf(' ')) +
                          "!",
                      style: TextStyleComponent.dSemiBoldWhite(
                        fontSize: size.height * 0.023,
                      ),
                    ),
                  ],
                ),
                SizedBox(height: size.height * 0.015),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      "Explore the career options listed below",
                      style: TextStyleComponent.normalWhite14,
                    ),
                  ],
                ),
              ],
            ),
          ),
  Positioned(
    top:size.height*0.25,
    left:size.width*0.06,
    right:size.width*0.06,

    child: GridView.count(
      shrinkWrap: true,
      crossAxisCount: 2,
      mainAxisSpacing: 20,
      crossAxisSpacing: 15,
      childAspectRatio: 0.7,
      children: [

      ],
    
    )
  
  ),
        ],
      ),
    );

}
Widget _buildCareerOption(String assetpath, String label)
{
  return Container(
    height: 400,
    decoration: BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(8)
    ),
    child:InkWell(
      onTap: (){
        //nav functionality later
      },
      child:Column(
        children: [
          Expanded(
          flex: 4,  
          child: ClipRRect(
          borderRadius: BorderRadius.vertical(top: Radius.circular(8)),
          child: SvgPicture.asset(assetpath, 
          fit: BoxFit.cover,
          width: double.infinity,),
          )
          ),
          Expanded(
          flex:1,  
          child: Padding(padding: const EdgeInsets.all(8),
          child: Text(label,style: TextStyleComponent.boldBlack16,
          textAlign: TextAlign.center,),
          
          )
          
          )
        ],
      )
    )
  );
}
}