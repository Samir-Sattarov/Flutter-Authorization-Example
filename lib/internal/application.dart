import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';

import '../domain/services/auth_service.dart';
import '../presentations/cubit/auth_cubit.dart';
import '../presentations/screens/auth/sign_in_screen.dart';

class Application extends StatelessWidget {
  const Application({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Services

    AuthService authService = AuthService();

    // Cubits

    AuthCubit authCubit = AuthCubit(authService);

    return MultiBlocProvider(
      providers: [
        BlocProvider(create: (BuildContext context) => authCubit),
      ],
      child: MaterialApp(
        title: 'Flutter Demo',
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          primarySwatch: Colors.orange,
          textTheme: GoogleFonts.montserratTextTheme(
            Theme.of(context).textTheme,
          ),
          scaffoldBackgroundColor: const Color(0xfff8f7f7),
        ),
        home: const SignInScreen(),
      ),
    );
  }
}
