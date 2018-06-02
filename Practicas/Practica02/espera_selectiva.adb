with Data_Types,ADA.Real_Time;
use Data_Types,Ada.Real_Time;

package body espera_selectiva is 
   
  
   task body lecturaDatos is
      T: Time;
      Tuso:Time_Span:=Milliseconds(100);
     
   begin
      loop
        --Espera selectiva
         select
            accept LeeNivelDep1(lvl: out Nivel) do
               lvl:=55;
            end LeeNivelDep1;
         or
            accept LeeNivelDep2(lvl :out Nivel) do
               lvl:=70;
            end LeeNivelDep2;
         or
            accept LeetemperaturaDep1(temp :out Temperatura) do
               temp:=30;
            end LeetemperaturaDep1;
         or
            accept LecturaControlSeguridad (temp : out Temperatura) do
                temp:=50;
            end LecturaControlSeguridad;
         end select;
         
         --Se espera a que la tarea termine
         T:=Clock;
         T:= T+ Tuso;
         delay until(T);
      end loop;
      end lecturaDatos;
end espera_selectiva;
