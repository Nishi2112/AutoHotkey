#NoEnv
#SingleInstance force
SendMode Input
SetWorkingDir %A_ScriptDir%

/* メモ
Shift   +
Ctrl    ^
Alt     !
Win     #
*/

; グローバル変数
global F13_press_time := 0
global F13_long_press := 0
global F13_threshold := 300 ; ☆1 タップ判別時間 (ミリ秒単位)

; F13タップ/ホールド機能
    ; F13キーが押されたとき
        F13::
            F13_press_time := A_TickCount  ; 押された時刻を記録
            F13_long_press := 0  ; 長押しフラグをリセット
            
            ; キーが離されるまで待機
            KeyWait, F13
            
            ; 押されていた時間を計算
            press_duration := A_TickCount - F13_press_time
            
            ; 長押しフラグがセットされていない、かつ押されていた時間が閾値未満の場合のみ Alt+Tab を実行
            if (!F13_long_press && press_duration < F13_threshold) {
                Send, !{Tab}
            }
            return

        ; F13のホットキー組み合わせ
            #If GetKeyState("F13", "P")  ; F13が押されている間のみ有効

                ; 長押し検出用タイマー
                SetTimer, CheckF13LongPress1, 300    ; ☆1 タップ判別タイマー更新時間 (ミリ秒単位)
                return

                CheckF13LongPress1:
                    if GetKeyState("F13", "P") {
                        if (A_TickCount - F13_press_time >= F13_threshold) {
                            F13_long_press := 1
                        }
                    }
                    return

                ; F13組み合わせホットキー
                    WheelUp::
                        F13_long_press := 1
                        Send,^{+}
                        Return

                    WheelDown::
                        F13_long_press := 1
                        Send,^{-}
                        Return

                    Up::
                        F13_long_press := 1
                        Send,{Blind}{WheelUp}
                        Return

                    Left::
                        F13_long_press := 1
                        Send,{Blind}{WheelLeft}
                        Return

                    Down::
                        F13_long_press := 1
                        Send,{Blind}{WheelDown}
                        Return

                    Right::
                        F13_long_press := 1
                        Send,{Blind}{WheelRight}
                        Return

                    Pgup::
                        F13_long_press := 1
                        Send,{Blind}{WheelUp 5}
                        Return

                    Home::
                        F13_long_press := 1
                        Send,{Blind}{WheelLeft 5}
                        Return  

                    Pgdn::
                        F13_long_press := 1
                        Send,{Blind}{WheelDown 5}
                        Return

                    End::
                        F13_long_press := 1
                        Send,{Blind}{WheelRight 5}
                        Return

                    F1::
                        F13_long_press := 1
                        IME_SET(0)
                        Send,shota623hatabo
                        Return

                    F2::
                        F13_long_press := 1
                        IME_SET(0)
                        Send,b1401009@gl.aiu.ac.jp
                        Return

                    F3::
                        F13_long_press := 1
                        IME_SET(0)
                        Send,s-nishide@meihonet.co.jp
                        Return

                    F4::
                        F13_long_press := 1
                        IME_SET(0)
                        Send,snishide1111@gmail.com
                        Return

                    F5::
                        F13_long_press := 1
                        Send,{LCtrl down}
                        Send,{v}
                        Send,{g}
                        Send,{x}
                        Send,{LCtrl up}
                        Return

                    F6::
                        F13_long_press := 1
                        IME_SET(0)
                        Send,\\192.168.119.6
                        Return     

                    Delete::
                        F13_long_press := 1
                        Send,+{End}
                        Send,{Delete}
                        Return

                    Bs::
                        F13_long_press := 1
                        Send,+{Home}
                        Send,{Bs}
                        Return

            #If

        #If GetKeyState("F13", "P") and WinActive("ahk_exe Obsidian.exe")

            ; 長押し検出用タイマー
            SetTimer, CheckF13LongPress2, 300    ; ☆1 タップ判別タイマー更新時間 (ミリ秒単位)
            return

            CheckF13LongPress2:
                if GetKeyState("F13", "P") {
                    if (A_TickCount - F13_press_time >= F13_threshold) {
                        F13_long_press := 1
                    }
                }
                return

            ; Obsidian専用F13ホットキー
                tab::
                    F13_long_press := 1
                    Send,+!{enter}
                    Return
                esc::
                    F13_long_press := 1
                    Send,+!{esc}
                    Return

                f1::
                    F13_long_press := 1
                    Send,+!{f1}
                    Return
                f2::
                    F13_long_press := 1
                    Send,+!{f2}
                    Return
                f3::
                    F13_long_press := 1
                    Send,+!{f3}
                    Return
                f4::
                    F13_long_press := 1
                    Send,+!{f4}
                    Return
                f5::
                    F13_long_press := 1
                    Send,+!{f5}
                    Return
                f6::
                    F13_long_press := 1
                    Send,+!{f6}
                    Return
                f7::
                    F13_long_press := 1
                    Send,+!{f7}
                    Return
                f8::
                    F13_long_press := 1
                    Send,+!{f8}
                    Return
                f9::
                    F13_long_press := 1
                    Send,+!{f9}
                    Return
                f10::
                    F13_long_press := 1
                    Send,+!{f10}
                    Return
                f11::
                    F13_long_press := 1
                    Send,+!{f11}
                    Return
                f12::
                    F13_long_press := 1
                    Send,+!{f12}
                    Return

                1::
                    F13_long_press := 1
                    Send,+!{1}
                    Return
                2::
                    F13_long_press := 1
                    Send,+!{2}
                    Return
                3::
                    F13_long_press := 1
                    Send,+!{3}
                    Return
                4::
                    F13_long_press := 1
                    Send,+!{4}
                    Return
                5::
                    F13_long_press := 1
                    Send,+!{5}
                    Return
                6::
                    F13_long_press := 1
                    Send,+!{6}
                    Return
                7::
                    F13_long_press := 1
                    Send,+!{7}
                    Return
                8::
                    F13_long_press := 1
                    Send,+!{8}
                    Return
                9::
                    F13_long_press := 1
                    Send,+!{9}
                    Return
                0::
                    F13_long_press := 1
                    Send,+!{0}
                    Return

                q::
                    F13_long_press := 1
                    Send,+!{q}
                    Return
                a::
                    F13_long_press := 1
                    Send,+!{a}
                    Return
                z::
                    F13_long_press := 1
                    Send,+!{z}
                    Return
                w::
                    F13_long_press := 1
                    Send,+!{w}
                    Return
                s::
                    F13_long_press := 1
                    Send,+!{s}
                    Return
                x::
                    F13_long_press := 1
                    Send,+!{x}
                    Return
                e::
                    F13_long_press := 1
                    Send,+!{e}
                    Return
                d::
                    F13_long_press := 1
                    Send,+!{d}
                    Return
                c::
                    F13_long_press := 1
                    Send,+!{c}
                    Return
                r::
                    F13_long_press := 1
                    Send,+!{r}
                    Return
                f::
                    F13_long_press := 1
                    Send,+!{f}
                    Return
                v::
                    F13_long_press := 1
                    Send,+!{v}
                    Return
                t::
                    F13_long_press := 1
                    Send,+!{t}
                    Return
                g::
                    F13_long_press := 1
                    Send,+!{g}
                    Return
                b::
                    F13_long_press := 1
                    Send,+!{b}
                    Return
                y::
                    F13_long_press := 1
                    Send,+!{y}
                    Return
                h::
                    F13_long_press := 1
                    Send,+!{h}
                    Return
                n::
                    F13_long_press := 1
                    Send,+!{n}
                    Return
                u::
                    F13_long_press := 1
                    Send,+!{u}
                    Return
                j::
                    F13_long_press := 1
                    Send,+!{j}
                    Return
                m::
                    F13_long_press := 1
                    Send,+!{m}
                    Return
                i::
                    F13_long_press := 1
                    Send,+!{i}
                    Return
                k::
                    F13_long_press := 1
                    Send,+!{k}
                    Return
                o::
                    F13_long_press := 1
                    Send,+!{o}
                    Return
                l::
                    F13_long_press := 1
                    Send,+!{l}
                    Return
                p::
                    F13_long_press := 1
                    Send,+!{p}
                    Return

        #If

