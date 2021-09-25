import 'package:code_test_datacom_albums/domain/entities/photos_entity.dart';
import 'package:flutter/material.dart';

class PhotoDetailScreen extends StatefulWidget {
  final PhotoEntity photoEntity;

  const PhotoDetailScreen({Key? key, required this.photoEntity})
      : super(key: key);
  @override
  State<PhotoDetailScreen> createState() => _PhotoDetailScreenState();
}

class _PhotoDetailScreenState extends State<PhotoDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.photoEntity.title),
      ),
      body: Center(child: Image.network(widget.photoEntity.url)),
    );
  }
}
