import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'main2.dart';
import 'package:http/http.dart' as http;
import 'package:http_parser/http_parser.dart';
void main() {
  runApp(Main3());
}

// Generated by: https://www.figma.com/community/plugin/842128343887142055/
class Main3 extends StatelessWidget {
  const Main3 ({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark().copyWith(
        scaffoldBackgroundColor: const Color.fromARGB(255, 18, 32, 47),
      ),
      home: Scaffold(
        body: ListView(children: [
          Page(),
        ]),
      ),
    );
  }
}

class Page extends StatefulWidget {
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<Page> {
  File? _imageFile;
  final _picker = ImagePicker();
  final _textEditingController = TextEditingController();

  Future<void> _getImage() async {
    final pickedFile = await _picker.pickImage(source: ImageSource.gallery);

    setState(() {
      if (pickedFile != null) {
        _imageFile = File(pickedFile.path);
      } else {
        print('No image selected.');
      }
    });
  }

  void _saveDietPlan() async {
    print('Diet plan text: ${_textEditingController.text}');
    print('Image path: ${_imageFile?.path}');

    try {
      var request = http.MultipartRequest(
        'POST',
        Uri.parse('https://your-backend-server.com/diet-plans'),  // 실제 백엔드 서버 주소로 변경해야 합니다.
      );

      request.fields['text'] = _textEditingController.text;

      if (_imageFile != null) {
        request.files.add(
          http.MultipartFile(
            'image',
            _imageFile!.readAsBytes().asStream(),
            _imageFile!.lengthSync(),
            filename: _imageFile!.path.split('/').last,
            contentType: MediaType('image', 'jpeg'),
          ),
        );
      }

      var response = await request.send();

      if (response.statusCode == 200) {
        print('Diet plan uploaded successfully.');
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => Main2()),
        );
      } else {
        print('Failed to upload diet plan.');
      }
    } catch (e) {
      print('Server connection failed: $e');
    }
  }




  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
        child: Column(
         children: [
          Container(
           width: 393,
           height: 850,
           clipBehavior: Clip.antiAlias,
           decoration: BoxDecoration(color: Color(0xFFF9F9F9)),
           child: Stack(
            children: [
              Positioned(
                top: 63,  // 체중관리 줄의 위치에 따라 조정해야 합니다.
                left: 10.0,  // 왼쪽 끝에 배치하기 위해 0으로 설정.

                child: Material( // Material 위젯 추가
                  type: MaterialType.transparency, // background color를 투명하게 설정
                  child: IconButton(
                    icon: Icon(Icons.arrow_back),
                    iconSize: 24,  // 아이콘 크기를 24로 설정.
                    color: Colors.black,
                    onPressed: () {
                      // 뒤로가기 버튼을 눌렀을 때의 액션을 여기에 정의합니다.
                      Navigator.pop(context);
                    },
                  ),
                ),
              ),
              Positioned(
                left: 35,
                top: 70,
                child: SizedBox(
                  width: 324,
                  height: 38.49,
                  child: Text(
                    '식단 작성하기',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.800000011920929),
                      fontSize: 20,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0,
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 15,
                top: 77,
                child: Container(
                  width: 24,
                  height: 24,
                  padding: const EdgeInsets.symmetric(horizontal: 7.75, vertical: 4.25),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [

                    ],
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 154,
                child: Container(
                  width: 302,
                  height: 408.50,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 408.50,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 86,
                        top: 365,
                        child: Material( // Material 위젯 추가
                          color: Colors.transparent,
                        child: InkWell(
                          onTap: _getImage,
                          child: SizedBox(
                            width: 137,
                            height: 24,
                            child: Stack(
                              children: [
                                Positioned(
                                  left: 0,
                                  top: 0,
                                  child: Container(
                                    width: 24,
                                    height: 24,
                                    padding: const EdgeInsets.all(2),
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      crossAxisAlignment: CrossAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 20,
                                          height: 20,
                                          child: Stack(
                                            children: [
                                              Positioned(
                                                left: 0,
                                                top: 0,
                                                child: Container(
                                                  width: 20,
                                                  height: 20,
                                                  decoration: ShapeDecoration(
                                                    shape: OvalBorder(
                                                      side: BorderSide(
                                                        width: 1,
                                                        strokeAlign: BorderSide.strokeAlignCenter,
                                                        color: Colors.black.withOpacity(0.6000000238418579),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                              Positioned(
                                                left: 86,  // '사진 추가하기' 버튼과 같은 위치로 설정
                                                top: 400,  // '사진 추가하기' 버튼 아래에 위치하도록 설정
                                                child: _imageFile == null
                                                    ? Text('No image selected.')
                                                    : Image.file(
                                                  _imageFile!,
                                                  width: 100,  // 이미지의 크기를 조정해야 할 수도 있습니다.
                                                  height: 100,  // 이미지의 크기를 조정해야 할 수도 있습니다.
                                                ),
                                              ),

                                            ],
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Positioned(
                                  left: -12,
                                  top: -12,
                                  child: IconButton(  // IconButton 위젯을 추가합니다.
                                    icon: Icon(Icons.add),  // '+' 아이콘을 추가합니다.
                                    iconSize: 20,  // 아이콘 크기를 24로 설정.
                                    color: Colors.black,
                                    onPressed: _getImage,
                                    //     () {
                                    //   // '+' 버튼을 눌렀을 때의 동작을 정의합니다.
                                    // },
                                  ),
                                ),
                                Positioned(
                                  left: 29,
                                  top: 5,
                                  child: SizedBox(
                                    width: 108,
                                    height: 18,
                                    child: Text(
                                      '사진 추가하기',
                                      style: TextStyle(
                                        color: Colors.black.withOpacity(0.699999988079071),
                                        fontSize: 16,
                                        fontFamily: 'Montserrat',
                                        fontWeight: FontWeight.w500,
                                        height: 1.0,

                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 46,
                top: 582.50,
                child: Container(
                  width: 302,
                  height: 56,
                  child: Stack(
                    children: [
                      Positioned(
                        left: 0,
                        top: 0,
                        child: Container(
                          width: 302,
                          height: 56,
                          decoration: ShapeDecoration(
                            color: Colors.white,
                            shape: RoundedRectangleBorder(
                              side: BorderSide(width: 0.50, color: Color(0xFF868686)),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            shadows: [
                              BoxShadow(
                                color: Color(0x0C000000),
                                blurRadius: 64,
                                offset: Offset(0, 4),
                                spreadRadius: 0,
                              )
                            ],
                          ),
                        ),
                      ),
                      Positioned(
                        left: 103,
                        top: 21,
                        child: Material( // Material 위젯 추가
                          color: Colors.transparent,
                         child: InkWell(
                          onTap: () {
                            _saveDietPlan();
                            Navigator.push(
                              context,
                              MaterialPageRoute(builder: (context) => Main2()),
                            );
                          },
                          child: SizedBox(
                            width: 97,
                            height: 14,
                            child: Text(
                              '식단 저장하기',
                              style: TextStyle(
                                color: Colors.black.withOpacity(0.699999988079071),
                                fontSize: 16,
                                fontFamily: 'Montserrat',
                                fontWeight: FontWeight.w500,
                                height: 1.0,
                              ),
                            ),
                          ),
                        ),
                      ),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                left: 0,
                top: 114,
                child: Container(
                  width: 398,
                  decoration: ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: Colors.black.withOpacity(0.20000000298023224),
                      ),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 73,
                top: 194,
                child: Container(
                  width: 247,
                  height: 307,
                  decoration: ShapeDecoration(
                    color: Colors.white,
                    shape: RoundedRectangleBorder(
                      side: BorderSide(width: 1, color: Color(0x9E3C3C3C)),
                    ),
                  ),
                ),
              ),
              Positioned(
                left: 89,
                top: 211,
                child: Material( // Materail 위젯 추가
                  color: Colors.transparent,
                 child: SizedBox(
                  width: 216,
                  height: 272,
                  child: TextField(
                    controller: _textEditingController,
                    decoration: InputDecoration(
                      hintText: '식단에 대해 작성해주세요.',  // 힌트 텍스트를 추가합니다.
                      hintStyle: TextStyle(
                        color: Colors.black.withOpacity(0.550000011920929),
                        fontSize: 16,
                        fontFamily: 'Montserrat',
                        fontWeight: FontWeight.w500,
                        height: 0.8,
                      ),
                    ),
                    style: TextStyle(
                      color: Colors.black.withOpacity(0.550000011920929),
                      fontSize: 16,
                      fontFamily: 'Montserrat',
                      fontWeight: FontWeight.w500,
                      height: 0.8,
                    ),
                    // 입력된 텍스트를 저장할 변수를 설정하거나, onChanged 콜백을 활용하여 텍스트 입력 시 동작을 추가할 수 있습니다.
                    maxLines: null,
                  ),
                ),
              ),
              ),
            ],
          ),
        ),
      ],
        ),
    );
  }
}