#!/bin/bash
cat ./Ejercicio_Final/creates.sql | mysql
cat ./Ejercicio_Final/inserts.sql| mysql Evil_Corp
cat ./Ejercicio_Final/dead_user.sql ./Ejercicio_Final/randomuser.sql ./Ejercicio_Final/profit_x_planet.sql ./Ejercicio_Final/contador_personas_planeta.sql ./Ejercicio_Final/combinacion.sql | mysql Evil_Corp
cat ./Ejercicio_Final/parca.sql | mysql
cat ./Classe/add_city.sql ./Classe/medicine_view.sql ./Classe/show_illuminatis.sql ./Classe/illuminati_contador.sql | mysql Evil_Corp
