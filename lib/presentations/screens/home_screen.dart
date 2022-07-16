import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../cubit/auth_cubit.dart';
import '../widget/button_widget.dart';

class HomeScreen extends StatelessWidget {
  static route() => MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      );

  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: GestureDetector(
          onTap: () => Navigator.pop(context),
          child: Icon(
            Icons.arrow_back,
            color: Colors.white,
          ),
        ),
        title: const Text(
          'Home',
          style: TextStyle(color: Colors.white),
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          BlocBuilder<AuthCubit, AuthState>(
            builder: (context, state) {
              if (state is SignInSuccess) {
                return Text(
                  "uid: ${state.data.user!.uid}",
                  textAlign: TextAlign.center,
                );
              }
              return const Text("UID not found");
            },
          ),
          const SizedBox(height: 30),
          ButtonWidget(
            onPressed: () {
              Navigator.pop(context);
              BlocProvider.of<AuthCubit>(context).exit();
            },
            text: 'Exit',
          )
        ],
      ),
    );
  }
}
