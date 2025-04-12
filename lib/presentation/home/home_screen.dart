import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:real_chat_app/data/services/service_locator.dart';
import 'package:real_chat_app/logic/cubit/auth/auth_cubit.dart';
import 'package:real_chat_app/logic/cubit/auth/auth_state.dart';
import 'package:real_chat_app/presentation/screens/auth/login_screen.dart';
import 'package:real_chat_app/router/app_router.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
              onPressed: () {
                getIt<AuthCubit>().signOut();
                getIt<AppRouter>().pushAndRemoveUntil(const LoginScreen());
              },
              icon: const Icon(Icons.logout))
        ],
      ),
      body: Center(
        child: BlocBuilder<AuthCubit, AuthState>(
          bloc: getIt<AuthCubit>(),
          builder: (context, state) {
           if(state.status==AuthStatus.authenticatedState){
             return Text("Welcome to the ${state.user!.fullName}");
           }
           if(state.status==AuthStatus.anauthenticatedState){
           return const SizedBox();

           }else{
            return const SizedBox();
           }
          },
        ),
      ),
    );
  }
}
