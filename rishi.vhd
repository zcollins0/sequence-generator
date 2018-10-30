library ieee;
use ieee.std_logic_1164.all;

entity rishi is
generic(
  n: integer
);
port(
  inputs: in std_logic_vector(3 downto 0);
  load_gen, clock, reset: in std_logic;
  outputs, fs: out std_logic_vector(3 downto 0)
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
  signal common_bus: std_logic_vector(3 downto 0);
  -- the input "track" signal, should be tied to VDD
  signal track: std_logic := '1';
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

  PRE: preprocess port map(inputs, common_bus, load_gen, clock,
       preprocess_out, gclock);

  GEN_SLICES: for i in 0 to (n-1) generate

    UPPER_BIT: if i=(n-1) generate
      MS: slice port map(O(i-1), ts(i-1), '0', clock, gclock, reset,
            output_buf, common_bus, ts(i));
    end generate UPPER_BIT;

    LOWER_BIT: if i=0 generate
      LS: slice port map (preprocess_out, track, ts(i+1), clock, gclock, reset,
            O(i), common_bus, ts(i));
    end generate LOWER_BIT;

    OTHER_BITS: if (i<(n-1)) and (i>0) generate
      OTHER: slice port map (O(i-1), ts(i-1), ts(i+1), clock, gclock, reset,
            O(i), common_bus, ts(i));
    end generate OTHER_BITS;

  end generate GEN_SLICES;

  rishi_process: process(common_bus, output_buf)
  begin
    fs <= common_bus;
    outputs <= output_buf;
  end process rishi_process;

end rishi_behave;

