library ieee;
use ieee.std_logic_1164.all;

entity rishi is
generic(
  n: integer
);
port(
  inputs: in std_logic_vector(3 downto 0);
  load_gen, clock, reset, track: in std_logic;
  outputs, fs: out std_logic_vector(3 downto 0);
  track_out: out std_logic
);
end entity rishi;

architecture rishi_behave of rishi is

  component slice is
  port(
    inputs: in std_logic_vector(3 downto 0);
    tin, tnext, clock, gclock, reset: in std_logic;
    outputs, fs: out std_logic_vector(3 downto 0);
    tout: out std_logic
  );
  end component slice;

  component preprocess is
  port(
    inputs, fs: in std_logic_vector(3 downto 0);
    load_gen, clock: in std_logic;
    outputs: out std_logic_vector(3 downto 0);
    gclock: out std_logic
  );
  end component preprocess;

  type STD_LOGIC_VECTOR_ARRAY is array(0 to (n-1)) of std_logic_vector(3 downto 0);

  -- common bus holds the output/pipe back to beginning signal
  --   needs to be an array because t-gates don't work quite right in vhdl
  --signal common_bus: STD_LOGIC_VECTOR_ARRAY;
  -- holds the one active value in common_bus
  signal common_bus_value: std_logic_vector(3 downto 0);
  -- the clock signal for the flip flops used to track which output
  --   to pipe to the common bus
  signal gclock: std_logic;
  -- output signal interconnects between slices. last item in array is not used
  signal O: STD_LOGIC_VECTOR_ARRAY;
  -- track signal to pipe between slices
  signal ts: std_logic_vector(n-1 downto 0);
  -- output from the last slice
  signal output_buf: std_logic_vector(3 downto 0);
  -- output signal from preprocessor
  signal preprocess_out: std_logic_vector(3 downto 0);

begin

  PRE: preprocess port map(inputs, common_bus_value, load_gen, clock,
       preprocess_out, gclock);

  GEN_SLICES: for i in 0 to (n-1) generate

    UPPER_BIT: if i=(n-1) generate
      MS: slice port map(O(i-1), ts(i-1), '0', clock, gclock, reset,
            output_buf, common_bus_value, ts(i));
    end generate UPPER_BIT;

    LOWER_BIT: if i=0 generate
      LS: slice port map (preprocess_out, track, ts(i+1), clock, gclock, reset,
            O(i), common_bus_value, ts(i));
    end generate LOWER_BIT;

    OTHER_BITS: if (i<(n-1)) and (i>0) generate
      OTHER: slice port map (O(i-1), ts(i-1), ts(i+1), clock, gclock, reset,
            O(i), common_bus_value, ts(i));
    end generate OTHER_BITS;

  end generate GEN_SLICES;

  rishi_process: process(common_bus_value, output_buf, ts)
  begin
    --common_bus_loop: for i in (n-1) downto 0 loop
    --  if (common_bus(i) /= "ZZZZ") and (common_bus(i) /= "UUUU") then
    --    common_bus_value <= common_bus(i);
    --    exit common_bus_loop;
    --  end if;
    --end loop common_bus_loop;
    fs <= common_bus_value;
    outputs <= output_buf;
    track_out <= ts(n-1);
  end process rishi_process;

end rishi_behave;

