import 'package:flutter/material.dart';

class MenuItem{

  final String title;
  final String subTitle;
  final String link;
  final IconData icon;

  
  const MenuItem({
    required this.title, 
    required this.subTitle, 
    required this.link, 
    required this.icon
    });


}


const appMenuItems = <MenuItem>[

  MenuItem(
    title: 'Botones', 
    subTitle: 'Varios botones en flutter', 
    link: '/buttons', 
    icon: Icons.smart_button_outlined
    ),

  MenuItem(
    title: 'Tarjetas', 
    subTitle: 'Un contenedor estetizado', 
    link: '/cards', 
    icon: Icons.credit_card
    ),

    MenuItem(
    title: 'ProgressIndicators', 
    subTitle: 'Generales y controlados', 
    link: '/progress', 
    icon: Icons.refresh_outlined
    ),


    MenuItem(
    title: 'Snackbars y dialogos', 
    subTitle: 'Indicadores en pantalla', 
    link: '/snackbar', 
    icon: Icons.info_outline_rounded
    ),

    MenuItem(
    title: 'Animated Container', 
    subTitle: 'Stateful widget animated', 
    link: '/animated', 
    icon: Icons.check_box_outline_blank_outlined
    ),

    MenuItem(
    title: 'UI Controls', 
    subTitle: 'Serie de controles de Flutter', 
    link: '/ui-controls', 
    icon: Icons.car_rental_outlined
    ),

    MenuItem(
    title: 'Introduccion a app', 
    subTitle: 'Introduccion a app', 
    link: '/tutorial', 
    icon: Icons.accessibility_new_outlined
    ),

    MenuItem(
    title: 'Infinite Scroll y pull', 
    subTitle: 'Listas infinitas y pull to refresh', 
    link: '/infinite', 
    icon: Icons.list_alt_rounded
    ),    


];