with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO; use Ada.Integer_Text_IO;
with Ada.Float_Text_IO; use Ada.Float_Text_IO;
                          
procedure ejercicio02 is

 
  type vectorTemperatura is array (Integer range <>) of Integer;--Tipo del vector que almacenar� las temperaturas de entrada
  type matriz is array (1..11,1..3) of Float;--Matriz que almacenar� el contenido de tabla1.txt


  tevector : vectorTemperatura(0..10);--Vector que almacenar� las temperaturas de entrada. Para probar el c�digo lo haremos introduciendo 10 valores que ser�n mostrados tras la ejecuci�n del mismo
  contador : Integer := 0;--Vamos a limitar a 100 el n�mero de entradas por teclado, para eso necesitamos un contador que nos diga hasta donde funciona el programa
  ts : Float := 0.0;--Temperatura de salida
  te : Integer := 0;--Temperatura de entrada
  tabla : matriz;
  Archivo_lectura : File_Type;
  x : Integer;--Variable auxiliar que utilizaremos para leer los enteros del fichero
  z : Float;--Variable auxiliar que utilizaremos para leer los float del fichero
  y : Integer := 1;--Contador lectura y escritura de filas del archivo y posiciones del vector
  Aaux : Float digits 4;--Variable auxiliar que utilizaremos para obtener el valor de A cuando Te no sea exacto
  Baux : Float digits 2;--Variable auxiliar que utilizaremos para obtener el valor de B cuando Te no sea exacto

begin
   --Leemos el contenido del archivo Tabla 1.txt y lo guardamos en una variable llamada tabla
   Open(Archivo_lectura,In_File,"src/Tabla1.txt");
   while y <= 11 loop--Rellenamos la tabla con los datos del fichero Tabla 1
         Get(Archivo_lectura,x);--Leemos te del archivo
         tabla(y,1) := Float(x);--Guardamos te en tabla

         Get(Archivo_lectura,z);--Leemos A del archivo
         tabla(y,2) := z;--Guardamos A en tabla

         Get(Archivo_lectura,z);--Leemos B del archivo
         tabla(y,3) := z;--Guardamos B en tabla

      y := y + 1;
   end loop;
   close(Archivo_lectura);--Cerramos el fichero

   while contador < 10 loop--Delimitamos el n�mero de iteraciones del programa

      New_Line;
      Put_Line("Introduzca la Temperatura de entrada: ");
      Get(te);--Tomamos por teclado la temperatura de entrada

   if te < 50 then--Calculamos la temperatura de salida en funci�n de las ecuaciones del enunciado
      Put_Line("El valor Te = " & te'Img & " introducido es inferior al rango (50,100), por lo tanto Ts = 0");
      ts := 0.0;
   elsif te < 55 then
      y := 1;--Valor de la posici�n del rango en la matriz
         if te = 50 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 60 then
         y := 2;
         if te = 55 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 65 then
         y := 3;
         if te = 60 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 70 then
         y := 4;
         if te = 65 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 75 then
         y := 5;
         if te = 70 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 80 then
         y := 6;
         if te = 75 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 85 then
         y := 7;
         if te = 80 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 90 then
         y := 8;
         if te = 85 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 95 then
         y := 9;
         if te = 90 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te < 100 then
         y := 10;
         if te = 95 then
            ts := Float(te) * tabla(y,2) + tabla(y,3);
         else
            Aaux := tabla(y,2) + (tabla(y + 1,2) - tabla(y,2))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            Baux := tabla(y,3) + (tabla(y + 1,3) - tabla(y,3))*((Float(te) - Float(tabla(y,1)))/(Float(tabla(y + 1,1)) - Float(tabla(y,1))));
            ts := Float(te) * Aaux + Baux;
         end if;
      elsif te = 100 then
         y := 11;
         ts := Float(te) * tabla(y,2) + tabla(y,3);
      else
         Put_Line("El valor Te = " & te'Img & " introducido es superior al rango (50,100), por lo tanto Ts = 0");
         ts := 0.0;
      end if;
      tevector(contador) := te;--Almacenamos la temperatura de entrada
      Put_Line("La temperatura de salida para " & te'Img & " es " & ts'Img);--Mostramos la temperatura de salida resultante
      contador := contador + 1;--Incrementamos el contador
   end loop;

  contador := 0;--Reiniciamos el contador para recorrer el vector
  New_Line;--Para una mejor visualizaci�n por pantalla
  Put_Line("Mostramos el contenido del vector de Temperaturas de entrada");
  while contador < 10 loop--Bucle para mostrar el contenido de los valores almacenados en tevector
    Put(tevector(contador)'Img & " ");
    contador := contador + 1;
  end loop;
   
end ejercicio02;
