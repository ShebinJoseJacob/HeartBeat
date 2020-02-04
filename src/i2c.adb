with Interfaces.C;
with Ada.Strings.Fixed;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with GNAT.Expect;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;

package body i2c is
    V1: Integer;
    
    procedure read  is
          function System (Cmd : String) return Integer is
            function C_System (S : Interfaces.C.char_array) return Integer;
        pragma Import (C, C_System, "system");
        begin
            return C_System (Interfaces.C.To_C (Cmd));        
        end System;
        pragma Inline (System);
	Com: String:="sudo chmod +x hb.sh && ./hb.sh";
    begin
    V1 := System (Com);
    end read;

end i2c;
