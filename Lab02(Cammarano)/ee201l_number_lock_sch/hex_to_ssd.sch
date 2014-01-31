VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL ssd(0)
        SIGNAL hex(0)
        SIGNAL hex(1)
        SIGNAL hex(2)
        SIGNAL hex(3)
        SIGNAL hex(3:0)
        SIGNAL ssd(2)
        SIGNAL ssd(4)
        SIGNAL ssd(5)
        SIGNAL ssd(3)
        SIGNAL ssd(1)
        SIGNAL ssd(7)
        SIGNAL ssd(6)
        SIGNAL ssd(7:0)
        PORT Input hex(3:0)
        PORT Output ssd(7:0)
        BEGIN BLOCKDEF rom16x1
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -128 64 -128 
            LINE N 0 -192 64 -192 
            LINE N 0 -256 64 -256 
            LINE N 0 -320 64 -320 
            RECTANGLE N 64 -384 320 -64 
            LINE N 384 -320 320 -320 
        END BLOCKDEF
        BEGIN BLOCKDEF USC_CENG_border
            TIMESTAMP 2008 2 4 4 45 46
            RECTANGLE N 0 -32 724 204 
            LINE N 0 60 724 60 
            LINE N 0 108 724 108 
            LINE N 0 152 724 152 
            LINE N 352 152 352 108 
            LINE N 368 60 368 108 
        END BLOCKDEF
        BEGIN BLOCK Ca rom16x1
            BEGIN ATTR INIT "2812"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(0)
        END BLOCK
        BLOCK XLXI_1 USC_CENG_border
        BEGIN BLOCK Cc rom16x1
            BEGIN ATTR INIT "D004"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(2)
        END BLOCK
        BEGIN BLOCK Ce rom16x1
            BEGIN ATTR INIT "02BA"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(4)
        END BLOCK
        BEGIN BLOCK Cf rom16x1
            BEGIN ATTR INIT "208E"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(5)
        END BLOCK
        BEGIN BLOCK Cd rom16x1
            BEGIN ATTR INIT "8492"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(3)
        END BLOCK
        BEGIN BLOCK Cb rom16x1
            BEGIN ATTR INIT "D860"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(1)
        END BLOCK
        BEGIN BLOCK Dp rom16x1
            BEGIN ATTR INIT "ffff"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(7)
        END BLOCK
        BEGIN BLOCK Cg rom16x1
            BEGIN ATTR INIT "1083"
                VERILOG all:0 dp:1nosynth wsynop:1 wsynth:1
                VHDL all:0 gm:1nosynth wa:1 wd:1
                VALUETYPE BitVector 16 h
            END ATTR
            PIN A0 hex(0)
            PIN A1 hex(1)
            PIN A2 hex(2)
            PIN A3 hex(3)
            PIN O ssd(6)
        END BLOCK
    END NETLIST
    BEGIN SHEET 1 2720 1760
        BEGIN INSTANCE Ca 592 544 R0
            BEGIN DISPLAY 176 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -200 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(0)
            WIRE 976 224 1024 224
            WIRE 1024 224 1040 224
            BEGIN DISPLAY 1024 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3:0)
            WIRE 144 320 144 528
            WIRE 144 528 144 704
            BEGIN DISPLAY 144 528 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 144 320 hex(3:0) R270 28
        BEGIN BRANCH hex(3)
            WIRE 400 416 464 416
            WIRE 464 416 592 416
            BEGIN DISPLAY 464 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 400 352 464 352
            WIRE 464 352 592 352
            BEGIN DISPLAY 464 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 400 288 464 288
            WIRE 464 288 592 288
            BEGIN DISPLAY 464 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 400 224 464 224
            WIRE 464 224 592 224
            BEGIN DISPLAY 464 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH ssd(2)
            WIRE 2464 224 2496 224
            WIRE 2496 224 2512 224
            BEGIN DISPLAY 2496 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 1888 224 1952 224
            WIRE 1952 224 2080 224
            BEGIN DISPLAY 1952 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1888 288 1952 288
            WIRE 1952 288 2080 288
            BEGIN DISPLAY 1952 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 1888 352 1952 352
            WIRE 1952 352 2080 352
            BEGIN DISPLAY 1952 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 1888 416 1952 416
            WIRE 1952 416 2080 416
            BEGIN DISPLAY 1952 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Cc 2080 544 R0
            BEGIN DISPLAY 176 -232 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -184 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(4)
            WIRE 1696 656 1744 656
            WIRE 1744 656 1776 656
            BEGIN DISPLAY 1744 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 1120 656 1184 656
            WIRE 1184 656 1312 656
            BEGIN DISPLAY 1184 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1120 720 1184 720
            WIRE 1184 720 1312 720
            BEGIN DISPLAY 1184 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 1120 784 1184 784
            WIRE 1184 784 1312 784
            BEGIN DISPLAY 1184 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 1120 848 1184 848
            WIRE 1184 848 1312 848
            BEGIN DISPLAY 1184 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Ce 1312 976 R0
            BEGIN DISPLAY 192 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -200 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(5)
            WIRE 2464 656 2496 656
            WIRE 2496 656 2528 656
            BEGIN DISPLAY 2496 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 1888 656 1952 656
            WIRE 1952 656 2080 656
            BEGIN DISPLAY 1952 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1888 720 1952 720
            WIRE 1952 720 2080 720
            BEGIN DISPLAY 1952 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 1888 784 1952 784
            WIRE 1952 784 2080 784
            BEGIN DISPLAY 1952 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 1888 848 1952 848
            WIRE 1952 848 2080 848
            BEGIN DISPLAY 1952 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Cf 2080 976 R0
            BEGIN DISPLAY 192 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -200 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        INSTANCE XLXI_1 1984 1536 R0
        BEGIN DISPLAY 2428 1628 TEXT "HEX to SSD Converter"
            FONT 24 "Arial"
        END DISPLAY
        BEGIN DISPLAY 2144 1628 TEXT Detour
            FONT 24 "Arial"
        END DISPLAY
        BEGIN BRANCH ssd(3)
            WIRE 976 656 1024 656
            WIRE 1024 656 1040 656
            BEGIN DISPLAY 1024 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 400 656 464 656
            WIRE 464 656 592 656
            BEGIN DISPLAY 464 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 400 720 464 720
            WIRE 464 720 592 720
            BEGIN DISPLAY 464 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 400 784 464 784
            WIRE 464 784 592 784
            BEGIN DISPLAY 464 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 400 848 464 848
            WIRE 464 848 592 848
            BEGIN DISPLAY 464 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Cd 592 976 R0
            BEGIN DISPLAY 176 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -200 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(1)
            WIRE 1696 224 1712 224
            WIRE 1712 224 1728 224
            BEGIN DISPLAY 1712 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 1120 224 1168 224
            WIRE 1168 224 1312 224
            BEGIN DISPLAY 1168 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1120 288 1168 288
            WIRE 1168 288 1312 288
            BEGIN DISPLAY 1168 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 1120 352 1168 352
            WIRE 1168 352 1312 352
            BEGIN DISPLAY 1168 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 1120 416 1168 416
            WIRE 1168 416 1312 416
            BEGIN DISPLAY 1168 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Cb 1312 544 R0
            BEGIN DISPLAY 192 -232 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -184 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(7)
            WIRE 1696 1104 1728 1104
            WIRE 1728 1104 1760 1104
            BEGIN DISPLAY 1728 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 1120 1296 1184 1296
            WIRE 1184 1296 1312 1296
            BEGIN DISPLAY 1184 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 1120 1232 1184 1232
            WIRE 1184 1232 1312 1232
            BEGIN DISPLAY 1184 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1120 1168 1184 1168
            WIRE 1184 1168 1312 1168
            BEGIN DISPLAY 1184 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 1120 1104 1184 1104
            WIRE 1184 1104 1312 1104
            BEGIN DISPLAY 1184 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Dp 1312 1424 R0
            BEGIN DISPLAY 192 -232 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 128 -184 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(6)
            WIRE 976 1104 1008 1104
            WIRE 1008 1104 1040 1104
            BEGIN DISPLAY 1008 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(0)
            WIRE 400 1104 464 1104
            WIRE 464 1104 592 1104
            BEGIN DISPLAY 464 1104 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 400 1168 464 1168
            WIRE 464 1168 592 1168
            BEGIN DISPLAY 464 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(2)
            WIRE 400 1232 464 1232
            WIRE 464 1232 592 1232
            BEGIN DISPLAY 464 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(3)
            WIRE 400 1296 464 1296
            WIRE 464 1296 592 1296
            BEGIN DISPLAY 464 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN INSTANCE Cg 592 1424 R0
            BEGIN DISPLAY 192 -248 ATTR InstName
                FONT 28 "Arial"
            END DISPLAY
            BEGIN DISPLAY 144 -200 ATTR INIT
                FONT 28 "Arial"
                DISPLAYFORMAT NAMEEQUALSVALUE
            END DISPLAY
        END INSTANCE
        BEGIN BRANCH ssd(7:0)
            WIRE 2640 528 2640 704
            WIRE 2640 704 2640 992
            BEGIN DISPLAY 2640 704 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2640 528 ssd(7:0) R270 28
    END SHEET
END SCHEMATIC
