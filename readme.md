Задача: создать instance group + lb


Что делаем:
1. Cоздаем instance group:
    1. Создаем instance template c контейнером +
    1. Создаем google_compute_instance_group_manager +
    1. Создаем google_compute_health_check
    1. Создаем autoscaler +
1. Создаем backend
1. Cоздаем lb (из модуля гугла)