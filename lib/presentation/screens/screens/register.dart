import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:zybo/presentation/cubit/Auth/auth_cubit.dart';
import 'package:zybo/screens/otp.dart';

class RegisterScreen extends StatefulWidget {
  final String phoneNumber;
  final String otp;
  const RegisterScreen({super.key, required this.phoneNumber, required this.otp});

  @override
  RegisterScreenState createState() => RegisterScreenState();
}

class RegisterScreenState extends State<RegisterScreen> {
  final TextEditingController nameController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthSuccesss) {
                      
                      Navigator.push(
  context,
  MaterialPageRoute(builder: (context) => OtpVerificationScreen(otp: widget.otp, phoneNumber:widget.phoneNumber,jwt: state.authData.token?.access ?? ''
,)),
);

                    }
      },
      builder: (context, state) {
        return Scaffold(
          body: LayoutBuilder(
            builder: (context, constraints) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: constraints.maxWidth * 0.05,
                    vertical: constraints.maxHeight * 0.1),
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
                    TextField(
                      controller: nameController,
                      decoration: InputDecoration(
                        hintText: "Enter Full Name",
                        border: UnderlineInputBorder(),
                      ),
                      keyboardType: TextInputType.text,
                    ),
                    SizedBox(height: 30),
                    Center(
                      child: SizedBox(
                        width: constraints.maxWidth * 0.9,
                        height: 50,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor:
                                const Color.fromRGBO(94, 91, 226, 1.0),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                          onPressed: () {
                             context.read<AuthCubit>().loginRegister(nameController.text, widget.phoneNumber);
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
      },
    );
  }
}
