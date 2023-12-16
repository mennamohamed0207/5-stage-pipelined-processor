LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;

ENTITY execute IS
  PORT (
    op1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    op2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
    opCode : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
    res : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
    outPort_EXE : OUT STD_LOGIC_VECTOR (31 DOWNTO 0)
  );
END execute;

ARCHITECTURE archExecute OF execute IS
  SIGNAL CCR : STD_LOGIC_VECTOR(2 DOWNTO 0); --c n z 
  SIGNAL temp_res : STD_LOGIC_VECTOR (31 DOWNTO 0);
BEGIN

  PROCESS (opCode, temp_res, op1,op2)
  BEGIN
    CASE opCode IS
      WHEN "000001" =>
        -- NOT
        temp_res <= NOT op1;
        res <= temp_res;
        CCR(1) <= temp_res(31);
        IF temp_res = X"00000000"THEN
          CCR(0) <= '1';
        ELSE
          CCR(0) <= '0';
        END IF;
      WHEN "000101" =>
        -- OUT
        outPort_EXE <= op1;
      WHEN "000100" =>
        -- DEC
        temp_res <= STD_LOGIC_VECTOR(unsigned(op1) - 1);
        res <= temp_res;
        CCR(1) <= temp_res(31);
        IF temp_res = X"00000000"THEN
          CCR(0) <= '1';
        ELSE
          CCR(0) <= '0';
        END IF;
      WHEN "010101" =>
        -- OR
        temp_res <= op1 OR op2;
        res <= temp_res;
        CCR(1) <= temp_res(31);
        IF temp_res = X"00000000" THEN
          CCR(0) <= '1';
        ELSE
          CCR(0) <= '0';
        END IF;
      WHEN "100101" =>
        -- PROTECT
        res <= op1;
      WHEN "010010" =>
        -- ADDI
        temp_res <= STD_LOGIC_VECTOR(unsigned(op1) + unsigned(op2));
        res <= temp_res;
        CCR(1) <= temp_res(31);
        IF temp_res = X"00000000"THEN
          CCR(0) <= '1';
        ELSE
          CCR(0) <= '0';
        END IF;
      WHEN OTHERS =>
        -- Default case when opCode does not match any of the specified values
        NULL;
    END CASE;
  END PROCESS;

END archExecute;