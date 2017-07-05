source 'https://rubygems.org'

ruby "2.3.4"
gem 'rails', '~> 5.1.2'
gem "pg"                                          # для соеденения с базой postgress


# assets
#gem "autoprefixer-rails"                          # автоматический выставляет префиксы css для правильного отображения различных браузеров
gem "coffee-rails"                                # для чтения coffee файлов
#gem "foundation-icons-sass-rails"                 # настраивает иконки, так же можно использовать css для изменения
#gem "foundation-rails"                            # аналогичен твиттер боотсрап но использует sass вместо less
#gem "mini_racer"                                  # заменяет therubaracer предназначенный для интерпретаций кода javascript в движке руби
#gem "premailer-rails"                             # настраивает стили к почте отправляемую на электронный адрес
gem "sass-rails", "~> 5.0.0", ">= 5.0.6"          # стандартная библиотека sass
gem "uglifier", ">= 2.7.2"                        # стандартная библиотека

source "https://rails-assets.org" do
  gem "rails-assets-jquery-ujs"                   # подключает jquery
  gem "rails-assets-jquery2"                      # подключает jquery2
end

# views
#gem "active_link_to"                              # отображает ссылку, которую открыл посетитель
#gem "inky-rb", require: "inky"                    # преобразует html код для отправки по электронной почте
gem "metamagic"                                   # плагин для создания метатегов
gem "simple_form"                                 # плагин для создания понятных инпутов
gem "slim"                                        # упрощает код html с помощью иерархической структуры, аналог haml

# all other gems
#gem "decent_decoration"                           # упрощает код в контроллере
#gem "decent_exposure"                             # помощник для создания декоративных интерфейсов в контроллере
gem "devise"                                      # гем для аутентификаций пользователя
#gem "draper"                                      # с его помощью можно вынести обектно ориентированную логику в коде из представления.
#gem "flamegraph"                                  # отображает повторяющуюся логику с помощью графической структуры
gem "google-analytics-rails"                      # для анализа запросов на вебсайт
#gem "health_check"                                # простая проверка роботоспособности rails c сайтами предназначенными для проверки роботоспособности
#gem "interactor"                                  # удобное средство разработки для контроля бизнес логики в приложении
#gem "kaminari"                                    # пагинатор для отображения определенного количества постов
#gem "memory_profiler"                             # профилировщик памяти
#gem "puma"                                        # вебсервер для рейлс
gem "pundit"                                      # для создания системы авторизации
#gem "rack-canonical-host"                         # для определения имени хоста
#gem "rack-mini-profiler", require: false, git: "https://github.com/MiniProfiler/rack-mini-profiler.git"
                                                  # профилировщик скорости отображения html страниц
#gem "responders"                                  # гем для настройки флеш сообщений
#gem "rollbar"                                     # гем для отслеживания проблем в коде
#gem "seedbank"                                    # для создания строк в базе данных
#gem "stackprof"                                   # профайлер для стеков
gem 'listen', '~> 3.1.5'
group :staging, :production do
  #gem "newrelic_rpm"                              # платформа для аналитики сайта в продакшен среде
end

group :test do
  gem "capybara"                                  # помощник для тестирования
  #gem "codeclimate-test-reporter", require: false # для проверки охвата кода тестированием
  gem "database_cleaner"                          # очистка базы перед повторным тестированием в среде тестирования
  #gem "email_spec"                                # набор шаблонов для проверки правильности отправки электронных писем
  #gem "formulaic"                                 # упрощенное заполнение формы с капибарой
  #gem "guard-rspec"                               # автоматический выполняет команды для rspec тестирования
  #gem "launchy"                                   # фигня для систематизаций команды в различных системах типо OS x linux and windows
  #gem "poltergeist"                               # драйвер для Capybara позволяющая отображать тесты капибары без браузера Webkit
  #gem "rspec-its"                                 # представляет its метод тестировщику rspec, очень удобно для тестирования
  gem "shoulda-matchers"                          # предоставляет короткие команды для тестирвания
  #gem "terminal-notifier-guard"                   # фигня какая то для Mac os X
  #gem "webmock", require: false                   # интеграция внешних сервисов для тестирования
end

group :development, :test do
  gem "rspec-rails", "~> 3.4"                     # самая крутая тестовая игрушка
  #gem "awesome_print"                             # красиво печатает объекты в руби
  #gem "brakeman", require: false                  # проверка безопасности и уязвимостей рейлс приложения
  #gem "bullet"                                    # помощник для убийства N+1 запросов
  #gem "bundler-audit", require: false             # проверка уровня исполнения bundler команд
  gem "byebug"                                    # отладчик для руби
  #gem "coffeelint"                                # код для проверки стиля coffeescript
  #gem "dotenv-rails"                              # работа приложения в различных средах
  gem "factory_girl_rails"                        # создает объекты в основном используют для тестирования
  #gem "faker"                                     # создает в базе данных аналогичные данные
  #gem "jasmine", "> 2.0"                          # автоматизация тестирования js
  #gem "jasmine-jquery-rails"                      # автоматизация тестирования jquery
  #gem "pry-rails"                                 # создает помощника типо рейлс консоль, но новареченный командами подобными из терминала убунту
  #gem "rubocop", require: false                   # статический анализатор кода
  #gem "rubocop-rspec", require: false             # статический анализатор для тестировочного кода рспек
  #gem "scss_lint", require: false                 # настраиваемый инструмент для написания чистого и последовательного scss
  gem "slim_lint", require: false                 # настраиваемый инструмент для slim
end

group :development do
  #gem "letter_opener"                             # предварительный просмотр почты в браузере вместо отправки.
  #gem "rails-erd"                                 # создание диаграмы для отображения связей в базе данных
   gem "slim-rails"                                # использование слим при гененраций команд через scaffold and resources
  gem "spring"                                    # автоматический предразгрузчик rails s
  #gem "spring-commands-rspec"                     # автоматический предразгрузчик команд рспек
  #gem "spring-watcher-listen"                     #автоматический слушает файловую систему, используется как правило в крупных проектах
  gem "web-console", "~> 2.0"                     #рейлс консоль в браузере
 end
