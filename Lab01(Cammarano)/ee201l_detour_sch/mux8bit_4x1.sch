VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL A(0)
        SIGNAL B(0)
        SIGNAL C(0)
        SIGNAL D(0)
        SIGNAL S0
        SIGNAL A(1)
        SIGNAL B(1)
        SIGNAL C(1)
        SIGNAL D(1)
        SIGNAL A(2)
        SIGNAL B(2)
        SIGNAL C(2)
        SIGNAL D(2)
        SIGNAL A(3)
        SIGNAL B(3)
        SIGNAL C(3)
        SIGNAL D(3)
        SIGNAL S1
        SIGNAL B(7:0)
        SIGNAL C(7:0)
        SIGNAL A(7:0)
        SIGNAL D(7:0)
        SIGNAL O(7:0)
        SIGNAL A(4)
        SIGNAL B(4)
        SIGNAL C(4)
        SIGNAL D(4)
        SIGNAL XLXN_53
        SIGNAL A(5)
        SIGNAL B(5)
        SIGNAL C(5)
        SIGNAL D(5)
        SIGNAL A(6)
        SIGNAL B(6)
        SIGNAL C(6)
        SIGNAL D(6)
        SIGNAL A(7)
        SIGNAL B(7)
        SIGNAL C(7)
        SIGNAL D(7)
        SIGNAL O(0)
        SIGNAL O(1)
        SIGNAL O(2)
        SIGNAL O(3)
        SIGNAL O(4)
        SIGNAL O(5)
        SIGNAL O(6)
        SIGNAL O(7)
        PORT Input S0
        PORT Input S1
        PORT Input B(7:0)
        PORT Input C(7:0)
        PORT Input A(7:0)
        PORT Input D(7:0)
        PORT Output O(7:0)
        BEGIN BLOCKDEF m4_1e
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -416 96 -416 
            LINE N 0 -352 96 -352 
            LINE N 0 -288 96 -288 
            LINE N 0 -224 96 -224 
            LINE N 0 -32 96 -32 
            LINE N 320 -320 256 -320 
            LINE N 0 -160 96 -160 
            LINE N 0 -96 96 -96 
            LINE N 176 -96 96 -96 
            LINE N 176 -208 176 -96 
            LINE N 224 -32 96 -32 
            LINE N 224 -216 224 -32 
            LINE N 256 -224 96 -192 
            LINE N 256 -416 256 -224 
            LINE N 96 -448 256 -416 
            LINE N 96 -192 96 -448 
            LINE N 128 -160 96 -160 
            LINE N 128 -200 128 -160 
        END BLOCKDEF
        BEGIN BLOCKDEF vcc
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 64 -32 64 -64 
            LINE N 64 0 64 -32 
            LINE N 96 -64 32 -64 
        END BLOCKDEF
        BEGIN BLOCKDEF USC_CENG_border
            TIMESTAMP 2008 2 4 4 45 44
            RECTANGLE N 0 -32 724 204 
            LINE N 0 60 724 60 
            LINE N 0 108 724 108 
            LINE N 0 152 724 152 
            LINE N 352 152 352 108 
            LINE N 368 60 368 108 
        END BLOCKDEF
        BEGIN BLOCK XLXI_17 m4_1e
            PIN D0 A(1)
            PIN D1 B(1)
            PIN D2 C(1)
            PIN D3 D(1)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(1)
        END BLOCK
        BEGIN BLOCK XLXI_16 m4_1e
            PIN D0 A(0)
            PIN D1 B(0)
            PIN D2 C(0)
            PIN D3 D(0)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(0)
        END BLOCK
        BEGIN BLOCK XLXI_18 m4_1e
            PIN D0 A(2)
            PIN D1 B(2)
            PIN D2 C(2)
            PIN D3 D(2)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(2)
        END BLOCK
        BEGIN BLOCK XLXI_19 m4_1e
            PIN D0 A(3)
            PIN D1 B(3)
            PIN D2 C(3)
            PIN D3 D(3)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(3)
        END BLOCK
        BEGIN BLOCK XLXI_30 m4_1e
            PIN D0 A(4)
            PIN D1 B(4)
            PIN D2 C(4)
            PIN D3 D(4)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(4)
        END BLOCK
        BEGIN BLOCK XLXI_31 m4_1e
            PIN D0 A(5)
            PIN D1 B(5)
            PIN D2 C(5)
            PIN D3 D(5)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(5)
        END BLOCK
        BEGIN BLOCK XLXI_32 m4_1e
            PIN D0 A(6)
            PIN D1 B(6)
            PIN D2 C(6)
            PIN D3 D(6)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(6)
        END BLOCK
        BEGIN BLOCK XLXI_33 m4_1e
            PIN D0 A(7)
            PIN D1 B(7)
            PIN D2 C(7)
            PIN D3 D(7)
            PIN E XLXN_53
            PIN S0 S0
            PIN S1 S1
            PIN O O(7)
        END BLOCK
        BEGIN BLOCK XLXI_34 vcc
            PIN P XLXN_53
        END BLOCK
        BLOCK XLXI_36 USC_CENG_border
    END NETLIST
    BEGIN SHEET 1 3520 2720
        INSTANCE XLXI_16 944 592 R0
        INSTANCE XLXI_17 944 1088 R0
        INSTANCE XLXI_18 928 1584 R0
        INSTANCE XLXI_19 928 2080 R0
        BEGIN BRANCH A(0)
            WIRE 736 176 784 176
            WIRE 784 176 944 176
            BEGIN DISPLAY 784 176 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(0)
            WIRE 736 240 784 240
            WIRE 784 240 944 240
            BEGIN DISPLAY 784 240 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(0)
            WIRE 736 304 784 304
            WIRE 784 304 944 304
            BEGIN DISPLAY 784 304 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(0)
            WIRE 736 368 784 368
            WIRE 784 368 944 368
            BEGIN DISPLAY 784 368 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 640 432 672 432
            WIRE 672 432 944 432
            BEGIN DISPLAY 672 432 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 640 496 656 496
            WIRE 656 496 944 496
            BEGIN DISPLAY 656 496 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(1)
            WIRE 736 672 800 672
            WIRE 800 672 944 672
            BEGIN DISPLAY 800 672 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(1)
            WIRE 736 736 784 736
            WIRE 784 736 944 736
            BEGIN DISPLAY 784 736 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(1)
            WIRE 736 800 784 800
            WIRE 784 800 944 800
            BEGIN DISPLAY 784 800 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(1)
            WIRE 736 864 784 864
            WIRE 784 864 944 864
            BEGIN DISPLAY 784 864 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 640 928 672 928
            WIRE 672 928 944 928
            BEGIN DISPLAY 672 928 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 640 992 672 992
            WIRE 672 992 944 992
            BEGIN DISPLAY 672 992 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(2)
            WIRE 720 1168 768 1168
            WIRE 768 1168 928 1168
            BEGIN DISPLAY 768 1168 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(2)
            WIRE 720 1232 768 1232
            WIRE 768 1232 928 1232
            BEGIN DISPLAY 768 1232 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(2)
            WIRE 720 1296 768 1296
            WIRE 768 1296 928 1296
            BEGIN DISPLAY 768 1296 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(2)
            WIRE 720 1360 768 1360
            WIRE 768 1360 928 1360
            BEGIN DISPLAY 768 1360 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 624 1424 656 1424
            WIRE 656 1424 928 1424
            BEGIN DISPLAY 656 1424 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 624 1488 656 1488
            WIRE 656 1488 928 1488
            BEGIN DISPLAY 656 1488 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(3)
            WIRE 720 1664 768 1664
            WIRE 768 1664 928 1664
            BEGIN DISPLAY 768 1664 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(3)
            WIRE 720 1728 752 1728
            WIRE 752 1728 928 1728
            BEGIN DISPLAY 752 1728 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(3)
            WIRE 720 1792 752 1792
            WIRE 752 1792 928 1792
            BEGIN DISPLAY 752 1792 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(3)
            WIRE 720 1856 768 1856
            WIRE 768 1856 928 1856
            BEGIN DISPLAY 768 1856 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 624 1920 656 1920
            WIRE 656 1920 928 1920
            BEGIN DISPLAY 656 1920 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 624 1984 656 1984
            WIRE 656 1984 928 1984
            BEGIN DISPLAY 656 1984 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(7:0)
            WIRE 192 720 192 864
        END BRANCH
        IOMARKER 192 720 B(7:0) R270 28
        BEGIN BRANCH C(7:0)
            WIRE 256 720 256 864
        END BRANCH
        IOMARKER 256 720 C(7:0) R270 28
        BEGIN BRANCH A(7:0)
            WIRE 128 704 128 864
        END BRANCH
        IOMARKER 128 704 A(7:0) R270 28
        BEGIN BRANCH D(7:0)
            WIRE 336 720 336 864
        END BRANCH
        IOMARKER 336 720 D(7:0) R270 28
        BEGIN BRANCH S1
            WIRE 160 992 368 992
        END BRANCH
        IOMARKER 160 992 S1 R180 28
        BEGIN BRANCH O(7:0)
            WIRE 112 1088 288 1088
        END BRANCH
        IOMARKER 288 1088 O(7:0) R0 28
        BEGIN BRANCH A(4)
            WIRE 1856 160 1920 160
            WIRE 1920 160 2064 160
            BEGIN DISPLAY 1920 160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(4)
            WIRE 1856 224 1920 224
            WIRE 1920 224 2064 224
            BEGIN DISPLAY 1920 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(4)
            WIRE 1856 288 1920 288
            WIRE 1920 288 2064 288
            BEGIN DISPLAY 1920 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(4)
            WIRE 1856 352 1920 352
            WIRE 1920 352 2064 352
            BEGIN DISPLAY 1920 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 1760 416 1808 416
            WIRE 1808 416 2064 416
            BEGIN DISPLAY 1808 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1760 480 1808 480
            WIRE 1808 480 2064 480
            BEGIN DISPLAY 1808 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(5)
            WIRE 1856 656 1904 656
            WIRE 1904 656 2064 656
            BEGIN DISPLAY 1904 656 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(5)
            WIRE 1856 720 1904 720
            WIRE 1904 720 2064 720
            BEGIN DISPLAY 1904 720 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(5)
            WIRE 1856 784 1920 784
            WIRE 1920 784 2064 784
            BEGIN DISPLAY 1920 784 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(5)
            WIRE 1856 848 1904 848
            WIRE 1904 848 2064 848
            BEGIN DISPLAY 1904 848 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 1760 912 1808 912
            WIRE 1808 912 2064 912
            BEGIN DISPLAY 1808 912 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1760 976 1808 976
            WIRE 1808 976 2064 976
            BEGIN DISPLAY 1808 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(6)
            WIRE 1840 1152 1888 1152
            WIRE 1888 1152 2048 1152
            BEGIN DISPLAY 1888 1152 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(6)
            WIRE 1840 1216 1888 1216
            WIRE 1888 1216 2048 1216
            BEGIN DISPLAY 1888 1216 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(6)
            WIRE 1840 1280 1888 1280
            WIRE 1888 1280 2048 1280
            BEGIN DISPLAY 1888 1280 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(6)
            WIRE 1840 1344 1888 1344
            WIRE 1888 1344 2048 1344
            BEGIN DISPLAY 1888 1344 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 1744 1408 1792 1408
            WIRE 1792 1408 2048 1408
            BEGIN DISPLAY 1792 1408 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1744 1472 1792 1472
            WIRE 1792 1472 2048 1472
            BEGIN DISPLAY 1792 1472 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH A(7)
            WIRE 1840 1648 1888 1648
            WIRE 1888 1648 2048 1648
            BEGIN DISPLAY 1888 1648 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH B(7)
            WIRE 1840 1712 1888 1712
            WIRE 1888 1712 2048 1712
            BEGIN DISPLAY 1888 1712 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH C(7)
            WIRE 1840 1776 1888 1776
            WIRE 1888 1776 2048 1776
            BEGIN DISPLAY 1888 1776 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH D(7)
            WIRE 1840 1840 1904 1840
            WIRE 1904 1840 2048 1840
            BEGIN DISPLAY 1904 1840 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 1744 1904 1792 1904
            WIRE 1792 1904 2048 1904
            BEGIN DISPLAY 1792 1904 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S1
            WIRE 1744 1968 1792 1968
            WIRE 1792 1968 2048 1968
            BEGIN DISPLAY 1792 1968 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_30 2064 576 R0
        INSTANCE XLXI_31 2064 1072 R0
        INSTANCE XLXI_32 2048 1568 R0
        INSTANCE XLXI_33 2048 2064 R0
        BEGIN BRANCH O(0)
            WIRE 1264 272 1328 272
            WIRE 1328 272 1392 272
            BEGIN DISPLAY 1328 272 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(1)
            WIRE 1264 768 1328 768
            WIRE 1328 768 1392 768
            BEGIN DISPLAY 1328 768 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(2)
            WIRE 1248 1264 1328 1264
            WIRE 1328 1264 1392 1264
            BEGIN DISPLAY 1328 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(3)
            WIRE 1248 1760 1344 1760
            WIRE 1344 1760 1408 1760
            BEGIN DISPLAY 1344 1760 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(4)
            WIRE 2384 256 2480 256
            WIRE 2480 256 2544 256
            BEGIN DISPLAY 2480 256 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(5)
            WIRE 2384 752 2496 752
            WIRE 2496 752 2560 752
            BEGIN DISPLAY 2496 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(6)
            WIRE 2368 1248 2496 1248
            WIRE 2496 1248 2560 1248
            BEGIN DISPLAY 2496 1248 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH O(7)
            WIRE 2368 1744 2512 1744
            WIRE 2512 1744 2576 1744
            BEGIN DISPLAY 2512 1744 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH S0
            WIRE 160 928 368 928
        END BRANCH
        IOMARKER 160 928 S0 R180 28
        BEGIN BRANCH XLXN_53
            WIRE 896 560 944 560
            WIRE 896 560 896 1056
            WIRE 896 1056 944 1056
            WIRE 896 1056 896 1552
            WIRE 896 1552 928 1552
            WIRE 896 1552 896 2048
            WIRE 896 2048 928 2048
            WIRE 896 2048 896 2144
            WIRE 896 2144 2016 2144
            WIRE 896 2144 896 2320
            WIRE 896 2320 1008 2320
            WIRE 1008 2304 1008 2320
            WIRE 2016 544 2064 544
            WIRE 2016 544 2016 1040
            WIRE 2016 1040 2064 1040
            WIRE 2016 1040 2016 1536
            WIRE 2016 1536 2048 1536
            WIRE 2016 1536 2016 2032
            WIRE 2016 2032 2048 2032
            WIRE 2016 2032 2016 2144
        END BRANCH
        INSTANCE XLXI_34 944 2304 R0
        INSTANCE XLXI_36 2784 2512 R0
        BEGIN DISPLAY 2940 2596 TEXT Detour
            FONT 24 "Arial"
        END DISPLAY
        BEGIN DISPLAY 3244 2596 TEXT mux8bit_4x1
            FONT 24 "Arial"
        END DISPLAY
    END SHEET
END SCHEMATIC