; 無変換(F14)
    F14::LButton

; 変換(F15)
    F15::AppsKey
    ; F15::RButton

; Snugon 中指手前(F23)
    F23::^!Tab

; Snugon 薬指手前(F24)
    F24::#Tab

; ひらがな・カタカナ(F16)
    ;スクロールモード切り替え(AHKWheelBall)

; 右モディファイアキー ※無効中
    /*
        >+Up::
            Send,{WheelUp}
            Return
        >+Left::
            Send,{WheelLeft}
            Return
        >+Down::
            Send,{WheelDown}
            Return
        >+Right::
            Send,{WheelRight}
            Return

        >+>^Up::
            Send,{WheelUp 5}
            Return
        >+>^Left::
            Send,{WheelLeft 5}
            Return
        >+>^Down::
            Send,{WheelDown 5}
            Return
        >+>^Right::
            Send,{WheelRight 5}
            Return

        >^Up::
            Send,{Pgup}
            Return
        >^Left::
            Send,{Home}
            Return
        >^Down::
            Send,{PgDn}
            Return
        >^Right::
            Send,{End}
            Return
    */

; Ctrl + Shift
    ; AHKリロード
        ^+F5::
            Reload
            Return 

    ; テキスト貼り付け
        ^+v::
            clipboard = %clipboard%  ;プレーンテキストに変換
            Send,^v
            Return

    ; アンダーバー
        ^+_::
            IME_SET(0)
            Send,_
            return

    ; 日付 yyyy/mm/dd
        ^+s::            
            TimeString = A_Now
            FormatTime, TimeString, TimeString, yyyy/MM/dd

            IME_SET(0)
            Send,%TimeString%
            Return

    ; 日付 (yyyymmdd)
        ^+x::    
            TimeString = A_Now
            FormatTime, TimeString, TimeString, yyyyMMdd

            IME_SET(0)
            Send,%TimeString%
            return

    ; (円弧カッコ囲い)
        ^+8::
            Send,^x
            IME_SET(0)
            Send,(
            Send,^v
            Sleep 100
            Send,)
            return

    ; 「鍵カッコ囲い」
        ^+[::
            Send,^x
            IME_SET(0)
            Send,「
            Send,^v
            Sleep 100
            Send,」
            return

    ; 【角カッコ囲い】
        ^+]::
            Send,^x
            IME_SET(0)
            Send,【
            Send,^v
            Sleep 100
            Send,】
            return

    ; "ダブルクォーテーション囲い"
        ^+2::
            Send,^x
            IME_SET(0)
            Send,"
            Send,^v
            Sleep 100
            Send,"
            return

