with Ada.Text_IO;use Ada.Text_IO;
with Ada.Integer_Text_IO; use ada.Integer_Text_IO;

procedure Ejercicio03_01 is
   type Matriz is array (1..10,1..5) of Integer;
   Lineas:Matriz;
   
   I:Integer:=1;
   j:Integer:=1;
   F:File_Type;
   Out_F:File_Type;
begin
   
   Open(F,In_File,"C:\Users\javi\src\input.txt");
   loop
      begin
         Create(Out_F,Name => "C:\Users\javi\src\output.txt");
         exit;
      exception
         when Status_Error => 
            Open(Out_F,Mode => Out_File,Name => "C:\Users\javi\src\output.txt" );
            Delete(Out_F);
      
      end;
   end loop;
   while not End_Of_File(F) loop
      if End_Of_Line(F)then
         --New_Line(Out_F);
         Skip_Line(F);
         J:= J + 1;
         i:= 1;
      else
         Get(F,Lineas(I,J));
         --Put(Out_F,Lineas(j,i));
         I:= I+1;
      end if; 
   end loop;
   for Col in 1..10 loop
      for fil in 1..5 loop
         Put(Out_F,Lineas(col,fil));
      
      end loop;
      New_Line(Out_F);
   end loop;
   Close(F);
   Close(Out_F);
end Ejercicio03_01;
