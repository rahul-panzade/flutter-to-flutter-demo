import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kyc2/main.dart';
import 'package:kyc2/utils/from_data.dart';
import 'package:provider/provider.dart';
import 'package:shared_preferences/shared_preferences.dart';


class KycLogin extends StatelessWidget {
  const KycLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(child: TextButton(
      style: ButtonStyle(
        foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
      ),
      onPressed: () {
        getData(context);
      },
      child: Text('TextButton'),
    ),);
  }
}

void getData(BuildContext context) async{
  var _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.setString('mapData',
  '{"appName":"","appVersion":"1.8.0","rneUrl":"::rne_source=::rne_campaign=::rne_emp=::rne_campaignType=::rne_field1=::rne_field2=::rne_field3=::btype=","mobileNumber":"9840372197","ipAddress":"164.199.239.252","channel":"","language":"en","source":"","buildRelease":"prod","platform":"Android","appsFlyerId":"1643932109842-5180390539520987561","pipeTopic":"spark_android","macAddress":"3dcfe56913d7f1c7","cleverTapId":"__g5fe963cb25514ce1938be594b3e41cf8","tvcClientId":"560704ae-39ae-40df-8c27-857f80f34e0e","envType":"uat","appId":"dfbd2821-b900-4adf-b244-8378ff59dc5f","releaseCode":"analytics2.0","device":"android","campaignName":"","mediaSource":"","guestToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTQyNDU3NDAsIm9yaWdfaWF0IjoxNjUzNjQwOTQwLCJ1c2VyRGF0YSI6eyJjb3VudHJ5X2NvZGUiOiJJTiIsIm1vYl9ubyI6Ijk0MDQwMzE5OTIiLCJ1c2VyX2lkIjoibmFydXRvIiwic291cmNlIjoic3BhcmsiLCJhcHBfaWQiOiJuYXJ1dG8iLCJuYW1lIjoiU0hVQkhBTSBTSU5IQSIsImVtYWlsIjoic2luaGFzaHViaGFtOTVAZ21haWwuY29tIiwiaWQiOiJFODQxMjMiLCJyb2xlIjoxNX19.L9Oni7nXAe_uqwFa8YB_UuLxQubwS7zkiRHhfOOb8eI"}');
  WidgetsFlutterBinding.ensureInitialized();
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => const KycSdkScreen()),
  );
  // runApp(const KYC_Log());
}

class KycSdkScreen extends StatelessWidget {
  const KycSdkScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycApp(futterCallback: (value) {
      debugPrint("-------------Rahul------------------>$value");
    });
  }
}