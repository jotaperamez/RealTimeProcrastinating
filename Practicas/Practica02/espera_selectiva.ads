with Data_Types;
use Data_Types;


package espera_selectiva is

   task lecturaDatos is 
      entry LeeNivelDep1(lvl: out Nivel);
      entry LeeNivelDep2(lvl: out Nivel);  
      entry LeetemperaturaDep1(temp :out Temperatura);
      entry LecturaControlSeguridad(temp: out Temperatura);
   
       
   end lecturaDatos;
end espera_selectiva;
