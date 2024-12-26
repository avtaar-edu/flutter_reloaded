import 'package:avtaar_signupotp/components/Colors.dart';
import 'package:avtaar_signupotp/components/TextStyleComponent.dart';
import 'package:avtaar_signupotp/components/extension.dart';
import 'package:flutter/material.dart';
import 'package:avtaar_signupotp/constants/StringConstants.dart' as StringConstants;
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

class NewCareerInterest extends StatefulWidget {
  @override
  _NewCareerInterestState createState() => _NewCareerInterestState();
}

class _NewCareerInterestState extends State<NewCareerInterest> {
  bool _searching = true;
  PreQ _preQ = PreQ();
  bool loading = false;
  List<String> _selectedCareers = [];
  List<String> _careerList = [];

  List<String> get _unSelected {
    final _list = [..._careerList];
    _selectedCareers.forEach((element) {
      _list.remove(element);
    });
    return _list;
  }

  Future<void> getCareerList(String query) async {
    try {
      if (!_searching) {
        setState(() {
          _searching = true;
        });
      }
      _careerList = ['Full Stack Developer','UX Researcher','Crypto Trader','Environmental Lawyer',
      'Ethical Hacker','Entrepreneur','Venture Capitalist','Digital Marketing Expert','UI/UX Designer','Fashion Designer','Credit Analyst','Cinematographer',
      'Standup Comedian','Registered Nurse',
'Event Manager',

      
      ];
      setState(() {
        _searching = false;
      });
      ScaffoldMessenger.of(context).hideCurrentSnackBar();
    } catch (e) {
      print(e);
    }
  }

  void _savePreq({bool skipped = false}) async {
    setState(() {
      loading = true;
    });
    ScaffoldMessenger.of(context).hideCurrentSnackBar();
    if (skipped) {
      _preQ.skip_time = DateTime.now().millisecondsSinceEpoch;
      // Navigate to another page if required
    } else {
      _preQ.interestedCareerNames = _selectedCareers;
    }
    setState(() {
      loading = false;
    });
    // Handle the saved data (e.g., send it to a server or save it locally)
  }

