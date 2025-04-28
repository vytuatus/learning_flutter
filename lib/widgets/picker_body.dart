import 'package:flutter/material.dart';
import 'package:learning_flutter/models/image_model.dart';
import 'package:learning_flutter/repo/image_repository.dart';

class NetworkImagePicker extends StatelessWidget {
  final Function(String)? onImageSelected;

  NetworkImagePicker({
    super.key,
    required this.onImageSelected,
  });

  final ImageRepository _imageRepo = ImageRepository();

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(20),
          topRight: Radius.circular(20),
        ),
      ),
      child: FutureBuilder<List<CustomImage>>(
        future: _imageRepo.getNetworkImages(), 
        builder: (context, AsyncSnapshot<List<CustomImage>> snapshot) {
          if (snapshot.hasData) {
            final images = snapshot.data!;
            return Expanded(
              child: GridView.builder(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                  mainAxisSpacing: 4.0,
                  crossAxisSpacing: 4.0,
                ),
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      // Handle image selection
                      onImageSelected!(images[index].imageUrl!);
                      
                    },
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.network(images[index].imageUrl!, fit: BoxFit.cover),
                    ),
                  );
                },
              ),
            );
          } else if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return const Center(child: Text('Error loading images'));
          } else {
            return const SizedBox.shrink(); // Placeholder for the image loading
          }
        },
      ),
    );
  }
}