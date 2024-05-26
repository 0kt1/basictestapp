import 'package:flutter/material.dart';
import 'package:something/cachingimages.dart';
//import 'package:untitled/addwork.dart';
// import 'nothing.dart';

void main() async {


  WidgetsFlutterBinding.ensureInitialized();

  

  runApp(MaterialApp(
      home: CachingImages(imageUrls: images,),
    ),
  );
}

List<String> images = [
  'https://images.unsplash.com/photo-1531427186611-ecfd6d936c79?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1453728013993-6d66e9c9123a?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1500530855697-b586d89ba3ee?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1487528278747-ba99ed528ebc?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1507525428034-b723cf961d3e?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1521747116042-5a810fda9664?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1506748686214-e9df14d4d9d0?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1541698444083-023c97d3f4b6?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1517248135467-4c7edcad34c4?w=500&h=400&fit=crop',
  'https://images.unsplash.com/photo-1494790108377-be9c29b29330?w=500&h=400&fit=crop',

];