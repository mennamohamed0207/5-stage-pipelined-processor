LIBRARY IEEE;
USE IEEE.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
USE work.my_pkg.ALL;

-- get instruction from memory and update pc 
ENTITY Fetch IS
    PORT (
	clk:IN STD_LOGIC;
        Instruction_Memory : IN memory_array(0 TO 4095)(15 DOWNTO 0);
        reset : IN STD_LOGIC;
        instruction : OUT STD_LOGIC_VECTOR(15 DOWNTO 0)
    );
END ENTITY Fetch;

ARCHITECTURE FetchArch OF Fetch IS
    signal PC : std_logic_vector(31 DOWNTO 0);
    signal PC_next : std_logic_vector(31 DOWNTO 0);
    -- signal Instruction_Memory : memory_array(0 TO 4095)(15 DOWNTO 0);

BEGIN

    process (reset,clk)
    begin
        if reset = '1' and clk='1' then
            PC <= (others => '0');
 
 

       else if clk='1' then
            -- Increment PC by 1
	    instruction <= Instruction_Memory(to_integer(unsigned(PC)));
            PC <= std_logic_vector(unsigned(PC) + 1);
		 
            
      end if;
end if;

       
    end process; -- identifier

END ARCHITECTURE FetchArch;
