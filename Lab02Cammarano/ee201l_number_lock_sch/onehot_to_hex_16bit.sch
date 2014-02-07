VERSION 6
BEGIN SCHEMATIC
    BEGIN ATTR DeviceFamilyName "spartan2"
        DELETE all:0
        EDITNAME all:0
        EDITTRAIT all:0
    END ATTR
    BEGIN NETLIST
        SIGNAL one_hot(5)
        SIGNAL one_hot(3)
        SIGNAL one_hot(7)
        SIGNAL one_hot(1)
        SIGNAL one_hot(13)
        SIGNAL one_hot(11)
        SIGNAL one_hot(15)
        SIGNAL one_hot(9)
        SIGNAL hex(1)
        SIGNAL one_hot(6)
        SIGNAL one_hot(2)
        SIGNAL one_hot(14)
        SIGNAL one_hot(10)
        SIGNAL hex(2)
        SIGNAL one_hot(4)
        SIGNAL one_hot(12)
        SIGNAL hex(3)
        SIGNAL one_hot(8)
        SIGNAL hex(0)
        SIGNAL one_hot(15:0)
        SIGNAL hex(3:0)
        PORT Input one_hot(15:0)
        PORT Output hex(3:0)
        BEGIN BLOCKDEF or8
            TIMESTAMP 2000 1 1 10 10 10
            LINE N 0 -64 48 -64 
            LINE N 0 -128 48 -128 
            LINE N 0 -192 48 -192 
            LINE N 0 -384 48 -384 
            LINE N 0 -448 48 -448 
            LINE N 0 -512 48 -512 
            LINE N 256 -288 192 -288 
            LINE N 0 -320 64 -320 
            LINE N 0 -256 64 -256 
            ARC N 28 -336 204 -160 192 -288 112 -336 
            LINE N 112 -240 48 -240 
            ARC N 28 -416 204 -240 112 -240 192 -288 
            ARC N -40 -344 72 -232 48 -240 48 -336 
            LINE N 112 -336 48 -336 
            LINE N 48 -336 48 -512 
            LINE N 48 -64 48 -240 
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
        BEGIN BLOCK XLXI_9 or8
            PIN I0 one_hot(15)
            PIN I1 one_hot(13)
            PIN I2 one_hot(11)
            PIN I3 one_hot(9)
            PIN I4 one_hot(7)
            PIN I5 one_hot(5)
            PIN I6 one_hot(3)
            PIN I7 one_hot(1)
            PIN O hex(0)
        END BLOCK
        BEGIN BLOCK XLXI_19 or8
            PIN I0 one_hot(15)
            PIN I1 one_hot(14)
            PIN I2 one_hot(11)
            PIN I3 one_hot(10)
            PIN I4 one_hot(7)
            PIN I5 one_hot(6)
            PIN I6 one_hot(3)
            PIN I7 one_hot(2)
            PIN O hex(1)
        END BLOCK
        BEGIN BLOCK XLXI_20 or8
            PIN I0 one_hot(15)
            PIN I1 one_hot(14)
            PIN I2 one_hot(13)
            PIN I3 one_hot(12)
            PIN I4 one_hot(7)
            PIN I5 one_hot(6)
            PIN I6 one_hot(5)
            PIN I7 one_hot(4)
            PIN O hex(2)
        END BLOCK
        BEGIN BLOCK XLXI_21 or8
            PIN I0 one_hot(15)
            PIN I1 one_hot(14)
            PIN I2 one_hot(13)
            PIN I3 one_hot(12)
            PIN I4 one_hot(11)
            PIN I5 one_hot(10)
            PIN I6 one_hot(9)
            PIN I7 one_hot(8)
            PIN O hex(3)
        END BLOCK
        BLOCK XLXI_22 USC_CENG_border
    END NETLIST
    BEGIN SHEET 1 2720 1760
        BEGIN BRANCH one_hot(5)
            WIRE 256 256 320 256
            WIRE 320 256 592 256
            BEGIN DISPLAY 320 256 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(3)
            WIRE 256 192 320 192
            WIRE 320 192 592 192
            BEGIN DISPLAY 320 192 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(7)
            WIRE 256 320 320 320
            WIRE 320 320 592 320
            BEGIN DISPLAY 320 320 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(1)
            WIRE 256 128 320 128
            WIRE 320 128 592 128
            BEGIN DISPLAY 320 128 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_9 592 640 R0
        BEGIN BRANCH one_hot(13)
            WIRE 256 512 320 512
            WIRE 320 512 592 512
            BEGIN DISPLAY 320 512 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(11)
            WIRE 256 448 320 448
            WIRE 320 448 592 448
            BEGIN DISPLAY 320 448 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(15)
            WIRE 256 576 320 576
            WIRE 320 576 592 576
            BEGIN DISPLAY 320 576 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(9)
            WIRE 256 384 320 384
            WIRE 320 384 592 384
            BEGIN DISPLAY 320 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH hex(1)
            WIRE 1984 384 2176 384
            WIRE 2176 384 2304 384
            BEGIN DISPLAY 2176 384 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(6)
            WIRE 1392 288 1456 288
            WIRE 1456 288 1728 288
            BEGIN DISPLAY 1456 288 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(3)
            WIRE 1392 224 1456 224
            WIRE 1456 224 1728 224
            BEGIN DISPLAY 1456 224 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(7)
            WIRE 1392 352 1456 352
            WIRE 1456 352 1728 352
            BEGIN DISPLAY 1456 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(2)
            WIRE 1392 160 1456 160
            WIRE 1456 160 1728 160
            BEGIN DISPLAY 1456 160 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(14)
            WIRE 1392 544 1456 544
            WIRE 1456 544 1728 544
            BEGIN DISPLAY 1456 544 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(11)
            WIRE 1392 480 1456 480
            WIRE 1456 480 1728 480
            BEGIN DISPLAY 1456 480 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(15)
            WIRE 1392 608 1456 608
            WIRE 1456 608 1728 608
            BEGIN DISPLAY 1456 608 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(10)
            WIRE 1392 416 1456 416
            WIRE 1456 416 1728 416
            BEGIN DISPLAY 1456 416 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_19 1728 672 R0
        BEGIN BRANCH hex(2)
            WIRE 816 976 1008 976
            WIRE 1008 976 1136 976
            BEGIN DISPLAY 1008 976 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(6)
            WIRE 224 880 304 880
            WIRE 304 880 560 880
            BEGIN DISPLAY 304 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(5)
            WIRE 224 816 304 816
            WIRE 304 816 560 816
            BEGIN DISPLAY 304 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(7)
            WIRE 224 944 320 944
            WIRE 320 944 560 944
            BEGIN DISPLAY 320 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(4)
            WIRE 224 752 304 752
            WIRE 304 752 560 752
            BEGIN DISPLAY 304 752 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(14)
            WIRE 224 1136 304 1136
            WIRE 304 1136 560 1136
            BEGIN DISPLAY 304 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(13)
            WIRE 224 1072 288 1072
            WIRE 288 1072 560 1072
            BEGIN DISPLAY 288 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(15)
            WIRE 224 1200 304 1200
            WIRE 304 1200 560 1200
            BEGIN DISPLAY 304 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(12)
            WIRE 224 1008 304 1008
            WIRE 304 1008 560 1008
            BEGIN DISPLAY 304 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_20 560 1264 R0
        BEGIN BRANCH hex(3)
            WIRE 2000 1040 2208 1040
            WIRE 2208 1040 2320 1040
            BEGIN DISPLAY 2208 1040 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(10)
            WIRE 1408 944 1472 944
            WIRE 1472 944 1744 944
            BEGIN DISPLAY 1472 944 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(9)
            WIRE 1408 880 1472 880
            WIRE 1472 880 1744 880
            BEGIN DISPLAY 1472 880 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(11)
            WIRE 1408 1008 1472 1008
            WIRE 1472 1008 1744 1008
            BEGIN DISPLAY 1472 1008 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(8)
            WIRE 1408 816 1472 816
            WIRE 1472 816 1744 816
            BEGIN DISPLAY 1472 816 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(14)
            WIRE 1408 1200 1472 1200
            WIRE 1472 1200 1744 1200
            BEGIN DISPLAY 1472 1200 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(13)
            WIRE 1408 1136 1472 1136
            WIRE 1472 1136 1744 1136
            BEGIN DISPLAY 1472 1136 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(15)
            WIRE 1408 1264 1488 1264
            WIRE 1488 1264 1744 1264
            BEGIN DISPLAY 1488 1264 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(12)
            WIRE 1408 1072 1472 1072
            WIRE 1472 1072 1744 1072
            BEGIN DISPLAY 1472 1072 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        INSTANCE XLXI_21 1744 1328 R0
        BEGIN BRANCH hex(0)
            WIRE 848 352 1008 352
            WIRE 1008 352 1168 352
            BEGIN DISPLAY 1008 352 ATTR Name
                ALIGNMENT SOFT-BCENTER
            END DISPLAY
        END BRANCH
        BEGIN BRANCH one_hot(15:0)
            WIRE 96 560 96 672
            WIRE 96 672 96 880
            BEGIN DISPLAY 96 672 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 96 560 one_hot(15:0) R270 28
        BEGIN BRANCH hex(3:0)
            WIRE 2496 576 2496 672
            WIRE 2496 672 2496 896
            BEGIN DISPLAY 2496 672 ATTR Name
                ALIGNMENT SOFT-TVCENTER
            END DISPLAY
        END BRANCH
        IOMARKER 2496 576 hex(3:0) R270 28
        INSTANCE XLXI_22 1984 1536 R0
        BEGIN DISPLAY 2156 1624 TEXT Detour
            FONT 20 "Arial"
        END DISPLAY
        BEGIN DISPLAY 2396 1628 TEXT "One Hot (16-bit) to HEX Converter"
            FONT 20 "Arial"
        END DISPLAY
    END SHEET
END SCHEMATIC
