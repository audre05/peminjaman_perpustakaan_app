import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/register_controller.dart';

class RegisterView extends GetView<RegisterController> {
  const RegisterView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Register'),
        centerTitle: true,
      ),
      body: Center(
          child: Form(key: controller.formKey,
            child: Column(
              children: [
                TextFormField(
                  controller: controller.nameController,
                  decoration: InputDecoration(hintText: "Masukan Nama Anda"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Nama tidak boleh kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.usernameController,
                  decoration: InputDecoration(hintText: "Masukan username"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "username tidak boleh kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.notlpnController,
                  decoration: InputDecoration(hintText: "Masukan Nomor Telepon"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "No.telfon tidak boleh kosong";
                    }
                    return null;
                  },
                ),TextFormField(
                  controller: controller.alamatController,
                  decoration: InputDecoration(hintText: "Masukan Alamat Anda"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Aamat tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: controller.passwordController,
                  decoration: InputDecoration(hintText: "Masukan Password"),
                  validator: (value) {
                    if (value!.isEmpty) {
                      return "Password tidak boleh kosong";
                    }
                    return null;
                  },
                ),
                Obx(() =>
                controller.loadingRegister.value?
                CircularProgressIndicator():
                ElevatedButton(onPressed: () {
                  controller.register();
                }, child: Text("Register")))
              ],
            ),
          )),
    );
  }
}