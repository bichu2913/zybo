import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:zybo/presentation/cubit/user/user_cubit.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: LayoutBuilder(
        builder: (context, constraints) {
          double width = constraints.maxWidth;

          return BlocBuilder<UserCubit, UserState>(
            builder: (context, state) {
              if (state is UserFailure) {
          return Center(child: Text(state.error));
        } else if (state is UserLoading) {
          return Center(child: CircularProgressIndicator());
        } else if (state is UserSuccess) {
              return Padding(
                padding: EdgeInsets.symmetric(
                    horizontal: width * 0.08, vertical: 40),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "My Profile",
                      style: TextStyle(
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                          color: Colors.black),
                    ),
                    SizedBox(height: 30),
                    ProfileField(label: "Name", value: state.userProfile.name.toString()),
                    SizedBox(height: 20),
                    ProfileField(label: "Phone", value: state.userProfile.phoneNumber.toString()),
                  ],
                ),
              );
        } else {
          return Center(child: CircularProgressIndicator());
            }
            }
          );
        },
      ),
    );
  }
}

class ProfileField extends StatelessWidget {
  final String label;
  final String value;

  ProfileField({required this.label, required this.value});

  @override
  Widget build(BuildContext context) {
    
        
          return Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                label,
                style: TextStyle(fontSize: 14, color: Colors.grey),
              ),
              SizedBox(height: 4),
              Text(
                value,
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
              ),
            ],
          );
        
 
}}
