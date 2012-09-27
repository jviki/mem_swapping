-- mem_swapping.vhd
-- Jan Viktorin <xvikto03@stud.fit.vutbr.cz>

library ieee;
use ieee.std_logic_1164.all;
use ieee.std_logic_arith.all;
use ieee.std_logic_unsigned.all;

library proc_common_v3_00_a;
use proc_common_v3_00_a.proc_common_pkg.log2;

---
-- Provides BRAM memory model that swaps
-- its contents to filesystem. This can
-- solve the issue with ISIM to not allocate
-- very huge amount of memory.
---
entity mem_swapping is
generic (
	MEM_CAP  : integer := 640 * 480;
	MEM_LINE : integer := 19200;
	DWIDTH   : integer := 8;
	PREFIX   : string  := "mem"
);
port (
	CLK       : in  std_logic;
	RST       : in  std_logic;

	MEM_A0    : in  std_logic_vector(log2(MEM_CAP) - 1 downto 0);
	MEM_DIN0  : in  std_logic_vector(DWIDTH - 1 downto 0);
	MEM_DOUT0 : out std_logic_vector(DWIDTH - 1 downto 0);
	MEM_WE0   : in  std_logic;
	MEM_RE0	  : in  std_logic;
	MEM_DRDY0 : out std_logic;

	MEM_A1    : in  std_logic_vector(log2(MEM_CAP) - 1 downto 0);
	MEM_DIN1  : in  std_logic_vector(DWIDTH - 1 downto 0);
	MEM_DOUT1 : out std_logic_vector(DWIDTH - 1 downto 0);
	MEM_WE1   : in  std_logic;
	MEM_RE1	  : in  std_logic;
	MEM_DRDY1 : out std_logic
);
end entity;
