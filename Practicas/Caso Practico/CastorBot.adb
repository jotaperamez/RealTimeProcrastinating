------------------------------------------------------------------------------
--                                                                          --
--                     Copyright (C) 2010-2012, AdaCore                     --
--                                                                          --
-- This  is  free  software;  you  can  redistribute  it and/or  modify  it --
-- under terms of the  GNU General Public License as published  by the Free --
-- Software  Foundation;  either version 2,  or (at your option)  any later --
-- version.  This  is  distributed  in the hope that  it  will  be  useful, --
-- but WITHOUT ANY WARRANTY; without even the implied warranty of MERCHANT- --
-- ABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU General Public --
-- License for  more details.  You should have  received  a copy of the GNU --
-- General Public License distributed with GNATStack;  see file COPYING. If --
-- not, write to the  Free Software Foundation,  51 Franklin Street,  Fifth --
-- Floor, Boston, MA 02110-1301, USA.                                       --
------------------------------------------------------------------------------

with Ada.Real_Time; use Ada.Real_Time;
with NXT.AVR;       use NXT.AVR;
with NXT.Display;   use NXT.Display;
with Menu_Tests;
with NXT.Last_Chance;
with NXT.Buttons;   use NXT.Buttons;
with Interfaces;    use Interfaces;
with NXT.Sound_Sensors; use NXT.Sound_Sensors;
with NXT;           use NXT;

procedure Tests is

   --Procedimiento que ya venía en esta plantilla y que nos permite esperar a la pulsación de una tecla para interactura con el NXT
   procedure Wait_Any_Key is
      use NXT;
   begin
      loop
         exit when Current_Button = No_Button;
         delay until Clock + Milliseconds (10);
      end loop;
      loop
         exit when Current_Button /= No_Button;
         delay until Clock + Milliseconds (10);
      end loop;
   end Wait_Any_Key;

   Micro : Unsigned_16;--Variable Micro para tomar las medidas del sensor
   lectura: Unsigned_16 := 0;--Variable auxiliar que nos permitirá actuar con el sensor saltándonos el fuerte tipado
   tiempo_espera : Time;--Variable que utilizaremos para las esperas

begin
   Clear_Screen_Noupdate;--Borrado de pantalla del visor de NXT
   Put_Line ("Comenzar");--Escritura sobre el visto de pantalla del NXT
   Wait_Any_Key;--Espera la pulsación de algún botón del NXT para comenzar
   Clear_Screen_Noupdate;--Borrado de pantalla del visor de NXT
   Put_line ("Lecturas");--Escritura sobre el visor de pantalla del NXT

   Set_Power(Motor_A, -35, true);--Iniciamos el motor A a una potencia de -35 para realizar la rotación sobre su propio eje
   Set_Power(Motor_C, 25, true);--Iniciamos el motor C a una potencia de 25
   tiempo_espera := Clock + Milliseconds(100);--Para realizar el delay necesitamos una variable auxiliar porque ADA es un lenguaje fuertemente tipado
   delay until (tiempo_espera);--Espera de 100 milisegundos

   loop--Bucle que irá tomando las medidas del sensor y actuando en consecuencia
      Micro := Raw_Input(Sensor_Id(Sensor_2));--Lectura de la medida del micro que entra por el puerto 2
      tiempo_espera := Clock + Milliseconds(100);--Configuramos la espera a 100 milisegundos, necesaria para tomar datos fiables del sensor
      delay until (tiempo_espera);--Realizamos la espera de 100 milisegundos
      lectura := lectura + Micro;--Transformamos la lectura en un valor unsigned_16 con el que si podemos trabajar debido al fuerte tipado de ADA
      lectura := lectura / 12;--Reducimos el valor del micro a una valor con el que podamos trabajar, puesto que la lectura da valores demasiado elevados

      if (lectura > 50) and (lectura <= 100) then--Si la lectura está entre 50 y 100dB
         Set_Power(Motor_C, 50, true);--Incrementamos la velocidad del motor C a 50
         tiempo_espera := Clock + Milliseconds(500);--Lo dejamos moverse 500 milisegundos
         delay until (tiempo_espera);--Realizamos la espera de 500 milisegundos
      end if;--Fin del condicional if
      if lectura <= 50 then--Si la lectura es menor o igual a 50 dB
         Set_Power(Motor_A, 25, true);--El motor A se fija a una potencia de 25 y el robot camina en su dirección
         tiempo_espera := Clock + Milliseconds(5000);--Fijamos una espera de 5 segundos, para que el robot no bloquee sus ruedas y le de tiempo a avanzar
         delay until (tiempo_espera);--Realizmos la espera de 5 segundos
      end if;--Fin del condicional if
      --Volvemos al estado inicial de los motores
      Set_Power(Motor_A, -35, true);--Reestablecemos el motor A a una potencia de -35
      Set_Power(Motor_C, 25, true);--Reestablecemos el motor C a una potencia de 25
   end loop;--Fin del bucle
end Tests;--Fin del archivo Tests
