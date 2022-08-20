import 'dart:typed_data';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'image_upload.dart';

class ImageInput extends StatefulWidget {
  final Map<String, dynamic> widgetJson;
  const ImageInput({
    Key? key,
    required this.widgetJson,
  }) : super(key: key);

  @override
  State<ImageInput> createState() => _ImageInputState();
}

class _ImageInputState extends State<ImageInput>
    with AutomaticKeepAliveClientMixin {
  final List<Uint8List> _imageFileList = [];
  String appBarTitle = " length ";

  Future<void> _addImageToList(List<Uint8List> image) async {
    setState(() {
      _imageFileList.addAll(image);
    });
  }

  void setAppBarTitle(String path) {
    appBarTitle = _imageFileList.length as String;
  }

  int _getCrossAxisCount() {
    try {
      Size size = MediaQuery.of(context).size;
      // double height = size.height;
      double width = size.width;
      int count = width ~/ 120;
      // debugPrint('count --> $count');
      return count;
    } catch (e) {
      return 4;
    }
    return 4;
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    return Scaffold(
      appBar: AppBar(
        title: Text(appBarTitle),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            '${widget.widgetJson['label']}',
            softWrap: true,
            style: const TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.w600,
            ),
          ),
          const SizedBox(
            height: 2.5,
          ),
          Container(
            decoration: BoxDecoration(
              border: Border.all(
                color: Colors.grey.shade400,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(10),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey.shade400,
                  offset: const Offset(0.0, 2.5), //(x,y)
                  blurRadius: 3.5,
                ),
              ],
            ),
            margin: const EdgeInsets.all(10),
            child: GridView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: _imageFileList.length + 1,
              gridDelegate:
                  // crossAxisCount stands for number of columns you want for displaying
                  SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: _getCrossAxisCount(),
                mainAxisSpacing: 15,
                crossAxisSpacing: 15,
              ),
              itemBuilder: (BuildContext context, int index) {
                if (index <= 2) {
                  if (index == _imageFileList.length) {
                    /// give option to add images
                    // print('add button returned');
                    return Container(
                      height: 400,
                      width: 400,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(0.0, 2.5), //(x,y)
                            blurRadius: 3.5,
                          ),
                        ],
                      ),
                      child: Center(
                        child: IconButton(
                          icon:
                              const Icon(Icons.add_a_photo_outlined, size: 24),
                          onPressed: () async {
                            List<Uint8List>? image;
                            await Navigator.of(context)
                                .push(CupertinoPageRoute(builder: (context) {
                              return const ImagePickerImageInput(
                                title: "Image",
                              );
                            })).then((value) {
                              if (value != null) {
                                image = value;
                                _addImageToList(value);
                              }
                            });
                            setState(() {
                              appBarTitle = _imageFileList.length.toString();
                            });
                          },
                        ),
                      ),
                    );
                  } else {
                    return Container(
                      height: 200,
                      width: 200,
                      margin: EdgeInsets.all(5),
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: Colors.grey.shade400,
                        ),
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade400,
                            offset: const Offset(0.0, 2.5), //(x,y)
                            blurRadius: 3.5,
                          ),
                        ],
                      ),
                      child: Stack(
                        fit: StackFit.passthrough,
                        alignment: AlignmentDirectional.topEnd,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.memory(
                              _imageFileList[index],
                              fit: BoxFit.contain,
                            ),
                          ),
                          Positioned(
                            top: -10,
                            right: 0,
                            child: IconButton(
                              onPressed: () {
                                setState(() {
                                  _imageFileList.removeAt(index);
                                });
                              },
                              icon: const Icon(
                                Icons.cancel,
                                size: 32,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                } else {
                  return const Text('');
                }
              },
            ),
          ),
        ],
      ),
    );
  }

  @override
  // TODO: implement wantKeepAlive
  bool get wantKeepAlive => true;
}
