# Clean Architecture for Flutter

This a sample app that implement Uncle Bob's Clean Architecture in Flutter.

There are 3 main Layers to help separate the code:

1- Domain.                                                                                                                                                                       
2- Data.                                                                                                                                                                         
3- Presentation.                                                                                                                                                                                                                                                                                                                                                 
<img src="./flutter_clean_arch.png" style="width: 75%;"/>

Domain Layer:
defines the business logic of the application and contains UseCases, Domain Entities, and Repository Interfaces.

Data Layer:
responsible for data retrieval and contains APIs, Local Storage, Data objects (Request, Response and DB objects), and the Repository Implementation.

Presentation
the UI of the application and contains Screens, Widgets and Presentation logic.


## Libraries
* [GetX](https://pub.dev/packages/get)
* [Dio](https://pub.dev/packages/dio)
* [GetIt](https://pub.dev/packages/get_it)
* [get_storage](https://pub.dev/packages/get_storage)
* [internet_connection_checker](https://pub.dev/packages/internet_connection_checker)
* [equatable](https://pub.dev/packages/equatable)


## References
* [The Clean Code Blog](https://blog.cleancoder.com/uncle-bob/2012/08/13/the-clean-architecture.html)
* [Reso Coder](https://resocoder.com/2019/08/27/flutter-tdd-clean-architecture-course-1-explanation-project-structure/)
* [Flutter Clean Architecture Series](https://devmuaz.medium.com/flutter-clean-architecture-series-part-1-d2d4c2e75c47)


### Support
If you liked the repo giving it a Star ⭐️.

> Before you build this App from source code, please get an ApiKey from [newsapi.org](https://newsapi.org)
and add your ApiKey in constants.dart file. 