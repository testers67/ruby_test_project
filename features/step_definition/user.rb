# encoding: UTF-8
# language: ru
require 'rubygems'
require 'selenium-webdriver'
require 'rspec/expectations'

When(/^открываем гугл$/) do
  visit "http://google.com"
  sleep 1
end

When(/^захожу на страницу "(.*?)"/) do |url|
  visit url
  sleep 1
end

When(/^ввожу в поисковой строке текст "(.*?)"$/) do |text|
  #Ищем строку поиска на странце
  query = find("//body//input[@id='lst-ib']")
  #Вводим текст в строку поиска
  query.set(text)
  #Нажимаем кнопку поиска
  button = find("//input[@name='btnK']")
  button.click
  sleep 1
end

When(/^кликаю по первой строке выдачи$/) do
  #Ищем первую ссылку в выдаче
  link_first = find("//h3/a[@href='https://cucumber.io/']")
  link_first.click
  sleep 1
end

When(/^я должен увидеть текст на странице "(.*?)"$/) do |text_page|
  sleep 5
  windows = switch_to_window { title == 'Cucumber' }
  page.should have_text text_page
end

When(/^скачиваю файл по ссылке "(.*?)"$/) do |link_download|
  find("//a[@href='#{link_download}']").click
  sleep 5
end

When(/^я должен увидеть файл в папке tmp$/) do
  sleep 10
  fail 'папка tmp пуста' if Dir.glob(Dir.pwd + '/features/tmp/*')[0].nil?
end

When(/^я должен увидеть в файле xml тег "(.*?)"$/) do |tag_text|
  file_path = Dir.glob(Dir.pwd + '/features/mocks/*')[0]
  File.open(file_path) do |f|
    doc = Nokogiri::XML(f)
    tag_name = tag_text.scan(/[\wА-Яа-я-]+/)[0]
    fail "В содержимом файла тэг #{tag_text} отсутствует" unless doc.xpath("//#{tag_name}").find do |item|
      item.to_s.encode('UTF-8').include? tag_text
    end
  end
end

When(/^я должен увидеть в атрибуте "(.*?)" тэга "(.*?)" текст "(.*?)"$/) do |attr, tag, text|
  file_path = Dir.glob(Dir.pwd + '/features/mocks/*')[0]
  File.open(file_path) do |f|
    doc = Nokogiri::XML(f)
    tag = doc.at_css "#{tag}"
    tag["#{attr}"].should have_text text
  end
end