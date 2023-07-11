import 'package:chat_app/core/utils/assets.dart';

class Chats {
  String name, lastMessage, image, time;
  bool isActive;

  Chats(
    this.name,
    this.image,
    this.isActive,
    this.lastMessage,
    this.time,
  );
}

List listOfChats = [
  Chats("Mostafa ahmed", AssetData.mostafaPic, true, " هنلعب الساعه كام؟ ",
      "4m ago"),
  Chats("Ali", AssetData.aliPic, true, " بصيح حاليا", "5m ago"),
  Chats("ellebda ", AssetData.ellebdaPic, false, " جاي ببجي ؟", "40m ago"),
  Chats("Dolci", AssetData.dolciPic, true, "تودي قبل ما انام !! ", "2m ago"),
  Chats(
      "Ramadan", AssetData.ramadanPic, false, "ايه يخويا عامل ايه", "15m ago"),
  Chats("Kareem", AssetData.kareemPic, true, " بس كده", "10m ago"),
];
