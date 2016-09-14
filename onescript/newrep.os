
// Создаем
ЗапуститьПриложение("git init",,Истина);
ЗапуститьПриложение("git config --local user.name pav",,Истина);
ЗапуститьПриложение("git remote add vanessa-bootstrap https://github.com/silverbulleters/vanessa-bootstrap.git",,Истина);
ЗапуститьПриложение("git fetch vanessa-bootstrap",,Истина);

//СоздатьПроцесс("git init");
//СоздатьПроцесс("git config --local user.name pav");
//СоздатьПроцесс("git remote add vanessa-bootstrap https://github.com/silverbulleters/vanessa-bootstrap.git");
//СоздатьПроцесс("git fetch vanessa-bootstrap");


// Копируем из precommit1c
Путькхранилищу = "D:\repo\precommit1c\";
//СоздатьКаталог("..\.git\hooks");
СоздатьКаталог(".\.git\hooks\ibService");
ФайлыДляКопирования = НайтиФайлы(Путькхранилищу + "ibService", "*.*");
Для Каждого КопируемыйФайл Из ФайлыДляКопирования Цикл
    КопироватьФайл(КопируемыйФайл.ПолноеИмя, ".\.git\hooks\ibService\"+КопируемыйФайл.ПолноеИмя);
КонецЦикла