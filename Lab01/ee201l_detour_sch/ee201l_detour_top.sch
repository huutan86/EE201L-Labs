<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="RESET" />
        <signal name="I" />
        <signal name="L1" />
        <signal name="L12" />
        <signal name="L123" />
        <signal name="R1" />
        <signal name="R12" />
        <signal name="R123" />
        <signal name="L" />
        <signal name="SSD_L(0)" />
        <signal name="SSD_L(1)" />
        <signal name="SSD_L(2)" />
        <signal name="SSD_L(3)" />
        <signal name="SSD_L(4)" />
        <signal name="SSD_L(5)" />
        <signal name="SSD_L(6)" />
        <signal name="XLXN_197" />
        <signal name="XLXN_200" />
        <signal name="Ca" />
        <signal name="Cb" />
        <signal name="Cc" />
        <signal name="Cd" />
        <signal name="Ce" />
        <signal name="Cf" />
        <signal name="Cg" />
        <signal name="Dp" />
        <signal name="SSD_out(0)" />
        <signal name="SSD_out(1)" />
        <signal name="SSD_out(2)" />
        <signal name="SSD_out(3)" />
        <signal name="SSD_out(4)" />
        <signal name="SSD_out(5)" />
        <signal name="SSD_out(6)" />
        <signal name="SSD_out(7)" />
        <signal name="SSD_out(7:0)" />
        <signal name="XLXN_1" />
        <signal name="DIVCLK(7:0)" />
        <signal name="XLXN_11" />
        <signal name="CLKPORT" />
        <signal name="BtnC" />
        <signal name="DIVCLK(23:8)" />
        <signal name="XLXN_522" />
        <signal name="An1" />
        <signal name="An2" />
        <signal name="LD6" />
        <signal name="LD7" />
        <signal name="LD3" />
        <signal name="LD2" />
        <signal name="LD1" />
        <signal name="LD0" />
        <signal name="LD4" />
        <signal name="LD5" />
        <signal name="GL" />
        <signal name="G1" />
        <signal name="G2" />
        <signal name="GR" />
        <signal name="R" />
        <signal name="CLK" />
        <signal name="state_onehot(0)" />
        <signal name="state_onehot(1)" />
        <signal name="state_onehot(2)" />
        <signal name="state_onehot(3)" />
        <signal name="state_onehot(4)" />
        <signal name="state_onehot(5)" />
        <signal name="state_onehot(6)" />
        <signal name="state_onehot(7)" />
        <signal name="XLXN_418" />
        <signal name="state_onehot(8)" />
        <signal name="state_onehot(9)" />
        <signal name="state_onehot(10)" />
        <signal name="state_onehot(11)" />
        <signal name="state_onehot(12)" />
        <signal name="state_onehot(13)" />
        <signal name="state_onehot(14)" />
        <signal name="state_onehot(15)" />
        <signal name="RamCS" />
        <signal name="MemOE" />
        <signal name="MemWR" />
        <signal name="FlashCS" />
        <signal name="QuadSpiFlashCS" />
        <signal name="state_onehot(15:0)" />
        <signal name="LR_BAR" />
        <signal name="SW0" />
        <signal name="SSD_L(7)" />
        <signal name="DIVCLK(31:24)" />
        <signal name="DIVCLK(31:0)" />
        <signal name="DIVCLK(25)" />
        <signal name="XLXN_752" />
        <signal name="XLXN_753" />
        <signal name="SSD_R(0)" />
        <signal name="SSD_R(1)" />
        <signal name="SSD_R(2)" />
        <signal name="SSD_R(3)" />
        <signal name="SSD_R(4)" />
        <signal name="SSD_R(5)" />
        <signal name="SSD_R(6)" />
        <signal name="SSD_R(7)" />
        <signal name="XLXN_809" />
        <signal name="An0" />
        <signal name="An3" />
        <signal name="DIVCLK(15)" />
        <signal name="SSD_L(7:0)" />
        <signal name="SSD_R(7:0)" />
        <signal name="XLXN_837(7:0)" />
        <signal name="XLXN_841" />
        <signal name="XLXN_842" />
        <signal name="XLXN_843" />
        <signal name="XLXN_856(3:0)" />
        <signal name="SSD_num(7:0)" />
        <port polarity="Output" name="Ca" />
        <port polarity="Output" name="Cb" />
        <port polarity="Output" name="Cc" />
        <port polarity="Output" name="Cd" />
        <port polarity="Output" name="Ce" />
        <port polarity="Output" name="Cf" />
        <port polarity="Output" name="Cg" />
        <port polarity="Output" name="Dp" />
        <port polarity="Input" name="CLKPORT" />
        <port polarity="Input" name="BtnC" />
        <port polarity="Output" name="An1" />
        <port polarity="Output" name="An2" />
        <port polarity="Output" name="LD6" />
        <port polarity="Output" name="LD7" />
        <port polarity="Output" name="LD3" />
        <port polarity="Output" name="LD2" />
        <port polarity="Output" name="LD1" />
        <port polarity="Output" name="LD0" />
        <port polarity="Output" name="LD4" />
        <port polarity="Output" name="LD5" />
        <port polarity="Output" name="RamCS" />
        <port polarity="Output" name="MemOE" />
        <port polarity="Output" name="MemWR" />
        <port polarity="Output" name="FlashCS" />
        <port polarity="Output" name="QuadSpiFlashCS" />
        <port polarity="Input" name="SW0" />
        <port polarity="Output" name="An0" />
        <port polarity="Output" name="An3" />
        <blockdef name="cb8ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="cb16ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <rect width="64" x="320" y="-268" height="24" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
        </blockdef>
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="bufgp">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="ee201l_detour">
            <timestamp>2008-2-1T23:26:28</timestamp>
            <rect width="256" x="64" y="-832" height="832" />
            <line x2="0" y1="-736" y2="-736" x1="64" />
            <line x2="384" y1="-608" y2="-608" x1="320" />
            <line x2="384" y1="-544" y2="-544" x1="320" />
            <line x2="384" y1="-672" y2="-672" x1="320" />
            <line x2="384" y1="-480" y2="-480" x1="320" />
            <line x2="384" y1="-416" y2="-416" x1="320" />
            <line x2="384" y1="-800" y2="-800" x1="320" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <line x2="384" y1="-288" y2="-288" x1="320" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <line x2="0" y1="-672" y2="-672" x1="64" />
            <line x2="384" y1="-736" y2="-736" x1="320" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <line x2="0" y1="-800" y2="-800" x1="64" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="USC_CENG_border">
            <timestamp>2008-2-4T4:45:44</timestamp>
            <rect width="724" x="0" y="-32" height="236" />
            <line x2="724" y1="60" y2="60" x1="0" />
            <line x2="724" y1="108" y2="108" x1="0" />
            <line x2="724" y1="152" y2="152" x1="0" />
            <line x2="352" y1="152" y2="108" x1="352" />
            <line x2="368" y1="60" y2="108" x1="368" />
        </blockdef>
        <blockdef name="mux8bit_2x1">
            <timestamp>2011-9-13T5:52:49</timestamp>
            <rect width="256" x="64" y="-192" height="192" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
        </blockdef>
        <blockdef name="inv">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="160" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="64" y1="0" y2="-64" x1="64" />
            <circle r="16" cx="144" cy="-32" />
        </blockdef>
        <blockdef name="onehot_to_hex_16bit">
            <timestamp>2008-2-3T20:7:16</timestamp>
            <rect width="256" x="64" y="-112" height="112" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="0" y1="-80" y2="-80" x1="64" />
            <rect width="64" x="0" y="-92" height="24" />
        </blockdef>
        <blockdef name="hex_to_ssd">
            <timestamp>2008-2-3T20:27:52</timestamp>
            <rect width="256" x="64" y="-96" height="96" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="0" y1="-64" y2="-64" x1="64" />
            <rect width="64" x="0" y="-76" height="24" />
        </blockdef>
        <block symbolname="buf" name="XLXI_79">
            <blockpin signalname="XLXN_200" name="I" />
            <blockpin signalname="SSD_L(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_80">
            <blockpin signalname="XLXN_200" name="I" />
            <blockpin signalname="SSD_L(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_81">
            <blockpin signalname="XLXN_200" name="I" />
            <blockpin signalname="SSD_L(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_82">
            <blockpin signalname="XLXN_197" name="I" />
            <blockpin signalname="SSD_L(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_83">
            <blockpin signalname="XLXN_197" name="I" />
            <blockpin signalname="SSD_L(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_84">
            <blockpin signalname="XLXN_197" name="I" />
            <blockpin signalname="SSD_L(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_85">
            <blockpin signalname="XLXN_200" name="I" />
            <blockpin signalname="SSD_L(6)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_89">
            <blockpin signalname="XLXN_197" name="G" />
        </block>
        <block symbolname="vcc" name="XLXI_91">
            <blockpin signalname="XLXN_200" name="P" />
        </block>
        <block symbolname="cb8ce" name="XLXI_1">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_11" name="CE" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="XLXN_1" name="CEO" />
            <blockpin signalname="DIVCLK(7:0)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="vcc" name="XLXI_4">
            <blockpin signalname="XLXN_11" name="P" />
        </block>
        <block symbolname="bufgp" name="XLXI_5">
            <blockpin signalname="CLKPORT" name="I" />
            <blockpin signalname="CLK" name="O" />
        </block>
        <block symbolname="cb8ce" name="XLXI_185">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_522" name="CE" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="DIVCLK(31:24)" name="Q(7:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="cb16ce" name="XLXI_2">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_1" name="CE" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="XLXN_522" name="CEO" />
            <blockpin signalname="DIVCLK(23:8)" name="Q(15:0)" />
            <blockpin name="TC" />
        </block>
        <block symbolname="USC_CENG_border" name="XLXI_236" />
        <block symbolname="USC_CENG_border" name="XLXI_237" />
        <block symbolname="obuf" name="XLXI_28">
            <blockpin signalname="GL" name="I" />
            <blockpin signalname="LD6" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_27">
            <blockpin signalname="GL" name="I" />
            <blockpin signalname="LD7" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_31">
            <blockpin signalname="G2" name="I" />
            <blockpin signalname="LD3" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_32">
            <blockpin signalname="G2" name="I" />
            <blockpin signalname="LD2" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_33">
            <blockpin signalname="GR" name="I" />
            <blockpin signalname="LD1" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_34">
            <blockpin signalname="GR" name="I" />
            <blockpin signalname="LD0" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_30">
            <blockpin signalname="G1" name="I" />
            <blockpin signalname="LD4" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_29">
            <blockpin signalname="G1" name="I" />
            <blockpin signalname="LD5" name="O" />
        </block>
        <block symbolname="ee201l_detour" name="UUT">
            <blockpin signalname="RESET" name="RESET" />
            <blockpin signalname="XLXN_809" name="CLK" />
            <blockpin signalname="LR_BAR" name="LR_BAR" />
            <blockpin signalname="L" name="L" />
            <blockpin signalname="R" name="R" />
            <blockpin signalname="G1" name="G1" />
            <blockpin signalname="G2" name="G2" />
            <blockpin signalname="GR" name="GR" />
            <blockpin signalname="GL" name="GL" />
            <blockpin signalname="I" name="I" />
            <blockpin signalname="R1" name="R1" />
            <blockpin signalname="R12" name="R12" />
            <blockpin signalname="R123" name="R123" />
            <blockpin signalname="L1" name="L1" />
            <blockpin signalname="L12" name="L12" />
            <blockpin signalname="L123" name="L123" />
        </block>
        <block symbolname="buf" name="XLXI_14">
            <blockpin signalname="DIVCLK(25)" name="I" />
            <blockpin signalname="XLXN_809" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_111">
            <blockpin signalname="I" name="I" />
            <blockpin signalname="state_onehot(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_112">
            <blockpin signalname="L1" name="I" />
            <blockpin signalname="state_onehot(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_113">
            <blockpin signalname="L12" name="I" />
            <blockpin signalname="state_onehot(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_114">
            <blockpin signalname="L123" name="I" />
            <blockpin signalname="state_onehot(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_115">
            <blockpin signalname="R1" name="I" />
            <blockpin signalname="state_onehot(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_116">
            <blockpin signalname="R12" name="I" />
            <blockpin signalname="state_onehot(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_117">
            <blockpin signalname="R123" name="I" />
            <blockpin signalname="state_onehot(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_118">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(7)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_119">
            <blockpin signalname="XLXN_418" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_120">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(8)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_121">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(9)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_122">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(10)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_123">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(11)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_124">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(12)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_125">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(13)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_126">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(14)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_127">
            <blockpin signalname="XLXN_418" name="I" />
            <blockpin signalname="state_onehot(15)" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_9">
            <blockpin signalname="RamCS" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_10">
            <blockpin signalname="MemOE" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_13">
            <blockpin signalname="MemWR" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_273">
            <blockpin signalname="FlashCS" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_7">
            <blockpin signalname="QuadSpiFlashCS" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_297">
            <blockpin signalname="An1" name="P" />
        </block>
        <block symbolname="vcc" name="XLXI_298">
            <blockpin signalname="An2" name="P" />
        </block>
        <block symbolname="buf" name="XLXI_301">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_302">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_303">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_304">
            <blockpin signalname="XLXN_753" name="I" />
            <blockpin signalname="SSD_R(3)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_305">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(4)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_306">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(5)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_307">
            <blockpin signalname="XLXN_752" name="I" />
            <blockpin signalname="SSD_R(6)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_325">
            <blockpin signalname="XLXN_200" name="I" />
            <blockpin signalname="SSD_L(7)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_326">
            <blockpin signalname="XLXN_753" name="I" />
            <blockpin signalname="SSD_R(7)" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_328">
            <blockpin signalname="XLXN_752" name="G" />
        </block>
        <block symbolname="obuf" name="XLXI_357">
            <blockpin signalname="SSD_out(7)" name="I" />
            <blockpin signalname="Dp" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_358">
            <blockpin signalname="SSD_out(6)" name="I" />
            <blockpin signalname="Cg" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_359">
            <blockpin signalname="SSD_out(5)" name="I" />
            <blockpin signalname="Cf" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_360">
            <blockpin signalname="SSD_out(4)" name="I" />
            <blockpin signalname="Ce" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_361">
            <blockpin signalname="SSD_out(3)" name="I" />
            <blockpin signalname="Cd" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_362">
            <blockpin signalname="SSD_out(2)" name="I" />
            <blockpin signalname="Cc" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_363">
            <blockpin signalname="SSD_out(1)" name="I" />
            <blockpin signalname="Cb" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_364">
            <blockpin signalname="SSD_out(0)" name="I" />
            <blockpin signalname="Ca" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_382">
            <blockpin signalname="BtnC" name="I" />
            <blockpin signalname="RESET" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_390">
            <blockpin signalname="SW0" name="I" />
            <blockpin signalname="LR_BAR" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_391">
            <blockpin signalname="XLXN_753" name="P" />
        </block>
        <block symbolname="inv" name="XLXI_415">
            <blockpin signalname="LR_BAR" name="I" />
            <blockpin signalname="XLXN_841" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_418">
            <blockpin signalname="An3" name="I" />
            <blockpin signalname="An0" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_419">
            <blockpin signalname="DIVCLK(15)" name="I" />
            <blockpin signalname="An3" name="O" />
        </block>
        <block symbolname="mux8bit_2x1" name="XLXI_420">
            <blockpin signalname="XLXN_837(7:0)" name="A(7:0)" />
            <blockpin signalname="SSD_num(7:0)" name="B(7:0)" />
            <blockpin signalname="SSD_out(7:0)" name="O(7:0)" />
            <blockpin signalname="XLXN_843" name="S" />
        </block>
        <block symbolname="inv" name="XLXI_421">
            <blockpin signalname="DIVCLK(15)" name="I" />
            <blockpin signalname="XLXN_843" name="O" />
        </block>
        <block symbolname="mux8bit_2x1" name="XLXI_414">
            <blockpin signalname="SSD_L(7:0)" name="A(7:0)" />
            <blockpin signalname="SSD_R(7:0)" name="B(7:0)" />
            <blockpin signalname="XLXN_837(7:0)" name="O(7:0)" />
            <blockpin signalname="XLXN_841" name="S" />
        </block>
        <block symbolname="onehot_to_hex_16bit" name="XLXI_436">
            <blockpin signalname="XLXN_856(3:0)" name="hex(3:0)" />
            <blockpin signalname="state_onehot(15:0)" name="one_hot(15:0)" />
        </block>
        <block symbolname="hex_to_ssd" name="XLXI_437">
            <blockpin signalname="SSD_num(7:0)" name="ssd(7:0)" />
            <blockpin signalname="XLXN_856(3:0)" name="hex(3:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <instance x="896" y="480" name="XLXI_1" orien="R0" />
        <branch name="DIVCLK(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1392" y="224" type="branch" />
            <wire x2="1392" y1="224" y2="224" x1="1280" />
            <wire x2="1408" y1="224" y2="224" x1="1392" />
        </branch>
        <instance x="768" y="176" name="XLXI_4" orien="R0" />
        <branch name="XLXN_11">
            <wire x2="832" y1="176" y2="288" x1="832" />
            <wire x2="896" y1="288" y2="288" x1="832" />
        </branch>
        <instance x="432" y="384" name="XLXI_5" orien="R0" />
        <branch name="CLKPORT">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="416" y="352" type="branch" />
            <wire x2="416" y1="352" y2="352" x1="336" />
            <wire x2="432" y1="352" y2="352" x1="416" />
        </branch>
        <branch name="BtnC">
            <wire x2="432" y1="592" y2="592" x1="320" />
        </branch>
        <iomarker fontsize="36" x="336" y="352" name="CLKPORT" orien="R180" />
        <iomarker fontsize="36" x="320" y="592" name="BtnC" orien="R180" />
        <branch name="CLK">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1344" y="512" type="branch" />
            <wire x2="720" y1="352" y2="352" x1="656" />
            <wire x2="896" y1="352" y2="352" x1="720" />
            <wire x2="720" y1="352" y2="768" x1="720" />
            <wire x2="1344" y1="768" y2="768" x1="720" />
            <wire x2="1920" y1="768" y2="768" x1="1344" />
            <wire x2="1472" y1="336" y2="336" x1="1344" />
            <wire x2="1344" y1="336" y2="512" x1="1344" />
            <wire x2="1344" y1="512" y2="768" x1="1344" />
            <wire x2="1920" y1="336" y2="768" x1="1920" />
            <wire x2="2032" y1="336" y2="336" x1="1920" />
        </branch>
        <branch name="DIVCLK(23:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1968" y="208" type="branch" />
            <wire x2="1968" y1="208" y2="208" x1="1856" />
            <wire x2="2000" y1="208" y2="208" x1="1968" />
        </branch>
        <branch name="XLXN_522">
            <wire x2="2032" y1="272" y2="272" x1="1856" />
        </branch>
        <instance x="2032" y="464" name="XLXI_185" orien="R0" />
        <branch name="XLXN_1">
            <wire x2="1296" y1="288" y2="288" x1="1280" />
            <wire x2="1472" y1="272" y2="272" x1="1296" />
            <wire x2="1296" y1="272" y2="288" x1="1296" />
        </branch>
        <instance x="1472" y="464" name="XLXI_2" orien="R0" />
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="784" y="592" type="branch" />
            <wire x2="784" y1="592" y2="592" x1="656" />
            <wire x2="896" y1="592" y2="592" x1="784" />
            <wire x2="1472" y1="592" y2="592" x1="896" />
            <wire x2="2032" y1="592" y2="592" x1="1472" />
            <wire x2="896" y1="448" y2="592" x1="896" />
            <wire x2="1472" y1="432" y2="592" x1="1472" />
            <wire x2="2032" y1="432" y2="592" x1="2032" />
        </branch>
        <instance x="2784" y="2496" name="XLXI_236" orien="R0" />
        <text style="fontsize:24;fontname:Arial" x="2940" y="2584">Detour</text>
        <text style="fontsize:24;fontname:Arial" x="3208" y="2584">TOP schematic (Sheet 1/2)</text>
        <branch name="GL">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1888" y="1088" type="branch" />
            <wire x2="1888" y1="1088" y2="1088" x1="1824" />
            <wire x2="1952" y1="1088" y2="1088" x1="1888" />
        </branch>
        <branch name="G1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1888" y="1152" type="branch" />
            <wire x2="1888" y1="1152" y2="1152" x1="1824" />
            <wire x2="1952" y1="1152" y2="1152" x1="1888" />
        </branch>
        <branch name="G2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1888" y="1216" type="branch" />
            <wire x2="1888" y1="1216" y2="1216" x1="1824" />
            <wire x2="1952" y1="1216" y2="1216" x1="1888" />
        </branch>
        <branch name="GR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1888" y="1280" type="branch" />
            <wire x2="1888" y1="1280" y2="1280" x1="1824" />
            <wire x2="1952" y1="1280" y2="1280" x1="1888" />
        </branch>
        <branch name="R123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2032" y="1728" type="branch" />
            <wire x2="2032" y1="1728" y2="1728" x1="1824" />
            <wire x2="2096" y1="1728" y2="1728" x1="2032" />
        </branch>
        <branch name="R12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2032" y="1664" type="branch" />
            <wire x2="2032" y1="1664" y2="1664" x1="1824" />
            <wire x2="2096" y1="1664" y2="1664" x1="2032" />
        </branch>
        <branch name="R1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2032" y="1600" type="branch" />
            <wire x2="2032" y1="1600" y2="1600" x1="1824" />
            <wire x2="2096" y1="1600" y2="1600" x1="2032" />
        </branch>
        <branch name="L123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2032" y="1536" type="branch" />
            <wire x2="2032" y1="1536" y2="1536" x1="1824" />
            <wire x2="2096" y1="1536" y2="1536" x1="2032" />
        </branch>
        <branch name="L12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2048" y="1472" type="branch" />
            <wire x2="2048" y1="1472" y2="1472" x1="1824" />
            <wire x2="2096" y1="1472" y2="1472" x1="2048" />
        </branch>
        <branch name="L1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2048" y="1408" type="branch" />
            <wire x2="2048" y1="1408" y2="1408" x1="1824" />
            <wire x2="2096" y1="1408" y2="1408" x1="2048" />
        </branch>
        <branch name="I">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2048" y="1344" type="branch" />
            <wire x2="2048" y1="1344" y2="1344" x1="1824" />
            <wire x2="2096" y1="1344" y2="1344" x1="2048" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2048" y="960" type="branch" />
            <wire x2="2048" y1="960" y2="960" x1="1824" />
            <wire x2="2096" y1="960" y2="960" x1="2048" />
        </branch>
        <instance x="1120" y="1056" name="XLXI_14" orien="R0" />
        <branch name="R123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="272" y="1488" type="branch" />
            <wire x2="272" y1="1488" y2="1488" x1="192" />
            <wire x2="336" y1="1488" y2="1488" x1="272" />
        </branch>
        <branch name="R12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="272" y="1424" type="branch" />
            <wire x2="272" y1="1424" y2="1424" x1="192" />
            <wire x2="336" y1="1424" y2="1424" x1="272" />
        </branch>
        <branch name="R1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="272" y="1360" type="branch" />
            <wire x2="272" y1="1360" y2="1360" x1="192" />
            <wire x2="336" y1="1360" y2="1360" x1="272" />
        </branch>
        <branch name="L123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="272" y="1296" type="branch" />
            <wire x2="272" y1="1296" y2="1296" x1="192" />
            <wire x2="336" y1="1296" y2="1296" x1="272" />
        </branch>
        <branch name="L12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="288" y="1232" type="branch" />
            <wire x2="288" y1="1232" y2="1232" x1="192" />
            <wire x2="336" y1="1232" y2="1232" x1="288" />
        </branch>
        <branch name="L1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="288" y="1168" type="branch" />
            <wire x2="288" y1="1168" y2="1168" x1="192" />
            <wire x2="336" y1="1168" y2="1168" x1="288" />
        </branch>
        <branch name="I">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="288" y="1104" type="branch" />
            <wire x2="288" y1="1104" y2="1104" x1="192" />
            <wire x2="336" y1="1104" y2="1104" x1="288" />
        </branch>
        <instance x="336" y="1136" name="XLXI_111" orien="R0" />
        <instance x="336" y="1200" name="XLXI_112" orien="R0" />
        <instance x="336" y="1264" name="XLXI_113" orien="R0" />
        <instance x="336" y="1328" name="XLXI_114" orien="R0" />
        <instance x="336" y="1392" name="XLXI_115" orien="R0" />
        <instance x="336" y="1456" name="XLXI_116" orien="R0" />
        <instance x="336" y="1520" name="XLXI_117" orien="R0" />
        <branch name="state_onehot(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1104" type="branch" />
            <wire x2="592" y1="1104" y2="1104" x1="560" />
            <wire x2="672" y1="1104" y2="1104" x1="592" />
        </branch>
        <branch name="state_onehot(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1168" type="branch" />
            <wire x2="592" y1="1168" y2="1168" x1="560" />
            <wire x2="672" y1="1168" y2="1168" x1="592" />
        </branch>
        <branch name="state_onehot(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1232" type="branch" />
            <wire x2="592" y1="1232" y2="1232" x1="560" />
            <wire x2="672" y1="1232" y2="1232" x1="592" />
        </branch>
        <branch name="state_onehot(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1296" type="branch" />
            <wire x2="592" y1="1296" y2="1296" x1="560" />
            <wire x2="672" y1="1296" y2="1296" x1="592" />
        </branch>
        <branch name="state_onehot(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1360" type="branch" />
            <wire x2="592" y1="1360" y2="1360" x1="560" />
            <wire x2="672" y1="1360" y2="1360" x1="592" />
        </branch>
        <branch name="state_onehot(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1424" type="branch" />
            <wire x2="592" y1="1424" y2="1424" x1="560" />
            <wire x2="672" y1="1424" y2="1424" x1="592" />
        </branch>
        <branch name="state_onehot(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="592" y="1488" type="branch" />
            <wire x2="592" y1="1488" y2="1488" x1="560" />
            <wire x2="672" y1="1488" y2="1488" x1="592" />
        </branch>
        <instance x="336" y="1584" name="XLXI_118" orien="R0" />
        <branch name="state_onehot(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1552" type="branch" />
            <wire x2="576" y1="1552" y2="1552" x1="560" />
            <wire x2="672" y1="1552" y2="1552" x1="576" />
        </branch>
        <instance x="176" y="1728" name="XLXI_119" orien="R0" />
        <branch name="XLXN_418">
            <wire x2="240" y1="1552" y2="1600" x1="240" />
            <wire x2="320" y1="1552" y2="1552" x1="240" />
            <wire x2="336" y1="1552" y2="1552" x1="320" />
            <wire x2="320" y1="1552" y2="1616" x1="320" />
            <wire x2="336" y1="1616" y2="1616" x1="320" />
            <wire x2="320" y1="1616" y2="1680" x1="320" />
            <wire x2="336" y1="1680" y2="1680" x1="320" />
            <wire x2="320" y1="1680" y2="1744" x1="320" />
            <wire x2="336" y1="1744" y2="1744" x1="320" />
            <wire x2="320" y1="1744" y2="1808" x1="320" />
            <wire x2="336" y1="1808" y2="1808" x1="320" />
            <wire x2="320" y1="1808" y2="1872" x1="320" />
            <wire x2="336" y1="1872" y2="1872" x1="320" />
            <wire x2="320" y1="1872" y2="1936" x1="320" />
            <wire x2="336" y1="1936" y2="1936" x1="320" />
            <wire x2="320" y1="1936" y2="2000" x1="320" />
            <wire x2="336" y1="2000" y2="2000" x1="320" />
            <wire x2="320" y1="2000" y2="2064" x1="320" />
            <wire x2="336" y1="2064" y2="2064" x1="320" />
        </branch>
        <instance x="336" y="1648" name="XLXI_120" orien="R0" />
        <instance x="336" y="1712" name="XLXI_121" orien="R0" />
        <instance x="336" y="1776" name="XLXI_122" orien="R0" />
        <instance x="336" y="1840" name="XLXI_123" orien="R0" />
        <instance x="336" y="1904" name="XLXI_124" orien="R0" />
        <instance x="336" y="1968" name="XLXI_125" orien="R0" />
        <instance x="336" y="2032" name="XLXI_126" orien="R0" />
        <instance x="336" y="2096" name="XLXI_127" orien="R0" />
        <branch name="state_onehot(8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1616" type="branch" />
            <wire x2="576" y1="1616" y2="1616" x1="560" />
            <wire x2="672" y1="1616" y2="1616" x1="576" />
        </branch>
        <branch name="state_onehot(9)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1680" type="branch" />
            <wire x2="576" y1="1680" y2="1680" x1="560" />
            <wire x2="672" y1="1680" y2="1680" x1="576" />
        </branch>
        <branch name="state_onehot(10)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1744" type="branch" />
            <wire x2="576" y1="1744" y2="1744" x1="560" />
            <wire x2="672" y1="1744" y2="1744" x1="576" />
        </branch>
        <branch name="state_onehot(11)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1808" type="branch" />
            <wire x2="576" y1="1808" y2="1808" x1="560" />
            <wire x2="672" y1="1808" y2="1808" x1="576" />
        </branch>
        <branch name="state_onehot(12)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1872" type="branch" />
            <wire x2="576" y1="1872" y2="1872" x1="560" />
            <wire x2="672" y1="1872" y2="1872" x1="576" />
        </branch>
        <branch name="state_onehot(13)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="1936" type="branch" />
            <wire x2="576" y1="1936" y2="1936" x1="560" />
            <wire x2="672" y1="1936" y2="1936" x1="576" />
        </branch>
        <branch name="state_onehot(14)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="2000" type="branch" />
            <wire x2="576" y1="2000" y2="2000" x1="560" />
            <wire x2="672" y1="2000" y2="2000" x1="576" />
        </branch>
        <branch name="state_onehot(15)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="576" y="2064" type="branch" />
            <wire x2="576" y1="2064" y2="2064" x1="560" />
            <wire x2="672" y1="2064" y2="2064" x1="576" />
        </branch>
        <branch name="RamCS">
            <wire x2="3136" y1="864" y2="864" x1="2992" />
        </branch>
        <instance x="2928" y="864" name="XLXI_9" orien="R0" />
        <branch name="MemOE">
            <wire x2="3136" y1="992" y2="992" x1="2992" />
        </branch>
        <instance x="2928" y="992" name="XLXI_10" orien="R0" />
        <branch name="MemWR">
            <wire x2="3136" y1="1136" y2="1136" x1="2992" />
        </branch>
        <instance x="2928" y="1136" name="XLXI_13" orien="R0" />
        <branch name="FlashCS">
            <wire x2="2704" y1="864" y2="864" x1="2560" />
        </branch>
        <instance x="2496" y="864" name="XLXI_273" orien="R0" />
        <branch name="QuadSpiFlashCS">
            <wire x2="2704" y1="992" y2="992" x1="2560" />
        </branch>
        <instance x="2496" y="992" name="XLXI_7" orien="R0" />
        <text style="fontsize:40;fontname:Arial" x="2636" y="1216">To disable the three memories</text>
        <iomarker fontsize="28" x="3136" y="864" name="RamCS" orien="R0" />
        <iomarker fontsize="28" x="3136" y="992" name="MemOE" orien="R0" />
        <iomarker fontsize="28" x="3136" y="1136" name="MemWR" orien="R0" />
        <iomarker fontsize="28" x="2704" y="864" name="FlashCS" orien="R0" />
        <iomarker fontsize="28" x="2704" y="992" name="QuadSpiFlashCS" orien="R0" />
        <branch name="state_onehot(15:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="832" y="1984" type="branch" />
            <wire x2="832" y1="1984" y2="1984" x1="800" />
            <wire x2="1008" y1="1984" y2="1984" x1="832" />
        </branch>
        <text style="fontsize:32;fontname:Arial" x="132" y="2228">into a 16-bit one-hot coded number (useful in Part 3)</text>
        <text style="fontsize:32;fontname:Arial" x="204" y="2176">Converting the current state information </text>
        <branch name="R">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2048" y="1024" type="branch" />
            <wire x2="2048" y1="1024" y2="1024" x1="1824" />
            <wire x2="2096" y1="1024" y2="1024" x1="2048" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1104" y="896" type="branch" />
            <wire x2="1104" y1="896" y2="896" x1="976" />
            <wire x2="1440" y1="896" y2="896" x1="1104" />
            <wire x2="1440" y1="896" y2="960" x1="1440" />
        </branch>
        <instance x="1440" y="1760" name="UUT" orien="R0">
        </instance>
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash;fillcolor:rgb(255,0,0)" width="2388" x="964" y="1800" height="616" />
        <circle style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" r="68" cx="1352" cy="1000" />
        <branch name="LR_BAR">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1376" y="1184" type="branch" />
            <wire x2="1440" y1="1088" y2="1088" x1="1376" />
            <wire x2="1376" y1="1088" y2="1184" x1="1376" />
            <wire x2="1376" y1="1184" y2="1328" x1="1376" />
        </branch>
        <branch name="SW0">
            <wire x2="1152" y1="1328" y2="1328" x1="1072" />
        </branch>
        <iomarker fontsize="36" x="1072" y="1328" name="SW0" orien="R180" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="320" x="1092" y="1276" height="124" />
        <text style="fontsize:24;fontname:Arial" x="2912" y="2624">Gandhi Puvvada</text>
        <branch name="DIVCLK(31:24)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2528" y="208" type="branch" />
            <wire x2="2528" y1="208" y2="208" x1="2416" />
            <wire x2="2592" y1="208" y2="208" x1="2528" />
        </branch>
        <branch name="DIVCLK(31:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2720" y="256" type="branch" />
            <wire x2="2720" y1="144" y2="256" x1="2720" />
            <wire x2="2720" y1="256" y2="400" x1="2720" />
        </branch>
        <circle style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" r="82" cx="1346" cy="494" />
        <branch name="DIVCLK(25)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1008" y="1024" type="branch" />
            <wire x2="1008" y1="1024" y2="1024" x1="976" />
            <wire x2="1120" y1="1024" y2="1024" x1="1008" />
        </branch>
        <instance x="432" y="624" name="XLXI_382" orien="R0" />
        <text style="fontsize:48;fontname:Arial" x="2400" y="2352">For Part 3 completion</text>
        <instance x="1152" y="1360" name="XLXI_390" orien="R0" />
        <branch name="XLXN_809">
            <wire x2="1440" y1="1024" y2="1024" x1="1344" />
        </branch>
        <instance x="1008" y="2064" name="XLXI_436" orien="R0">
        </instance>
        <branch name="XLXN_856(3:0)">
            <wire x2="1472" y1="2032" y2="2032" x1="1392" />
        </branch>
        <instance x="1472" y="2096" name="XLXI_437" orien="R0">
        </instance>
        <branch name="SSD_num(7:0)">
            <attrtext style="alignment:SOFT-LEFT" attrname="Name" x="2000" y="2064" type="branch" />
            <wire x2="2000" y1="2064" y2="2064" x1="1856" />
        </branch>
    </sheet>
    <sheet sheetnum="2" width="3520" height="2720">
        <instance x="416" y="96" name="XLXI_79" orien="R0" />
        <instance x="416" y="160" name="XLXI_80" orien="R0" />
        <instance x="416" y="224" name="XLXI_81" orien="R0" />
        <instance x="416" y="288" name="XLXI_82" orien="R0" />
        <instance x="416" y="352" name="XLXI_83" orien="R0" />
        <instance x="416" y="416" name="XLXI_84" orien="R0" />
        <instance x="416" y="480" name="XLXI_85" orien="R0" />
        <branch name="SSD_L(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="656" y="64" type="branch" />
            <wire x2="656" y1="64" y2="64" x1="640" />
            <wire x2="736" y1="64" y2="64" x1="656" />
        </branch>
        <branch name="SSD_L(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="128" type="branch" />
            <wire x2="672" y1="128" y2="128" x1="640" />
            <wire x2="736" y1="128" y2="128" x1="672" />
        </branch>
        <branch name="SSD_L(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="192" type="branch" />
            <wire x2="672" y1="192" y2="192" x1="640" />
            <wire x2="736" y1="192" y2="192" x1="672" />
        </branch>
        <branch name="SSD_L(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="256" type="branch" />
            <wire x2="672" y1="256" y2="256" x1="640" />
            <wire x2="736" y1="256" y2="256" x1="672" />
        </branch>
        <branch name="SSD_L(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="320" type="branch" />
            <wire x2="672" y1="320" y2="320" x1="640" />
            <wire x2="736" y1="320" y2="320" x1="672" />
        </branch>
        <branch name="SSD_L(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="384" type="branch" />
            <wire x2="672" y1="384" y2="384" x1="640" />
            <wire x2="736" y1="384" y2="384" x1="672" />
        </branch>
        <branch name="SSD_L(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="672" y="448" type="branch" />
            <wire x2="672" y1="448" y2="448" x1="640" />
            <wire x2="736" y1="448" y2="448" x1="672" />
        </branch>
        <branch name="XLXN_197">
            <wire x2="320" y1="320" y2="320" x1="160" />
            <wire x2="416" y1="320" y2="320" x1="320" />
            <wire x2="320" y1="320" y2="384" x1="320" />
            <wire x2="416" y1="384" y2="384" x1="320" />
            <wire x2="160" y1="320" y2="608" x1="160" />
            <wire x2="416" y1="256" y2="256" x1="320" />
            <wire x2="320" y1="256" y2="320" x1="320" />
        </branch>
        <instance x="96" y="736" name="XLXI_89" orien="R0" />
        <branch name="Ca">
            <wire x2="3312" y1="112" y2="112" x1="3136" />
        </branch>
        <branch name="Cb">
            <wire x2="3312" y1="192" y2="192" x1="3136" />
        </branch>
        <branch name="Cc">
            <wire x2="3312" y1="272" y2="272" x1="3136" />
        </branch>
        <branch name="Cd">
            <wire x2="3312" y1="352" y2="352" x1="3136" />
        </branch>
        <branch name="Ce">
            <wire x2="3312" y1="432" y2="432" x1="3136" />
        </branch>
        <branch name="Cf">
            <wire x2="3312" y1="512" y2="512" x1="3136" />
        </branch>
        <branch name="Cg">
            <wire x2="3312" y1="592" y2="592" x1="3136" />
        </branch>
        <branch name="Dp">
            <wire x2="3312" y1="672" y2="672" x1="3136" />
        </branch>
        <branch name="SSD_out(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="112" type="branch" />
            <wire x2="2768" y1="112" y2="112" x1="2400" />
            <wire x2="2912" y1="112" y2="112" x1="2768" />
        </branch>
        <branch name="SSD_out(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="192" type="branch" />
            <wire x2="2768" y1="192" y2="192" x1="2400" />
            <wire x2="2912" y1="192" y2="192" x1="2768" />
        </branch>
        <branch name="SSD_out(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="272" type="branch" />
            <wire x2="2768" y1="272" y2="272" x1="2400" />
            <wire x2="2912" y1="272" y2="272" x1="2768" />
        </branch>
        <branch name="SSD_out(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="352" type="branch" />
            <wire x2="2768" y1="352" y2="352" x1="2400" />
            <wire x2="2912" y1="352" y2="352" x1="2768" />
        </branch>
        <branch name="SSD_out(4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="432" type="branch" />
            <wire x2="2768" y1="432" y2="432" x1="2400" />
            <wire x2="2912" y1="432" y2="432" x1="2768" />
        </branch>
        <branch name="SSD_out(5)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="512" type="branch" />
            <wire x2="2768" y1="512" y2="512" x1="2400" />
            <wire x2="2912" y1="512" y2="512" x1="2768" />
        </branch>
        <branch name="SSD_out(6)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="592" type="branch" />
            <wire x2="2768" y1="592" y2="592" x1="2400" />
            <wire x2="2912" y1="592" y2="592" x1="2768" />
        </branch>
        <branch name="SSD_out(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2768" y="672" type="branch" />
            <wire x2="2768" y1="672" y2="672" x1="2400" />
            <wire x2="2912" y1="672" y2="672" x1="2768" />
        </branch>
        <iomarker fontsize="36" x="3312" y="112" name="Ca" orien="R0" />
        <iomarker fontsize="36" x="3312" y="192" name="Cb" orien="R0" />
        <iomarker fontsize="36" x="3312" y="272" name="Cc" orien="R0" />
        <iomarker fontsize="36" x="3312" y="352" name="Cd" orien="R0" />
        <iomarker fontsize="36" x="3312" y="432" name="Ce" orien="R0" />
        <iomarker fontsize="36" x="3312" y="512" name="Cf" orien="R0" />
        <iomarker fontsize="36" x="3312" y="592" name="Cg" orien="R0" />
        <iomarker fontsize="36" x="3312" y="672" name="Dp" orien="R0" />
        <bustap x2="2400" y1="112" y2="112" x1="2304" />
        <bustap x2="2400" y1="192" y2="192" x1="2304" />
        <bustap x2="2400" y1="272" y2="272" x1="2304" />
        <bustap x2="2400" y1="352" y2="352" x1="2304" />
        <bustap x2="2400" y1="432" y2="432" x1="2304" />
        <bustap x2="2400" y1="512" y2="512" x1="2304" />
        <bustap x2="2400" y1="592" y2="592" x1="2304" />
        <bustap x2="2400" y1="672" y2="672" x1="2304" />
        <instance x="208" y="624" name="XLXI_91" orien="R0" />
        <instance x="2784" y="2512" name="XLXI_237" orien="R0" />
        <text style="fontsize:24;fontname:Arial" x="2940" y="2600">Detour</text>
        <text style="fontsize:24;fontname:Arial" x="3208" y="2600">TOP schematic (Sheet 2/2)</text>
        <branch name="An1">
            <wire x2="2336" y1="1168" y2="1168" x1="2048" />
        </branch>
        <iomarker fontsize="28" x="2336" y="1168" name="An1" orien="R0" />
        <branch name="An2">
            <wire x2="2336" y1="1232" y2="1232" x1="1968" />
        </branch>
        <iomarker fontsize="28" x="2336" y="1232" name="An2" orien="R0" />
        <iomarker fontsize="28" x="2336" y="1296" name="An3" orien="R0" />
        <branch name="LD6">
            <wire x2="3232" y1="1088" y2="1088" x1="3056" />
        </branch>
        <branch name="LD7">
            <wire x2="3232" y1="1008" y2="1008" x1="3056" />
        </branch>
        <branch name="GL">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2624" y="1040" type="branch" />
            <wire x2="2624" y1="1040" y2="1040" x1="2592" />
            <wire x2="2672" y1="1040" y2="1040" x1="2624" />
            <wire x2="2672" y1="1040" y2="1088" x1="2672" />
            <wire x2="2832" y1="1088" y2="1088" x1="2672" />
            <wire x2="2832" y1="1008" y2="1008" x1="2672" />
            <wire x2="2672" y1="1008" y2="1040" x1="2672" />
        </branch>
        <instance x="2832" y="1120" name="XLXI_28" orien="R0" />
        <instance x="2832" y="1040" name="XLXI_27" orien="R0" />
        <branch name="LD3">
            <wire x2="3248" y1="1536" y2="1536" x1="3072" />
        </branch>
        <branch name="LD2">
            <wire x2="3248" y1="1616" y2="1616" x1="3072" />
        </branch>
        <branch name="LD1">
            <wire x2="3248" y1="1776" y2="1776" x1="3072" />
        </branch>
        <branch name="LD0">
            <wire x2="3248" y1="1856" y2="1856" x1="3072" />
        </branch>
        <branch name="LD4">
            <wire x2="3248" y1="1376" y2="1376" x1="3072" />
        </branch>
        <branch name="LD5">
            <wire x2="3248" y1="1296" y2="1296" x1="3072" />
        </branch>
        <instance x="2848" y="1568" name="XLXI_31" orien="R0" />
        <instance x="2848" y="1648" name="XLXI_32" orien="R0" />
        <instance x="2848" y="1808" name="XLXI_33" orien="R0" />
        <instance x="2848" y="1888" name="XLXI_34" orien="R0" />
        <instance x="2848" y="1408" name="XLXI_30" orien="R0" />
        <instance x="2848" y="1328" name="XLXI_29" orien="R0" />
        <iomarker fontsize="36" x="3232" y="1088" name="LD6" orien="R0" />
        <iomarker fontsize="36" x="3232" y="1008" name="LD7" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1536" name="LD3" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1616" name="LD2" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1776" name="LD1" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1856" name="LD0" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1376" name="LD4" orien="R0" />
        <iomarker fontsize="36" x="3248" y="1296" name="LD5" orien="R0" />
        <instance x="1904" y="1232" name="XLXI_298" orien="R0" />
        <instance x="1984" y="1168" name="XLXI_297" orien="R0" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="268" x="2492" y="1208" height="796" />
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(255,0,0)" x="1908" y="1372">Change it in Part 3</text>
        <instance x="400" y="976" name="XLXI_301" orien="R0" />
        <instance x="400" y="1040" name="XLXI_302" orien="R0" />
        <instance x="400" y="1104" name="XLXI_303" orien="R0" />
        <instance x="400" y="1168" name="XLXI_304" orien="R0" />
        <instance x="400" y="1232" name="XLXI_305" orien="R0" />
        <instance x="400" y="1296" name="XLXI_306" orien="R0" />
        <instance x="400" y="1360" name="XLXI_307" orien="R0" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="912" x="44" y="856" height="956" />
        <text style="fontsize:56;fontname:Arial;textcolor:rgb(255,0,0)" x="336" y="1732">To display R</text>
        <text style="fontsize:24;fontname:Arial" x="2912" y="2640">Gandhi Puvvada</text>
        <branch name="SSD_L(7)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="656" y="512" type="branch" />
            <wire x2="656" y1="512" y2="512" x1="640" />
            <wire x2="736" y1="512" y2="512" x1="656" />
        </branch>
        <instance x="400" y="1424" name="XLXI_326" orien="R0" />
        <text style="fontsize:56;fontname:Arial;textcolor:rgb(255,0,0)" x="360" y="784">To display L</text>
        <branch name="XLXN_200">
            <wire x2="320" y1="128" y2="128" x1="224" />
            <wire x2="416" y1="128" y2="128" x1="320" />
            <wire x2="320" y1="128" y2="192" x1="320" />
            <wire x2="416" y1="192" y2="192" x1="320" />
            <wire x2="224" y1="128" y2="480" x1="224" />
            <wire x2="224" y1="480" y2="640" x1="224" />
            <wire x2="272" y1="640" y2="640" x1="224" />
            <wire x2="320" y1="480" y2="480" x1="224" />
            <wire x2="320" y1="480" y2="512" x1="320" />
            <wire x2="416" y1="512" y2="512" x1="320" />
            <wire x2="272" y1="624" y2="640" x1="272" />
            <wire x2="416" y1="64" y2="64" x1="320" />
            <wire x2="320" y1="64" y2="128" x1="320" />
            <wire x2="416" y1="448" y2="448" x1="320" />
            <wire x2="320" y1="448" y2="480" x1="320" />
        </branch>
        <instance x="416" y="544" name="XLXI_325" orien="R0" />
        <instance x="128" y="1520" name="XLXI_328" orien="R0" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="440" x="1852" y="856" height="580" />
        <iomarker fontsize="28" x="2336" y="1104" name="An0" orien="R0" />
        <instance x="2912" y="704" name="XLXI_357" orien="R0" />
        <instance x="2912" y="624" name="XLXI_358" orien="R0" />
        <instance x="2912" y="544" name="XLXI_359" orien="R0" />
        <instance x="2912" y="464" name="XLXI_360" orien="R0" />
        <instance x="2912" y="384" name="XLXI_361" orien="R0" />
        <instance x="2912" y="304" name="XLXI_362" orien="R0" />
        <instance x="2912" y="224" name="XLXI_363" orien="R0" />
        <instance x="2912" y="144" name="XLXI_364" orien="R0" />
        <instance x="288" y="1568" name="XLXI_391" orien="R0" />
        <branch name="XLXN_752">
            <wire x2="400" y1="944" y2="944" x1="192" />
            <wire x2="192" y1="944" y2="1008" x1="192" />
            <wire x2="400" y1="1008" y2="1008" x1="192" />
            <wire x2="192" y1="1008" y2="1072" x1="192" />
            <wire x2="400" y1="1072" y2="1072" x1="192" />
            <wire x2="192" y1="1072" y2="1200" x1="192" />
            <wire x2="400" y1="1200" y2="1200" x1="192" />
            <wire x2="192" y1="1200" y2="1264" x1="192" />
            <wire x2="400" y1="1264" y2="1264" x1="192" />
            <wire x2="192" y1="1264" y2="1328" x1="192" />
            <wire x2="192" y1="1328" y2="1392" x1="192" />
            <wire x2="400" y1="1328" y2="1328" x1="192" />
        </branch>
        <branch name="XLXN_753">
            <wire x2="400" y1="1136" y2="1136" x1="272" />
            <wire x2="272" y1="1136" y2="1392" x1="272" />
            <wire x2="400" y1="1392" y2="1392" x1="272" />
            <wire x2="272" y1="1392" y2="1584" x1="272" />
            <wire x2="352" y1="1584" y2="1584" x1="272" />
            <wire x2="352" y1="1568" y2="1584" x1="352" />
        </branch>
        <branch name="SSD_R(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="944" type="branch" />
            <wire x2="720" y1="944" y2="944" x1="624" />
            <wire x2="752" y1="944" y2="944" x1="720" />
        </branch>
        <branch name="SSD_R(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1008" type="branch" />
            <wire x2="720" y1="1008" y2="1008" x1="624" />
            <wire x2="752" y1="1008" y2="1008" x1="720" />
        </branch>
        <branch name="SSD_R(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1072" type="branch" />
            <wire x2="720" y1="1072" y2="1072" x1="624" />
            <wire x2="752" y1="1072" y2="1072" x1="720" />
        </branch>
        <branch name="SSD_R(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1136" type="branch" />
            <wire x2="720" y1="1136" y2="1136" x1="624" />
            <wire x2="752" y1="1136" y2="1136" x1="720" />
        </branch>
        <branch name="SSD_R(4)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1200" type="branch" />
            <wire x2="720" y1="1200" y2="1200" x1="624" />
            <wire x2="752" y1="1200" y2="1200" x1="720" />
        </branch>
        <branch name="SSD_R(5)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1264" type="branch" />
            <wire x2="720" y1="1264" y2="1264" x1="624" />
            <wire x2="752" y1="1264" y2="1264" x1="720" />
        </branch>
        <branch name="SSD_R(6)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1328" type="branch" />
            <wire x2="720" y1="1328" y2="1328" x1="624" />
            <wire x2="752" y1="1328" y2="1328" x1="720" />
        </branch>
        <branch name="SSD_R(7)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1392" type="branch" />
            <wire x2="720" y1="1392" y2="1392" x1="624" />
            <wire x2="752" y1="1392" y2="1392" x1="720" />
        </branch>
        <text style="fontsize:40;fontname:Arial;textcolor:rgb(255,0,0)" x="1220" y="1360">Generate SSD_out(7:0)</text>
        <branch name="GR">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2624" y="1776" type="branch" />
            <wire x2="2624" y1="1776" y2="1776" x1="2592" />
            <wire x2="2688" y1="1776" y2="1776" x1="2624" />
            <wire x2="2848" y1="1776" y2="1776" x1="2688" />
            <wire x2="2688" y1="1776" y2="1856" x1="2688" />
            <wire x2="2848" y1="1856" y2="1856" x1="2688" />
        </branch>
        <branch name="G1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2624" y="1296" type="branch" />
            <wire x2="2624" y1="1296" y2="1296" x1="2560" />
            <wire x2="2720" y1="1296" y2="1296" x1="2624" />
            <wire x2="2848" y1="1296" y2="1296" x1="2720" />
            <wire x2="2720" y1="1296" y2="1376" x1="2720" />
            <wire x2="2848" y1="1376" y2="1376" x1="2720" />
        </branch>
        <branch name="G2">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2608" y="1536" type="branch" />
            <wire x2="2608" y1="1536" y2="1536" x1="2576" />
            <wire x2="2704" y1="1536" y2="1536" x1="2608" />
            <wire x2="2848" y1="1536" y2="1536" x1="2704" />
            <wire x2="2704" y1="1536" y2="1616" x1="2704" />
            <wire x2="2848" y1="1616" y2="1616" x1="2704" />
        </branch>
        <branch name="An0">
            <wire x2="2176" y1="960" y2="960" x1="2128" />
            <wire x2="2176" y1="960" y2="1104" x1="2176" />
            <wire x2="2336" y1="1104" y2="1104" x1="2176" />
        </branch>
        <branch name="An3">
            <wire x2="1904" y1="960" y2="1296" x1="1904" />
            <wire x2="2336" y1="1296" y2="1296" x1="1904" />
            <wire x2="1904" y1="1296" y2="1664" x1="1904" />
        </branch>
        <instance x="1904" y="992" name="XLXI_418" orien="R0" />
        <instance x="1680" y="1696" name="XLXI_419" orien="R0" />
        <branch name="DIVCLK(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1616" y="1664" type="branch" />
            <wire x2="1616" y1="1664" y2="1664" x1="1584" />
            <wire x2="1680" y1="1664" y2="1664" x1="1616" />
        </branch>
        <branch name="SSD_out(7:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2064" y="336" type="branch" />
            <wire x2="2064" y1="336" y2="336" x1="1936" />
            <wire x2="2304" y1="336" y2="336" x1="2064" />
            <wire x2="2304" y1="336" y2="352" x1="2304" />
            <wire x2="2304" y1="352" y2="432" x1="2304" />
            <wire x2="2304" y1="432" y2="512" x1="2304" />
            <wire x2="2304" y1="512" y2="592" x1="2304" />
            <wire x2="2304" y1="592" y2="672" x1="2304" />
            <wire x2="2304" y1="96" y2="112" x1="2304" />
            <wire x2="2304" y1="112" y2="192" x1="2304" />
            <wire x2="2304" y1="192" y2="272" x1="2304" />
            <wire x2="2304" y1="272" y2="336" x1="2304" />
        </branch>
        <instance x="1552" y="496" name="XLXI_420" orien="R0">
        </instance>
        <instance x="1120" y="272" name="XLXI_414" orien="R0">
        </instance>
        <branch name="SSD_L(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1040" y="112" type="branch" />
            <wire x2="1040" y1="112" y2="112" x1="1024" />
            <wire x2="1120" y1="112" y2="112" x1="1040" />
        </branch>
        <branch name="SSD_R(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1040" y="176" type="branch" />
            <wire x2="1040" y1="176" y2="176" x1="1024" />
            <wire x2="1120" y1="176" y2="176" x1="1040" />
        </branch>
        <branch name="XLXN_837(7:0)">
            <wire x2="1520" y1="112" y2="112" x1="1504" />
            <wire x2="1520" y1="112" y2="336" x1="1520" />
            <wire x2="1552" y1="336" y2="336" x1="1520" />
        </branch>
        <branch name="XLXN_841">
            <wire x2="1120" y1="240" y2="240" x1="1088" />
        </branch>
        <instance x="864" y="272" name="XLXI_415" orien="R0" />
        <branch name="LR_BAR">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="848" y="240" type="branch" />
            <wire x2="864" y1="240" y2="240" x1="848" />
        </branch>
        <branch name="XLXN_843">
            <wire x2="1552" y1="464" y2="464" x1="1520" />
        </branch>
        <instance x="1296" y="496" name="XLXI_421" orien="R0" />
        <branch name="DIVCLK(15)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1088" y="464" type="branch" />
            <wire x2="1088" y1="464" y2="464" x1="1056" />
            <wire x2="1296" y1="464" y2="464" x1="1088" />
        </branch>
        <branch name="SSD_num(7:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1408" y="400" type="branch" />
            <wire x2="1408" y1="400" y2="400" x1="1360" />
            <wire x2="1552" y1="400" y2="400" x1="1408" />
        </branch>
    </sheet>
</drawing>