with Ada.Text_IO,Ada.Strings.Unbounded;
use Ada.Text_IO,Ada.Strings.Unbounded;

package body Practica2_ImprimirPantalla is
   --La tarea servidora
   task body ImprimirPantalla is  
   begin
      loop
         --Mostrar por pantalla 
         accept Imprimir(NombreTarea: in Unbounded_String; ajustes : in Unbounded_String) do
            Put_Line(To_String(NombreTarea) & "realiza los siguientes ajustes: " & To_String(ajustes));
         end Imprimir;
         
      end loop;
   end ImprimirPantalla;
    
end Practica2_ImprimirPantalla;
