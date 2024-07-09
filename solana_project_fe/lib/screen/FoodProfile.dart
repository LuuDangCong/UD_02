import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:solana_project_fe/screen/PurchaseMoreScreen.dart';
import 'package:solana_project_fe/utils/FoodColors.dart';
import 'package:solana_project_fe/utils/FoodString.dart';
import 'package:solana_project_fe/utils/AppWidget.dart';

class FoodProfile extends StatefulWidget {
  static String tag = '/FoodProfile';

  @override
  FoodProfileState createState() => FoodProfileState();
}

class FoodProfileState extends State<FoodProfile> {
  String? _selectedLocation = 'Female';
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: food_white,
      appBar: appBar(context, food_lbl_profile),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: <Widget>[
              SizedBox(height: 20),
              Center(
                child: CircleAvatar(
                  radius: 50,
                  backgroundImage: AssetImage('assets/profile_picture.png'), // Đường dẫn tới ảnh avatar
                ),
              ),
              SizedBox(height: 20),
              Text(
                'Tên người dùng',
                style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
              ),
              SizedBox(height: 10),
              Text(
                'email@example.com',
                style: TextStyle(fontSize: 16, color: Colors.grey),
              ),
              SizedBox(height: 20),
              Divider(),
              SizedBox(height: 20),
              buildTextField('Họ và tên', 'Nguyễn Văn A'),
              SizedBox(height: 20),
              buildTextField('Email', 'email@example.com'),
              SizedBox(height: 20),
              buildTextField('Số điện thoại', '0123456789'),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    'Giới tính',
                    style: TextStyle(fontSize: 16),
                  ),
                  DropdownButton<String>(
                    value: _selectedLocation,
                    onChanged: (String? newValue) {
                      setState(() {
                        _selectedLocation = newValue;
                      });
                    },
                    items: <String>['Male', 'Female', 'Other']
                        .map<DropdownMenuItem<String>>((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                  ),
                ],
              ),
              SizedBox(height: 20),
              ElevatedButton(
                onPressed: () {
                  // Xử lý khi nhấn nút lưu
                },
                child: Text('Lưu'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget buildTextField(String labelText, String placeholder) {
    return TextField(
      decoration: InputDecoration(
        labelText: labelText,
        floatingLabelBehavior: FloatingLabelBehavior.always,
        hintText: placeholder,
        contentPadding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}
