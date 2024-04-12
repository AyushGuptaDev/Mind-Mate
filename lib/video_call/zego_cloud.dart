import"package:flutter/material.dart";
import 'package:zego_uikit_prebuilt_call/zego_uikit_prebuilt_call.dart';
class VidioCall extends StatelessWidget {
  const VidioCall({Key? key,required this.userid,required this.username}) : super(key: key);
  //final String callID;
  final String userid;
  final String username;


  @override
  Widget build(BuildContext context) {
    return ZegoUIKitPrebuiltCall(
      appID: 1859111143, // Fill in the appID that you get from ZEGOCLOUD Admin Console.
      appSign: "99871da3a5383cb446405da1bb4f4b0b7b96bbf85b6d01875fe9c8d06ed24e23", // Fill in the appSign that you get from ZEGOCLOUD Admin Console.
      userID: userid,
      userName: username,
      callID: "12345",
      // You can also use groupVideo/groupVoice/oneOnOneVoice to make more types of calls.
      config: ZegoUIKitPrebuiltCallConfig.oneOnOneVideoCall()

    );
  }
}