; Ctrl + Alt + Q ウインドウを常に最前面に表示する(全面固定)
    ^!q::
        Winset, AlwaysOnTop, , A

        WinGetTitle, windowTitle, A

        isAlwaysOnTop := IsWindowAlwaysOnTop(windowTitle)

        ; 最前面表示ONになった場合、他のウィンドウは最前面OFFにする
        if isAlwaysOnTop {
            WinGet, windowTitleList, List, , , %windowTitle%
            Loop, %windowTitleList% {
                StringTrimRight, this_id, windowTitleList%A_Index%, 0
                Winset, AlwaysOnTop, Off, ahk_id %this_id%
            }
        }

        ; メッセージ表示
            ShowMessage(isAlwaysOnTop)

        Sleep 500 ; 0.5秒待つ

        ; メッセージ消す
            HideMessage()
            return

        ShowMessage(isAlwaysOnTop) {
            if isAlwaysOnTop {
                message := "最前面表示`nオン"
            }
            else { 
                message := "最前面表示`nオフ"
            }
            Progress, B ZH0 FS18 WS700 CTeeeeee CW333333, %message%, , , メイリオ
        }

        IsWindowAlwaysOnTop(windowTitle) {
            WinGet, windowStyle, ExStyle, %windowTitle%
            return (windowStyle & 0x8) ; 0x8 is WS_EX_TOPMOST.
        }

        HideMessage() {
            Progress, Off
        }

