library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;
--get instruction from memory and update pc 
entity Fetch is
    port (
        --PC : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        instruction: OUT std_logic_vector(15 downto 0)
    );
end entity Fetch;
architecture FetchArch of Fetch is
--     component InstructionMemory is
--         port (
--             PC : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
           
--             memRead : IN STD_LOGIC;
-- Instruction : OUT STD_LOGIC_VECTOR (15 DOWNTO 0)
	
            
--         );
--         end component;

begin
--     Fetch_Data: InstructionMemory port map(
--         PC=>PC,
-- memRead=>'1',
-- Instruction=>Instruction
--     );

instruction <="0000011100000000";

end architecture FetchArch;
