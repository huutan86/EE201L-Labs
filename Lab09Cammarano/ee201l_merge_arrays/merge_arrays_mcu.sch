<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="CLK" />
        <signal name="I(1:0)" />
        <signal name="J(1:0)" />
        <signal name="K(2:0)" />
        <signal name="XLXN_149(3:0)" />
        <signal name="array_Q_DOUT(3:0)" />
        <signal name="array_P_DOUT(3:0)" />
        <signal name="array_R_DOUT(3:0)" />
        <signal name="R_DATA(0)" />
        <signal name="array_R_DOUT(1)" />
        <signal name="R_DATA(1)" />
        <signal name="array_R_DOUT(2)" />
        <signal name="R_DATA(2)" />
        <signal name="array_R_DOUT(3)" />
        <signal name="R_DATA(3)" />
        <signal name="P_LT_Q" />
        <signal name="array_R_DOUT(0)" />
        <signal name="array_P_DOUT(0)" />
        <signal name="array_P_DOUT(1)" />
        <signal name="array_P_DOUT(2)" />
        <signal name="array_P_DOUT(3)" />
        <signal name="array_Q_DOUT(0)" />
        <signal name="array_Q_DOUT(1)" />
        <signal name="array_Q_DOUT(2)" />
        <signal name="array_Q_DOUT(3)" />
        <signal name="R_ADDR(0)" />
        <signal name="read_ADDR(0)" />
        <signal name="R_ADDR(1)" />
        <signal name="read_ADDR(1)" />
        <signal name="R_ADDR(2)" />
        <signal name="read_ADDR(2)" />
        <signal name="I(1)" />
        <signal name="I(0)" />
        <signal name="ACK" />
        <signal name="RESET" />
        <signal name="SYS_CLK" />
        <signal name="START" />
        <signal name="J(1)" />
        <signal name="J(0)" />
        <signal name="R_DATA(3:0)" />
        <signal name="R_ADDR(2:0)" />
        <signal name="K(0)" />
        <signal name="K(1)" />
        <signal name="K(2)" />
        <signal name="DONE" />
        <signal name="read_ADDR(2:0)" />
        <signal name="XLXN_798" />
        <signal name="XLXN_799" />
        <signal name="XLXN_800" />
        <signal name="XLXN_801" />
        <signal name="XLXN_802" />
        <signal name="XLXN_803" />
        <signal name="XLXN_804" />
        <port polarity="Input" name="ACK" />
        <port polarity="Input" name="RESET" />
        <port polarity="Input" name="SYS_CLK" />
        <port polarity="Input" name="START" />
        <port polarity="Output" name="R_DATA(3:0)" />
        <port polarity="Input" name="R_ADDR(2:0)" />
        <port polarity="Output" name="DONE" />
        <blockdef name="mux_2_to_1">
            <timestamp>2008-3-28T5:22:10</timestamp>
            <line x2="0" y1="32" y2="32" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-172" height="24" />
            <line x2="384" y1="-160" y2="-160" x1="320" />
            <rect width="256" x="64" y="-192" height="256" />
        </blockdef>
        <blockdef name="array_P_ROM">
            <timestamp>2008-3-27T8:52:54</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="array_Q_ROM">
            <timestamp>2008-3-27T8:54:26</timestamp>
            <rect width="256" x="64" y="-64" height="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="320" y="-44" height="24" />
            <line x2="384" y1="-32" y2="-32" x1="320" />
        </blockdef>
        <blockdef name="array_R_RAM">
            <timestamp>2008-3-28T4:36:28</timestamp>
            <rect width="288" x="64" y="-320" height="320" />
            <line x2="0" y1="-288" y2="-288" x1="64" />
            <line x2="0" y1="-224" y2="-224" x1="64" />
            <rect width="64" x="0" y="-172" height="24" />
            <line x2="0" y1="-160" y2="-160" x1="64" />
            <rect width="64" x="0" y="-108" height="24" />
            <line x2="0" y1="-96" y2="-96" x1="64" />
            <rect width="64" x="0" y="-44" height="24" />
            <line x2="0" y1="-32" y2="-32" x1="64" />
            <rect width="64" x="352" y="-300" height="24" />
            <line x2="416" y1="-288" y2="-288" x1="352" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
        </blockdef>
        <blockdef name="compm4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-320" y2="-320" x1="0" />
            <line x2="64" y1="-512" y2="-512" x1="0" />
            <line x2="64" y1="-576" y2="-576" x1="0" />
            <line x2="64" y1="-448" y2="-448" x1="0" />
            <line x2="64" y1="-384" y2="-384" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <rect width="256" x="64" y="-640" height="576" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
        </blockdef>
        <blockdef name="cb2ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-384" height="320" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
        </blockdef>
        <blockdef name="cb4ce">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <rect width="256" x="64" y="-512" height="448" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="320" y1="-320" y2="-320" x1="384" />
            <line x2="320" y1="-384" y2="-384" x1="384" />
            <line x2="320" y1="-448" y2="-448" x1="384" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="320" y1="-128" y2="-128" x1="384" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="320" y1="-192" y2="-192" x1="384" />
        </blockdef>
        <block symbolname="array_P_ROM" name="array_P">
            <blockpin signalname="I(1:0)" name="I(1:0)" />
            <blockpin signalname="array_P_DOUT(3:0)" name="DOUT(3:0)" />
        </block>
        <block symbolname="array_Q_ROM" name="array_Q">
            <blockpin signalname="J(1:0)" name="J(1:0)" />
            <blockpin signalname="array_Q_DOUT(3:0)" name="DOUT(3:0)" />
        </block>
        <block symbolname="mux_2_to_1" name="mux_sel_P_Q">
            <blockpin signalname="array_P_DOUT(3:0)" name="input_A(3:0)" />
            <blockpin signalname="array_Q_DOUT(3:0)" name="input_B(3:0)" />
            <blockpin signalname="XLXN_149(3:0)" name="Output(3:0)" />
            <blockpin signalname="XLXN_798" name="S" />
        </block>
        <block symbolname="array_R_RAM" name="array_R">
            <blockpin signalname="CLK" name="clk" />
            <blockpin name="write_EN" />
            <blockpin signalname="XLXN_149(3:0)" name="input_data(3:0)" />
            <blockpin signalname="read_ADDR(2:0)" name="read_addr(2:0)" />
            <blockpin signalname="K(2:0)" name="write_addr(2:0)" />
            <blockpin signalname="array_R_DOUT(3:0)" name="Output(3:0)" />
        </block>
        <block symbolname="buf" name="XLXI_294">
            <blockpin signalname="array_R_DOUT(0)" name="I" />
            <blockpin signalname="R_DATA(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_295">
            <blockpin signalname="array_R_DOUT(1)" name="I" />
            <blockpin signalname="R_DATA(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_296">
            <blockpin signalname="array_R_DOUT(2)" name="I" />
            <blockpin signalname="R_DATA(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_297">
            <blockpin signalname="array_R_DOUT(3)" name="I" />
            <blockpin signalname="R_DATA(3)" name="O" />
        </block>
        <block symbolname="compm4" name="XLXI_416">
            <blockpin signalname="array_P_DOUT(0)" name="A0" />
            <blockpin signalname="array_P_DOUT(1)" name="A1" />
            <blockpin signalname="array_P_DOUT(2)" name="A2" />
            <blockpin signalname="array_P_DOUT(3)" name="A3" />
            <blockpin signalname="array_Q_DOUT(0)" name="B0" />
            <blockpin signalname="array_Q_DOUT(1)" name="B1" />
            <blockpin signalname="array_Q_DOUT(2)" name="B2" />
            <blockpin signalname="array_Q_DOUT(3)" name="B3" />
            <blockpin name="GT" />
            <blockpin signalname="P_LT_Q" name="LT" />
        </block>
        <block symbolname="buf" name="XLXI_290">
            <blockpin signalname="R_ADDR(0)" name="I" />
            <blockpin signalname="read_ADDR(0)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_292">
            <blockpin signalname="R_ADDR(1)" name="I" />
            <blockpin signalname="read_ADDR(1)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_293">
            <blockpin signalname="R_ADDR(2)" name="I" />
            <blockpin signalname="read_ADDR(2)" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_433">
            <blockpin signalname="SYS_CLK" name="I" />
            <blockpin signalname="CLK" name="O" />
        </block>
        <block symbolname="cb2ce" name="XLXI_463">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_799" name="CE" />
            <blockpin signalname="XLXN_800" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="I(0)" name="Q0" />
            <blockpin signalname="I(1)" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="cb2ce" name="XLXI_466">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_801" name="CE" />
            <blockpin signalname="XLXN_802" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="J(0)" name="Q0" />
            <blockpin signalname="J(1)" name="Q1" />
            <blockpin name="TC" />
        </block>
        <block symbolname="cb4ce" name="XLXI_467">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_803" name="CE" />
            <blockpin signalname="XLXN_804" name="CLR" />
            <blockpin name="CEO" />
            <blockpin signalname="K(0)" name="Q0" />
            <blockpin signalname="K(1)" name="Q1" />
            <blockpin signalname="K(2)" name="Q2" />
            <blockpin name="Q3" />
            <blockpin name="TC" />
        </block>
    </netlist>
    <sheet sheetnum="1" width="3520" height="2720">
        <branch name="ACK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="1632" type="branch" />
            <wire x2="288" y1="1632" y2="1632" x1="128" />
            <wire x2="416" y1="1632" y2="1632" x1="288" />
        </branch>
        <iomarker fontsize="28" x="128" y="1632" name="ACK" orien="R180" />
        <iomarker fontsize="28" x="160" y="1104" name="RESET" orien="R180" />
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="320" y="1104" type="branch" />
            <wire x2="320" y1="1104" y2="1104" x1="160" />
            <wire x2="416" y1="1104" y2="1104" x1="320" />
        </branch>
        <instance x="416" y="1248" name="XLXI_433" orien="R0" />
        <iomarker fontsize="28" x="160" y="1424" name="START" orien="R180" />
        <iomarker fontsize="28" x="192" y="1216" name="SYS_CLK" orien="R180" />
        <branch name="SYS_CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="304" y="1216" type="branch" />
            <wire x2="304" y1="1216" y2="1216" x1="192" />
            <wire x2="416" y1="1216" y2="1216" x1="304" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="720" y="1216" type="branch" />
            <wire x2="720" y1="1216" y2="1216" x1="640" />
            <wire x2="896" y1="1216" y2="1216" x1="720" />
        </branch>
        <branch name="START">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="336" y="1424" type="branch" />
            <wire x2="336" y1="1424" y2="1424" x1="160" />
            <wire x2="416" y1="1424" y2="1424" x1="336" />
        </branch>
        <text style="fontsize:48;fontname:Arial" x="2832" y="2264">merge_arrrays_mcu.sch </text>
        <text style="fontsize:48;fontname:Arial" x="2840" y="2324">Page 1</text>
        <text style="fontsize:48;fontname:Arial" x="2844" y="2404">Control Unit Design</text>
        <text style="fontsize:48;fontname:Arial" x="2848" y="2468">(Incomplete)</text>
        <branch name="DONE">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="176" y="1872" type="branch" />
            <wire x2="176" y1="1872" y2="1872" x1="80" />
            <wire x2="336" y1="1872" y2="1872" x1="176" />
        </branch>
        <iomarker fontsize="28" x="336" y="1872" name="DONE" orien="R0" />
    </sheet>
    <sheet sheetnum="2" width="3520" height="2720">
        <branch name="array_Q_DOUT(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="768" y="400" type="branch" />
            <wire x2="656" y1="496" y2="496" x1="544" />
            <wire x2="656" y1="400" y2="496" x1="656" />
            <wire x2="768" y1="400" y2="400" x1="656" />
            <wire x2="992" y1="400" y2="400" x1="768" />
        </branch>
        <branch name="array_P_DOUT(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="848" y="336" type="branch" />
            <wire x2="656" y1="208" y2="208" x1="544" />
            <wire x2="656" y1="208" y2="336" x1="656" />
            <wire x2="848" y1="336" y2="336" x1="656" />
            <wire x2="992" y1="336" y2="336" x1="848" />
        </branch>
        <instance x="160" y="240" name="array_P" orien="R0">
        </instance>
        <instance x="160" y="528" name="array_Q" orien="R0">
        </instance>
        <branch name="I(1:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="112" y="208" type="branch" />
            <wire x2="112" y1="208" y2="208" x1="64" />
            <wire x2="160" y1="208" y2="208" x1="112" />
        </branch>
        <branch name="J(1:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="112" y="496" type="branch" />
            <wire x2="112" y1="496" y2="496" x1="80" />
            <wire x2="160" y1="496" y2="496" x1="112" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1776" y="144" type="branch" />
            <wire x2="1776" y1="144" y2="144" x1="1520" />
            <wire x2="1888" y1="144" y2="144" x1="1776" />
        </branch>
        <branch name="R_DATA(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2240" y="2176" type="branch" />
            <wire x2="2240" y1="2176" y2="2176" x1="2176" />
            <wire x2="2304" y1="2176" y2="2176" x1="2240" />
        </branch>
        <branch name="array_R_DOUT(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1792" y="2304" type="branch" />
            <wire x2="1792" y1="2304" y2="2304" x1="1744" />
            <wire x2="1952" y1="2304" y2="2304" x1="1792" />
        </branch>
        <branch name="R_DATA(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2256" y="2304" type="branch" />
            <wire x2="2256" y1="2304" y2="2304" x1="2176" />
            <wire x2="2304" y1="2304" y2="2304" x1="2256" />
        </branch>
        <branch name="array_R_DOUT(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1792" y="2432" type="branch" />
            <wire x2="1792" y1="2432" y2="2432" x1="1744" />
            <wire x2="1952" y1="2432" y2="2432" x1="1792" />
        </branch>
        <branch name="R_DATA(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2272" y="2432" type="branch" />
            <wire x2="2272" y1="2432" y2="2432" x1="2176" />
            <wire x2="2304" y1="2432" y2="2432" x1="2272" />
        </branch>
        <branch name="array_R_DOUT(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1776" y="2544" type="branch" />
            <wire x2="1776" y1="2544" y2="2544" x1="1744" />
            <wire x2="1952" y1="2544" y2="2544" x1="1776" />
        </branch>
        <branch name="R_DATA(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2272" y="2544" type="branch" />
            <wire x2="2272" y1="2544" y2="2544" x1="2176" />
            <wire x2="2304" y1="2544" y2="2544" x1="2272" />
        </branch>
        <instance x="1952" y="2208" name="XLXI_294" orien="R0" />
        <instance x="1952" y="2336" name="XLXI_295" orien="R0" />
        <instance x="1952" y="2464" name="XLXI_296" orien="R0" />
        <instance x="1952" y="2576" name="XLXI_297" orien="R0" />
        <branch name="XLXN_149(3:0)">
            <wire x2="1888" y1="272" y2="272" x1="1376" />
        </branch>
        <instance x="1888" y="432" name="array_R" orien="R0">
        </instance>
        <branch name="K(2:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1776" y="400" type="branch" />
            <wire x2="1776" y1="400" y2="400" x1="1568" />
            <wire x2="1888" y1="400" y2="400" x1="1776" />
        </branch>
        <branch name="array_R_DOUT(3:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2448" y="144" type="branch" />
            <wire x2="2448" y1="144" y2="144" x1="2304" />
            <wire x2="2512" y1="144" y2="144" x1="2448" />
        </branch>
        <branch name="array_R_DOUT(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1792" y="2176" type="branch" />
            <wire x2="1792" y1="2176" y2="2176" x1="1744" />
            <wire x2="1952" y1="2176" y2="2176" x1="1792" />
        </branch>
        <instance x="992" y="432" name="mux_sel_P_Q" orien="R0">
        </instance>
        <branch name="array_P_DOUT(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="1216" type="branch" />
            <wire x2="288" y1="1216" y2="1216" x1="128" />
            <wire x2="384" y1="1216" y2="1216" x1="288" />
        </branch>
        <branch name="array_P_DOUT(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="1280" type="branch" />
            <wire x2="288" y1="1280" y2="1280" x1="128" />
            <wire x2="384" y1="1280" y2="1280" x1="288" />
        </branch>
        <branch name="array_P_DOUT(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="1344" type="branch" />
            <wire x2="288" y1="1344" y2="1344" x1="128" />
            <wire x2="384" y1="1344" y2="1344" x1="288" />
        </branch>
        <branch name="array_P_DOUT(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="1408" type="branch" />
            <wire x2="288" y1="1408" y2="1408" x1="128" />
            <wire x2="384" y1="1408" y2="1408" x1="288" />
        </branch>
        <branch name="array_Q_DOUT(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="272" y="1472" type="branch" />
            <wire x2="272" y1="1472" y2="1472" x1="128" />
            <wire x2="384" y1="1472" y2="1472" x1="272" />
        </branch>
        <branch name="array_Q_DOUT(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="272" y="1536" type="branch" />
            <wire x2="272" y1="1536" y2="1536" x1="128" />
            <wire x2="384" y1="1536" y2="1536" x1="272" />
        </branch>
        <branch name="array_Q_DOUT(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="272" y="1600" type="branch" />
            <wire x2="272" y1="1600" y2="1600" x1="128" />
            <wire x2="384" y1="1600" y2="1600" x1="272" />
        </branch>
        <branch name="array_Q_DOUT(3)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="272" y="1664" type="branch" />
            <wire x2="272" y1="1664" y2="1664" x1="128" />
            <wire x2="384" y1="1664" y2="1664" x1="272" />
        </branch>
        <branch name="P_LT_Q">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="848" y="1472" type="branch" />
            <wire x2="848" y1="1472" y2="1472" x1="768" />
            <wire x2="912" y1="1472" y2="1472" x1="848" />
        </branch>
        <instance x="384" y="1792" name="XLXI_416" orien="R0" />
        <instance x="288" y="2400" name="XLXI_290" orien="R0" />
        <instance x="288" y="2496" name="XLXI_292" orien="R0" />
        <instance x="288" y="2592" name="XLXI_293" orien="R0" />
        <branch name="R_ADDR(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="256" y="2368" type="branch" />
            <wire x2="256" y1="2368" y2="2368" x1="224" />
            <wire x2="288" y1="2368" y2="2368" x1="256" />
        </branch>
        <branch name="read_ADDR(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="544" y="2368" type="branch" />
            <wire x2="544" y1="2368" y2="2368" x1="512" />
            <wire x2="640" y1="2368" y2="2368" x1="544" />
        </branch>
        <branch name="R_ADDR(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="240" y="2464" type="branch" />
            <wire x2="240" y1="2464" y2="2464" x1="224" />
            <wire x2="288" y1="2464" y2="2464" x1="240" />
        </branch>
        <branch name="read_ADDR(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="544" y="2464" type="branch" />
            <wire x2="544" y1="2464" y2="2464" x1="512" />
            <wire x2="640" y1="2464" y2="2464" x1="544" />
        </branch>
        <branch name="R_ADDR(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="240" y="2560" type="branch" />
            <wire x2="240" y1="2560" y2="2560" x1="224" />
            <wire x2="288" y1="2560" y2="2560" x1="240" />
        </branch>
        <branch name="read_ADDR(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="544" y="2560" type="branch" />
            <wire x2="544" y1="2560" y2="2560" x1="512" />
            <wire x2="640" y1="2560" y2="2560" x1="544" />
        </branch>
        <text style="fontsize:48;fontname:Arial" x="2896" y="2376">merge_arrrays_mcu.sch </text>
        <text style="fontsize:48;fontname:Arial" x="2904" y="2436">Page 2</text>
        <text style="fontsize:48;fontname:Arial" x="2908" y="2516">Data Path Unit Design</text>
        <text style="fontsize:48;fontname:Arial" x="2912" y="2580">(Complete)</text>
        <branch name="R_DATA(3:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="2544" y="2272" type="branch" />
            <wire x2="2544" y1="2128" y2="2272" x1="2544" />
            <wire x2="2544" y1="2272" y2="2544" x1="2544" />
        </branch>
        <iomarker fontsize="28" x="2544" y="2128" name="R_DATA(3:0)" orien="R270" />
        <branch name="R_ADDR(2:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="64" y="2432" type="branch" />
            <wire x2="64" y1="2240" y2="2432" x1="64" />
            <wire x2="64" y1="2432" y2="2624" x1="64" />
        </branch>
        <iomarker fontsize="28" x="64" y="2240" name="R_ADDR(2:0)" orien="R270" />
        <instance x="2864" y="720" name="XLXI_463" orien="R0" />
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2736" y="592" type="branch" />
            <wire x2="2736" y1="592" y2="592" x1="2688" />
            <wire x2="2864" y1="592" y2="592" x1="2736" />
        </branch>
        <branch name="I(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3296" y="400" type="branch" />
            <wire x2="3296" y1="400" y2="400" x1="3248" />
            <wire x2="3344" y1="400" y2="400" x1="3296" />
        </branch>
        <branch name="I(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3296" y="464" type="branch" />
            <wire x2="3296" y1="464" y2="464" x1="3248" />
            <wire x2="3344" y1="464" y2="464" x1="3296" />
        </branch>
        <branch name="I(1:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3408" y="432" type="branch" />
            <wire x2="3408" y1="352" y2="432" x1="3408" />
            <wire x2="3408" y1="432" y2="528" x1="3408" />
        </branch>
        <instance x="2880" y="1296" name="XLXI_466" orien="R0" />
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2752" y="1168" type="branch" />
            <wire x2="2752" y1="1168" y2="1168" x1="2704" />
            <wire x2="2880" y1="1168" y2="1168" x1="2752" />
        </branch>
        <branch name="J(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3312" y="976" type="branch" />
            <wire x2="3312" y1="976" y2="976" x1="3264" />
            <wire x2="3360" y1="976" y2="976" x1="3312" />
        </branch>
        <branch name="J(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3312" y="1040" type="branch" />
            <wire x2="3312" y1="1040" y2="1040" x1="3264" />
            <wire x2="3360" y1="1040" y2="1040" x1="3312" />
        </branch>
        <branch name="J(1:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3424" y="1008" type="branch" />
            <wire x2="3424" y1="928" y2="1008" x1="3424" />
            <wire x2="3424" y1="1008" y2="1104" x1="3424" />
        </branch>
        <instance x="2880" y="1904" name="XLXI_467" orien="R0" />
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2768" y="1776" type="branch" />
            <wire x2="2768" y1="1776" y2="1776" x1="2720" />
            <wire x2="2880" y1="1776" y2="1776" x1="2768" />
        </branch>
        <branch name="K(0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3328" y="1456" type="branch" />
            <wire x2="3328" y1="1456" y2="1456" x1="3264" />
            <wire x2="3376" y1="1456" y2="1456" x1="3328" />
        </branch>
        <branch name="K(1)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3328" y="1520" type="branch" />
            <wire x2="3328" y1="1520" y2="1520" x1="3264" />
            <wire x2="3376" y1="1520" y2="1520" x1="3328" />
        </branch>
        <branch name="K(2)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3328" y="1584" type="branch" />
            <wire x2="3328" y1="1584" y2="1584" x1="3264" />
            <wire x2="3376" y1="1584" y2="1584" x1="3328" />
        </branch>
        <branch name="K(2:0)">
            <attrtext style="alignment:SOFT-TVCENTER" attrname="Name" x="3440" y="1536" type="branch" />
            <wire x2="3440" y1="1440" y2="1536" x1="3440" />
            <wire x2="3440" y1="1536" y2="1632" x1="3440" />
        </branch>
        <branch name="read_ADDR(2:0)">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1696" y="336" type="branch" />
            <wire x2="1696" y1="336" y2="336" x1="1568" />
            <wire x2="1888" y1="336" y2="336" x1="1696" />
        </branch>
        <text style="fontsize:24;fontname:Arial" x="2896" y="2648">You may modify this schematic, if necessary. </text>
        <branch name="XLXN_798">
            <wire x2="992" y1="464" y2="464" x1="976" />
            <wire x2="976" y1="464" y2="960" x1="976" />
            <wire x2="992" y1="960" y2="960" x1="976" />
        </branch>
        <branch name="XLXN_799">
            <wire x2="2864" y1="528" y2="528" x1="2384" />
        </branch>
        <branch name="XLXN_800">
            <wire x2="2864" y1="688" y2="688" x1="2416" />
        </branch>
        <branch name="XLXN_801">
            <wire x2="2880" y1="1104" y2="1104" x1="2448" />
        </branch>
        <branch name="XLXN_802">
            <wire x2="2880" y1="1264" y2="1264" x1="2432" />
        </branch>
        <branch name="XLXN_803">
            <wire x2="2880" y1="1712" y2="1712" x1="2400" />
        </branch>
        <branch name="XLXN_804">
            <wire x2="2880" y1="1872" y2="1872" x1="2416" />
        </branch>
    </sheet>
</drawing>