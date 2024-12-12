import 'package:flutter/material.dart';
import 'package:to_do/pages/home.dart';                                           // Импартируем пакет из to_do из папки pages выбираем фаил home.dart

void main() => runApp(MaterialApp(                                                //Вызываем метод runApp и в качестве значения передаем  (MaterialApp(
  theme: ThemeData(                                                               // Для темы указываем класс ThemeData
    primaryColor: Colors.deepOrangeAccent,                                        // Указываем значения Colors.deepOrangeAccent
  ),
  home: Home(),                                                                   //Указываем основную страничку, в качестве основной странички вызываем класс Home()
));

// Тут мы можем добавлять все остальные классы, и продолжить писать весь код. Для удобства создадим в папке Lib новую папку Pages в папке создаем фаил Home.dart
// Папку test удаляем