  @override
  Widget build(BuildContext context) {
    return NewInterestBackground(
      child: SafeArea(
        child: Scaffold(
          backgroundColor: ColorCodes.cTransparent,
          body: Padding(
            padding: EdgeInsets.symmetric(
              vertical: 15.hWise,
              horizontal: 15.wWise,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  StringConstants.SELECT_5_CAREER,
                  style: TextStyleComponent.dBoldBlack(fontSize: 16.hWise)
                ),
                15.hGap,
                
                Container(
                        width: context.width,
                        padding: EdgeInsets.symmetric(
                            vertical: 10.hWise, horizontal: 10.wWise),
                        constraints: BoxConstraints(
                            minHeight: 140.hWise, maxHeight: 180.hWise),
                        decoration: BoxDecoration(
                          color: ColorCodes.cPurpleBackground,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: _selectedCareers.isEmpty
                            ? Center(
                                child: Text(
                                  StringConstants.EMPTY_CAREER_MESSAGE,
                                  style: TextStyleComponent.dNormalLightGrey(
                                      fontSize: 13.hWise),
                                ),
                              )
                            : SingleChildScrollView(
                                child: Wrap(
                                  runSpacing: 10.hWise,
                                  spacing: 12.wWise,
                                  children: _selectedCareers
                                      .map((career) => CareerChip(
                                            text: career,
                                            isSelected: true,
                                            onTap: () {
                                              setState(() {
                                                _selectedCareers.remove(career);
                                              });
                                              _preQ.interestedCareerNames!
                                                  .remove(career);
                                            },
                                          ))
                                      .toList(),
                                ),
                              ),
                      ),
                      20.hGap,
                      Center(
                        child: Container(
                          height: 30,
                          width: context.width * 0.84,
                          padding: EdgeInsets.symmetric(horizontal: 8.wWise),
                          decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                              boxShadow: [
                                BoxShadow(
                                  offset: Offset(0, 2),
                                  blurRadius: 10,
                                  color: ColorCodes.cShadow.withOpacity(0.5),
                                )
                              ]),
                          child: Row(
                            children: [
                              Icon(
                                Icons.search,
                                color: Colors.black,
                                size: 15.hWise,
                              ),
                              5.wGap,
                              Container(
                                width: context.width * 0.5,
                                child: TextField(
                                  cursorColor: Colors.black,
                                  onChanged: (query) async {
                                    await Future.delayed(
                                        Duration(milliseconds: 200));
                                    getCareerList(query);
                                  },
                                  style: TextStyleComponent.dNormalBlack(
                                      fontSize: 12.hWise),
                                  decoration: InputDecoration.collapsed(
                                      hintText: 'Search Careers',
                                      hintStyle:
                                          TextStyleComponent.dNormalLightGrey(
                                              fontSize: 12.hWise)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      20.hGap,
                      Expanded(
                        child: Container(
                          padding: EdgeInsets.symmetric(horizontal: 5.wWise),
                          child:
                               SingleChildScrollView(
                                  padding: EdgeInsets.only(bottom: 0.hWise),
                                  child: Wrap(
                                    runSpacing: 18.hWise,
                                    spacing: 12.wWise,
                                    children: _unSelected
                                        .map((career) => CareerChip(
                                              text: career,
                                              onTap: () {
                                               if (_selectedCareers.length ==
                                                     5) {
                                                   ScaffoldMessenger.of(context)
                                                       .showSnackBar(SnackBar(
                                                           content: Text(
                                                     '5 careers have been selected',
                                                     textAlign: TextAlign.center,
                                                     style: TextStyleComponent
                                                         .dNormalWhite(
                                                             fontSize: 14.hWise),
                                                   )));
                                                   return;
                                                 }
                                                setState(() {
                                                  _selectedCareers.add(career);
                                                });

                                                _preQ.interestedCareerNames!
                                                    .add(career);
                                              },
                                            ))
                                        .toList(),
                                  ),
                                ),
                        ),
                      ),
                      
                      Row(
                        children: [
                          
                          10.wGap,
                          TextButton(
                            onPressed: () => _savePreq(skipped: true),
                            child: Text(
                              'Skip',
                              style: TextStyleComponent.dNormalGrey(
                                  fontSize: 14.hWise),
                            ),
                            style: ButtonStyle(
                              overlayColor: MaterialStateColor.resolveWith(
                                  (states) => ColorCodes.cShadow),
                            ),
                          ),
                          Spacer(),
                        TextButton(
                            
                           child:Text( 'Done', style: TextStyle(fontSize:14,color: Color.fromARGB(255, 255, 255, 255)),),
                           style: ButtonStyle(backgroundColor:MaterialStateProperty.all(Color.fromARGB(255, 99, 11, 255),
                           
                           ),
                           padding: MaterialStateProperty.all<EdgeInsets>(
            EdgeInsets.only(left:25, right:25, top:10, bottom: 10)),
                           shape: MaterialStateProperty.all<RoundedRectangleBorder>(
    RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(5.0),
      side: BorderSide(color: Colors.transparent)))),
                            onPressed:
                                _selectedCareers.isEmpty ? null : _savePreq,
                                
                          ),
                          10.wGap
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}

class CareerChip extends StatefulWidget {
  final String text;
  final bool isSelected;
  final Function()? onTap;

  const CareerChip({required this.text, this.isSelected = false, this.onTap});
  @override
  _CareerChipState createState() => _CareerChipState();
}

class _CareerChipState extends State<CareerChip> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.onTap,
      child: Container(
        padding: EdgeInsets.symmetric(
          vertical: 7.hWise,
          horizontal: 15.wWise,
        ),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: widget.isSelected ? ColorCodes.cBluePurple : Colors.white,
            boxShadow: [
              BoxShadow(
                offset: Offset(0, 4),
                blurRadius: 4,
                color: ColorCodes.cShadow.withOpacity(0.5),
              )
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              widget.text,
              style: widget.isSelected
                  ? TextStyleComponent.dNormalWhite(fontSize: 12.hWise)
                  : TextStyleComponent.dNormalBlack(fontSize: 12.hWise),
            ),
            if (widget.isSelected)
              Container(
                margin: EdgeInsets.only(left: 8.wWise),
                child: Transform.translate(
                  offset: Offset(0, 1.hWise),
                  child: SvgPicture.asset(
                    'assets/cross.svg',
                    color: Colors.white.withOpacity(0.8),
                    height: 12.hWise,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class NewInterestBackground extends StatelessWidget {
  final Widget child;

  const NewInterestBackground({required this.child});
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: Container(
        color: Colors.white,
        height: context.height,
        width: context.width,
        child: Stack(
          alignment: Alignment.topCenter,
          children: [
            Align(
              alignment: Alignment.topRight,
              child: SvgPicture.asset(
                'assets/blob-t-right.svg',
                height: 270.hWise,
              ),
            ),
            child,
          ],
        ),
      ),
    );
  }
}
class PreQ {
  int? skip_time;
  List<String>? interestedCareerNames = [];
}
