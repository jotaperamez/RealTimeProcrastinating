with Sensores; use Sensores;--Importamos el paquete Sensores necesario para tomar las medidas
with Ada.Text_IO; use Ada.Text_IO;
with Ada.Calendar; use Ada.Calendar;--Importamos el paquete Ada.Calendar necesario para mostrar y almacenar las fechas de las medidas

procedure ejercicio03 is

   cont_1 : Float;--Concentración del monóxido de carbono del sensor 1
   cont_2 : Float;--Concentración del monóxido de carbono del sensor 2
   cont_S : Float;--Concentración media de los sensores 1 y 2
   cont_T : Float;--Concentración del monóxido de carbono media
   cont_max : Float := 0.0;--Concentración máxima alcanzada, iniciamos a 0 puesto que no hay ninguna entrada
   cont_min : Float := 100.0;--Concentración mínima alcanzada, iniciamos a 100 puesto que no hay ninguna entrada
   contador : Integer := 0;--Contador para el while

   v1 : Float;--Voltaje del sensor 1
   v2 : Float;--Voltaje del sensor 2

   A1 : Float digits 1;--Valor de la variable A de medida de la concentración del monóxido de carbono del sensor 1
   B1 : Float digits 1;--Valor de la variable B de medida de la concentración del monóxido de carbono del sensor 1
   A2 : Float digits 1;--Valor de la variable A de medida de la concentración del monóxido de carbono del sensor 2
   B2 : Float digits 1;--Valor de la variable B de medida de la concentración del monóxido de carbono del sensor 2

   s1 : Boolean := true;--Variable que regula si el sensor 1 ha fallado; inicialmente está activo
   s2 : Boolean := true;--Variable que regula si el sensor 2 ha fallado; inicialmente está activo

   ventilacion : Boolean := false;--Variable que nos dice si la alarma de ventilación ya ha sido activada, inicialmente está desactivada

   archivo : File_Type;--Para poder escribir en ficheros

   reloj : Time;--Utilizamos una variable Time para poder almacenar las horas
   horas : Integer;--Almacena las horas
   minutos : Integer;--Almacena los minutos
   segundos : Integer;--Almacena los segundos



begin
   Create(archivo, Out_File, "Medidas.txt");--Creamos un fichero para tomar las medidas
--Escribimos la cabecera del archivo----------------------------------------------------
   Put_Line(archivo, "  HH:MM:SS             C1            C2            C           Min(C)         Max(C)       Media(C)      Fallo S1       Fallo S2");
   Put_Line("  HH:MM:SS             C1            C2            C           Min(C)         Max(C)       Media(C)      Fallo S1       Fallo S2");

--Ejecución del programa---------------------------------------------------------------
   while s1 or s2 loop--El programa se ejecutará hasta un error de lectura de ambos sensores

      v1 := LeerSensor(1);--Leemos el valor del voltaje del sensor 1
      v2 := LeerSensor(2);--Leemos el valor del voltaje del sensor 2

      if (v1 > 5.0 or v1 < 0.0) and s1 then--Detectamos un fallo de lectura del sensor 1
         s1 := false;--Incapacitamos el sensor 1
      end if;

      if (v2 > 5.0 or v2 < 0.0) and s2 then--Detectamos un fallo de lectura del sensor 2
         s2 := false;--Incapacitamos el sensor 2
      end if;

--Lectura sensor 1--------------------------------------------------------------------
      if s1 then--De este modo solo leeremos los valores de A y B y calcularemos la concentración del sensor 1 si está activo
         if (0.0 <= v1) and (v1 < 1.0) then-- 0 <= v < 1
            A1 := 1.3;
            B1 := 1.6;
         elsif (1.0 <= v1) and (v1 < 2.0) then-- 1 <= v < 2
            A1 := 4.1;
            B1 := 1.2;
         elsif (v1 >= 2.0) then-- v >= 2
            A1 := 3.2;
            B1 := 2.6;
         else
            s1 := false;
         end if;
      end if;

--Lectura sensor 2----------------------------------------------------------------------
      if s2 then--De este modo solo leeremos los valores de A y B y calcularemos la concentración del sensor 2 si está activo
         if (0.0 <= v2) and (v2 < 1.0) then-- 0 <= v < 1
            A2 := 1.3;
            B2 := 1.4;
         elsif (1.0 <= v2) and (v2 < 2.0) then-- 1 <= v < 2
            A2 := 3.1;
            B2 := 2.2;
         elsif (v2 >= 2.0) then-- v >= 2
            A2 := 4.1;
            B2 := 1.7;
         else
            s2 := false;
         end if;
      end if;

