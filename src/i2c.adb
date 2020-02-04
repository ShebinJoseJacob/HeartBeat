with Interfaces.C;
with Ada.Strings.Fixed;
with Ada.Text_IO;
with Ada.Integer_Text_IO;
with GNAT.Expect;
with Ada.Strings.Unbounded;
with Ada.Text_IO.Unbounded_IO;

package body i2c is
    R,V1: Integer;
    W1: String:="i2cset -y -a 1 0x5b 0x41 0x87";
    W2: String:="i2cset -y -a 1 0x5b 0x42 0x00";
    W3: String:="i2cset -y -a 1 0x5b 0x43 0x00";
    W4: String:="i2cset -y -a 1 0x5b 0x44 0x00";
    W5: String:="i2cset -y -a 1 0x5b 0x45 0x00";
    W6: String:="i2cset -y -a 1 0x5b 0x46 0x03";
    

    procedure write is
        function System (Cmd : String) return Integer is
            function C_System (S : Interfaces.C.char_array) return Integer;
        pragma Import (C, C_System, "system");
        begin
            return C_System (Interfaces.C.To_C (Cmd));        
        end System;
        pragma Inline (System);
    begin
    R := System (W1);
    DELAY 0.5;
    R := System (W2);
    R := System (W3);
    R := System (W4);
    R := System (W5);
    R := System (W6);
    end write;
    
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
