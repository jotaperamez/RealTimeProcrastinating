--Paquete que declara los tipos de datos
--del proceso de control de temperatura


package Data_Types is

   --Tipo de dato temperatura,nivel y resistencia que puede ser
   --10..100, 0 a 750, y 10 a 1000 respectivamente.
   type Temperatura  is new Integer range 10 .. 100;
   type Nivel  is new Integer range 0 .. 750;
   type Resistencia is new Integer range 10 .. 1000;
   --Tipo de dato valvula setting, Bomba_setting
   -- Entrada_aire_setting
   --que puede ser
   --On o Off
   type Valvula_Setting is (On, Off);
   type Bomba_Setting is (On, Off);
   type Entrada_Aire_Setting is (On, Off);

end Data_Types;
