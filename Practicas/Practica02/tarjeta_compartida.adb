with Ada.Text_IO,Ada.Strings.Unbounded;
use Ada.Text_IO,Ada.Strings.Unbounded;

   
package body tarjeta_compartida is
  
   task body tarjeta_escritura is  
   begin
      loop
         
         accept Escribir (NombreTarea : in Unbounded_String; ajustes : in Unbounded_String) do
            Put_Line(To_String(NombreTarea) & "accede al recurso compartido");

          end Escribir;
       
      end loop;
   end tarjeta_escritura;
    
end tarjeta_compartida;
