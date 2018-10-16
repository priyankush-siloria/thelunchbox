#Локальное развёртывание проекта:
Для того, чтобы выкатить локально проект (и в дальнейшем запустить его)
нужно для начала убедиться что у тебя установлен **git и python3**.

Если с этим всё гуд, тогда клонируем проект из репозитория в любой удобный
тебе каталог командой:

**git clone https://github.com/OlzhasAlexandrov/py-dev-restaurant.git**

Затем перейдем в этот каталог: **cd py-dev-restaurant/**
и создадим внутри него виртуальное окружение:   
**virtualenv --no-site-packages --distribute -p python3 env**

Каталог "env" который создастся и будет нашим виртуальным окружением.

Теперь нужно активировать виртуальное окружение и установить зависимости
проекта:   
**. env/bin/activate**  
**pip install -r requirements.txt**

После этого, скорее всего 'pip' предложет обновиться, поэтому смело вводим
команду: **pip install --upgrade pip**

Теперь можно запускать проект: 
**./manage.py runserver --settings=restaurant.settings_debug**

По умолчанию в основном файле **settings.py** отключен дебаг, т.к. этот файл 
улетает на продакшн, поэтому я создал **settings_debug.py** для локальной отладки.

В файле settings_debug нужно указать правильный путь к каталогу static, 
иначе возникнут проблемы с отображением картинок и всего прочего.

##Удобнее всего запускать проект из PyCharm :) 
В верхнем правом углу жмем дропдаун "restaurant" -> Edit configurations
В открытом окне настроек убеждаемся, что у нас используется правильный интерпретатор
который содержит путь к созданному нами виртуальному окружению.

В качестве HOST выставляем 0.0.0.0, порт можно оставить тем же 8000

Редактируем Environment varibles нажав справа на три точки и добавляем
переменную (если не добавилась автоматически) DJANGO_SETTINGS_MODULE
и присваиваем ей: restaurant.settings_debug
После этого нажимаем Apply и закрываем окно настроек. 
Чтобы запустить проект жмем в правом верхнем углу на зеленый треугольник и радуемся.

###Если захотелось поверстать:
Для того, чтобы вносить изменения в стили, нужно обратить внимание на два файла
внутри проекта: package.json и gulpfile.js  
**package.json** содержит в себе зависимости проекта, например тот же Gulp.
Чтобы установить эти зависимости, нужно убедиться, что у тебя установлен
node.js, т.к. он в своей поставке содержит систему управления пакетами npm
В общем, если такой отсутствует, то нужно установить, затем перейти в каталог с проектом
и установить зависимости:  
**npm install**

Подтянутся все нужные и ненужные зависимости, после чего можем юзать 
Gulp:  
**gulp watch**

Всё это необходимо для локальной разработки. Мы складываем файлы со стилями LESS
в каталог assets/, который затем будет транслироваться и сжиматься в css. 
Аналогично со скриптами и спрайтами. После этих процедур файлы будут складываться
в каталог static/, который улетает на продакшн сервер!

## English - Translated with Google Translate
# Local deployment project:
In order to roll out the project locally (and then run it)
we first need to make sure that you have installed ** git and python3 **.

If this all gud, then clone a project from the repository at any convenient
You directory command:

** Git clone https://github.com/OlzhasAlexandrov/py-dev-restaurant.git**

Then go to the directory: ** cd py-dev-restaurant / **
and create inside the virtual environment:
** Virtualenv --no-site-packages --distribute -p python3 env **

Catalog "env" which will be created and will be our virtual environment.

Now you need to activate the virtual environment and install dependencies
project:
**. env / bin / activate **
** Pip install -r requirements.txt **

After that, most likely 'pip' predlozhet upgrade, so feel free to enter
command: ** pip install --upgrade pip **

Now you can run the project:
**. / Manage.py runserver --settings = restaurant.settings_debug **

Default mostly ** settings.py ** off debug file, because the file
It flies in the production, so I created a ** settings_debug.py ** for local debugging.

In settings_debug file you need to specify the correct path to the folder static,
otherwise there will be problems with the display of pictures and other things.

## The most convenient way to run the project from PyCharm :)
In the upper right corner click the Dropdown "restaurant" -> Edit configurations
In the open settings window make sure that we are using the correct interpreter
which contains the path to the created contact to the virtual environment.

As HOST exhibit 0.0.0.0, the port may be left in the same 8000

Editing Environment varibles clicking on the right and add three points
variable (if not added automatically) DJANGO_SETTINGS_MODULE
and assign to it: restaurant.settings_debug
Then click Apply and close the settings window.
To start the project click in the upper right corner on the green triangle and rejoice.

### If you want poverstat:
To make changes to styles, you need to pay attention to two files
within the project: package.json and gulpfile.js
** Package.json ** contains the project's dependencies, such as the same Gulp.
To set these dependencies, you need to make sure that you have installed
node.js, as it includes in its delivery package management system npm
In general, if this is not available, then you need to install, and then go to the directory with the project
and install the dependencies:
** Npm install **

Tighten all necessary and unnecessary dependence, then we can juzat
Gulp:
** Gulp watch **

All this is necessary for the local development. We put the files with styles LESS
the directory assets /, which will then be broadcast or shrink in the css.
Similarly, with scripts and sprites. After these procedures, the files will be stored
in static /, which flies in the catalog production server!