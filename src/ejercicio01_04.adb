with Ada.Integer_Text_IO;
use Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
use Ada.Float_Text_IO;

procedure ejercicio01_04 is
   --Declare Arrays
   type A is array (0..149) of Float;
   type B is array (0..199,0..199,0..199) of Integer;
   type C is array(Integer range<>) of Float;
   
   varA: A:=(others =>0.0);
   varB: B:= (others=> (others=> (others =>0)));
   varC: C(1..10):= (others=> 0.0);
begin
   -- Put on console
   Put(varA(10));
   Put(varB(10,10,10));
   Put(varC(10));
end ejercicio01_04;