--Concentración del sensor 1-------------------------------------------------------------
      if s1 then--Calculamos la concentración de s1
         cont_1 := 2.4 * (v1**3) - A1 * (v1**2) + B1 * V1 + Float(1);
      else
         if s2 then--El enunciado nos dice que el sensor 1 almacenará la concentración del sensor 2
            cont_1 := Float(2) * (v2**3) - A2 * (v2**2) + B2 * V2 + Float(1);--cont_2 :=  2 * (v2**3) - A2 * (v2**2) + B2 * V2 + 1;
         else
            Put_Line("Ambos sensores han fallado, el sistema se para");
         end if;
      end if;

--Concentración del sensor 2--------------------------------------------------------------
      if s2 then--Calculamos la concentración de s2
         cont_2 :=  Float(2) * (v2**3) - A2 * (v2**2) + B2 * V2 + Float(1);
      else
         if s1 then--El enunciado nos dice que el sensor 2 almacenará la concentración del sensor 1
            cont_2 := 2.4 * (v1**3) - A1 * (v1**2) + B1 * V1 + Float(1);--cont_1 := 2.4 * (v1**3) - A1 * (v1**2) + B1 * V1 + 1;
         else
            Put_Line("Ambos sensores han fallado, el sistema se para");
         end if;
      end if;
--Calculamos la media de C1 y C2----------------------------------------------------------
      if s1 and s2 then
         cont_S := Float(Integer(cont_1 + cont_2)/2);
      elsif s1 then
         cont_S := cont_1;
      else
         cont_S := cont_2;
      end if;
--Calculamos la concentración máxima y mínima---------------------------------------------
      if cont_1 > cont_2 then--Concentración máxima
         if cont_1 > cont_max then
            cont_max := cont_1;
         else
            null;
         end if;
      else
         if cont_2 > cont_max then
            cont_max := cont_2;
         else
            null;
         end if;
      end if;

      if cont_1 < cont_2 then--Concentración mínima
         if cont_1 < cont_min then
            cont_min := cont_1;
         else
            null;
         end if;
      else
         if cont_2 < cont_min then
            cont_min := cont_2;
         else
            null;
         end if;
      end if;
--Alerta de ventilación------------------------------------------------------------------------
      if ventilacion = false and cont_max > 100.0 then--Condiciones para activar la ventilación
         Put_Line("La concentracion maxima ha excedido de 100u. Se ha abierto la ventilacion");
         ventilacion := true;--Activamos la ventilación
      end if;
--Concentración media---------------------------------------------------------------------------
      if contador = 0 then
         cont_T := cont_S;
      else
         cont_T := Float(Integer(cont_T + cont_S)/contador);
      end if;
--Toma de fecha y hora del paquete Ada.Calendar-------------------------------------------------
      reloj := Clock;
      horas := Integer(Seconds(reloj))/3600;
      minutos := (Integer(Seconds(reloj))-horas*3600)/60;
      segundos := ((Integer(Seconds(reloj))-horas*3600)-minutos*60);
--Escritura en archivo de cada iteración--------------------------------------------------------
      New_Line;
      Put(archivo, horas'Img &":"& minutos'Img &":"& segundos'Img &"      ");
      Put(horas'Img &":"& minutos'Img &":"& segundos'Img &"      ");
      Put(archivo, cont_1'Img &"  ");
      Put(cont_1'Img &"  ");
      Put(archivo, cont_2'Img &"  ");
      Put(cont_2'Img &"  ");
      Put(archivo, cont_S'Img &"  ");
      Put(cont_S'Img &"  ");
      Put(archivo, cont_min'Img &"   ");
      Put(cont_min'Img &"   ");
      Put(archivo, cont_max'Img &"   ");
      Put(cont_max'Img &"   ");
      Put(archivo, cont_T'Img &"  ");
      Put(cont_T'Img &"  ");
      if s1 then
         Put(archivo, "     0" & "  ");
         Put("     0" & "  ");
      else
         Put(archivo, "     1" & "  ");
         Put("     1" & "  ");
      end if;

      if s2 then
         Put_Line(archivo, "             0");
         Put_Line("             0");
      else
         Put_Line(archivo, "             1");
         Put_Line("             1");
      end if;
      ---------------------------------------------------------------------------------------------------------------------------------------
      contador := contador + 1;
   end loop;
   Close(archivo);--Cerramos el fichero
end ejercicio03;
