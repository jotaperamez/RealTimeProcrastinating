with Ada.Strings.Unbounded; use Ada.Strings.Unbounded;
with Ada.Text_IO; use Ada.Text_IO;
package body Numeros_Complejos is

   function Init(R,I: Float) return Complejo is
      D:Complejo;
   begin
      D.P_Real:=R;
      D.P_Imag:=I;
      return D;
   end Init;
      -- Sobrecarga de operadores
   function "+"(X,Y: Complejo) return Complejo is
      D:Complejo;
   begin
      D.P_Real:= X.P_Real + Y.P_Real;
      D.P_Imag:= x.P_Imag + y.P_Imag;
      return D;
   end "+";
   
   function "-"(X,Y: Complejo) return Complejo is
      D:Complejo;
   begin
      D.P_Real:= X.P_Real - Y.P_Real;
      D.P_Imag:= x.P_Imag - y.P_Imag;
      return D;   
   end "-";
   
   function "*"(X,Y: Complejo) return Complejo is
         D:Complejo;
   begin
      D.P_Real:= X.P_Real * Y.P_Real - x.P_Imag * y.P_Imag;
      D.P_Imag:= x.P_Imag * y.P_Real + y.P_Imag * x.P_Real;
      return D;
   end "*";
   
   function "/"(X,Y: Complejo) return Complejo is 
      D:Complejo;
      C_aux: Complejo;
      Div: Float;
   begin
      C_aux := y*y.Conj;
      Div := C_aux.P_Real;
      D.P_Real := C_aux.P_Real/Div;
      D.P_Imag := C_aux.P_Imag/Div;
      return D;
   end "/";

   function Conj(X: Complejo) return Complejo is
      D:Complejo;
   begin
      D.P_Real := X.P_Real;
      D.P_Imag := -X.P_Imag;
      return D;
   end Conj;
   
   function P_Real(X: Complejo) return Float is
   begin
      return X.P_Real;
   end P_Real;

   function P_Imag(X: Complejo) return Float is
   begin
      return X.P_Imag;
   end P_Imag;
   
   function To_String(X: Complejo) return String is
      S:Unbounded_String;
   begin
      Ada.Strings.Unbounded.Append(S,X.P_Real'Img);
      Ada.Strings.Unbounded.Append(S," + ");
      Ada.Strings.Unbounded.Append(S,X.P_Imag'Img);
      Ada.Strings.Unbounded.Append(S,"i");
      return Ada.Strings.Unbounded.To_String(S);
   end To_String;
  
   procedure Put(X: Complejo) is
   begin
      ada.Text_IO.Put(X.To_String);
   end Put;
   procedure Put_Line(X: Complejo) is
   begin
      ada.Text_IO.Put_Line(x.To_String);
   end Put_Line;


end Numeros_Complejos ;
