import 'package:dio/dio.dart' as dio;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:peminjam_perpustakaan_app/app/data/constant/endpoint.dart';
import 'package:peminjam_perpustakaan_app/app/data/provider/api_provider.dart';
import 'package:peminjam_perpustakaan_app/app/routes/app_pages.dart';

import '../../../data/provider/storage_provider.dart';

class RegisterController extends GetxController {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final TextEditingController nameController = TextEditingController();
  final TextEditingController usernameController = TextEditingController();
  final TextEditingController notlpnController = TextEditingController();
  final TextEditingController alamatController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  //TODO: Implement registerController

  final count = 0.obs;
  @override
  void onInit() {
    super.onInit();
  }

  @override
  void onReady() {
    super.onReady();
    String status = StorageProvider.read(StorageKey.status);
    if (status == "Logged"){
      Get.offAllNamed(Routes.HOME);
    }
  }

  @override
  void onClose() {
    super.onClose();
  }

  void increment() => count.value++;

  final loadingRegister = false.obs;
  register() async {
    loadingRegister(true);
    try{
      FocusScope.of(Get.context!).unfocus();
      formKey.currentState?.save();
      if (formKey.currentState!.validate()){
        final response = await ApiProvider.instance().post(Endpoint.register,
            data: dio.FormData.fromMap(
                {"nama": usernameController.text.toString(), "username": usernameController.text.toString(), "telp": usernameController.text.toString(),"alamat": usernameController.text.toString(), "password": passwordController.text.toString()}));
        if (response.statusCode == 200){
          Get.back();
        } else {
          Get.snackbar("Sorry", "Login Gagal", backgroundColor: Colors.orange);
        }
      }
      loadingRegister(false);
    } on dio.DioException catch (e){
      loadingRegister(false);
      Get.snackbar("Sorry", e.message ?? "", backgroundColor: Colors.red);
    } catch (e) {
      loadingRegister(false);
      Get.snackbar("Error", e.toString(), backgroundColor: Colors.red);
      throw Exception('Error: $e');
    }
  }
}