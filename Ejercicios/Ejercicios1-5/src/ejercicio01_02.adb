with Ada.Text_IO;
use Ada.Text_IO;

procedure ejercicio01_02 is
   --Declare type Semaforo
   type Semaforo is (Rojo,Amarillo,Verde);
   --Declare variable type Semaforo
   color: Semaforo;
begin
   --Init variable
   color:= Rojo;
   --Print it
   Put(color'Img);
end ejercicio01_02;
