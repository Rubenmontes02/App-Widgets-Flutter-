


import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

class SnackbarScreen extends StatelessWidget {

  static const name = 'snackbar_screen';

  const SnackbarScreen({super.key});

  void showCustomSnackbar(BuildContext context){

    ScaffoldMessenger.of( context ).clearSnackBars();

    final snackbar = SnackBar(
        content: const Text('Hola Mundo'),
        action:SnackBarAction(
          label: 'Ok', 
          onPressed: (){}
          ),
          duration: const Duration(seconds: 2),
        );
    ScaffoldMessenger.of(context).showSnackBar(snackbar);

  }


  void openDialog(BuildContext context){

    showDialog(
      barrierDismissible: false,
      context: context, 
      builder: (context) => AlertDialog(
        title: const Text('Estas seguro?'),
        content: const Text('Deserunt ipsum ex duis aute exercitation ut ad.Ad elit nostrud qui do.Nostrud laborum deserunt ipsum do enim reprehenderit mollit sit pariatur cupidatat exercitation excepteur.Esse laborum sunt consequat veniam sunt nostrud amet fugiat dolor.Non laborum ipsum labore ad commodo incididunt irure nisi.'),
        actions: [
          TextButton(onPressed: () => context.pop(), child: const Text('Cancelar')),

          FilledButton(onPressed: ()=> context.pop(), child: const Text('Aceptar'))     
          ],
      
      ),
      );
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('SnackBar y Dialogos'),
      ),

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            FilledButton.tonal(
              onPressed: (){
                showAboutDialog(
                  context: context,
                  children: [
                    const Text('Nulla in magna occaecat laboris non culpa aliqua. Commodo eu Lorem commodo adipisicing laborum eu excepteur consequat nisi consectetur.Dolor irure aliqua veniam reprehenderit exercitation nulla fugiat fugiat.Duis laborum minim quis fugiat ex sint elit fugiat.Sunt exercitation incididunt nisi fugiat labore nulla incididunt consectetur officia cupidatat consectetur.Cillum enim amet dolore eu occaecat do consectetur nulla.Irure ullamco enim ullamco adipisicing adipisicing duis.')
                  ]
                  );
              }, 
              child: const Text('Licencias usadas')),

            FilledButton.tonal(
              onPressed: () => openDialog(context), 
              child: const Text('Mostrar diálogo'))

          ],
        ),
      ),



      floatingActionButton: FloatingActionButton.extended(
        label: const Text('Mostrar Snackbar'),
        icon: const Icon(Icons.remove_red_eye),
        onPressed: () => showCustomSnackbar(context)
        
      ),

    );
  }
}