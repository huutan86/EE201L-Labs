<?xml version="1.0" encoding="UTF-8"?>
<drawing version="7">
    <attr value="spartan6" name="DeviceFamilyName">
        <trait delete="all:0" />
        <trait editname="all:0" />
        <trait edittrait="all:0" />
    </attr>
    <netlist>
        <signal name="QI" />
        <signal name="QL123" />
        <signal name="L123" />
        <signal name="QL12" />
        <signal name="L12" />
        <signal name="QL1" />
        <signal name="L1" />
        <signal name="R123" />
        <signal name="QR12" />
        <signal name="R12" />
        <signal name="QR1" />
        <signal name="R1" />
        <signal name="I" />
        <signal name="GL" />
        <signal name="GR" />
        <signal name="G2" />
        <signal name="G1" />
        <signal name="XLXN_174" />
        <signal name="R" />
        <signal name="L" />
        <signal name="LR_BAR" />
        <signal name="CLK" />
        <signal name="XLXN_160" />
        <signal name="RESET" />
        <signal name="XLXN_210" />
        <signal name="QR123" />
        <signal name="XLXN_211" />
        <signal name="XLXN_214" />
        <port polarity="Output" name="L123" />
        <port polarity="Output" name="L12" />
        <port polarity="Output" name="L1" />
        <port polarity="Output" name="R123" />
        <port polarity="Output" name="R12" />
        <port polarity="Output" name="R1" />
        <port polarity="Output" name="I" />
        <port polarity="Output" name="GL" />
        <port polarity="Output" name="GR" />
        <port polarity="Output" name="G2" />
        <port polarity="Output" name="G1" />
        <port polarity="Output" name="R" />
        <port polarity="Output" name="L" />
        <port polarity="Input" name="LR_BAR" />
        <port polarity="Input" name="CLK" />
        <port polarity="Input" name="RESET" />
        <blockdef name="fdp">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <line x2="192" y1="-320" y2="-352" x1="192" />
            <line x2="64" y1="-352" y2="-352" x1="192" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="64" y1="-352" y2="-352" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
        </blockdef>
        <blockdef name="fdc">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="64" y1="-256" y2="-256" x1="0" />
            <line x2="320" y1="-256" y2="-256" x1="384" />
            <rect width="256" x="64" y="-320" height="256" />
            <line x2="80" y1="-112" y2="-128" x1="64" />
            <line x2="64" y1="-128" y2="-144" x1="80" />
            <line x2="192" y1="-64" y2="-32" x1="192" />
            <line x2="64" y1="-32" y2="-32" x1="192" />
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
        <blockdef name="or4">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="48" y1="-64" y2="-64" x1="0" />
            <line x2="64" y1="-128" y2="-128" x1="0" />
            <line x2="64" y1="-192" y2="-192" x1="0" />
            <line x2="48" y1="-256" y2="-256" x1="0" />
            <line x2="192" y1="-160" y2="-160" x1="256" />
            <arc ex="112" ey="-208" sx="192" sy="-160" r="88" cx="116" cy="-120" />
            <line x2="48" y1="-208" y2="-208" x1="112" />
            <line x2="48" y1="-112" y2="-112" x1="112" />
            <line x2="48" y1="-256" y2="-208" x1="48" />
            <line x2="48" y1="-64" y2="-112" x1="48" />
            <arc ex="48" ey="-208" sx="48" sy="-112" r="56" cx="16" cy="-160" />
            <arc ex="192" ey="-160" sx="112" sy="-112" r="88" cx="116" cy="-200" />
        </blockdef>
        <blockdef name="buf">
            <timestamp>2000-1-1T10:10:10</timestamp>
            <line x2="64" y1="-32" y2="-32" x1="0" />
            <line x2="128" y1="-32" y2="-32" x1="224" />
            <line x2="128" y1="0" y2="-32" x1="64" />
            <line x2="64" y1="-32" y2="-64" x1="128" />
            <line x2="64" y1="-64" y2="0" x1="64" />
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
        <blockdef name="USC_CENG_border">
            <timestamp>2008-2-4T4:45:44</timestamp>
            <rect width="724" x="0" y="-32" height="236" />
            <line x2="724" y1="60" y2="60" x1="0" />
            <line x2="724" y1="108" y2="108" x1="0" />
            <line x2="724" y1="152" y2="152" x1="0" />
            <line x2="352" y1="152" y2="108" x1="352" />
            <line x2="368" y1="60" y2="108" x1="368" />
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
        <block symbolname="USC_CENG_border" name="XLXI_36" />
        <block symbolname="buf" name="XLXI_81">
            <blockpin signalname="QL123" name="I" />
            <blockpin signalname="L123" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_80">
            <blockpin signalname="QL12" name="I" />
            <blockpin signalname="L12" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_79">
            <blockpin signalname="QL1" name="I" />
            <blockpin signalname="L1" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_78">
            <blockpin signalname="QR123" name="I" />
            <blockpin signalname="R123" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_77">
            <blockpin signalname="QR12" name="I" />
            <blockpin signalname="R12" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_76">
            <blockpin signalname="QR1" name="I" />
            <blockpin signalname="R1" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_59">
            <blockpin signalname="QI" name="I" />
            <blockpin signalname="I" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_55">
            <blockpin signalname="QL123" name="I0" />
            <blockpin signalname="QL12" name="I1" />
            <blockpin signalname="QL1" name="I2" />
            <blockpin signalname="XLXN_210" name="I3" />
            <blockpin signalname="G2" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_49">
            <blockpin signalname="QL12" name="I0" />
            <blockpin signalname="QL123" name="I1" />
            <blockpin signalname="XLXN_174" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_53">
            <blockpin signalname="QR123" name="I" />
            <blockpin signalname="GR" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_52">
            <blockpin signalname="QL123" name="I" />
            <blockpin signalname="GL" name="O" />
        </block>
        <block symbolname="or4" name="XLXI_50">
            <blockpin signalname="QR123" name="I0" />
            <blockpin signalname="QR12" name="I1" />
            <blockpin signalname="QR1" name="I2" />
            <blockpin signalname="XLXN_174" name="I3" />
            <blockpin signalname="G1" name="O" />
        </block>
        <block symbolname="inv" name="XLXI_58">
            <blockpin signalname="LR_BAR" name="I" />
            <blockpin signalname="R" name="O" />
        </block>
        <block symbolname="buf" name="XLXI_57">
            <blockpin signalname="LR_BAR" name="I" />
            <blockpin signalname="L" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_48">
            <blockpin signalname="QR123" name="I0" />
            <blockpin signalname="QL123" name="I1" />
            <blockpin signalname="XLXN_160" name="O" />
        </block>
        <block symbolname="fdp" name="XLXI_42">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="XLXN_160" name="D" />
            <blockpin signalname="RESET" name="PRE" />
            <blockpin signalname="QI" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_41">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="QL12" name="D" />
            <blockpin signalname="QL123" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_40">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="QL1" name="D" />
            <blockpin signalname="QL12" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_39">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="XLXN_211" name="D" />
            <blockpin signalname="QL1" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_82">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="XLXN_214" name="D" />
            <blockpin signalname="QR1" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_83">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="QR1" name="D" />
            <blockpin signalname="QR12" name="Q" />
        </block>
        <block symbolname="fdc" name="XLXI_84">
            <blockpin signalname="CLK" name="C" />
            <blockpin signalname="RESET" name="CLR" />
            <blockpin signalname="QR12" name="D" />
            <blockpin signalname="QR123" name="Q" />
        </block>
        <block symbolname="and2" name="XLXI_85">
            <blockpin signalname="QI" name="I0" />
            <blockpin signalname="L" name="I1" />
            <blockpin signalname="XLXN_211" name="O" />
        </block>
        <block symbolname="and2" name="XLXI_86">
            <blockpin signalname="QI" name="I0" />
            <blockpin signalname="R" name="I1" />
            <blockpin signalname="XLXN_214" name="O" />
        </block>
        <block symbolname="or2" name="XLXI_87">
            <blockpin signalname="QR12" name="I0" />
            <blockpin signalname="QR123" name="I1" />
            <blockpin signalname="XLXN_210" name="O" />
        </block>
    </netlist>
    <sheet sheetnum="2" width="3520" height="2720">
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="1020" x="84" y="2536" height="172" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="1028" x="76" y="2188" height="328" />
        <text style="fontsize:48;fontname:Arial" x="1800" y="1488">State Memory and Next State Logic for QR1, QR12, QR123</text>
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="2460" x="1000" y="832" height="744" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="408" x="968" y="112" height="248" />
        <rect style="linewidth:W;linecolor:rgb(255,0,0);linestyle:Dash" width="408" x="88" y="608" height="248" />
        <text style="fontsize:24;fontname:Arial" x="3244" y="2596">Detour core design</text>
        <text style="fontsize:24;fontname:Arial" x="2940" y="2596">Detour</text>
        <instance x="2784" y="2512" name="XLXI_36" orien="R0" />
        <iomarker fontsize="28" x="2368" y="2512" name="L123" orien="R0" />
        <iomarker fontsize="28" x="2368" y="2384" name="L12" orien="R0" />
        <iomarker fontsize="28" x="2368" y="2256" name="L1" orien="R0" />
        <iomarker fontsize="28" x="2368" y="2128" name="R123" orien="R0" />
        <iomarker fontsize="28" x="2368" y="2000" name="R12" orien="R0" />
        <iomarker fontsize="28" x="2368" y="1872" name="R1" orien="R0" />
        <iomarker fontsize="28" x="2368" y="1728" name="I" orien="R0" />
        <instance x="1968" y="2544" name="XLXI_81" orien="R0" />
        <instance x="1968" y="2416" name="XLXI_80" orien="R0" />
        <instance x="1968" y="2288" name="XLXI_79" orien="R0" />
        <instance x="1968" y="2160" name="XLXI_78" orien="R0" />
        <instance x="1968" y="2032" name="XLXI_77" orien="R0" />
        <instance x="1968" y="1904" name="XLXI_76" orien="R0" />
        <instance x="1968" y="1760" name="XLXI_59" orien="R0" />
        <iomarker fontsize="28" x="816" y="1472" name="R" orien="R0" />
        <iomarker fontsize="28" x="816" y="1328" name="L" orien="R0" />
        <iomarker fontsize="28" x="1360" y="1744" name="GL" orien="R0" />
        <iomarker fontsize="28" x="1392" y="2592" name="GR" orien="R0" />
        <iomarker fontsize="28" x="1376" y="2368" name="G2" orien="R0" />
        <iomarker fontsize="28" x="1360" y="2032" name="G1" orien="R0" />
        <instance x="368" y="2032" name="XLXI_49" orien="R0" />
        <instance x="928" y="2624" name="XLXI_53" orien="R0" />
        <instance x="896" y="1776" name="XLXI_52" orien="R0" />
        <instance x="944" y="2192" name="XLXI_50" orien="R0" />
        <iomarker fontsize="28" x="192" y="1408" name="LR_BAR" orien="R180" />
        <instance x="432" y="1504" name="XLXI_58" orien="R0" />
        <instance x="432" y="1360" name="XLXI_57" orien="R0" />
        <iomarker fontsize="28" x="512" y="992" name="CLK" orien="R90" />
        <iomarker fontsize="28" x="400" y="544" name="RESET" orien="R180" />
        <instance x="272" y="832" name="XLXI_48" orien="R0" />
        <instance x="592" y="992" name="XLXI_42" orien="R0" />
        <instance x="2704" y="464" name="XLXI_41" orien="R0" />
        <instance x="2128" y="464" name="XLXI_40" orien="R0" />
        <instance x="1504" y="464" name="XLXI_39" orien="R0" />
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="2512" type="branch" />
            <wire x2="1824" y1="2512" y2="2512" x1="1760" />
            <wire x2="1968" y1="2512" y2="2512" x1="1824" />
        </branch>
        <branch name="L123">
            <wire x2="2368" y1="2512" y2="2512" x1="2192" />
        </branch>
        <branch name="QL12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="2384" type="branch" />
            <wire x2="1824" y1="2384" y2="2384" x1="1760" />
            <wire x2="1968" y1="2384" y2="2384" x1="1824" />
        </branch>
        <branch name="L12">
            <wire x2="2368" y1="2384" y2="2384" x1="2192" />
        </branch>
        <branch name="QL1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="2256" type="branch" />
            <wire x2="1824" y1="2256" y2="2256" x1="1760" />
            <wire x2="1968" y1="2256" y2="2256" x1="1824" />
        </branch>
        <branch name="L1">
            <wire x2="2368" y1="2256" y2="2256" x1="2192" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="2128" type="branch" />
            <wire x2="1824" y1="2128" y2="2128" x1="1760" />
            <wire x2="1968" y1="2128" y2="2128" x1="1824" />
        </branch>
        <branch name="R123">
            <wire x2="2368" y1="2128" y2="2128" x1="2192" />
        </branch>
        <branch name="QR12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="2000" type="branch" />
            <wire x2="1824" y1="2000" y2="2000" x1="1760" />
            <wire x2="1968" y1="2000" y2="2000" x1="1824" />
        </branch>
        <branch name="R12">
            <wire x2="2368" y1="2000" y2="2000" x1="2192" />
        </branch>
        <branch name="QR1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="1872" type="branch" />
            <wire x2="1824" y1="1872" y2="1872" x1="1760" />
            <wire x2="1968" y1="1872" y2="1872" x1="1824" />
        </branch>
        <branch name="R1">
            <wire x2="2368" y1="1872" y2="1872" x1="2192" />
        </branch>
        <branch name="QI">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1824" y="1728" type="branch" />
            <wire x2="1824" y1="1728" y2="1728" x1="1760" />
            <wire x2="1968" y1="1728" y2="1728" x1="1824" />
        </branch>
        <branch name="I">
            <wire x2="2368" y1="1728" y2="1728" x1="2192" />
        </branch>
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="176" y="1824" type="branch" />
            <wire x2="176" y1="1824" y2="1824" x1="112" />
            <wire x2="368" y1="1824" y2="1824" x1="176" />
            <wire x2="368" y1="1824" y2="1904" x1="368" />
        </branch>
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="720" y="1744" type="branch" />
            <wire x2="720" y1="1744" y2="1744" x1="592" />
            <wire x2="896" y1="1744" y2="1744" x1="720" />
        </branch>
        <branch name="GL">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1216" y="1744" type="branch" />
            <wire x2="1216" y1="1744" y2="1744" x1="1120" />
            <wire x2="1360" y1="1744" y2="1744" x1="1216" />
        </branch>
        <branch name="GR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1296" y="2592" type="branch" />
            <wire x2="1296" y1="2592" y2="2592" x1="1152" />
            <wire x2="1392" y1="2592" y2="2592" x1="1296" />
        </branch>
        <branch name="G2">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1280" y="2368" type="branch" />
            <wire x2="1280" y1="2368" y2="2368" x1="1232" />
            <wire x2="1376" y1="2368" y2="2368" x1="1280" />
        </branch>
        <branch name="G1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1280" y="2032" type="branch" />
            <wire x2="1280" y1="2032" y2="2032" x1="1200" />
            <wire x2="1360" y1="2032" y2="2032" x1="1280" />
        </branch>
        <branch name="XLXN_174">
            <wire x2="944" y1="1936" y2="1936" x1="624" />
        </branch>
        <branch name="QL12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="160" y="1968" type="branch" />
            <wire x2="160" y1="1968" y2="1968" x1="112" />
            <wire x2="368" y1="1968" y2="1968" x1="160" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="720" y="2128" type="branch" />
            <wire x2="720" y1="2128" y2="2128" x1="640" />
            <wire x2="944" y1="2128" y2="2128" x1="720" />
        </branch>
        <branch name="QR12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="800" y="2064" type="branch" />
            <wire x2="800" y1="2064" y2="2064" x1="720" />
            <wire x2="944" y1="2064" y2="2064" x1="800" />
        </branch>
        <branch name="QR1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="880" y="2000" type="branch" />
            <wire x2="880" y1="2000" y2="2000" x1="768" />
            <wire x2="944" y1="2000" y2="2000" x1="880" />
        </branch>
        <branch name="R">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="720" y="1472" type="branch" />
            <wire x2="720" y1="1472" y2="1472" x1="656" />
            <wire x2="816" y1="1472" y2="1472" x1="720" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="704" y="1328" type="branch" />
            <wire x2="704" y1="1328" y2="1328" x1="656" />
            <wire x2="816" y1="1328" y2="1328" x1="704" />
        </branch>
        <branch name="LR_BAR">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="256" y="1408" type="branch" />
            <wire x2="256" y1="1408" y2="1408" x1="192" />
            <wire x2="416" y1="1408" y2="1408" x1="256" />
            <wire x2="416" y1="1408" y2="1472" x1="416" />
            <wire x2="432" y1="1472" y2="1472" x1="416" />
            <wire x2="432" y1="1328" y2="1328" x1="416" />
            <wire x2="416" y1="1328" y2="1408" x1="416" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1152" y="464" type="branch" />
            <wire x2="1152" y1="464" y2="464" x1="1104" />
            <wire x2="1440" y1="464" y2="464" x1="1152" />
            <wire x2="1440" y1="64" y2="336" x1="1440" />
            <wire x2="1504" y1="336" y2="336" x1="1440" />
            <wire x2="1440" y1="336" y2="464" x1="1440" />
            <wire x2="1952" y1="64" y2="64" x1="1440" />
            <wire x2="1952" y1="64" y2="336" x1="1952" />
            <wire x2="2128" y1="336" y2="336" x1="1952" />
            <wire x2="2592" y1="64" y2="64" x1="1952" />
            <wire x2="2592" y1="64" y2="336" x1="2592" />
            <wire x2="2704" y1="336" y2="336" x1="2592" />
        </branch>
        <branch name="QI">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1056" y="736" type="branch" />
            <wire x2="1056" y1="736" y2="736" x1="976" />
            <wire x2="1168" y1="736" y2="736" x1="1056" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-TVCENTER;fontsize:32;fontname:Arial" attrname="Name" x="512" y="928" type="branch" />
            <wire x2="592" y1="864" y2="864" x1="512" />
            <wire x2="512" y1="864" y2="928" x1="512" />
            <wire x2="512" y1="928" y2="992" x1="512" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="208" y="768" type="branch" />
            <wire x2="208" y1="768" y2="768" x1="176" />
            <wire x2="272" y1="768" y2="768" x1="208" />
        </branch>
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="208" y="704" type="branch" />
            <wire x2="208" y1="704" y2="704" x1="176" />
            <wire x2="272" y1="704" y2="704" x1="208" />
        </branch>
        <branch name="XLXN_160">
            <wire x2="592" y1="736" y2="736" x1="528" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="464" y="544" type="branch" />
            <wire x2="464" y1="544" y2="544" x1="400" />
            <wire x2="592" y1="544" y2="544" x1="464" />
            <wire x2="592" y1="544" y2="640" x1="592" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="1376" y="592" type="branch" />
            <wire x2="1376" y1="592" y2="592" x1="1296" />
            <wire x2="1504" y1="592" y2="592" x1="1376" />
            <wire x2="2128" y1="592" y2="592" x1="1504" />
            <wire x2="2704" y1="592" y2="592" x1="2128" />
            <wire x2="1504" y1="432" y2="592" x1="1504" />
            <wire x2="2128" y1="432" y2="592" x1="2128" />
            <wire x2="2704" y1="432" y2="592" x1="2704" />
        </branch>
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="3216" y="208" type="branch" />
            <wire x2="3216" y1="208" y2="208" x1="3088" />
            <wire x2="3296" y1="208" y2="208" x1="3216" />
        </branch>
        <branch name="QL12">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2544" y="208" type="branch" />
            <wire x2="2544" y1="208" y2="208" x1="2512" />
            <wire x2="2704" y1="208" y2="208" x1="2544" />
        </branch>
        <branch name="QL1">
            <attrtext style="alignment:SOFT-BCENTER;fontsize:32;fontname:Arial" attrname="Name" x="2016" y="208" type="branch" />
            <wire x2="2016" y1="208" y2="208" x1="1888" />
            <wire x2="2128" y1="208" y2="208" x1="2016" />
        </branch>
        <instance x="976" y="2528" name="XLXI_55" orien="R0" />
        <instance x="1472" y="1328" name="XLXI_82" orien="R0" />
        <instance x="2096" y="1328" name="XLXI_83" orien="R0" />
        <instance x="2672" y="1328" name="XLXI_84" orien="R0" />
        <instance x="1088" y="304" name="XLXI_85" orien="R0" />
        <instance x="1104" y="1168" name="XLXI_86" orien="R0" />
        <instance x="384" y="2368" name="XLXI_87" orien="R0" />
        <branch name="XLXN_211">
            <wire x2="1504" y1="208" y2="208" x1="1344" />
        </branch>
        <branch name="L">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1040" y="176" type="branch" />
            <wire x2="1040" y1="176" y2="176" x1="1008" />
            <wire x2="1088" y1="176" y2="176" x1="1040" />
        </branch>
        <branch name="QI">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1040" y="240" type="branch" />
            <wire x2="1040" y1="240" y2="240" x1="1008" />
            <wire x2="1088" y1="240" y2="240" x1="1040" />
        </branch>
        <branch name="XLXN_214">
            <wire x2="1472" y1="1072" y2="1072" x1="1360" />
        </branch>
        <branch name="R">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1056" y="1040" type="branch" />
            <wire x2="1056" y1="1040" y2="1040" x1="1040" />
            <wire x2="1104" y1="1040" y2="1040" x1="1056" />
        </branch>
        <branch name="QI">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1056" y="1104" type="branch" />
            <wire x2="1056" y1="1104" y2="1104" x1="1040" />
            <wire x2="1104" y1="1104" y2="1104" x1="1056" />
        </branch>
        <branch name="CLK">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1200" y="1376" type="branch" />
            <wire x2="1200" y1="1376" y2="1376" x1="1168" />
            <wire x2="1408" y1="1376" y2="1376" x1="1200" />
            <wire x2="1408" y1="880" y2="1200" x1="1408" />
            <wire x2="1408" y1="1200" y2="1376" x1="1408" />
            <wire x2="1472" y1="1200" y2="1200" x1="1408" />
            <wire x2="1984" y1="880" y2="880" x1="1408" />
            <wire x2="2592" y1="880" y2="880" x1="1984" />
            <wire x2="2592" y1="880" y2="1200" x1="2592" />
            <wire x2="2672" y1="1200" y2="1200" x1="2592" />
            <wire x2="1984" y1="880" y2="1200" x1="1984" />
            <wire x2="2096" y1="1200" y2="1200" x1="1984" />
        </branch>
        <branch name="RESET">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1184" y="1440" type="branch" />
            <wire x2="1184" y1="1440" y2="1440" x1="1136" />
            <wire x2="1472" y1="1440" y2="1440" x1="1184" />
            <wire x2="2096" y1="1440" y2="1440" x1="1472" />
            <wire x2="2672" y1="1440" y2="1440" x1="2096" />
            <wire x2="1472" y1="1296" y2="1440" x1="1472" />
            <wire x2="2096" y1="1296" y2="1440" x1="2096" />
            <wire x2="2672" y1="1296" y2="1440" x1="2672" />
        </branch>
        <branch name="XLXN_210">
            <wire x2="912" y1="2272" y2="2272" x1="640" />
            <wire x2="928" y1="2272" y2="2272" x1="912" />
            <wire x2="976" y1="2272" y2="2272" x1="928" />
        </branch>
        <branch name="QL1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="800" y="2336" type="branch" />
            <wire x2="800" y1="2336" y2="2336" x1="768" />
            <wire x2="976" y1="2336" y2="2336" x1="800" />
        </branch>
        <branch name="QL12">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="736" y="2400" type="branch" />
            <wire x2="736" y1="2400" y2="2400" x1="704" />
            <wire x2="976" y1="2400" y2="2400" x1="736" />
        </branch>
        <branch name="QL123">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="704" y="2464" type="branch" />
            <wire x2="704" y1="2464" y2="2464" x1="656" />
            <wire x2="976" y1="2464" y2="2464" x1="704" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="672" y="2592" type="branch" />
            <wire x2="672" y1="2592" y2="2592" x1="624" />
            <wire x2="928" y1="2592" y2="2592" x1="672" />
        </branch>
        <branch name="QR1">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="1952" y="1072" type="branch" />
            <wire x2="1952" y1="1072" y2="1072" x1="1856" />
            <wire x2="2096" y1="1072" y2="1072" x1="1952" />
        </branch>
        <branch name="QR12">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="2560" y="1072" type="branch" />
            <wire x2="2560" y1="1072" y2="1072" x1="2480" />
            <wire x2="2672" y1="1072" y2="1072" x1="2560" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="3120" y="1072" type="branch" />
            <wire x2="3120" y1="1072" y2="1072" x1="3056" />
            <wire x2="3152" y1="1072" y2="1072" x1="3120" />
        </branch>
        <branch name="QR123">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="288" y="2240" type="branch" />
            <wire x2="288" y1="2240" y2="2240" x1="256" />
            <wire x2="384" y1="2240" y2="2240" x1="288" />
        </branch>
        <branch name="QR12">
            <attrtext style="alignment:SOFT-BCENTER" attrname="Name" x="304" y="2304" type="branch" />
            <wire x2="304" y1="2304" y2="2304" x1="272" />
            <wire x2="384" y1="2304" y2="2304" x1="304" />
        </branch>
    </sheet>
</drawing>