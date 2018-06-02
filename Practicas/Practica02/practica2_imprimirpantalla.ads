
with Ada.Text_IO,Ada.Strings.Unbounded;
use Ada.Text_IO,Ada.Strings.Unbounded;

package Practica2_ImprimirPantalla is
 task ImprimirPantalla is
      entry Imprimir(NombreTarea: in Unbounded_String; ajustes : in Unbounded_String);
   end  ImprimirPantalla;
end Practica2_ImprimirPantalla;
