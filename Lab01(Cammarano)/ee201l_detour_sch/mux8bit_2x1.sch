<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="A(0)" />
        <signal name="B(0)" />
        <signal name="S" />
        <signal name="O(0)" />
        <signal name="O(1)" />
        <signal name="A(1)" />
        <signal name="B(1)" />
        <signal name="O(2)" />
        <signal name="A(2)" />
        <signal name="B(2)" />
        <signal name="O(3)" />
        <signal name="A(3)" />
        <signal name="B(3)" />
        <signal name="A(7:0)" />
        <signal name="B(7:0)" />
        <signal name="O(4)" />
        <signal name="A(4)" />
        <signal name="B(4)" />
        <signal name="O(5)" />
        <signal name="A(5)" />
        <signal name="B(5)" />
        <signal name="O(6)" />
        <signal name="A(6)" />
        <signal name="B(6)" />
        <signal name="O(7)" />
        <signal name="A(7)" />
        <signal name="B(7)" />
        <signal name="O(7:0)" />
        <port polarity="Input" name="S" />
        <port polarity="Input" name="A(7:0)" />
        <port polarity="Input" name="B(7:0)" />
        <port polarity="Output" name="O(7:0)" />
        <blockdef name="m2_1">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="96" y1="-64" y2="-192" x1="96" />
            <line x2="96" y1="-96" y2="-64" x1="256" />
            <line x2="256" y1="-160" y2="-96" x1="256" />
            <line x2="256" y1="-192" y2="-160" x1="96" />
            <line x2="96" y1="-32" y2="-32" x1="176" />
            <line x2="176" y1="-80" y2="-32" x1="176" />
            <line x2="96" y1="-32" y2="-32" x1="0" />
            <line x2="256" y1="-128" y2="-128" x1="320" />
            <line x2="96" y1="-96" y2="-96" x1="0" />
            <line x2="96" y1="-160" y2="-160" x1="0" />
        </blockdef>
        <blockdef name="USC_CENG_border">
            <timestamp>2008-2-4T5:45:46</timestamp>
            <rect width="724" x="0" y="-32" height="236" />
            <line x2="724" y1="60" y2="60" x1="0" />
            <line x2="724" y1="108" y2="108" x1="0" />
            <line x2="724" y1="152" y2="152" x1="0" />
            <line x2="352" y1="152" y2="108" x1="352" />
            <line x2="368" y1="60" y2="108" x1="368" />
        </blockdef>
        <block symbolname="m2_1" name="XLXI_1">
            <blockpin signalname="A(0)" name="D0" />
            <blockpin signalname="B(0)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(0)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_2">
            <blockpin signalname="A(1)" name="D0" />
            <blockpin signalname="B(1)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(1)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_3">
            <blockpin signalname="A(2)" name="D0" />
            <blockpin signalname="B(2)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(2)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_4">
            <blockpin signalname="A(3)" name="D0" />
            <blockpin signalname="B(3)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(3)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_5">
            <blockpin signalname="A(4)" name="D0" />
            <blockpin signalname="B(4)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(4)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_10">
            <blockpin signalname="A(5)" name="D0" />
            <blockpin signalname="B(5)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(5)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_14">
            <blockpin signalname="A(6)" name="D0" />
            <blockpin signalname="B(6)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(6)" name="O" />
        </block>
        <block symbolname="m2_1" name="XLXI_15">
            <blockpin signalname="A(7)" name="D0" />
            <blockpin signalname="B(7)" name="D1" />
            <blockpin signalname="S" name="S0" />
            <blockpin signalname="O(7)" name="O" />
        </block>
        <block symbolname="USC_CENG_border" name="XLXI_36" />
    </netlist>
    <sheet sheetnum="1" width="2720" height="1760">
        <instance x="880" y="416" name="XLXI_1" orien="R0" />
        <branch name="A(0)">
            <wire x2="640" y1="256" y2="256" x1="608" />
            <wire x2="880" y1="256" y2="256" x1="640" />
        </branch>
        <branch name="B(0)">
            <wire x2="624" y1="320" y2="320" x1="608" />
            <wire x2="880" y1="320" y2="320" x1="624" />
        </branch>
        <branch name="S">
            <wire x2="768" y1="384" y2="384" x1="688" />
            <wire x2="880" y1="384" y2="384" x1="768" />
        </branch>
        <branch name="O(0)">
            <wire x2="1280" y1="288" y2="288" x1="1200" />
            <wire x2="1328" y1="288" y2="288" x1="1280" />
        </branch>
        <instance x="864" y="656" name="XLXI_2" orien="R0" />
        <branch name="O(1)">
            <wire x2="1280" y1="528" y2="528" x1="1184" />
            <wire x2="1344" y1="528" y2="528" x1="1280" />
        </branch>
        <branch name="A(1)">
            <wire x2="656" y1="496" y2="496" x1="624" />
            <wire x2="864" y1="496" y2="496" x1="656" />
        </branch>
        <branch name="B(1)">
            <wire x2="640" y1="560" y2="560" x1="624" />
            <wire x2="864" y1="560" y2="560" x1="640" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="704" y="624" type="branch" />
            <wire x2="768" y1="624" y2="624" x1="704" />
            <wire x2="864" y1="624" y2="624" x1="768" />
        </branch>
        <instance x="880" y="896" name="XLXI_3" orien="R0" />
        <branch name="O(2)">
            <wire x2="1296" y1="768" y2="768" x1="1200" />
            <wire x2="1360" y1="768" y2="768" x1="1296" />
        </branch>
        <branch name="A(2)">
            <wire x2="672" y1="736" y2="736" x1="640" />
            <wire x2="880" y1="736" y2="736" x1="672" />
        </branch>
        <branch name="B(2)">
            <wire x2="672" y1="800" y2="800" x1="640" />
            <wire x2="880" y1="800" y2="800" x1="672" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="720" y="864" type="branch" />
            <wire x2="784" y1="864" y2="864" x1="720" />
            <wire x2="880" y1="864" y2="864" x1="784" />
        </branch>
        <instance x="880" y="1136" name="XLXI_4" orien="R0" />
        <branch name="O(3)">
            <wire x2="1296" y1="1008" y2="1008" x1="1200" />
            <wire x2="1360" y1="1008" y2="1008" x1="1296" />
        </branch>
        <branch name="A(3)">
            <wire x2="672" y1="976" y2="976" x1="640" />
            <wire x2="880" y1="976" y2="976" x1="672" />
        </branch>
        <branch name="B(3)">
            <wire x2="672" y1="1040" y2="1040" x1="640" />
            <wire x2="880" y1="1040" y2="1040" x1="672" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="720" y="1104" type="branch" />
            <wire x2="784" y1="1104" y2="1104" x1="720" />
            <wire x2="880" y1="1104" y2="1104" x1="784" />
        </branch>
        <branch name="A(7:0)">
            <wire x2="240" y1="368" y2="512" x1="240" />
            <wire x2="240" y1="512" y2="704" x1="240" />
        </branch>
        <branch name="B(7:0)">
            <wire x2="352" y1="368" y2="496" x1="352" />
            <wire x2="352" y1="496" y2="688" x1="352" />
        </branch>
        <instance x="1824" y="384" name="XLXI_5" orien="R0" />
        <branch name="O(4)">
            <wire x2="2240" y1="256" y2="256" x1="2144" />
            <wire x2="2304" y1="256" y2="256" x1="2240" />
        </branch>
        <branch name="A(4)">
            <wire x2="1616" y1="224" y2="224" x1="1584" />
            <wire x2="1824" y1="224" y2="224" x1="1616" />
        </branch>
        <branch name="B(4)">
            <wire x2="1616" y1="288" y2="288" x1="1584" />
            <wire x2="1824" y1="288" y2="288" x1="1616" />
        </branch>
        <instance x="1840" y="624" name="XLXI_10" orien="R0" />
        <branch name="O(5)">
            <wire x2="2256" y1="496" y2="496" x1="2160" />
            <wire x2="2320" y1="496" y2="496" x1="2256" />
        </branch>
        <branch name="A(5)">
            <wire x2="1632" y1="464" y2="464" x1="1600" />
            <wire x2="1840" y1="464" y2="464" x1="1632" />
        </branch>
        <branch name="B(5)">
            <wire x2="1632" y1="528" y2="528" x1="1600" />
            <wire x2="1840" y1="528" y2="528" x1="1632" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1680" y="592" type="branch" />
            <wire x2="1760" y1="592" y2="592" x1="1680" />
            <wire x2="1840" y1="592" y2="592" x1="1760" />
        </branch>
        <instance x="1840" y="864" name="XLXI_14" orien="R0" />
        <branch name="O(6)">
            <wire x2="2256" y1="736" y2="736" x1="2160" />
            <wire x2="2320" y1="736" y2="736" x1="2256" />
        </branch>
        <branch name="A(6)">
            <wire x2="1632" y1="704" y2="704" x1="1600" />
            <wire x2="1840" y1="704" y2="704" x1="1632" />
        </branch>
        <branch name="B(6)">
            <wire x2="1632" y1="768" y2="768" x1="1600" />
            <wire x2="1840" y1="768" y2="768" x1="1632" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1680" y="832" type="branch" />
            <wire x2="1760" y1="832" y2="832" x1="1680" />
            <wire x2="1840" y1="832" y2="832" x1="1760" />
        </branch>
        <instance x="1840" y="1104" name="XLXI_15" orien="R0" />
        <branch name="O(7)">
            <wire x2="2272" y1="976" y2="976" x1="2160" />
            <wire x2="2320" y1="976" y2="976" x1="2272" />
        </branch>
        <branch name="A(7)">
            <wire x2="1632" y1="944" y2="944" x1="1600" />
            <wire x2="1840" y1="944" y2="944" x1="1632" />
        </branch>
        <branch name="B(7)">
            <wire x2="1632" y1="1008" y2="1008" x1="1600" />
            <wire x2="1840" y1="1008" y2="1008" x1="1632" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1680" y="1072" type="branch" />
            <wire x2="1744" y1="1072" y2="1072" x1="1680" />
            <wire x2="1840" y1="1072" y2="1072" x1="1744" />
        </branch>
        <branch name="S">
            <attrtext style="alignment:SOFT-RIGHT" attrname="Name" x="1664" y="352" type="branch" />
            <wire x2="1744" y1="352" y2="352" x1="1664" />
            <wire x2="1824" y1="352" y2="352" x1="1744" />
        </branch>
        <branch name="O(7:0)">
            <wire x2="2512" y1="240" y2="352" x1="2512" />
            <wire x2="2512" y1="352" y2="656" x1="2512" />
        </branch>
        <branch name="S">
            <wire x2="368" y1="896" y2="896" x1="272" />
            <wire x2="480" y1="896" y2="896" x1="368" />
        </branch>
        <instance x="2000" y="1552" name="XLXI_36" orien="R0" />
        <text style="fontsize:24;fontname:Arial" x="2152" y="1640">Detour</text>
        <text style="fontsize:24;fontname:Arial" x="2456" y="1640">mux8bit_2x1</text>
        <iomarker fontsize="28" x="240" y="368" name="A(7:0)" orien="R270" />
        <iomarker fontsize="28" x="352" y="368" name="B(7:0)" orien="R270" />
        <iomarker fontsize="28" x="2512" y="656" name="O(7:0)" orien="R90" />
        <iomarker fontsize="28" x="272" y="896" name="S" orien="R180" />
    </sheet>
</drawing>