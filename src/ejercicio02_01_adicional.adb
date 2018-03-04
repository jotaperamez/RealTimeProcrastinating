with Ada.Text_IO; use Ada.Text_IO;

procedure Ejercicio02_01_Adicional is
   
   str:String(1..1);
   Entero:Integer;
   char:Character;
begin
   
   loop
      Get_Line(Str,Entero);
      char:= str(1);
      exit when Char = '0';
      case Char is
         when 'A'|'B' => Put_Line("Opcion 1");
         when 'C'|'D'|'E' => Put_Line("Opcion 2");
         when 'F' => Put_Line("Opcion 3");
         when others => Put_Line("Otra opcion");   
      end case;
      
   end loop;
      
end ejercicio02_01_Adicional;
