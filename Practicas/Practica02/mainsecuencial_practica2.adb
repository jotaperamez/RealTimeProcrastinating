with Ada.Text_IO,IO,Data_Types,Control_Procedure;
use Ada.Text_IO,IO,Data_Types,Control_Procedure;
procedure MainSecuencial_Practica2 is
   
   --Inicializamos las varaibales
   nv1 : Nivel := 10;
   nv2 : Nivel := 20;
   temp1 : Temperatura :=  20;
   rest1 : Resistencia := 60;
   auxNV : Nivel;
   --Muestra el estado secuencial del control de 
   --temperatura de un determinado producto quimico
begin
   Put_Line("");
   Put_Line("");
   Put_Line("");
   Put_Line("Inicio del Sistema(Secuencial)");
   Put_Line("Realizando Control de nivel del deposito 1");
   WriteNivelDeposito1(nv1);
   auxNV := NivelDeposito1(nv1);
   ControlNivelDeposito1(auxNV);
   Put_Line("");
   Put_Line("");
   Put_Line("");
   Put_Line("Realizando Control de nivel del deposito 2");
   WriteNivelDeposito2(nv2);
   auxNV := NivelDeposito2(nv2);
   ControlNivelDeposito2(auxNV);
   Put_Line("");
   Put_Line("");
   Put_Line("");
   Put_Line("Realizando Control de temperatura");
   WriteTemperaturaRDeposito1(temp1);
   Put_Line("Calculando Ajuste de temperatura");
   ControlDeTemperatura(temp1,rest1);
   Put_Line("");
   Put_Line("");
   Put_Line("");
   temp1 := 30;
   Put_Line("Realizando Control de Seguridad");
   WriteTemperaturaRDeposito1(temp1);
   ControlDeSeguridad(temp1);
   Put_Line("");
   Put_Line("");
   Put_Line("");
   
end MainSecuencial_Practica2;
