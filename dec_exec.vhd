LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
ENTITY dec_exec IS
      PORT (
            readData0_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            readData1_IN : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
            destReg0_IN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            destReg1_IN : IN STD_LOGIC_VECTOR (2 DOWNTO 0);
            opCode_IN : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
            fetchSignals_IN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            regFileSignals_IN : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
            executeSignals_IN : IN STD_LOGIC_VECTOR(2 DOWNTO 0);
            memorySignals_IN : IN STD_LOGIC_VECTOR(6 DOWNTO 0);

            readData0_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            readData1_OUT : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
            destReg0_OUT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            destReg1_OUT : OUT STD_LOGIC_VECTOR (2 DOWNTO 0);
            opCode_OUT : OUT STD_LOGIC_VECTOR (5 DOWNTO 0);
            fetchSignals_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            regFileSignals_OUT : OUT STD_LOGIC_VECTOR(4 DOWNTO 0);
            executeSignals_OUT : OUT STD_LOGIC_VECTOR(2 DOWNTO 0);
            memorySignals_OUT : OUT STD_LOGIC_VECTOR(6 DOWNTO 0)
      );
END dec_exec;

ARCHITECTURE arch_dec_exec OF dec_exec IS
SIGNAL destReg_temp : STD_LOGIC_VECTOR(2 DOWNTO 0);
BEGIN
      readData0_OUT <= readData0_IN;
      readData1_OUT <= readData1_IN;
      destReg1_OUT <= destReg1_IN;
      opCode_OUT <= opCode_IN;
      fetchSignals_OUT  <= fetchSignals_IN ; 
      regFileSignals_OUT <=regFileSignals_IN; 
      executeSignals_OUT <=executeSignals_IN ;
      memorySignals_OUT <=memorySignals_IN ;
	PROCESS (regFileSignals_IN)
	BEGIN 
	if regFileSignals_IN(2)='1' then
	destReg_temp <= destReg0_IN;
	else
	destReg_temp <= destReg_temp;
	end if;
	END PROCESS;
      destReg0_OUT <= destReg_temp;
END arch_dec_exec;