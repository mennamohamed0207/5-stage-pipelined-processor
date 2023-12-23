LIBRARY ieee;
USE ieee.std_logic_1164.ALL;
USE IEEE.numeric_std.ALL;
ENTITY AluOperandsSel IS
    PORT (
        readData : IN STD_LOGIC_VECTOR (31 DOWNTO 0);--op2
        readData1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        immData : IN STD_LOGIC_VECTOR (15 DOWNTO 0);
        opCode : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        lastOpCode : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
        AlutoAluop1 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        AlutoAluop2 : IN STD_LOGIC_VECTOR (31 DOWNTO 0);
        Sel : IN STD_LOGIC;
        forwardingsignalop1:in std_logic_vector(1 downto 0); --alu-mem
        forwardingsignalop2:in std_logic_vector(1 downto 0); --alu-mem
        op1 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        op2 : OUT STD_LOGIC_VECTOR (31 DOWNTO 0);
        opcodeAlu : OUT STD_LOGIC_VECTOR(5 DOWNTO 0)
    );
END AluOperandsSel;

ARCHITECTURE archAluOperandsSel OF AluOperandsSel IS
BEGIN
    op2 <= readData WHEN Sel = '0' ELSE
        (immData'RANGE => immData(15)) & immData;
    opcodeAlu <= opCode WHEN Sel = '0' ELSE
        lastOpCode;
    op1 <=AlutoAluop1 when forwardingsignalop1(0) ='1' else
        readData1;

END archAluOperandsSel;