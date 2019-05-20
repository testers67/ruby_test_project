# encoding: UTF-8
# language: ru
Функция: Тест



  Сценарий: test
    Дано захожу на страницу "http://google.com"
    И ввожу в поисковой строке текст "cucumber.io"
    И кликаю по первой строке выдачи
    И я должен увидеть текст на странице "Thousands of teams worldwide trust Cucumber to deliver better products, faster."

  Сценарий: test2
    И папка Загрузки пуста
    И захожу на страницу "https://rubyinstaller.org/downloads/"
    И скачиваю файл по ссылке "https://github.com/oneclick/rubyinstaller2/releases/download/RubyInstaller-2.4.6-1/rubyinstaller-devkit-2.4.6-1-x64.exe"
    И я должен увидеть файл в папке tmp

  Сценарий: test3
    И я должен увидеть в файле xml тег "FileInfo"
    И я должен увидеть в атрибуте "link" тэга "FileInfo" текст "http://on-realty.com"