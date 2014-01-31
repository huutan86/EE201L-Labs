<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="sysclk" />
        <signal name="u" />
        <signal name="z" />
        <signal name="reset" />
        <signal name="state(9)" />
        <signal name="ld1" />
        <signal name="BtnL" />
        <signal name="ld0" />
        <signal name="ClkPort" />
        <signal name="state(8)" />
        <signal name="state(10)" />
        <signal name="cg" />
        <signal name="cf" />
        <signal name="ce" />
        <signal name="cd" />
        <signal name="cc" />
        <signal name="cb" />
        <signal name="ca" />
        <signal name="XLXN_111" />
        <signal name="XLXN_107" />
        <signal name="XLXN_103" />
        <signal name="XLXN_99" />
        <signal name="XLXN_91" />
        <signal name="XLXN_87" />
        <signal name="XLXN_71" />
        <signal name="XLXN_695" />
        <signal name="ssd_output(6)" />
        <signal name="ssd_output(5)" />
        <signal name="ssd_output(4)" />
        <signal name="ssd_output(3)" />
        <signal name="ssd_output(2)" />
        <signal name="ssd_output(1)" />
        <signal name="ssd_output(0)" />
        <signal name="BtnC" />
        <signal name="ld2" />
        <signal name="XLXN_774" />
        <signal name="sw3" />
        <signal name="sw2" />
        <signal name="sw1" />
        <signal name="sw0" />
        <signal name="XLXN_780" />
        <signal name="state(0)" />
        <signal name="state(1)" />
        <signal name="state(2)" />
        <signal name="state(3)" />
        <signal name="state(4)" />
        <signal name="state(5)" />
        <signal name="state(6)" />
        <signal name="state(7)" />
        <signal name="ld3" />
        <signal name="dp" />
        <signal name="BtnR" />
        <signal name="div_clk(18)" />
        <signal name="XLXN_216" />
        <signal name="Ground" />
        <signal name="Ground,Ground,Ground,Ground,Ground,state(10:0)" />
        <signal name="state(7:4)" />
        <signal name="state(3:0)" />
        <signal name="hex(3:0)" />
        <signal name="selected_hex(3:0)" />
        <signal name="ssd_output(7:0)" />
        <signal name="ld4" />
        <signal name="hex(0)" />
        <signal name="ld5" />
        <signal name="hex(1)" />
        <signal name="ld6" />
        <signal name="hex(2)" />
        <signal name="ld7" />
        <signal name="hex(3)" />
        <signal name="Ground,state(10:8)" />
        <signal name="XLXN_224" />
        <signal name="XLXN_225" />
        <signal name="XLXN_227" />
        <signal name="XLXN_228" />
        <signal name="RamCS" />
        <signal name="MemOE" />
        <signal name="MemWR" />
        <signal name="FlashCS" />
        <signal name="QuadSpiFlashCS" />
        <signal name="div_clk(19)" />
        <signal name="ssd_output(7)" />
        <signal name="div_clk(25)" />
        <signal name="div_clk(25:0)" />
        <signal name="XLXN_198" />
        <signal name="state(10:0)" />
        <port polarity="Output" name="ld1" />
        <port polarity="Input" name="BtnL" />
        <port polarity="Output" name="ld0" />
        <port polarity="Input" name="ClkPort" />
        <port polarity="Output" name="cg" />
        <port polarity="Output" name="cf" />
        <port polarity="Output" name="ce" />
        <port polarity="Output" name="cd" />
        <port polarity="Output" name="cc" />
        <port polarity="Output" name="cb" />
        <port polarity="Output" name="ca" />
        <port polarity="Input" name="BtnC" />
        <port polarity="Output" name="ld2" />
        <port polarity="Input" name="sw3" />
        <port polarity="Input" name="sw2" />
        <port polarity="Input" name="sw1" />
        <port polarity="Input" name="sw0" />
        <port polarity="Output" name="ld3" />
        <port polarity="Output" name="dp" />
        <port polarity="Input" name="BtnR" />
        <port polarity="Output" name="ld4" />
        <port polarity="Output" name="ld5" />
        <port polarity="Output" name="ld6" />
        <port polarity="Output" name="ld7" />
        <port polarity="Output" name="RamCS" />
        <port polarity="Output" name="MemOE" />
        <port polarity="Output" name="MemWR" />
        <port polarity="Output" name="FlashCS" />
        <port polarity="Output" name="QuadSpiFlashCS" />
        <blockdef name="vcc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-64" x1="64" />
            <line x2="64" y1="0" y2="-32" x1="64" />
            <line x2="32" y1="-64" y2="-64" x1="96" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="obuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
        </blockdef>
        <blockdef name="ibuf">
            <timestamp>2009-3-20T10:10:10</timestamp>
            <line x2="64" y1="0" y2="-64" x1="64" />
            <line x2="64" y1="-32" y2="0" x1="128" />
            <line x2="128" y1="-64" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="or2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="192" ey="-96" sx="112" sy="-48" r="88" cx="116" cy="-136" />
            <arc ex="48" ey="-144" sx="48" sy="-48" r="56" cx="16" cy="-96" />
            <line x2="48" y1="-144" y2="-144" x1="112" />
            <arc ex="112" ey="-144" sx="192" sy="-96" r="88" cx="116" cy="-56" />
            <line x2="48" y1="-48" y2="-48" x1="112" />
        </blockdef>
        <blockdef name="and2">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="192" y1="-96" y2="-96" x1="256" />
            <arc ex="144" ey="-144" sx="144" sy="-48" r="48" cx="144" cy="-96" />
            <line x2="64" y1="-48" y2="-48" x1="144" />
            <line x2="144" y1="-144" y2="-144" x1="64" />
            <line x2="64" y1="-48" y2="-144" x1="64" />
        </blockdef>
        <blockdef name="d2_4e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="USC_CENG_border">
            <timestamp>2008-2-4T4:45:46</timestamp>
            <rect width="724" x="0" y="-32" height="236" />
            <line x2="724" y1="60" y2="60" x1="0" />
            <line x2="724" y1="108" y2="108" x1="0" />
            <line x2="724" y1="152" y2="152" x1="0" />
            <line x2="352" y1="152" y2="108" x1="352" />
            <line x2="368" y1="60" y2="108" x1="368" />
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
        <blockdef name="gnd">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="-96" x1="64" />
            <line x2="52" y1="-48" y2="-48" x1="76" />
            <line x2="60" y1="-32" y2="-32" x1="68" />
            <line x2="40" y1="-64" y2="-64" x1="88" />
            <line x2="64" y1="-64" y2="-80" x1="64" />
            <line x2="64" y1="-128" y2="-96" x1="64" />
        </blockdef>
        <blockdef name="mux4bit_4x1">
            <timestamp>2008-2-9T17:36:42</timestamp>
            <rect width="256" x="64" y="-384" height="384" />
            <line x2="0" y1="-352" y2="-352" x1="64" />
            <rect width="64" x="0" y="-364" height="24" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <rect width="64" x="0" y="-300" height="24" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-236" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-352" y2="-352" x1="320" />
            <rect width="64" x="320" y="-364" height="24" />
        </blockdef>
        <blockdef name="clock_divider">
            <timestamp>2008-2-10T19:1:18</timestamp>
            <rect width="256" x="64" y="-128" height="128" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-108" height="24" />
            <line x2="384" y1="-96" y2="-96" x1="320" />
        </blockdef>
        <blockdef name="ee201l_number_lock">
            <timestamp>2008-2-10T19:36:10</timestamp>
            <rect width="256" x="64" y="-256" height="256" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <line x2="384" y1="-224" y2="-224" x1="320" />
            <rect width="64" x="320" y="-236" height="24" />
        </blockdef>
        <blockdef name="bufg">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-64" y2="0" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
        </blockdef>
        <blockdef name="m16_1e">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-288" y2="-288" x1="0" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
            <line x2="96" y1="-224" y2="-224" x1="0" />
            <line x2="96" y1="-1312" y2="-1312" x1="0" />
            <line x2="96" y1="-352" y2="-352" x1="0" />
            <line x2="96" y1="-1248" y2="-1248" x1="0" />
            <line x2="96" y1="-416" y2="-416" x1="0" />
            <line x2="96" y1="-480" y2="-480" x1="0" />
            <line x2="96" y1="-1120" y2="-1120" x1="0" />
            <line x2="96" y1="-544" y2="-544" x1="0" />
            <line x2="96" y1="-608" y2="-608" x1="0" />
            <line x2="96" y1="-992" y2="-992" x1="0" />
            <line x2="96" y1="-672" y2="-672" x1="0" />
            <line x2="96" y1="-864" y2="-864" x1="0" />
            <line x2="96" y1="-800" y2="-800" x1="0" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="96" y1="-32" y2="-32" x1="232" />
            <line x2="232" y1="-344" y2="-32" x1="232" />
            <line x2="92" y1="-96" y2="-96" x1="200" />
            <line x2="200" y1="-340" y2="-96" x1="200" />
            <line x2="96" y1="-160" y2="-160" x1="172" />
            <line x2="172" y1="-336" y2="-160" x1="172" />
            <line x2="96" y1="-224" y2="-224" x1="148" />
            <line x2="148" y1="-328" y2="-224" x1="148" />
            <line x2="96" y1="-288" y2="-288" x1="120" />
            <line x2="120" y1="-324" y2="-288" x1="120" />
            <line x2="256" y1="-832" y2="-832" x1="320" />
            <line x2="96" y1="-1344" y2="-320" x1="96" />
            <line x2="96" y1="-1312" y2="-1344" x1="256" />
            <line x2="256" y1="-352" y2="-1312" x1="256" />
            <line x2="256" y1="-320" y2="-352" x1="96" />
            <line x2="96" y1="-1184" y2="-1184" x1="0" />
            <line x2="96" y1="-1056" y2="-1056" x1="0" />
            <line x2="96" y1="-928" y2="-928" x1="0" />
            <line x2="96" y1="-736" y2="-736" x1="0" />
        </blockdef>
        <block symbolname="obuf" name="XLXI_144">
            <blockpin signalname="sysclk" name="I" />
            <blockpin signalname="ld2" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_29">
            <blockpin signalname="u" name="I" />
            <blockpin signalname="ld1" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_31">
            <blockpin signalname="BtnL" name="I" />
            <blockpin signalname="u" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_30">
            <blockpin signalname="z" name="I" />
            <blockpin signalname="ld0" name="O" />
        </block>
        <block symbolname="ibuf" name="XLXI_32">
            <blockpin signalname="BtnR" name="I" />
            <blockpin signalname="z" name="O" />
        </block>
        <block symbolname="bufg" name="XLXI_142">
            <blockpin signalname="ClkPort" name="I" />
            <blockpin signalname="XLXN_198" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_58">
            <blockpin signalname="XLXN_111" name="I" />
            <blockpin signalname="cg" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_56">
            <blockpin signalname="XLXN_107" name="I" />
            <blockpin signalname="cf" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_54">
            <blockpin signalname="XLXN_103" name="I" />
            <blockpin signalname="ce" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_52">
            <blockpin signalname="XLXN_99" name="I" />
            <blockpin signalname="cd" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_48">
            <blockpin signalname="XLXN_91" name="I" />
            <blockpin signalname="cc" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_46">
            <blockpin signalname="XLXN_87" name="I" />
            <blockpin signalname="cb" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_44">
            <blockpin signalname="XLXN_71" name="I" />
            <blockpin signalname="ca" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_57">
            <blockpin signalname="ssd_output(6)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_111" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_55">
            <blockpin signalname="ssd_output(5)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_107" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_53">
            <blockpin signalname="ssd_output(4)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_103" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_51">
            <blockpin signalname="ssd_output(3)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_99" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_47">
            <blockpin signalname="ssd_output(2)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_91" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_45">
            <blockpin signalname="ssd_output(1)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_87" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_36">
            <blockpin signalname="ssd_output(0)" name="I0" />
            <blockpin signalname="XLXN_695" name="I1" />
            <blockpin signalname="XLXN_71" name="O" />
        </block>
        <block symbolname="USC_CENG_border" name="XLXI_348" />
        <block symbolname="USC_CENG_border" name="XLXI_349" />
        <block symbolname="USC_CENG_border" name="XLXI_350" />
        <block symbolname="m16_1e" name="XLXI_367">
            <blockpin signalname="state(0)" name="D0" />
            <blockpin signalname="state(1)" name="D1" />
            <blockpin signalname="state(10)" name="D10" />
            <blockpin signalname="XLXN_780" name="D11" />
            <blockpin signalname="XLXN_780" name="D12" />
            <blockpin signalname="XLXN_780" name="D13" />
            <blockpin signalname="XLXN_780" name="D14" />
            <blockpin signalname="XLXN_780" name="D15" />
            <blockpin signalname="state(2)" name="D2" />
            <blockpin signalname="state(3)" name="D3" />
            <blockpin signalname="state(4)" name="D4" />
            <blockpin signalname="state(5)" name="D5" />
            <blockpin signalname="state(6)" name="D6" />
            <blockpin signalname="state(7)" name="D7" />
            <blockpin signalname="state(8)" name="D8" />
            <blockpin signalname="state(9)" name="D9" />
            <blockpin signalname="XLXN_774" name="E" />
            <blockpin signalname="sw0" name="S0" />
            <blockpin signalname="sw1" name="S1" />
            <blockpin signalname="sw2" name="S2" />
            <blockpin signalname="sw3" name="S3" />
            <blockpin signalname="ld3" name="O" />
        </block>
        <block symbolname="vcc" name="XLXI_370">
            <blockpin signalname="XLXN_774" name="P" />
        </block>
        <block symbolname="gnd" name="XLXI_371">
            <blockpin signalname="XLXN_780" name="G" />
        </block>
        <block symbolname="obuf" name="XLXI_377">
            <blockpin signalname="ssd_output(7)" name="I" />
            <blockpin signalname="dp" name="O" />
        </block>
        <block symbolname="gnd" name="XLXI_153">
            <blockpin signalname="XLXN_216" name="G" />
        </block>
        <block symbolname="buf" name="XLXI_154">
            <blockpin signalname="XLXN_216" name="I" />
            <blockpin signalname="Ground" name="O" />
        </block>
        <block symbolname="onehot_to_hex_16bit" name="XLXI_109">
            <blockpin signalname="hex(3:0)" name="hex(3:0)" />
            <blockpin signalname="Ground,Ground,Ground,Ground,Ground,state(10:0)" name="one_hot(15:0)" />
        </block>
        <block symbolname="mux4bit_4x1" name="XLXI_131">
            <blockpin signalname="Ground,state(10:8)" name="A(3:0)" />
            <blockpin signalname="state(7:4)" name="B(3:0)" />
            <blockpin signalname="state(3:0)" name="C(3:0)" />
            <blockpin signalname="hex(3:0)" name="D(3:0)" />
            <blockpin signalname="div_clk(18)" name="S0" />
            <blockpin signalname="div_clk(19)" name="S1" />
            <blockpin signalname="selected_hex(3:0)" name="O(3:0)" />
        </block>
        <block symbolname="hex_to_ssd" name="XLXI_108">
            <blockpin signalname="ssd_output(7:0)" name="ssd(7:0)" />
            <blockpin signalname="selected_hex(3:0)" name="hex(3:0)" />
        </block>
        <block symbolname="obuf" name="XLXI_145">
            <blockpin signalname="hex(0)" name="I" />
            <blockpin signalname="ld4" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_352">
            <blockpin signalname="hex(1)" name="I" />
            <blockpin signalname="ld5" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_353">
            <blockpin signalname="hex(2)" name="I" />
            <blockpin signalname="ld6" name="O" />
        </block>
        <block symbolname="obuf" name="XLXI_354">
            <blockpin signalname="hex(3)" name="I" />
            <blockpin signalname="ld7" name="O" />
        </block>
        <block symbolname="d2_4e" name="XLXI_75">
            <blockpin signalname="div_clk(18)" name="A0" />
            <blockpin signalname="div_clk(19)" name="A1" />
            <blockpin name="E" />
            <blockpin signalname="XLXN_224" name="D0" />
            <blockpin signalname="XLXN_225" name="D1" />
            <blockpin signalname="XLXN_227" name="D2" />
            <blockpin signalname="XLXN_228" name="D3" />
        </block>
        <block symbolname="and2" name="XLXI_59">
            <blockpin signalname="sysclk" name="I0" />
            <blockpin signalname="state(9)" name="I1" />
            <blockpin signalname="XLXN_695" name="O" />
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
        <block symbolname="vcc" name="XLXI_382">
            <blockpin signalname="QuadSpiFlashCS" name="P" />
        </block>
        <block symbolname="ibuf" name="XLXI_389">
            <blockpin signalname="BtnC" name="I" />
            <blockpin signalname="reset" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_7">
            <blockpin signalname="div_clk(25)" name="I" />
            <blockpin signalname="sysclk" name="O" />
        </block>
        <block symbolname="clock_divider" name="XLXI_139">
            <blockpin signalname="XLXN_198" name="clk" />
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="div_clk(25:0)" name="div_clk(25:0)" />
        </block>
        <block symbolname="ee201l_number_lock" name="XLXI_141">
            <blockpin signalname="reset" name="reset" />
            <blockpin signalname="sysclk" name="sysclk" />
            <blockpin signalname="u" name="u" />
            <blockpin signalname="z" name="z" />
            <blockpin signalname="state(10:0)" name="state(10:0)" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="736" y="912" name="XLXI_29" orien="R0" />
        <instance x="304" y="912" name="XLXI_31" orien="R0" />
        <branch name="ld1">
            <wire x2="1088" y1="880" y2="880" x1="960" />
        </branch>
        <branch name="BtnL">
            <wire x2="304" y1="880" y2="880" x1="160" />
        </branch>
        <instance x="736" y="1168" name="XLXI_30" orien="R0" />
        <instance x="304" y="1168" name="XLXI_32" orien="R0" />
        <branch name="ld0">
            <wire x2="1088" y1="1136" y2="1136" x1="960" />
        </branch>
        <iomarker fontsize="28" x="160" y="880" name="BtnL" orien="R180" />
        <iomarker fontsize="28" x="1088" y="880" name="ld1" orien="R0" />
        <iomarker fontsize="28" x="1088" y="1136" name="ld0" orien="R0" />
        <branch name="ClkPort">
            <wire x2="368" y1="1424" y2="1424" x1="304" />
        </branch>
        <instance x="368" y="1456" name="XLXI_142" orien="R0" />
        <iomarker fontsize="28" x="304" y="1424" name="ClkPort" orien="R180" />
        <instance x="1984" y="1552" name="XLXI_350" orien="R0" />
        <text style="fontsize:20;fontname:Arial" x="2124" y="1680">Gandhi Puvvada</text>
        <text style="fontsize:20;fontname:Arial" x="2124" y="1632">Number Lock Top</text>
        <text style="fontsize:20;fontname:Arial" x="2428" y="1632">1/3</text>
        <branch name="u">
            <wire x2="736" y1="880" y2="880" x1="528" />
        </branch>
        <branch name="z">
            <wire x2="736" y1="1136" y2="1136" x1="528" />
        </branch>
        <branch name="BtnC">
            <wire x2="320" y1="1488" y2="1488" x1="224" />
        </branch>
        <iomarker fontsize="28" x="224" y="1488" name="BtnC" orien="R180" />
        <instance x="736" y="752" name="XLXI_144" orien="R0" />
        <branch name="ld2">
            <wire x2="1056" y1="720" y2="720" x1="960" />
        </branch>
        <iomarker fontsize="28" x="1056" y="720" name="ld2" orien="R0" />
        <instance x="1792" y="1472" name="XLXI_367" orien="R0" />
        <instance x="1776" y="1568" name="XLXI_370" orien="R0" />
        <branch name="XLXN_774">
            <wire x2="1792" y1="1440" y2="1584" x1="1792" />
            <wire x2="1840" y1="1584" y2="1584" x1="1792" />
            <wire x2="1840" y1="1568" y2="1584" x1="1840" />
        </branch>
        <branch name="sw3">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="1744" y="1376" type="branch" />
            <wire x2="1744" y1="1376" y2="1376" x1="1712" />
            <wire x2="1792" y1="1376" y2="1376" x1="1744" />
        </branch>
        <branch name="sw2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="1744" y="1312" type="branch" />
            <wire x2="1744" y1="1312" y2="1312" x1="1712" />
            <wire x2="1792" y1="1312" y2="1312" x1="1744" />
        </branch>
        <branch name="sw1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="1744" y="1248" type="branch" />
            <wire x2="1744" y1="1248" y2="1248" x1="1712" />
            <wire x2="1792" y1="1248" y2="1248" x1="1744" />
        </branch>
        <branch name="sw0">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="1744" y="1184" type="branch" />
            <wire x2="1744" y1="1184" y2="1184" x1="1712" />
            <wire x2="1792" y1="1184" y2="1184" x1="1744" />
        </branch>
        <branch name="XLXN_780">
            <wire x2="1776" y1="880" y2="880" x1="1728" />
            <wire x2="1776" y1="880" y2="928" x1="1776" />
            <wire x2="1792" y1="928" y2="928" x1="1776" />
            <wire x2="1776" y1="928" y2="992" x1="1776" />
            <wire x2="1792" y1="992" y2="992" x1="1776" />
            <wire x2="1776" y1="992" y2="1056" x1="1776" />
            <wire x2="1776" y1="1056" y2="1120" x1="1776" />
            <wire x2="1792" y1="1120" y2="1120" x1="1776" />
            <wire x2="1792" y1="1056" y2="1056" x1="1776" />
            <wire x2="1728" y1="880" y2="912" x1="1728" />
            <wire x2="1792" y1="864" y2="864" x1="1776" />
            <wire x2="1776" y1="864" y2="880" x1="1776" />
        </branch>
        <instance x="1664" y="1040" name="XLXI_371" orien="R0" />
        <branch name="state(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="160" type="branch" />
            <wire x2="1792" y1="160" y2="160" x1="1728" />
        </branch>
        <branch name="state(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="224" type="branch" />
            <wire x2="1792" y1="224" y2="224" x1="1728" />
        </branch>
        <branch name="state(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="288" type="branch" />
            <wire x2="1792" y1="288" y2="288" x1="1728" />
        </branch>
        <branch name="state(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="352" type="branch" />
            <wire x2="1792" y1="352" y2="352" x1="1728" />
        </branch>
        <branch name="state(4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="416" type="branch" />
            <wire x2="1792" y1="416" y2="416" x1="1728" />
        </branch>
        <branch name="state(5)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="480" type="branch" />
            <wire x2="1792" y1="480" y2="480" x1="1728" />
        </branch>
        <branch name="state(6)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="544" type="branch" />
            <wire x2="1792" y1="544" y2="544" x1="1728" />
        </branch>
        <branch name="state(7)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="608" type="branch" />
            <wire x2="1792" y1="608" y2="608" x1="1728" />
        </branch>
        <branch name="state(8)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="672" type="branch" />
            <wire x2="1792" y1="672" y2="672" x1="1728" />
        </branch>
        <branch name="state(9)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="736" type="branch" />
            <wire x2="1792" y1="736" y2="736" x1="1728" />
        </branch>
        <branch name="state(10)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="1728" y="800" type="branch" />
            <wire x2="1792" y1="800" y2="800" x1="1728" />
        </branch>
        <branch name="ld3">
            <wire x2="2128" y1="640" y2="640" x1="2112" />
        </branch>
        <iomarker fontsize="28" x="1712" y="1184" name="sw0" orien="R180" />
        <iomarker fontsize="28" x="1712" y="1248" name="sw1" orien="R180" />
        <iomarker fontsize="28" x="1712" y="1312" name="sw2" orien="R180" />
        <iomarker fontsize="28" x="1712" y="1376" name="sw3" orien="R180" />
        <branch name="BtnR">
            <wire x2="304" y1="1136" y2="1136" x1="160" />
        </branch>
        <iomarker fontsize="28" x="160" y="1136" name="BtnR" orien="R180" />
        <iomarker fontsize="28" x="2128" y="640" name="ld3" orien="R0" />
        <instance x="208" y="336" name="XLXI_7" orien="R0" />
        <branch name="div_clk(25)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="130" y="304" type="branch" />
            <wire x2="130" y1="304" y2="304" x1="80" />
            <wire x2="208" y1="304" y2="304" x1="130" />
        </branch>
        <text style="fontsize:48;fontname:Arial" x="536" y="828">U (UNO)</text>
        <text style="fontsize:48;fontname:Arial" x="496" y="1092">Z (ZERO)</text>
        <instance x="320" y="1520" name="XLXI_389" orien="R0" />
        <instance x="736" y="1520" name="XLXI_139" orien="R0">
        </instance>
        <branch name="div_clk(25:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="1200" y="1424" type="branch" />
            <wire x2="1200" y1="1424" y2="1424" x1="1120" />
            <wire x2="1248" y1="1424" y2="1424" x1="1200" />
        </branch>
        <branch name="XLXN_198">
            <wire x2="736" y1="1424" y2="1424" x1="592" />
        </branch>
        <branch name="reset">
            <wire x2="736" y1="1488" y2="1488" x1="544" />
        </branch>
        <instance x="640" y="464" name="XLXI_141" orien="R0">
        </instance>
        <branch name="reset">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="554" y="240" type="branch" />
            <wire x2="554" y1="240" y2="240" x1="496" />
            <wire x2="640" y1="240" y2="240" x1="554" />
        </branch>
        <branch name="u">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="552" y="368" type="branch" />
            <wire x2="552" y1="368" y2="368" x1="496" />
            <wire x2="640" y1="368" y2="368" x1="552" />
        </branch>
        <branch name="state(10:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1104" y="240" type="branch" />
            <wire x2="1104" y1="240" y2="240" x1="1024" />
            <wire x2="1216" y1="240" y2="240" x1="1104" />
        </branch>
        <branch name="z">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="544" y="432" type="branch" />
            <wire x2="544" y1="432" y2="432" x1="496" />
            <wire x2="640" y1="432" y2="432" x1="544" />
        </branch>
        <branch name="sysclk">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="491" y="304" type="branch" />
            <wire x2="491" y1="304" y2="304" x1="432" />
            <wire x2="640" y1="304" y2="304" x1="491" />
        </branch>
        <branch name="sysclk">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="544" y="720" type="branch" />
            <wire x2="544" y1="720" y2="720" x1="432" />
            <wire x2="736" y1="720" y2="720" x1="544" />
        </branch>
    </sheet>
    <sheet sheetnum="2" width="2720" height="1760">
        <instance x="1984" y="1552" name="XLXI_349" orien="R0" />
        <text style="fontsize:20;fontname:Arial" x="2124" y="1680">Gandhi Puvvada</text>
        <instance x="48" y="1056" name="XLXI_153" orien="R0" />
        <branch name="XLXN_216">
            <wire x2="112" y1="912" y2="928" x1="112" />
            <wire x2="224" y1="912" y2="912" x1="112" />
        </branch>
        <instance x="224" y="944" name="XLXI_154" orien="R0" />
        <branch name="Ground">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="480" y="912" type="branch" />
            <wire x2="480" y1="912" y2="912" x1="448" />
            <wire x2="560" y1="912" y2="912" x1="480" />
        </branch>
        <instance x="240" y="800" name="XLXI_109" orien="R0">
        </instance>
        <branch name="Ground,Ground,Ground,Ground,Ground,state(10:0)">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:24;fontname:Arial" attrname="Name" x="96" y="336" type="branch" />
            <wire x2="96" y1="272" y2="336" x1="96" />
            <wire x2="96" y1="336" y2="720" x1="96" />
            <wire x2="240" y1="720" y2="720" x1="96" />
        </branch>
        <instance x="1040" y="928" name="XLXI_131" orien="R0">
        </instance>
        <branch name="state(7:4)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="848" y="640" type="branch" />
            <wire x2="848" y1="640" y2="640" x1="816" />
            <wire x2="1040" y1="640" y2="640" x1="848" />
        </branch>
        <branch name="state(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="848" y="704" type="branch" />
            <wire x2="848" y1="704" y2="704" x1="816" />
            <wire x2="1040" y1="704" y2="704" x1="848" />
        </branch>
        <branch name="hex(3:0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="880" y="768" type="branch" />
            <wire x2="704" y1="768" y2="768" x1="624" />
            <wire x2="880" y1="768" y2="768" x1="704" />
            <wire x2="1040" y1="768" y2="768" x1="880" />
            <wire x2="704" y1="768" y2="1104" x1="704" />
            <wire x2="1840" y1="1104" y2="1104" x1="704" />
            <wire x2="1840" y1="752" y2="848" x1="1840" />
            <wire x2="1840" y1="848" y2="944" x1="1840" />
            <wire x2="1840" y1="944" y2="1056" x1="1840" />
            <wire x2="1840" y1="1056" y2="1104" x1="1840" />
        </branch>
        <branch name="div_clk(19)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="944" y="896" type="branch" />
            <wire x2="944" y1="896" y2="896" x1="928" />
            <wire x2="1040" y1="896" y2="896" x1="944" />
        </branch>
        <branch name="div_clk(18)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="944" y="832" type="branch" />
            <wire x2="944" y1="832" y2="832" x1="928" />
            <wire x2="1040" y1="832" y2="832" x1="944" />
        </branch>
        <branch name="selected_hex(3:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:24;fontname:Arial" attrname="Name" x="1692" y="576" type="branch" />
            <wire x2="1984" y1="576" y2="576" x1="1424" />
        </branch>
        <branch name="ssd_output(7:0)">
            <attrtext style="alignment:SOFT-LEFT;fontsize:24;fontname:Arial" attrname="Name" x="2384" y="444" type="branch" />
            <wire x2="2384" y1="608" y2="608" x1="2368" />
            <wire x2="2384" y1="304" y2="608" x1="2384" />
        </branch>
        <instance x="1984" y="640" name="XLXI_108" orien="R0">
        </instance>
        <branch name="ld4">
            <wire x2="2464" y1="752" y2="752" x1="2368" />
        </branch>
        <branch name="hex(0)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="2096" y="752" type="branch" />
            <wire x2="2096" y1="752" y2="752" x1="1936" />
            <wire x2="2144" y1="752" y2="752" x1="2096" />
        </branch>
        <instance x="2144" y="784" name="XLXI_145" orien="R0" />
        <branch name="ld5">
            <wire x2="2464" y1="848" y2="848" x1="2368" />
        </branch>
        <branch name="hex(1)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="2096" y="848" type="branch" />
            <wire x2="2096" y1="848" y2="848" x1="1936" />
            <wire x2="2144" y1="848" y2="848" x1="2096" />
        </branch>
        <instance x="2144" y="880" name="XLXI_352" orien="R0" />
        <branch name="ld6">
            <wire x2="2464" y1="944" y2="944" x1="2368" />
        </branch>
        <branch name="hex(2)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="2096" y="944" type="branch" />
            <wire x2="2096" y1="944" y2="944" x1="1936" />
            <wire x2="2144" y1="944" y2="944" x1="2096" />
        </branch>
        <instance x="2144" y="976" name="XLXI_353" orien="R0" />
        <branch name="ld7">
            <wire x2="2464" y1="1056" y2="1056" x1="2368" />
        </branch>
        <branch name="hex(3)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="2096" y="1056" type="branch" />
            <wire x2="2096" y1="1056" y2="1056" x1="1936" />
            <wire x2="2144" y1="1056" y2="1056" x1="2096" />
        </branch>
        <instance x="2144" y="1088" name="XLXI_354" orien="R0" />
        <bustap x2="1936" y1="752" y2="752" x1="1840" />
        <bustap x2="1936" y1="848" y2="848" x1="1840" />
        <bustap x2="1936" y1="944" y2="944" x1="1840" />
        <bustap x2="1936" y1="1056" y2="1056" x1="1840" />
        <branch name="Ground,state(10:8)">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:24;fontname:Arial" attrname="Name" x="896" y="576" type="branch" />
            <wire x2="896" y1="576" y2="576" x1="816" />
            <wire x2="1040" y1="576" y2="576" x1="896" />
        </branch>
        <iomarker fontsize="28" x="2464" y="752" name="ld4" orien="R0" />
        <iomarker fontsize="28" x="2464" y="848" name="ld5" orien="R0" />
        <iomarker fontsize="28" x="2464" y="944" name="ld6" orien="R0" />
        <iomarker fontsize="28" x="2464" y="1056" name="ld7" orien="R0" />
        <text style="fontsize:20;fontname:Arial" x="2120" y="1636">Number Lock Top</text>
        <text style="fontsize:20;fontname:Arial" x="2440" y="1636">2/3</text>
        <branch name="div_clk(18)">
            <wire x2="352" y1="1376" y2="1376" x1="304" />
        </branch>
        <branch name="div_clk(19)">
            <wire x2="352" y1="1440" y2="1440" x1="304" />
        </branch>
        <instance x="352" y="1696" name="XLXI_75" orien="R0" />
        <branch name="XLXN_224">
            <wire x2="800" y1="1376" y2="1376" x1="736" />
        </branch>
        <branch name="XLXN_225">
            <wire x2="800" y1="1440" y2="1440" x1="736" />
        </branch>
        <branch name="XLXN_227">
            <wire x2="800" y1="1504" y2="1504" x1="736" />
        </branch>
        <branch name="XLXN_228">
            <wire x2="800" y1="1568" y2="1568" x1="736" />
        </branch>
        <rect style="linewidth:W;linecolor:rgb(255,0,0)" width="1716" x="44" y="1176" height="552" />
    </sheet>
    <sheet sheetnum="3" width="2720" height="1760">
        <branch name="cg">
            <wire x2="1760" y1="1376" y2="1376" x1="1712" />
        </branch>
        <branch name="cf">
            <wire x2="1760" y1="1232" y2="1232" x1="1712" />
        </branch>
        <branch name="ce">
            <wire x2="1760" y1="1088" y2="1088" x1="1712" />
        </branch>
        <branch name="cd">
            <wire x2="1760" y1="944" y2="944" x1="1712" />
        </branch>
        <branch name="cc">
            <wire x2="1760" y1="800" y2="800" x1="1712" />
        </branch>
        <branch name="cb">
            <wire x2="1760" y1="656" y2="656" x1="1712" />
        </branch>
        <branch name="ca">
            <wire x2="1760" y1="512" y2="512" x1="1712" />
        </branch>
        <branch name="XLXN_111">
            <wire x2="1488" y1="1376" y2="1376" x1="1472" />
        </branch>
        <branch name="XLXN_107">
            <wire x2="1488" y1="1232" y2="1232" x1="1472" />
        </branch>
        <branch name="XLXN_103">
            <wire x2="1488" y1="1088" y2="1088" x1="1472" />
        </branch>
        <branch name="XLXN_99">
            <wire x2="1488" y1="944" y2="944" x1="1472" />
        </branch>
        <branch name="XLXN_91">
            <wire x2="1488" y1="800" y2="800" x1="1472" />
        </branch>
        <branch name="XLXN_87">
            <wire x2="1488" y1="656" y2="656" x1="1472" />
        </branch>
        <branch name="XLXN_71">
            <wire x2="1488" y1="512" y2="512" x1="1472" />
        </branch>
        <instance x="1488" y="1408" name="XLXI_58" orien="R0" />
        <instance x="1488" y="1264" name="XLXI_56" orien="R0" />
        <instance x="1488" y="1120" name="XLXI_54" orien="R0" />
        <instance x="1488" y="976" name="XLXI_52" orien="R0" />
        <instance x="1488" y="832" name="XLXI_48" orien="R0" />
        <instance x="1488" y="688" name="XLXI_46" orien="R0" />
        <instance x="1488" y="544" name="XLXI_44" orien="R0" />
        <instance x="1216" y="1472" name="XLXI_57" orien="R0" />
        <instance x="1216" y="1328" name="XLXI_55" orien="R0" />
        <instance x="1216" y="1184" name="XLXI_53" orien="R0" />
        <instance x="1216" y="1040" name="XLXI_51" orien="R0" />
        <instance x="1216" y="896" name="XLXI_47" orien="R0" />
        <instance x="1216" y="752" name="XLXI_45" orien="R0" />
        <instance x="1216" y="608" name="XLXI_36" orien="R0" />
        <iomarker fontsize="28" x="1760" y="1376" name="cg" orien="R0" />
        <iomarker fontsize="28" x="1760" y="1232" name="cf" orien="R0" />
        <iomarker fontsize="28" x="1760" y="1088" name="ce" orien="R0" />
        <iomarker fontsize="28" x="1760" y="944" name="cd" orien="R0" />
        <iomarker fontsize="28" x="1760" y="800" name="cc" orien="R0" />
        <iomarker fontsize="28" x="1760" y="656" name="cb" orien="R0" />
        <iomarker fontsize="28" x="1760" y="512" name="ca" orien="R0" />
        <branch name="ssd_output(5)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="1264" type="branch" />
            <wire x2="1216" y1="1264" y2="1264" x1="880" />
        </branch>
        <branch name="ssd_output(3)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="976" type="branch" />
            <wire x2="1216" y1="976" y2="976" x1="880" />
        </branch>
        <branch name="ssd_output(1)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="688" type="branch" />
            <wire x2="1216" y1="688" y2="688" x1="880" />
        </branch>
        <branch name="ssd_output(0)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="544" type="branch" />
            <wire x2="1216" y1="544" y2="544" x1="880" />
        </branch>
        <instance x="1984" y="1536" name="XLXI_348" orien="R0" />
        <text style="fontsize:20;fontname:Arial" x="2124" y="1664">Gandhi Puvvada</text>
        <text style="fontsize:20;fontname:Arial" x="2124" y="1616">Number Lock Top</text>
        <text style="fontsize:20;fontname:Arial" x="2428" y="1616">3/3</text>
        <text style="fontsize:32;fontname:Arial" x="1948" y="528">To disable the two memories</text>
        <instance x="1504" y="1632" name="XLXI_377" orien="R0" />
        <branch name="dp">
            <wire x2="1760" y1="1600" y2="1600" x1="1728" />
        </branch>
        <iomarker fontsize="28" x="1760" y="1600" name="dp" orien="R0" />
        <branch name="ssd_output(2)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="832" type="branch" />
            <wire x2="1216" y1="832" y2="832" x1="880" />
        </branch>
        <branch name="ssd_output(4)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="1120" type="branch" />
            <wire x2="1216" y1="1120" y2="1120" x1="880" />
        </branch>
        <branch name="ssd_output(6)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="880" y="1408" type="branch" />
            <wire x2="1216" y1="1408" y2="1408" x1="880" />
        </branch>
        <branch name="XLXN_695">
            <wire x2="1008" y1="272" y2="480" x1="1008" />
            <wire x2="1216" y1="480" y2="480" x1="1008" />
            <wire x2="1008" y1="480" y2="624" x1="1008" />
            <wire x2="1216" y1="624" y2="624" x1="1008" />
            <wire x2="1008" y1="624" y2="768" x1="1008" />
            <wire x2="1008" y1="768" y2="912" x1="1008" />
            <wire x2="1008" y1="912" y2="1056" x1="1008" />
            <wire x2="1008" y1="1056" y2="1200" x1="1008" />
            <wire x2="1008" y1="1200" y2="1344" x1="1008" />
            <wire x2="1216" y1="1344" y2="1344" x1="1008" />
            <wire x2="1216" y1="1200" y2="1200" x1="1008" />
            <wire x2="1216" y1="1056" y2="1056" x1="1008" />
            <wire x2="1216" y1="912" y2="912" x1="1008" />
            <wire x2="1216" y1="768" y2="768" x1="1008" />
        </branch>
        <branch name="state(9)">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="704" y="240" type="branch" />
            <wire x2="752" y1="240" y2="240" x1="704" />
        </branch>
        <branch name="sysclk">
            <attrtext style="alignment:SOFT-RIGHT;fontsize:24;fontname:Arial" attrname="Name" x="704" y="304" type="branch" />
            <wire x2="752" y1="304" y2="304" x1="704" />
        </branch>
        <instance x="752" y="368" name="XLXI_59" orien="R0" />
        <branch name="RamCS">
            <wire x2="2384" y1="176" y2="176" x1="2240" />
        </branch>
        <instance x="2176" y="176" name="XLXI_9" orien="R0" />
        <branch name="MemOE">
            <wire x2="2384" y1="304" y2="304" x1="2240" />
        </branch>
        <instance x="2176" y="304" name="XLXI_10" orien="R0" />
        <branch name="MemWR">
            <wire x2="2384" y1="448" y2="448" x1="2240" />
        </branch>
        <instance x="2176" y="448" name="XLXI_13" orien="R0" />
        <branch name="FlashCS">
            <wire x2="1952" y1="176" y2="176" x1="1808" />
        </branch>
        <instance x="1744" y="176" name="XLXI_273" orien="R0" />
        <branch name="QuadSpiFlashCS">
            <wire x2="1952" y1="304" y2="304" x1="1808" />
        </branch>
        <instance x="1744" y="304" name="XLXI_382" orien="R0" />
        <iomarker fontsize="28" x="2384" y="176" name="RamCS" orien="R0" />
        <iomarker fontsize="28" x="2384" y="304" name="MemOE" orien="R0" />
        <iomarker fontsize="28" x="2384" y="448" name="MemWR" orien="R0" />
        <iomarker fontsize="28" x="1952" y="176" name="FlashCS" orien="R0" />
        <iomarker fontsize="28" x="1952" y="304" name="QuadSpiFlashCS" orien="R0" />
        <branch name="ssd_output(7)">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="832" y="1600" type="branch" />
            <wire x2="1504" y1="1600" y2="1600" x1="832" />
        </branch>
    </sheet>
</drawing>