import 'package:flutter/material.dart';

class CachingImages extends StatefulWidget {
  final List<String> imageUrls; // Pass the list of image URLs to the widget

  const CachingImages({required this.imageUrls, Key? key}) : super(key: key);

  @override
  State<CachingImages> createState() => _CachingImagesState();
}

class _CachingImagesState extends State<CachingImages> {
  List<Image> images = [];
  int imagesPerPage = 5;
  bool isFetchingMore = false;
  ScrollController _scrollController = ScrollController();

  @override
  void initState() {
    super.initState();
    _scrollController.addListener(_onScroll);
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if (images.isEmpty) {
      loadMoreImages();
    }
  }

  Future<void> loadMoreImages() async {
    if (isFetchingMore) return;

    setState(() {
      isFetchingMore = true;
    });

    int currentCount = images.length;
    int nextCount = currentCount + imagesPerPage;
    nextCount = nextCount > widget.imageUrls.length
        ? widget.imageUrls.length
        : nextCount;

    List<Image> tempImages = [];
    for (int i = currentCount; i < nextCount; i++) {
      Image image = Image.network(widget.imageUrls[i]);
      await precacheImage(image.image, context, size: const Size(400, 400));
      tempImages.add(image);
      print(tempImages);
    }

    setState(() {
      images.addAll(tempImages);
      isFetchingMore = false;
      // print(images);
    });
  }

  void _onScroll() {
    if (_scrollController.position.pixels ==
            _scrollController.position.maxScrollExtent &&
        !isFetchingMore) {
      loadMoreImages();
    }
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    MediaQueryData queryData;
    queryData = MediaQuery.of(context);

    return Scaffold(
      body: images.isEmpty
          ? const Center(child: CircularProgressIndicator())
          : ListView.builder(
              controller: _scrollController,
              itemCount: images.length,
              itemBuilder: (context, index) {
                return Container(
                  height: queryData.size.height * 0.6,
                  width: queryData.size.width,
                  child: images[index],
                );
              },
            ),
    );
  }
}
