import 'package:flutter/material.dart';
import 'package:food_app/widgets/content/content_button.dart';
import 'package:food_app/widgets/content/content_input.dart';
import 'package:go_router/go_router.dart';

class FormRegister extends StatefulWidget {
  const FormRegister({super.key});

  @override
  State<FormRegister> createState() => _FormRegisterState();
}

class _FormRegisterState extends State<FormRegister> {
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _confirmPasswordController =
      TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: SingleChildScrollView(
        child: Column(
          spacing: 10,
          children: <Widget>[
            ContentInput(label: 'Name', controller: _nameController),
            ContentInput(label: 'Email', controller: _emailController),
            ContentInput(label: 'Password', controller: _passwordController, isSecret: true,),
            ContentInput(
              label: 'Confirm Password',
              controller: _confirmPasswordController,
              isSecret: true,
            ),
            const SizedBox(height: 20),
            ContentButton(title: 'Registrar', onPressed: () {
              if (_formKey.currentState!.validate()) {
                context.go('/verification');
              }
            }),
          ],
        ),
      ),
    );
  }
}
