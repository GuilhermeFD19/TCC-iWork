import 'package:flutter/material.dart';

class SelectIcon {
  Icon selection(String categoria) {
    switch (categoria) {
      case "Eletricista":
        return Icon(Icons.electrical_services);
      case "Encanador":
        return Icon(Icons.water_damage);
      case "Pedreiro":
        return Icon(Icons.construction);
      case "Pintor":
        return Icon(Icons.format_paint);
      case "Carpinteiro":
        return Icon(Icons.eco);
      case "Manicure":
        return Icon(Icons.woman_2_outlined);
      case "Cabeleireiro":
        return Icon(Icons.cut_outlined);
      case "Jardineiro":
        return Icon(Icons.sunny);

      default:
        return Icon(Icons.person);
    }
  }
}
