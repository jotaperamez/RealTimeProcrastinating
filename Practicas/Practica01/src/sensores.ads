-- Importación de paquetes de ADA predeterminados
with Ada.Numerics.Float_Random; use Ada.Numerics.Float_Random;
package Sensores is
   subtype Voltaje is Float range 0.0..5.0;
   function LeerSensor(i: Integer) return Float;
private
   ruido : array(1..2) of Float := (1 => (2.0), 2 => (3.0));
   G : Generator;
end Sensores;
