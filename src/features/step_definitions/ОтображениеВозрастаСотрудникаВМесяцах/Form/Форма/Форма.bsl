﻿//начало текста модуля

///////////////////////////////////////////////////
//Служебные функции и процедуры
///////////////////////////////////////////////////

&НаКлиенте
// контекст фреймворка Vanessa-Behavior
Перем Ванесса;
 
&НаКлиенте
// Структура, в которой хранится состояние сценария между выполнением шагов. Очищается перед выполнением каждого сценария.
Перем Контекст Экспорт;
 
&НаКлиенте
// Структура, в которой можно хранить служебные данные между запусками сценариев. Существует, пока открыта форма Vanessa-Behavior.
Перем КонтекстСохраняемый Экспорт;

&НаКлиенте
// Функция экспортирует список шагов, которые реализованы в данной внешней обработке.
Функция ПолучитьСписокТестов(КонтекстФреймворкаBDD) Экспорт
	Ванесса = КонтекстФреймворкаBDD;
	
	ВсеТесты = Новый Массив;

	//описание параметров
	//Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,Снипет,ИмяПроцедуры,ПредставлениеТеста,Транзакция,Параметр);

	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДатаРожденияСотрудникаРавна(Парам01)","ДатаРожденияСотрудникаРавна","Допустим дата рождения сотрудника равна 01.01.1970");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ДатаАктуальностиРавна(Парам01)","ДатаАктуальностиРавна","И дата актуальности равна 06.09.2016");
	Ванесса.ДобавитьШагВМассивТестов(ВсеТесты,"ВозрастСотрудникаВМесяцахДолженБытьРавен(Парам01)","ВозрастСотрудникаВМесяцахДолженБытьРавен","Тогда возраст сотрудника в месяцах должен быть равен 559");

	Возврат ВсеТесты;
КонецФункции
	
&НаСервере
// Служебная функция.
Функция ПолучитьМакетСервер(ИмяМакета)
	ОбъектСервер = РеквизитФормыВЗначение("Объект");
	Возврат ОбъектСервер.ПолучитьМакет(ИмяМакета);
КонецФункции
	
&НаКлиенте
// Служебная функция для подключения библиотеки создания fixtures.
Функция ПолучитьМакетОбработки(ИмяМакета) Экспорт
	Возврат ПолучитьМакетСервер(ИмяМакета);
КонецФункции



///////////////////////////////////////////////////
//Работа со сценариями
///////////////////////////////////////////////////

&НаКлиенте
// Процедура выполняется перед началом каждого сценария
Процедура ПередНачаломСценария() Экспорт
	
КонецПроцедуры

&НаКлиенте
// Процедура выполняется перед окончанием каждого сценария
Процедура ПередОкончаниемСценария() Экспорт
	
КонецПроцедуры



///////////////////////////////////////////////////
//Реализация шагов
///////////////////////////////////////////////////

&НаКлиенте
//И дата рождения сотрудника равна 01.01.1970
//@ДатаРожденияСотрудникаРавна(Парам01)
Процедура ДатаРожденияСотрудникаРавна(ДатаРождения) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Контекст.Вставить("ДатаРождения", ДатаРождения);		
КонецПроцедуры

&НаКлиенте
//И дата актуальности равна 06.09.2016
//@ДатаАктуальностиРавна(Парам01)
Процедура ДатаАктуальностиРавна(ДатаАктуальности) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Контекст.Вставить("ДатаАктуальности", ДатаАктуальности);		
КонецПроцедуры

&НаКлиенте
//Тогда возраст сотрудника в месяцах должен быть равен 559
//@ВозрастСотрудникаВМесяцахДолженБытьРавен(Парам01)
Процедура ВозрастСотрудникаВМесяцахДолженБытьРавен(ОжидаемыйРезультат) Экспорт
	//Ванесса.ПосмотретьЗначение(Парам01,Истина);
	Результат = КадровыеФункции.РасчетВозрастаВМесяцах(Контекст.ДатаАктуальности, Контекст.ДатаРождения);
	Если Не Результат = ОжидаемыйРезультат Тогда
		ВызватьИсключение "Результат расчитан не верно";
	КонецЕсли;
	
КонецПроцедуры

//окончание текста модуля
