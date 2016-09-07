PathAll = "D:\repo\al\";
УстановитьТекущийКаталог(PathAll);
//УдалитьФайлы(PathAll);
ЗапуститьПриложение("allure generate .",,Истина);
ЗапуститьПриложение("allure report open");