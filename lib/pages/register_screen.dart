
//import "package:avtaar_signupotp/pages/otpscreen.dart";
import "package:avtaar_signupotp/widgets/custom_button.dart";
import "package:firebase_auth/firebase_auth.dart";

//import "package:country_picker/country_picker.dart";
import "package:flutter/material.dart";

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({super.key});
  static String verify="";
  @override
  State<RegisterScreen> createState() => _RegisterScreenState();

}

class _RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController phoneController = TextEditingController();
  TextEditingController countryController=TextEditingController();
  var phone="";
  var errorText="";
   @override
  void initState() {
    
    countryController.text = "+91";
    super.initState();
  }

Future<void> verifyPhone() async {
                          try{await FirebaseAuth.instance.verifyPhoneNumber(
  phoneNumber: '${countryController.text+phone}',
  verificationCompleted: (PhoneAuthCredential credential)
  {}  ,
  verificationFailed: (FirebaseAuthException e) {},
  codeSent: (String verificationId, int? resendToken) {
    RegisterScreen.verify=verificationId;
   // LinearProgressIndicator();
    Navigator.pushNamed(context, "otp");
  },
  codeAutoRetrievalTimeout: (String verificationId) {},
);}catch(e){print("$e");}

                        }
   _validatePhoneNumber()=>setState(() {
   setState(() {
      if (phoneController.text.length < 10) {
        errorText = "Please enter a valid mobile number";
      } else {
        errorText = "";
        verifyPhone();
      }
    });  
   
    });
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        

          
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    GestureDetector(
onTap: (){},
child: Container(
  color: Colors.yellow.shade50,
  height:MediaQuery.of(context).size.height*0.6,
),
         
                    ),
                    ClipRRect(
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(10),
                        topRight: Radius.circular(10),
                      ),
                      child: Container(
                        color: Colors.white,
                        padding: EdgeInsets.fromLTRB(35, 25, 35 ,20),
                      
                    child:Column(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                    Container(
                      height: 200,
                      width: 200,
                      padding: const EdgeInsets.all(20.0),
                      decoration: BoxDecoration(shape: BoxShape.rectangle,
                      ),
                      child: Image.asset("assets/logo.png",
                        height:98,
                        width:98,
                      ),
                    ),
                    const SizedBox(height: 20),
                    const Text('Welcome to Avtaar',
                        style: TextStyle(fontSize: 32,
                            fontWeight: FontWeight.bold)
                    ),
                    const SizedBox(height: 3),
                    const Text('Sign in',
                      style: TextStyle(fontSize: 24,
                          color: Colors.black,
                          ),
                      textAlign: TextAlign.center,
                    ),

                    const SizedBox(height: 20),
                    TextField(
                        controller: phoneController,
                        keyboardType: TextInputType.phone,
                        onChanged: (value){
                          phone=value;
                        },
                        decoration: InputDecoration(
                          prefixText: "+91",
                          hintText: "Mobile Number",
                          errorText:errorText,
                        ),
                        
                    ),
                    const SizedBox(height: 40,),
                    SizedBox(
                      width:double.infinity,
                      height: 40,
                      child: CustomButton(
                        onPressed:_validatePhoneNumber,
                        text:'Get OTP',
                      ),
                    ),
                    const SizedBox(height:16),
                      ],
                      ),
                    ),

                  
                
                ),
                  ],
               ),


        ),
    );
  }
}