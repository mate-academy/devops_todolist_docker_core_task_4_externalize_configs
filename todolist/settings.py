import os

DATABASES = {
    'default': {
        'ENGINE': os.getenv('ENGINE', 'mysql.connector.django'),
        'NAME': os.getenv('NAME', 'app_db'),
        'USER': os.getenv('USER', 'app_user'),
        'PASSWORD': os.getenv('PASSWORD', '1234'),
        'HOST': os.getenv('HOST', 'mysql'),
        'PORT': os.getenv('PORT', '3306'),
    }
}
