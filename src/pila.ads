package Pila is

   type Elemento is range -100..100;
   function Vacia return Boolean;
  -- procedure Nuevo(E: out Elemento);
   procedure Poner(E: Elemento);
   procedure Quitar(E: out Elemento); 

end Pila;