; Git Bash専用
    #IfWinActive,ahk_exe mintty.exe

    ; コピー
        ^c::^Ins

    ; ペースト
        ^v::+Ins

    #IfWinActive

; KiCAD PCBエディタ・回路図エディタ専用
    #IfWinActive,ahk_exe eeschema.exe

    +WheelDown::+WheelUp
    +WheelUp::+WheelDown

    #IfWinActive,ahk_exe pcbnew.exe

    +WheelDown::+WheelUp
    +WheelUp::+WheelDown

    #IfWinActive

; Notionカレンダー専用
    #IfWinActive,ahk_exe Notion Calendar.exe

    ; Todoから完了
    F13 & d::
        Send,{e}
        Send,{c}
        Send,{Up 4}
        Send,{Enter}
        Send,{Esc}
        Return 

    ; 完了からTodo
    F13 & t::
        Send,{e}
        Send,{c}
        Send,{Down 4}
        Send,{Enter}
        Send,{Esc}
        Return 

    #IfWinActive

; Chrome専用
    #IfWinActive,ahk_exe chrome.exe

    F13 & 1::
        Send,^{c}
        Send,^{1}
        Return 

    F13 & 2::
        MouseClick
        Send,^{a}
        Send,^{v}
        Send,{Left 3}
        Send,-
        Send,{Enter}
        Return

    F13 & 3::
        MouseClick
        Send,^{a}
        Send,^{v}
        Send,{Left 3}
        Send,{Backspace 2}
        Send,-
        Send,{Enter}
        Return 
    
    F13 & Left::
        Send,!{Left}
        Send,^{Tab}
        Return 

    F13 & Up::
        Send,!{Left}
        Send,^{Tab}
        Send,!{Left}
        Send,^{Tab}
        Send,!{Left}
        Send,^{Tab}
        Send,!{Left}
        Send,^{Tab}
        Send,!{Left}
        Send,^{Tab}
        Return 

    F13 & Right::
        MouseClick
        Send,^{Tab}
        Return 

    F13 & Down::
        MouseClick
        Send,^{Tab}
        Sleep 100
        MouseClick
        Send,^{Tab}
        Sleep 100
        MouseClick
        Send,^{Tab}
        Sleep 100
        MouseClick
        Send,^{Tab}
        Sleep 100
        MouseClick
        Send,^{Tab}
        Return

    F13 & q::        
        Send,^{c}
        Send,^{Tab}
        MouseClick, Left, 1408, 155,,0
        Send,^{v}
        ; Send,{Left 3}
        ; Send,-
        Send,{Enter}
        ; Send,^+{Tab}
        Return 

    PgUp::
        send,{d}
        Return

    PgDn::
        send,{c}
        Return

    #IfWinActive

; One Commander専用
    #IfWinActive,ahk_exe OneCommander.exe

    ; 新しいタブで開く
    ^Enter::
        ; MouseClick, Middle
        Send,{AppsKey}
        Send,{Down 4}
        Send,{Right}
        Send,{Enter}
        Return 

    #IfWinActive

; Excel専用
    #IfWinActive,ahk_exe EXCEL.EXE

    ^Tab::
        Send,^{PgDn}
        Return

    ^+Tab::
        Send,^{PgUp}
        Return 

    #IfWinActive

; Excel専用
    #IfWinActive,ahk_exe smplayer.exe

    ^WheelDown::
        Send,^{Right}
        Return

    ^WheelUp::
        Send,^{Left}
        Return 

    +WheelDown::
        Send,+{Right}
        Return

    +WheelUp::
        Send,+{Left}
        Return 

    #IfWinActive