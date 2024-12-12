import 'package:flutter/material.dart';                                          // Импартируем material.dart
import 'package:material/material.dart';

void main() {
  runApp(
    MyApp(),
  );
}
class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.blue,
        body: SafeArea(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children:<Widget> [
                CircleAvatar(
                  radius:50,
                ),
                Text(
                  'Priyanshu',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 40.0,
                    fontFamily: 'Pacifico',
                    color: Colors.white,
                  ),
                ),
                Text(
                  'Flutter Developer',
                  style: TextStyle(
                    fontSize: 20.0,
                    fontFamily: 'Source Sans Pro',
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Card(

                  margin: EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: ListTile(
                      leading:
                      Icon(
                        Icons.phone,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      title:
                      Text(
                        '+91 7355689902',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      )

                  ),
                ),
                Card(

                  margin: EdgeInsets.all(20.0),
                  color: Colors.white,
                  child: ListTile(
                      leading:
                      Icon(
                        Icons.email,
                        color: Colors.black,
                        size: 20.0,
                      ),
                      title:
                      Text(
                        'priyanshutaru@gmial.com',
                        style: TextStyle(
                          fontFamily: 'Pacifico',
                          fontSize: 20.0,
                          color: Colors.black54,
                        ),
                      )

                  ),
                )
              ],
            )
        ),
      ),
    );
  }
}


class Home extends StatefulWidget {                                              // создаем класс Home он наследуется от StatefulWidget для множества динамических значений
   const Home({Key? key}) : super(key: key);

  @override                                                                      // Переопределяет
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // Используем для написания дизайна и реализации списка дел
  late String _userToDo;

  List todoList = []; // Создаем список todo_list


  @override
  void initState() {
    // Работаем со списком в этот метод встроен в флаторе, он вызывается в момент когда только запускается наша сцена
    // TODO: implement initState
    super.initState();
    todoList.addAll(['Buy milk', 'Купить Морковки', 'Купить игрушки']);
  }


  @override
  Widget build(BuildContext context) {
    // Используем для написания дизайна
    return Scaffold( // Вместа контейнера будем использовать объект Scaffold()
      backgroundColor: Colors.grey[900],
      // Указываем цвет и плотность в скобках
      appBar: AppBar( // В объекте указываем шапку, используем AppBar
        title: Text('Спиок дел'),
        // В шапке приложения указываем текстовую надпись 'Список дел'
        centerTitle: true,
      ),
      body: ListView
          .builder( // Указываем основную часть Объект ListView() Позволяет создать отображение в формате списка. обращаемся к .builder(itemBuilder: itemBuilder) это встроенный метод
          itemCount: todoList.length,
          // В itemCount: указываем сколько элементов в списке, обращаемся к свойству length
          itemBuilder: (BuildContext context,
              int index) { // itemBuilder это специальное значение, за счет которого мы указываем каким образом будет построен весь список. В качестве значения указываем функцию, эта функция принимает 2 параметра это BuildContext context, второй это индекс с которым мы будем работать int index
            return Dismissible(
                key: Key(todoList[index]),
                // Возвращаем каждый элемент, который будет выведен в списке. Можем указать в виде текста Text() НО МЫ СДЕЛАЕМ ВОЗВРАТ ЭЛЕМЕНТОВ В ВИДЕ БЛОКОВ КОТОРЫЕ МОЖНО БУДЕТ СВЙПАТЬ Dismissible( Тут указываем ключ key: key. и дочерний объект child: child) В качестве ключа необходимо передавать элемент с которым мы сейчас работаем, для начала обращаемся к классу Key(в скобках прописываем обращение к todo_list[по индексу бере нужный элемент index берем индекс который был указан в параметрах]) т.е в ключ передаем элемент с которым мы сейчас работаем
                child: Card( // В чаилд будем указывать дизайн, за счет которого мы будем отображать каждый отдельный элемент. C помощью Card() создаем некую карточку
                  child: ListTile(
                      title: Text(todoList[index]),
                      // Тут указываем что выводить
                      trailing: IconButton( // Добавляем иконку
                        icon: Icon(
                            Icons.delete_sweep,
                            color: Colors.deepOrangeAccent
                        ),
                        onPressed: () { //обрабатываем событие нажатие на кнопку
                          setState(() {
                            todoList.removeAt(
                                index); // меняем состояние, состояние списка и удаляем определенный элемент по его индексу
                          });
                        },
                      )
                  ),
                ),
                onDismissed: (
                    direction) // обработчик событий к Dismissible для отслеживания событий смахивания. эта функциядолжна принимать параметр direction за счет этого можно понять в какую сторону определенная карточка была удалена
                {
                  //if (direction == DismissDirection.endToStart)                  // Проверяем, для этого обращаемся к (direction и проверяем на класс DismissDirection и через точку проверяем в какую сторону был удален объект. с начала в конец или наооборот)
                  setState(() { // Не важно в какую сторону было смахивание, Мы просто будем удалять из , обращаемся к setState. Через данный метод мы можем контролировать состояние
                    todoList.removeAt(
                        index); // Обращаемся к todoList.removeAt(index туу указаваем индекс который хотим удалить)

                  });
                }
            );
          }
      ),
      floatingActionButton: FloatingActionButton( // Прописываем кнопку, основывается кнопка на классе FloatingActionButton
          backgroundColor: Colors.greenAccent, // указываем фон кнопки
          onPressed: () { // Реализ =вываем событие

            showDialog(context: context,
                builder: (
                    BuildContext context) { // при нажатии выводим всплывающее окно, вызываем этот метод

                  return AlertDialog(
                    title: Text('Добавить элеммент'),
                    content: TextField(
                      onChanged: (String value) {
                        _userToDo = value;
                      },
                    ),
                  );
                });
          },

          child: Icon( // дочерний элемент будет обычная иконка
              Icons.add_box,
              // для иконки указываем класс Icons далее выбираем из всех возмодных иконок add и выбираем иконку.
              color: Colors.white // Выбираем цвет
          )
      ),

    );
  }
}
  // Тут создаем основной класc