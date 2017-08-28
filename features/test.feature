# encoding: UTF-8
# language: ru
Функция: Тест



  Сценарий: test
    Дано открываем гугл
    И ввожу в поисковой строке текст "cucumber.io"
    И кликаю по первой строке выдачи
    И я должен увидеть текст на странице "Simple, human collaboration"

  Сценарий: test2
    И захожу на страницу "https://rubyinstaller.org/downloads/"
    И скачиваю файл по ссылке "https://github.com/oneclick/rubyinstaller2/releases/download/2.4.1-2/rubyinstaller-2.4.1-2-x64.exe"
    И я должен увидеть файл в папке tmp

  Сценарий: test3
    И я должен увидеть в файле xml тег "FileInfo"
    И я должен увидеть в атрибуте "link" тэга "FileInfo" текст "http://on-realty.com"