import 'dart:io';
import 'package:cloudinary/cloudinary.dart';
import 'package:image_picker/image_picker.dart';

class CloudinaryUploader {
  static final cloudinary = Cloudinary.signedConfig(
    apiKey: '172655181476765',
    apiSecret: 'mcVJcbswVYPwrL9E_2RnkzU7xPw',
    cloudName: 'dgakhptmh',
  );

  static Future<String?> uploadImage({
    required File file,
    String? folder,
    String? fileName,
    Function(int, int)? onProgress,
  }) async {
    final response = await cloudinary.upload(
      file: file.path,
      fileBytes: await file.readAsBytes(),
      resourceType: CloudinaryResourceType.image,
      folder: folder,
      fileName: fileName ?? 'image-${DateTime.now().millisecondsSinceEpoch}',
      progressCallback: onProgress,
    );

    if (response.isSuccessful) {
      return response.secureUrl;
    } else {
      print('Upload failed: ${response.error}');
      return null;
    }
  }

  static Future<File?> pickImageFromGallery() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      return File(pickedFile.path);
    }
    return null;
  }
}
