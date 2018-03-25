-- Importación de paquetes de ADA predeterminados
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
package body Sensores is

   function LeerSensor(i: Integer) return Float is
      V : Float;
   begin
      Reset(G);

      V := 5.0*Random(G) + ruido(i)*(Random(G)-0.5);

      return V;
   end LeerSensor;

end Sensores;
