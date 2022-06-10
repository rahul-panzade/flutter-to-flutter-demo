import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:kyc2/main.dart';
import 'package:kyc2/utils/from_data.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:provider/provider.dart';

class KycLogin extends StatelessWidget {
  const KycLogin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: TextButton(
        style: ButtonStyle(
          foregroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        ),
        onPressed: () {
          getData(context);
        },
        child: Text('TextButton'),
      ),
    );
  }
}

void getData(BuildContext context) async {
  var _sharedPreferences = await SharedPreferences.getInstance();
  _sharedPreferences.setString('mapData',
      '{"appName":"","appVersion":"1.8.0","rneUrl":"::rne_source=::rne_campaign=::rne_emp=::rne_campaignType=::rne_field1=::rne_field2=::rne_field3=::btype=","mobileNumber":"9840372197","ipAddress":"164.199.239.252","channel":"","language":"en","source":"","buildRelease":"prod","platform":"Android","appsFlyerId":"1643932109842-5180390539520987561","pipeTopic":"spark_android","macAddress":"3dcfe56913d7f1c7","cleverTapId":"__g5fe963cb25514ce1938be594b3e41cf8","tvcClientId":"560704ae-39ae-40df-8c27-857f80f34e0e","envType":"uat","appId":"dfbd2821-b900-4adf-b244-8378ff59dc5f","releaseCode":"analytics2.0","device":"android","campaignName":"","mediaSource":"","guestToken":"eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJleHAiOjE2NTQ4ODUyMDAsIm9yaWdfaWF0IjoxNjU0MjgwNDAwLCJ1c2VyRGF0YSI6eyJjb3VudHJ5X2NvZGUiOiJJTiIsIm1vYl9ubyI6Ijk0MDQwMzE5OTIiLCJ1c2VyX2lkIjoibmFydXRvIiwic291cmNlIjoic3BhcmsiLCJhcHBfaWQiOiJuYXJ1dG8iLCJuYW1lIjoiU0hVQkhBTSBTSU5IQSIsImVtYWlsIjoic2luaGFzaHViaGFtOTVAZ21haWwuY29tIiwiaWQiOiJFODQxMjMiLCJyb2xlIjoxNX19.c49IWXlNqZE8F9jsPerrpOddGCkMrimcK6P8qU5WOGw"}');
  WidgetsFlutterBinding.ensureInitialized();
  // Navigator.push(
  //   context,
  //   MaterialPageRoute(builder: (context) => const LoadKYCUsingROUTE()),
  // );
  runApp(const LoadKYCUsingRUNAPP());
}

class LoadKYCUsingROUTE extends StatelessWidget {
  const LoadKYCUsingROUTE({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return KycApp(futterCallback: (name, value) {
      debugPrint("-------------Rahul-------->$name---------->$value");
    });
  }
}

class LoadKYCUsingRUNAPP extends StatelessWidget {
  const LoadKYCUsingRUNAPP({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<FormData>(
        create: (context) => FormData(),
        child: KycApp(futterCallback: (name, value) {
          if (name == 'moveToMain') {
            runApp(MaterialApp(
              title: 'Flutter Demo',
              theme: ThemeData(
                primarySwatch: Colors.blue,
              ),
              home: const KycLogin(),
            ));
          }
          debugPrint("-------------Rahul-------->$name---------->$value");
        }));
  }
}
