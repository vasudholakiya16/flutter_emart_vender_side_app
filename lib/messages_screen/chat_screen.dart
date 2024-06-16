import 'package:flutter_emart_vender_side_app/const/const.dart';
import 'package:flutter_emart_vender_side_app/messages_screen/components/chat_bubble.dart';
import 'package:flutter_emart_vender_side_app/widgets/text_style.dart';

class ChatScreen extends StatelessWidget {
  const ChatScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: boldText(text: "Chats", size: 16.0, color: fontGrey),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Expanded(
              child: ListView.builder(
                  itemCount: 20,
                  itemBuilder: ((context, index) {
                    return chatBubble();
                  })),
            ),
            10.heightBox,
            SizedBox(
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                        child: TextFormField(
                      decoration: const InputDecoration(
                        isDense: true,
                        hintText: "Enter Message",
                        border: OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor),
                        ),
                        focusedBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: purpleColor),
                        ),
                      ),
                    )),
                    IconButton(
                        onPressed: () {},
                        icon: const Icon(
                          Icons.send,
                          color: purpleColor,
                        ))
                  ],
                ))
          ],
        ),
      ),
    );
  }
}
