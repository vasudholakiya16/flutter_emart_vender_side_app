import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/const/firebase_constant.dart';
import 'package:flutter_emart_vender_side_app/messages_screen/chat_screen.dart';
import 'package:flutter_emart_vender_side_app/services/store_services.dart';
import 'package:flutter_emart_vender_side_app/widgets/loadingIndigature.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';
import 'package:get/get.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: messages, size: 16.0, color: fontGrey),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: StoreServices.getMessages(currentUser!.uid),
        builder: (BuildContext context, AsyncSnapshot<QuerySnapshot> snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return loadingIndicator();
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else {
            var data = snapshot.data!.docs;

            return Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Column(
                  children: List.generate(
                    data.length,
                    (index) => ListTile(
                      onTap: () {
                        Get.to(() => const ChatScreen());
                      },
                      leading: const CircleAvatar(
                        backgroundColor: purpleColor,
                        child: Icon(Icons.person, color: Colors.white),
                      ),
                      title: boldText(
                        text: "${data[index]['friend_name']}",
                        color: fontGrey,
                      ),
                      subtitle: normalText(
                        text: "${data[index]['last_msg']}",
                        color: fontGrey,
                      ),
                      trailing: normalText(
                        text: "11:08PM",
                        color: fontGrey,
                      ),
                    ),
                  ),
                ),
              ),
            );
          }
        },
      ),

      // body: Padding(
      //   padding: const EdgeInsets.all(8.0),
      //   child: SingleChildScrollView(
      //     physics: const BouncingScrollPhysics(),
      //     child: Column(
      //       children: List.generate(
      //         20,
      //         (index) => ListTile(
      //           onTap: () {
      //             Get.to(() => const ChatScreen());
      //           },
      //           leading: const CircleAvatar(
      //             backgroundColor: purpleColor,
      //             child: Icon(Icons.person, color: white),
      //           ),
      //           title: boldText(text: "Username", color: fontGrey),
      //           subtitle: normalText(text: "last Message...", color: fontGrey),
      //           trailing: normalText(text: "11:08PM", color: fontGrey),
      //         ),
      //       ),
      //     ),
      //   ),
      // ),
    );
  }
}
