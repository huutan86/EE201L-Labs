library verilog;
use verilog.vl_types.all;
entity binary_game is
    port(
        Clk             : in     vl_logic;
        CEN             : in     vl_logic;
        Reset           : in     vl_logic;
        \Select\        : in     vl_logic;
        Quit            : in     vl_logic;
        selectRight     : in     vl_logic;
        selectLeft      : in     vl_logic;
        userNumber      : in     vl_logic_vector(7 downto 0);
        outputNumber    : out    vl_logic_vector(7 downto 0);
        q_Initial       : out    vl_logic;
        q_MenuPlay      : out    vl_logic;
        q_MenuPractice  : out    vl_logic;
        q_MenuScores    : out    vl_logic;
        q_MenuQuit      : out    vl_logic;
        q_PlayInitial   : out    vl_logic;
        q_Play          : out    vl_logic;
        q_PlayDone      : out    vl_logic;
        q_PracticeInitial: out    vl_logic;
        q_Practice      : out    vl_logic;
        q_PracticeDone  : out    vl_logic;
        q_Scores        : out    vl_logic;
        q_Done          : out    vl_logic
    );
end binary_game;
