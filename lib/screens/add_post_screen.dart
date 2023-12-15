import 'dart:typed_data';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:insta_clone/models/models.dart';
import 'package:insta_clone/providers/providers.dart';
import 'package:insta_clone/utils/helpers.dart';
import 'package:provider/provider.dart';

class AddPostScreen extends StatefulWidget {
  const AddPostScreen({super.key});

  @override
  State<AddPostScreen> createState() => _AddPostScreenState();
}

class _AddPostScreenState extends State<AddPostScreen> {
  Uint8List? _imageFile;

  _selectImage(BuildContext context, ThemeData theme) {
    return showModalBottomSheet(
      context: context,
      builder: (context) {
        return Container(
          height: 150,
          padding: const EdgeInsets.all(10),
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(15),
                topRight: Radius.circular(15),
              ),
              color: theme.dialogBackgroundColor),
          child: Column(
            children: [
              Text(
                'Add Photo',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20, color: theme.primaryColor),
              ),
              const SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Uint8List file = await pickImage(ImageSource.camera);
                          setState(() {
                            _imageFile = file;
                          });
                        },
                        icon: Icon(Icons.camera_alt, color: theme.primaryColor),
                      ),
                      Text('Camera', style: TextStyle(color: theme.primaryColor)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () async {
                          Navigator.of(context).pop();
                          Uint8List file = await pickImage(ImageSource.gallery);
                          setState(() {
                            _imageFile = file;
                          });
                        },
                        icon: Icon(Icons.photo_library, color: theme.primaryColor),
                      ),
                      Text('Gallery', style: TextStyle(color: theme.primaryColor)),
                    ],
                  ),
                  Column(
                    children: [
                      IconButton(
                        onPressed: () {
                          Navigator.of(context).pop();
                        },
                        icon: Icon(Icons.cancel, color: theme.primaryColor),
                      ),
                      Text('Cancel', style: TextStyle(color: theme.primaryColor)),
                    ],
                  ),
                ],
              ),
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final customTheme = Theme.of(context);
    final User user = Provider.of<UserProvider>(context).getUser;
    // ignore: no_leading_underscores_for_local_identifiers
    final TextEditingController _captionController = TextEditingController();
    return _imageFile == null
        ? Center(
            child: IconButton(
                icon: Icon(
                  Icons.upload,
                  color: customTheme.primaryColor,
                ),
                onPressed: () => _selectImage(context, customTheme)),
          )
        : Scaffold(
            appBar: AppBar(
              leading: const BackButton(),
              title: Text('Post to', style: customTheme.textTheme.titleLarge),
              centerTitle: false,
              actions: [
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'Post',
                    style: TextStyle(
                      color: customTheme.highlightColor,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ],
            ),
            body: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Column(
                // mainAxisAlignment: ,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      CircleAvatar(
                        radius: 20,
                        backgroundImage: NetworkImage(user.photoUrl),
                      ),
                      Expanded(
                        child: TextField(
                          controller: _captionController,
                          decoration: const InputDecoration(
                            hintText: 'Write a caption...',
                            border: InputBorder.none,
                            contentPadding: EdgeInsets.all(8),
                          ),
                          maxLines: null,
                        ),
                      ),
                      SizedBox(
                        height: 45,
                        width: 45,
                        child: AspectRatio(
                          aspectRatio: 0.9,
                          child: Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: MemoryImage(_imageFile!),
                                fit: BoxFit.cover,
                                alignment: Alignment.center,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
  }
}
