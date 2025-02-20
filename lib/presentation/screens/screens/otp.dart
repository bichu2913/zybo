import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:pinput/pinput.dart';
import 'package:zybo/core/secure_store/secure_store_helper.dart';
import 'package:zybo/presentation/widget/otpTimerWidget.dart';
import 'package:zybo/screens/homescreen.dart';



class OtpVerificationScreen extends StatefulWidget {
  final String otp;
  final String phoneNumber;
  final String jwt;
  const OtpVerificationScreen({super.key, required this.otp, required this.phoneNumber, required this.jwt});

  @override
  OtpVerificationScreenState createState() => OtpVerificationScreenState();
}

class OtpVerificationScreenState extends State<OtpVerificationScreen> {
  final storageService = SecureStorageService();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   // leading: IconButton(
      //   //   icon: Icon(Icons.arrow_back_ios),
      //   //   onPressed: () {},
      //   // ),
      //   backgroundColor: Colors.white,
      //   elevation: 0,
      // ),
      body: LayoutBuilder(
        builder: (context, constraints) {
          return Padding(
            padding:  EdgeInsets.symmetric(horizontal: constraints.maxWidth * 0.05,vertical: constraints.maxHeight * 0.1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey.shade300),
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: IconButton(
                    iconSize: constraints.maxWidth * 0.04,
                            icon: Icon(Icons.arrow_back_rounded),
                            onPressed: () {},
                          ),
                ),
                SizedBox(height: 20),
                Text(
                  "OTP VERIFICATION",
                  style: GoogleFonts.poppins(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 8),
                RichText(
                  text: TextSpan(
                    text: "Enter the OTP sent to ",
                    style: GoogleFonts.poppins(
                      color: Colors.black,
                      fontSize: 16,
                    ),
                    children: [
                      TextSpan(
                        text: "+91-${widget.phoneNumber}",
                        style: GoogleFonts.poppins(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "OTP is ${widget.otp}",
                  style: GoogleFonts.poppins(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: const Color.fromRGBO(94, 91, 226, 1.0),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: Pinput(
                    length: 4,
                    defaultPinTheme: PinTheme(
                      width: 60,
                      height: 60,
                      textStyle: GoogleFonts.poppins(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        border: Border.all(color: Colors.grey.shade400),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Center(
                  child: OtpTimerWidget()
,
                ),
                SizedBox(height: 10),
                Center(
                  child: RichText(
                    text: TextSpan(
                      text: "Don't receive code? ",
                      style: GoogleFonts.poppins(
                        color: Colors.black54,
                        fontSize: 16,
                      ),
                      children: [
                        TextSpan(
                          text: "Re-send",
                          style: GoogleFonts.poppins(
                            color: Colors.green,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 30),
                Center(
                  child: SizedBox(
                    width: constraints.maxWidth * 0.9,
                    height: 50,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(94, 91, 226, 1.0),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      onPressed: () async{
                       await storageService.saveToken(widget.jwt);
                        Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => HomeScreen()));
                      },
                      child: Text(
                        "Submit",
                        style: GoogleFonts.poppins(
                          fontSize: 18,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
