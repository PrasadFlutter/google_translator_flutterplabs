import 'package:flutter/material.dart';
import 'package:translator/translator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final translator = GoogleTranslator();
  TextEditingController inputText = TextEditingController();
  var TranslatedText;
  List LangList = [
    {"langName": "Amharic", "langCode": "am"},
    {"langName": "Arabic", "langCode": "ar"},
    {"langName": "Basque", "langCode": "eu"},
    {"langName": "Bengali", "langCode": "bn"},
    {"langName": "English (UK)", "langCode": "en-GB"},
    {"langName": "Portuguese (Brazil)", "langCode": "pt-BR"},
    {"langName": "Bulgarian", "langCode": "bg"},
    {"langName": "Catalan", "langCode": "ca"},
    {"langName": "Cherokee", "langCode": "chr"},
    {"langName": "Croatian", "langCode": "hr"},
    {"langName": "Czech", "langCode": "cs"},
    {"langName": "Danish", "langCode": "da"},
    {"langName": "Dutch", "langCode": "nl"},
    {"langName": "English (US)", "langCode": "en"},
    {"langName": "Estonian", "langCode": "et"},
    {"langName": "Filipino", "langCode": "fil"},
    {"langName": "Finnish", "langCode": "fi"},
    {"langName": "French", "langCode": "fr"},
    {"langName": "German", "langCode": "de"},
    {"langName": "Greek", "langCode": "el"},
    {"langName": "Gujarati", "langCode": "gu"},
    {"langName": "Hebrew", "langCode": "iw"},
    {"langName": "Hindi", "langCode": "hi"},
    {"langName": "Hungarian", "langCode": "hu"},
    {"langName": "Icelandic", "langCode": "is"},
    {"langName": "Indonesian", "langCode": "id"},
    {"langName": "Italian", "langCode": "it"},
    {"langName": "Japanese", "langCode": "ja"},
    {"langName": "Kannada", "langCode": "kn"},
    {"langName": "Korean", "langCode": "ko"},
    {"langName": "Latvian", "langCode": "lv"},
    {"langName": "Lithuanian", "langCode": "lt"},
    {"langName": "Malay", "langCode": "ms"},
    {"langName": "Malayalam", "langCode": "ml"},
    {"langName": "Marathi", "langCode": "mr"},
    {"langName": "Norwegian", "langCode": "no"},
    {"langName": "Polish", "langCode": "pl"},
    {"langName": "Portuguese (Portugal)", "langCode": "pt-PT"},
    {"langName": "Romanian", "langCode": "ro"},
    {"langName": "Russian", "langCode": "ru"},
    {"langName": "Serbian", "langCode": "sr"},
    {"langName": "Chinese (PRC)", "langCode": "zh-CN"},
    {"langName": "Slovak", "langCode": "sk"},
    {"langName": "Slovenian", "langCode": "sl"},
    {"langName": "Spanish", "langCode": "es"},
    {"langName": "Swahili", "langCode": "sw"},
    {"langName": "Swedish", "langCode": "sv"},
    {"langName": "Tamil", "langCode": "ta"},
    {"langName": "Telugu", "langCode": "te"},
    {"langName": "Thai", "langCode": "th"},
    {"langName": "Chinese (Taiwan)", "langCode": "zh-TW"},
    {"langName": "Turkish", "langCode": "tr"},
    {"langName": "Urdu", "langCode": "ur"},
    {"langName": "Ukrainian", "langCode": "uk"},
    {"langName": "Vietnamese", "langCode": "vi"},
    {"langName": "Welsh", "langCode": "cy"}
  ];

  translate() async {
    await translator
        .translate(inputText.text, from: 'en', to: '${Lang_Code}')
        .then((outputText) {
      TranslatedText = outputText.toString();
    });
    setState(() {});
  }

  String? Lang_Code;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Translator'),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 60,
            padding: EdgeInsets.all(10),
            margin: EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            decoration: BoxDecoration(
                color: Colors.white, borderRadius: BorderRadius.circular(6)),
            child: Center(
              child: DropdownButton(
                iconSize: 30,
                underline: Container(
                  color: Colors.white,
                ),
                focusColor: Colors.white,
                menuMaxHeight: 300.0,
                isExpanded: true,
                isDense: true,
                hint: Text(
                  "Select Language",
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.w400,
                      fontSize: 14,
                      overflow: TextOverflow.ellipsis),
                ),
                value: Lang_Code != null ? Lang_Code : null,
                items: LangList.map((item) {
                  return DropdownMenuItem(
                      enabled: true,
                      value: item['langCode'].toString(),
                      child: Text(
                        item['langName'].toString(),
                        style: TextStyle(
                            color: Colors.black,
                            fontWeight: FontWeight.w400,
                            fontSize: 14,
                            overflow: TextOverflow.ellipsis),
                      ));
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    Lang_Code = value;
                  });
                },
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20),
            child: TextFormField(
              controller: inputText,
              onChanged: (v) {
                translate();
              },
              decoration: InputDecoration(
                  border: OutlineInputBorder(
                      borderSide: BorderSide(
                    color: Color(0xffe4e4e4),
                  )),
                  contentPadding: EdgeInsets.only(top: 10, left: 5),
                  hintStyle: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 11,
                    color: Color(0xffb2b2b2),
                  ),
                  fillColor: Colors.white,
                  filled: true),
            ),
          ),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: TextButton(
                onPressed: () {
                  translate();
                },
                child: Text('Translate To ${Lang_Code}')),
          ),
          Text(
              'Translated Text --->> \n\n${TranslatedText == null ? '' : TranslatedText}')
        ],
      ),
    );
  }
}
