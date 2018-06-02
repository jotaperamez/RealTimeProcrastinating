with Ada.Text_IO,Ada.Strings.Unbounded;
use Ada.Text_IO,Ada.Strings.Unbounded;

package tarjeta_compartida is
   
 task tarjeta_escritura is
      entry Escribir(NombreTarea: in Unbounded_String; ajustes : in Unbounded_String);
 end  tarjeta_escritura;
   

end tarjeta_compartida;
