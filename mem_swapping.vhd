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

architecture full of mem_swapping is

	constant ADDRW : integer := log2(MEM_CAP);

	subtype memaddr_t is std_logic_vector(ADDRW  - 1 downto 0);
	subtype memcell_t is std_logic_vector(DWIDTH - 1 downto 0);
	type mempart_t is array(0 to MEM_LINE - 1) of memcell_t;
	type memfile_t is file of memcell_t;

	--------------------------------------------------------

	function get_memname(base : in integer) return string is
	begin
		assert base >= 0
			report "[MEM] Invalid base for access memory: " & integer'image(base)
			severity failure;

		return PREFIX & "/mem_" & integer'image(base);
	end function;

begin

end architecture;
