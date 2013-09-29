class RomanNumController < UIViewController
#    attr_accessor :ronum
    def viewDidLoad
        super

        self.view.backgroundColor = UIColor.blackColor

        @currentnum = Romanum.new(m: "",  d: "",  c: "",  l: "",  x: "",  v: "",  i: "",  roman: "", cm: "",  cd: "",  xc: "",  xl: "",  ix: "",  iv: "",  arabic: 0, mstore: "")   # the number being entered now
#        @currentnum.save
        @prevnum = Romanum.new(m: "",  d: "",  c: "",  l: "",  x: "",  v: "",  i: "",  roman: "", cm: "",  cd: "",  xc: "",  xl: "",  ix: "",  iv: "",  arabic: 0, mstore: "")          # the number entered most recently, before the current entry
#        @prevnum.save
        @nextnum = Romanum.new(m: "",  d: "",  c: "",  l: "",  x: "",  v: "",  i: "",  roman: "", cm: "",  cd: "",  xc: "",  xl: "",  ix: "",  iv: "",  arabic: 0, mstore: "")          # aka total, the result of the operation between currentnum and prevnum
#        @nextnum.save

        @maindisplay = UILabel.alloc.initWithFrame(CGRectZero)
        @maindisplay.backgroundColor = UIColor.blackColor
        @maindisplay.textColor = UIColor.whiteColor
        @maindisplay.text = " "
        @maindisplay.font = UIFont.fontWithName("Futura-CondensedMedium", size:50)
        @maindisplay.sizeToFit
        @maindisplay.frame = [[0, 110], [self.view.frame.size.width , 70]]
        @maindisplay.autoresizingMask = 
            UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
        self.view.addSubview(@maindisplay)

        @altdisplay = UILabel.alloc.initWithFrame(CGRectZero)
        @altdisplay.backgroundColor = UIColor.blackColor
        @altdisplay.textColor = UIColor.grayColor
        @altdisplay.text = " "
        @altdisplay.font = UIFont.fontWithName("Futura-CondensedMedium", size:50)
        @altdisplay.sizeToFit
        @altdisplay.frame = [[0, 10], [self.view.frame.size.width , 48]]
        @altdisplay.autoresizingMask = 
            UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
        self.view.addSubview(@altdisplay)

        @arabicdisplay = UILabel.alloc.initWithFrame(CGRectZero)
        @arabicdisplay.backgroundColor = UIColor.blackColor
        @arabicdisplay.textColor = UIColor.blackColor
        @arabicdisplay.text = " "
        @arabicdisplay.font = UIFont.fontWithName("Futura-Medium", size:15)
        @arabicdisplay.sizeToFit
        @arabicdisplay.frame = [[0, 70], [self.view.frame.size.width , 30]]
        @arabicdisplay.autoresizingMask = 
            UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
        self.view.addSubview(@arabicdisplay)

        self.title = "Additio"

            button_width = 79
            wide_button_width = 160
            numberbtnimage = "79x74-khaki.png"
            operatorbtnimage = "79x74-blue.png"
#            operatorbtnimage = "79x74-liteblue3.png"
            clearbtnimage = "79x74-liteturq2.png"
            arabicbtnimage = "79x74-literose.png"
#            arabicbtnimage = "79x36-literose.png"
#            historybtnimage = "79x36-litegreenblue.png"
            widebtnimage = "160x74-darkblue.png"
#            numberbtnimage = "79x74-litetan.png"
#            operatorbtnimage = "79x74-darkblue.png"
#            clearbtnimage = "79x74-liteturq2.png"
            btnfont = UIFont.fontWithName("HelveticaNeue-Light", size:36)
#            backspfont = UIFont.fontWithName("Verdana", size:36)
#            backspfont = UIFont.fontWithName("HiraKakuProN-W3", size:36)
            backspfont = UIFont.fontWithName("HelveticaNeue-Light", size:36)

            @mbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @mbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @mbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @mbutton.setTitle("M", forState:UIControlStateNormal)
            @mbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @mbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @mbutton.frame = [
                [ 0, @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24],
                [79, 74]
            ]
            @mbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @mbutton.addTarget(self,
                action:"tap_M", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@mbutton)


            @dbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @dbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @dbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @dbutton.setTitle("D", forState:UIControlStateNormal)
            @dbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @dbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @dbutton.frame = [
                [ (button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24],
                [79, 74]
            ]
            @dbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @dbutton.addTarget(self,
                action:"tap_D", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@dbutton)

            @cbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @cbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @cbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @cbutton.setTitle("C", forState:UIControlStateNormal)
            @cbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @cbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @cbutton.frame = [
                [ 2*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24],
                [79, 74]
            ]
            @cbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @cbutton.addTarget(self,
                action:"tap_C", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@cbutton)


            arabicbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            arabicbutton.setBackgroundImage UIImage.imageNamed(arabicbtnimage), forState:UIControlStateNormal
            arabicbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            arabicbutton.setTitle("0-9", forState:UIControlStateNormal)
            arabicbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

            arabicbutton.frame = [
                [ 3*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24],
                [80, 74]
            ]
            arabicbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            arabicbutton.addTarget(self,
                action:"tap_arabicnumbers", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(arabicbutton)

#            subtractbutton = UIButton.buttonWithType(UIButtonTypeCustom)
#            subtractbutton.setBackgroundImage UIImage.imageNamed(operatorbtnimage), forState:UIControlStateNormal
#            subtractbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
#            subtractbutton.setTitle("–", forState:UIControlStateNormal)
#            subtractbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

#            subtractbutton.frame = [
#                [ 3*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24],
#                [80, 74]
#            ]
#            subtractbutton.autoresizingMask =
#                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
#            subtractbutton.addTarget(self,
#                action:"tap_diff", 
#                forControlEvents:UIControlEventTouchUpInside)
#            self.view.addSubview(subtractbutton)


            @lbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @lbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @lbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @lbutton.setTitle("L", forState:UIControlStateNormal)
            @lbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @lbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @lbutton.frame = [
                [ 0, @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 ],
                [79, 74]
            ]
            @lbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @lbutton.addTarget(self,
                action:"tap_L", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@lbutton)


            @xbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @xbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @xbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @xbutton.setTitle("X", forState:UIControlStateNormal)
            @xbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @xbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @xbutton.frame = [
                [ (button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 ],
                [79, 74]
            ]
            @xbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @xbutton.addTarget(self,
                action:"tap_X", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@xbutton)

            @vbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @vbutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @vbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @vbutton.setTitle("V", forState:UIControlStateNormal)
            @vbutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @vbutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @vbutton.frame = [
                [ 2*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 ],
                [79, 74]
            ]
            @vbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @vbutton.addTarget(self,
                action:"tap_V", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@vbutton)


            addbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            addbutton.setBackgroundImage UIImage.imageNamed(operatorbtnimage), forState:UIControlStateNormal
            addbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            addbutton.setTitle("+", forState:UIControlStateNormal)
            addbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

            addbutton.frame = [
                [ 3*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 ],
                [80, 74]
            ]
            addbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            addbutton.addTarget(self,
                action:"tap_add", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(addbutton)

            clearbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            clearbutton.setBackgroundImage UIImage.imageNamed(clearbtnimage), forState:UIControlStateNormal
            clearbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            clearbutton.setTitle(" ", forState:UIControlStateNormal)
            clearbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

            clearbutton.frame = [
                [ 0, @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 +85 ],
                [79, 74]
            ]
            clearbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            clearbutton.addTarget(self,
                action:"tap_clear", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(clearbutton)

            backspbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            backspbutton.setBackgroundImage UIImage.imageNamed(clearbtnimage), forState:UIControlStateNormal
            backspbutton.titleLabel.setFont(backspfont, systemFontOfSize:36.0)
#            backspbutton.setTitle("\u21A4", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u22A2", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u2B05", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u232B", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u2190", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u2794", forState:UIControlStateNormal)
#            backspbutton.setTitle("\u279C", forState:UIControlStateNormal)
            backspbutton.setTitle("\u21E4", forState:UIControlStateNormal)
            backspbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

            backspbutton.frame = [
               [ (button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 +85 ],
                [79, 74]
            ]
            backspbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            backspbutton.addTarget(self,
                action:"tap_backsp", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(backspbutton)


            @ibutton = UIButton.buttonWithType(UIButtonTypeCustom)
            @ibutton.setBackgroundImage UIImage.imageNamed(numberbtnimage), forState:UIControlStateNormal
            @ibutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            @ibutton.setTitle("I", forState:UIControlStateNormal)
            @ibutton.setTitleColor(UIColor.blackColor, forState:UIControlStateNormal)
            @ibutton.setTitleColor(UIColor.grayColor, forState:UIControlStateDisabled)

            @ibutton.frame = [
                [ 2*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 +85 ],
                [79, 74]
            ]
            @ibutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            @ibutton.addTarget(self,
                action:"tap_I", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(@ibutton)

            totalbutton = UIButton.buttonWithType(UIButtonTypeCustom)
            totalbutton.setBackgroundImage UIImage.imageNamed(operatorbtnimage), forState:UIControlStateNormal
            totalbutton.titleLabel.setFont(btnfont, systemFontOfSize:36.0)
            totalbutton.setTitle("=", forState:UIControlStateNormal)
            totalbutton.setTitleColor(UIColor.whiteColor, forState:UIControlStateNormal)

            totalbutton.frame = [
                [ 3*(button_width + 1), @maindisplay.frame.origin.y + @maindisplay.frame.size.height + 24 + 84 +85 ],
                [80, 74]
            ]
            totalbutton.autoresizingMask =
                UIViewAutoresizingFlexibleBottomMargin | UIViewAutoresizingFlexibleTopMargin
            totalbutton.addTarget(self,
                action:"tap_total", 
                forControlEvents:UIControlEventTouchUpInside)
            self.view.addSubview(totalbutton)

            tap_clear
    end

#  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#    @counter = 0              # keeps track of how many numbers have been entered in our history
#     @prevnum.roman = ""           # holds the number previously entered when adding or differencing ()
#    @nextnum.roman = ""           # holds the number just entered when totaling
    @operation = "+"

    def tap_M
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("M")
        @currentnum.m += "M"
        @currentnum.roman += "M"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 1000
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        # Note to self -- update_display("M", 1000) could update both displays in one step. Think about it
        if @maindisplay.text.length > 2
            then last3 = @maindisplay.text[-3..-1]
            case last3
                when "MMM"
                @mbutton.enabled = false        # prevent 4 M's in a row from being entered
                when "MCM"
                @mbutton.enabled = false        # ensure that right group of keys are active for next press
                @dbutton.enabled = false
                @cbutton.enabled = false
                @currentnum.cm += "CM"         # keep a separate store for whenever CM (900) appears
                @currentnum.m.chop!               # have to remove the extra M we just appended
                @currentnum.d += "D"                   # replace it with D (500)
                @currentnum.c += "CCC"                 # and update C's so there are 4 of them
                @currentnum.arabic -= 200       # and adjust the arabic count
                update_arabicdisplay(@currentnum.arabic)
            end # case
        end # if
        if @maindisplay.text.length == 2
            then last2 = @maindisplay.text[-2..-1]
            case last2
                when "CM"
                    @mbutton.enabled = false        # ensure that right group of keys are active for next press
                    @dbutton.enabled = false
                    @cbutton.enabled = false
                    @currentnum.cm += "CM"         # keep a separate store for whenever CM (900) appears
                    @currentnum.m.chop!               # have to remove the extra M we just appended
                    @currentnum.d += "D"                   # and replace that M with D (500)
                    @currentnum.c += "CCC"                 # and update C's so there are 4 of them (the 400 left over)
                    @currentnum.arabic -= 200       # and adjust the arabic count
                    update_arabicdisplay(@currentnum.arabic)
            end  # case
        end     # if
    end          # def

    def tap_D
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("D")
        @currentnum.d += "D"
        @currentnum.roman += "D"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 500
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        @mbutton.enabled = false        # if  D is pressed, no additional M or D can be entered 
        @dbutton.enabled = false
        if @maindisplay.text.length > 1
            then last2 = @maindisplay.text[-2..-1]
            if last2 == "CD"
                @cbutton.enabled = false        # after CD,  C is no longer permitted
                @currentnum.cd += "CD"         # keep a separate store for whenever CD (400) appears
                @currentnum.d.chop!               # have to remove the extra D we just appended
                 @currentnum.c += "CCC"           # and update C's so there are 4 of them (eg, we entered  400)
               @currentnum.arabic -= 200      # and adjust the arabic count
                update_arabicdisplay(@currentnum.arabic)
            end     # if
        end         # if
    end             # def

    def tap_C
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("C")
        @currentnum.c += "C"
        @currentnum.roman += "C"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 100
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        if @maindisplay.text.length > 2
                then last3 = @maindisplay.text[-3..-1]
                if last3 == "CCC"
                    then @cbutton.enabled = false  # prevent 4 C's in a row from being entered
                elsif last3 == "MMC"
                    @mbutton.enabled = true
                end  # if  last3
        end  # if

        if @maindisplay.text.length > 1 
            then last2 = @maindisplay.text[-2..-1]
            case last2
                when "MC"
                    @mbutton.enabled = true  # to enable CM (900) to be entered
                    @dbutton.enabled = true    # to enable CD (400) to be entered
                #  when DC — the D has already disabled M and D 
                when "CC"
                    @mbutton.enabled = false  # once 2 C's are entered, M and D exit the permissible list
                    @dbutton.enabled = false
                    # don't  make any other adjustments, since C (300), L (250), X (210), V (205) and I (201) are all possible
                # when LC— not permitted
                 when "XC"
                    @cbutton.enabled = false     # XC (90) means C and L join M and D as impermissible
                    @lbutton.enabled = false
                    @xbutton.enabled = false
                    @currentnum.xc += "XC"         # keep a separate store for whenever XC (90) appears
                    @currentnum.c.chop!               # have to remove the extra C we just appended
                    @currentnum.l += "L"               # and replace that Cwith L (50) ...
                    @currentnum.x += "XXX"            # and 4 X's (one has already been entered)
                    @currentnum.arabic -= 20       # and adjust the arabic count, too
                    update_arabicdisplay(@currentnum.arabic)
                # when VC  — not permitted
                # when IC  — not permitted
            end  # case
        end  # if
    end  # def tap_C

    def tap_L
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("L")
        @currentnum.l += "L"
        @currentnum.roman += "L"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 50
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        @mbutton.enabled = false        # if  L is pressed, no additional M, D, C or L can be entered 
        @dbutton.enabled = false
        @cbutton.enabled = false
        @lbutton.enabled = false
        if @maindisplay.text.length > 1
            last2 = @maindisplay.text[-2..-1]
            if last2 == "XL"
                @xbutton.enabled = false        # after XL,  X is no longer permitted
                @currentnum.xl += "XL"         # keep a separate store for whenever XL (40) appears
                @currentnum.l.chop!               # have to remove the extra L we just appended
                @currentnum.x += "XXX"          #  and add 3 X's so we have the 40 that XL represents (one has already been entered)
                @currentnum.arabic -= 20      # and adjust the arabic count
                update_arabicdisplay(@currentnum.arabic)
           end  # if last2
           # ML, DL and CL don't require any further action
        end  # if
    end  # def tap_L

    def tap_X
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("X")
        @currentnum.x += "X"
        @currentnum.roman += "X"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 10
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        @mbutton.enabled = false  #  can rule out M and D now that X has been pressed
        @dbutton.enabled = false
        if @maindisplay.text.length > 2 then 
            last3 =@maindisplay.text[-3..-1]
                if last3 == "XXX"
                    then @xbutton.enabled = false
                end
        end
        if @maindisplay.text.length > 1
            last2 = @maindisplay.text[-2..-1]
            case last2
                when "CX"
                    @cbutton.enabled = true  # to enable XC (90) to be entered; that is, CXC, CCXC and CCCXC
#                when "LX"
#                    @cbutton.enabled = false   #  L and C are already disabled, by the single entry of L
                when "XX"
                    @cbutton.enabled = false   #  Since we don't know what preceded XX, we have to disable both C and L here
                    @lbutton.enabled = false
                when "IX"
                    @cbutton.enabled = false  # this is a terminal entry; disable all remaining keys
                    @xbutton.enabled = false
                    @vbutton.enabled = false
                    @ibutton.enabled = false

                    @currentnum.ix += "IX"         # keep a separate store for whenever IX (9) appears
                    @currentnum.x.chop!               # have to remove the extra X we just appended
                    @currentnum.v += "V"               # and instead store it as V (5)
                    @currentnum.i += "III"               # and 4 I's (one has already been entered)
                    @currentnum.arabic -= 2       # and adjust the arabic count
                    update_arabicdisplay(@currentnum.arabic)
                # when VX  — not permitted
                # when MX, DX, CX or LX  — no further action required
            end  # case
        end  # if
    end
 
    def tap_V
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("V")
        @currentnum.v += "V"
        @currentnum.roman += "V"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 5
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        @mbutton.enabled = false        # if  V is pressed, no additional M, D, C, L, X or V can be entered 
        @dbutton.enabled = false
        @cbutton.enabled = false
        @lbutton.enabled = false
        @xbutton.enabled = false
        @vbutton.enabled = false
        if @maindisplay.text.length > 1
            last2 = @maindisplay.text[-2..-1]
            if last2 == "IV"
                @ibutton.enabled = false  # this is a terminal entry; disable all remaining keys
                @currentnum.iv += "IV"         # keep a separate store for whenever IV (4) appears
                @currentnum.v.chop!               # have to remove the extra X we just appended
                @currentnum.i += "III"              # and store IV as four I's (one has already been entered)
                @currentnum.arabic -= 2       # and adjust the arabic count
                update_arabicdisplay(@currentnum.arabic)
            end  # if last2 == 'iv'
        end  # if
    end  # def tal_V

    def tap_I
        display_prev_in_alt(@prevnum.roman)
        update_maindisplay("I")
        @currentnum.i += "I"
        @currentnum.roman += "I"   # this is duplicating the maindisplay, probably unnecessarily
        @currentnum.arabic += 1
        update_arabicdisplay(@currentnum.arabic)  #  Used when option to "show arabic numerals too" is chosen
        @mbutton.enabled = false  #  can rule out M, D, L and C now that I has been pressed
        @dbutton.enabled = false
        @cbutton.enabled = false
        @lbutton.enabled = false
        if @maindisplay.text.length > 1
            last2 = @maindisplay.text[-2..-1]
            case last2
 #               when "MI"
 #                   @xbutton.enabled = true
 #                   @vbutton.enabled = true
 #               when "DI"
 #                   @xbutton.enabled = true
 #                   @vbutton.enabled = true
 #               when "CI"
 #                   @xbutton.enabled = true
 #                   @vbutton.enabled = true
                when "LI"
                    @xbutton.enabled = true  # X would have been disabled after XL so must be reenabled
                    @vbutton.enabled = true
 #               when "XI"
 #                   @xbutton.enabled = true   #  still could end with IX or IV; tap_X or tap_V will handle final key disabling
 #                   @vbutton.enabled = true
                when "VI"
                    @xbutton.enabled = false   # By now only I is permitted
                    @vbutton.enabled = false
                when "II"
                    @xbutton.enabled = false
                    @vbutton.enabled = false
            end
        end
        if @maindisplay.text.length > 2
                then last3 = @maindisplay.text[-3..-1]
                if last3 == "III"
                    @ibutton.enabled = false  # terminal entry; all entry keys disabled
                end  # if last3
        end  #if

    end  # def tap_I


    #   +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++

    #  +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    def tap_add   # this simply blanks the entry and stores the number to be compared when total is hit
#        send_to_history(@maindisplay.text) unless @maindisplay.text == " "
        if @prevnum.roman == ""   # case 1:  there's no history
            current_to_prev     # take what's in the main display and stick it in the alt display
 #           @operation = "+"   #  when there are multiple operations, which one is active has to be tracked
            tap_clear                  # clear the maindisplay and accumulators in preparation of a new number being entered
            update_arabicdisplay(@prevnum.arabic)
        elsif @prevnum.roman != "" and @currentnum.roman != "" and @nextnum.roman = ""    # case 2: we need to generate a subtotal and make it the previous number
            get_subtotal   
        elsif @prevnum.roman != "" and @currentnum.roman == "" and @maindisplay.text != " "  # we already have a total (or subtotal), just move it to the altdisplay
            update_altdisplay(@maindisplay.text)
            @maindisplay.text = ""
            update_maindisplay(" ")
#            total_to_prev   #  equals hasn't been pressed. Put currentnum in altdisplay and new total in maindisplay
#            @operation = "+"   #  when there are multiple operations, which one is active has to be tracked
#            tap_total                   # there's already a running total, so let tap_total act as though it were the first entry and this the second
        end  # if
    end  # def

    def tap_diff   # this simply blanks the entry and stores the number to be compared when total is hit
#        current_to_prev
#        @operation = "-"
        tap_clear
    end

    def tap_arabicnumbers
        if @arabicdisplay.textColor == UIColor.redColor
            @arabicdisplay.textColor = UIColor.blackColor
        else
            @arabicdisplay.textColor = UIColor.redColor
        end
    end

   def tap_total
        if @maindisplay.text == " "  and @altdisplay.text != " " #  pressed plus then equals
            update_maindisplay(@altdisplay.text)
            prev_to_current
        elsif @maindisplay.text != " "
#            @nextnum.arabic = @prevnum.arabic + @currentnum.arabic   # however, we know enough to calculate the arabic total
            combine_prev_and_next
        else                                # you get here if the maindisplay is blank, so blank or clear everything
                tap_clear
                current_to_prev
                reset_prev
                return
        end  # unless

        total = add_numbers(@prevnum.roman,@currentnum.roman)  

        @nextnum.roman = total
        total_to_prev
        @prevnum.roman = total   
        tap_clear
        @maindisplay.text = " "
        update_maindisplay(total)
        update_arabicdisplay(@arabictotaled)
    end

    def get_subtotal    #  same steps as tap_total, except result is sent to altdisplay and maindisplay is blanked
        combine_prev_and_next

        subtotal = add_numbers(@prevnum.roman,@currentnum.roman)  

        @nextnum.roman = subtotal
        total_to_prev
        @prevnum.roman = subtotal     # in total_to_prev,  maindisplay feeds prevnum.roman, so this needs to be adjusted
        tap_clear                                       # this clears currentnum and nextnum and but doesn't reset maindisplay
        @maindisplay.text = ""
        update_maindisplay(" ")

        @altdisplay.text = subtotal
        update_altdisplay(subtotal)
        update_arabicdisplay(@arabictotaled)
    end


    def tap_clear
#       clears display of whatever entry is there
        reset_display   # if @maindisplay has a number,  reset_display clears it
        @currentnum.m = ""  # now clear all the currentnum accumulators
        @currentnum.d = ""
        @currentnum.c = ""
        @currentnum.l = ""
        @currentnum.x = ""
        @currentnum.v = ""
        @currentnum.i = ""
        @currentnum.cm = ""
        @currentnum.cd = ""
        @currentnum.xc = ""
        @currentnum.xl = ""
        @currentnum.ix = ""
        @currentnum.iv = ""
        @currentnum.roman = ""
        @currentnum.arabic = 0
        update_arabicdisplay(" ")
        reset_active    #  and make all the entry keys active
        @nextnum.m = ""  # now clear all the nextnum accumulators (where the total is calculated)
        @nextnum.d = ""
        @nextnum.c = ""
        @nextnum.l = ""
        @nextnum.x = ""
        @nextnum.v = ""
        @nextnum.i = ""
        @nextnum.cm = ""
        @nextnum.cd = ""
        @nextnum.xc = ""
        @nextnum.xl = ""
        @nextnum.ix = ""
        @nextnum.iv = ""
        @nextnum.roman = ""
        @nextnum.arabic = 0
    end

    def tap_backsp
        if @maindisplay.text.length >2
            last3 = @maindisplay.text[-3..-1]
        end
        if @maindisplay.text.length >1  #  before we remove a char from the display, we have to check if we created a special flag and account for it if we did
            last2 = @maindisplay.text[-2..-1]       # we test the maindisplay but we're only adjusting accumulators here
            case last2
            when "CM"
                2.times { |i| @currentnum.cm.chop! }
                @mbutton.enabled = true        # reenable these so the right group of keys are active for next press
                @dbutton.enabled = true
                @cbutton.enabled = true
                @currentnum.d.chop!                 # We adjusted the accumulators as well as the flag, so adjust these back
                3.times { |i| @currentnum.c.chop! }
                @currentnum.arabic += 200   #  The arabic display will be upaded in the next test
                @currentnum.m += "M"            # We have to restore this M too, because it'll be chopped off in the next test, which only looks back one character so it expects the accumulator to have an extra M
            when "CD"
                2.times { |i| @currentnum.cd.chop! }
                @mbutton.enabled = true        # reenable these so the right group of keys are active for next press
                @dbutton.enabled = true
                @cbutton.enabled = true
                @currentnum.d += "D"
                3.times { |i| @currentnum.c.chop! }
                @currentnum.arabic += 200   #  The arabic display will be updated in the next test
            when "CC"
                if last3
                    if last3 == "CCC"
                        @mbutton.enabled = false
                        @dbutton.enabled = false
                    elsif last3 == "DCC"
                        @mbutton.enabled = false
                        @dbutton.enabled = false
                    elsif last3 =="MCC" 
                        @mbutton.enabled = true
                        @dbutton.enabled = true
                    end # if last3 ==
                else
                    @mbutton.enabled = true     # if last3 is false, then only two chars have been entered, CC, and after chopping it's just C, so M and D are in play
                    @dbutton.enabled = true
                end # if last3
            when "XC"
                2.times { |i| @currentnum.xc.chop! }
                @cbutton.enabled = true        # reenable these so the right group of keys are active for next press
                @lbutton.enabled = true
                @xbutton.enabled = true
                @currentnum.l.chop!                 # We adjusted the accumulators as well as the flag, so adjust these back to previous state
                3.times { |i| @currentnum.x.chop! }
                @currentnum.arabic += 20   #  The arabic display will be updated in the next test
                @currentnum.c += "C"            # We have to restore this C too, because it'll be chopped off in the next test, which only looks back one character so it expects the accumulator to have an extra M
            when "XL"
                2.times { |i| @currentnum.xl.chop! }
                @cbutton.enabled = true        # make sure right group of keys are active for next press. So X is now the last key pressed
                @lbutton.enabled = true
                @currentnum.l += "L"            # We have to restore this L too, because it'll be chopped off in the next test, which only looks back one character so it expects the accumulator to have an extra M
                3.times { |i| @currentnum.x.chop! }
                @currentnum.arabic += 20   #  The arabic display will be updated in the next test
            when "IX"
                2.times { |i| @currentnum.ix.chop! }
                @xbutton.enabled = true   #   reversing ourselves after a terminal entry
                @vbutton.enabled = true
                @ibutton.enabled = true
                @currentnum.x += "X"            # We have to restore this L too, because it'll be chopped off in the next test, which only looks back one character so it expects the accumulator to have an extra M
                @currentnum.v.chop!                 # We adjusted the accumulators as well as the flag, so adjust these back to previous state
                3.times { |i| @currentnum.i.chop! }
                @currentnum.arabic += 2   #  The arabic display will be updated in the next test
            when "IV"
                2.times { |i| @currentnum.iv.chop! }
                @xbutton.enabled = true   #   reversing ourselves after a terminal entry
                @vbutton.enabled = true
                @ibutton.enabled = true
                @currentnum.v += "V"            # We have to restore this L too, because it'll be chopped off in the next test, which only looks back one character so it expects the accumulator to have an extra M
                3.times { |i| @currentnum.i.chop! }
                @currentnum.arabic += 2   #  The arabic display will be updated in the next test
            end # when
        end # if
        char_to_cut = @maindisplay.text[-1]

        @maindisplay.text.chop!  # Now remove the character from the maindisplay
        @currentnum.roman.chop!  # and the duplicatre we're keeping in .roman

        case char_to_cut            # Next, remove the value from the accumulator, testing first to see which one it is. Correct and redisplay the arabic number too
        when "M"
            @currentnum.m.chop!   #  We account for CM in the previous test section
            @currentnum.arabic -= 1000
            update_arabicdisplay(@currentnum.arabic)
            @mbutton.enabled = true    #  We know it was OK to enter M here, so in case it got disabled as the third M in a row, we'll make sure it's enabled now without bothering to test
        when "D"
            @currentnum.d.chop!    #  We account for CD in the previous test section
            @currentnum.arabic -= 500
            update_arabicdisplay(@currentnum.arabic)
            @mbutton.enabled = true
            @dbutton.enabled = true
        when "C"
            @currentnum.c.chop!   #  We account for XC in the previous test section; a single C doesn't disable any keys and 2-char and 3-char are considered above
            @currentnum.arabic -= 100
             update_arabicdisplay(@currentnum.arabic) 
       when "L"
            @currentnum.l.chop!   #  We account for XL in the previous test section
            @currentnum.arabic -= 50
            update_arabicdisplay(@currentnum.arabic) 
            @cbutton.enabled = true
            @lbutton.enabled = true
           # not checking M and D, so they might be false enabled or disabled
       when "X"
            @currentnum.x.chop!   #  We account for IX in the previous test section
             @currentnum.arabic -= 10
             update_arabicdisplay(@currentnum.arabic) 
            @xbutton.enabled = true
            @vbutton.enabled = true
        when "V"
            @currentnum.v.chop!   #  We account for IV in the previous test section
             @currentnum.arabic -= 5
             update_arabicdisplay(@currentnum.arabic) 
            @xbutton.enabled = true   #  This is wrong for XXXV, btw
            @vbutton.enabled = true
        when "I"
            @currentnum.i.chop!
            @currentnum.arabic -= 1
             update_arabicdisplay(@currentnum.arabic)
            @ibutton.enabled = true

        end # case
        @maindisplay.sizeToFit
        @maindisplay.frame = [[0, 110], [self.view.frame.size.width , 70]]
        @maindisplay.textAlignment = UITextAlignmentRight        
    end  # def tap_backsp

    def combine_prev_and_next
            @nextnum.m = @prevnum.m              # Start out by setting the accumulators so they have all the necessary digits
            @nextnum.m += @currentnum.m        #  Whatever was in the nextnum accumulators is replaced and added to
            @nextnum.m += @prevnum.mstore      # put the mstore into the M's now
            @nextnum.d = @prevnum.d 
            @nextnum.d +=  @currentnum.d
            @nextnum.c = @prevnum.c 
            @nextnum.c += @currentnum.c
            @nextnum.l = @prevnum.l
            @nextnum.l += @currentnum.l
            @nextnum.x = @prevnum.x 
            @nextnum.x += @currentnum.x
            @nextnum.v = @prevnum.v
            @nextnum.v += @currentnum.v
            @nextnum.i = @prevnum.i
            @nextnum.i += @currentnum.i
            @nextnum.mstore  = ""
            @nextnum.cm = ""      # we'll use these flags to make sure the display comes out right, but we don't set them till we've looked at the entire number
            @nextnum.cd = ""
            @nextnum.xc = ""
            @nextnum.xl = ""
            @nextnum.ix = 
            @nextnum.iv = ""
            @nextnum.roman = ""     # we'll put the total in here, once we have it figured out
    end

    def current_to_prev
        @prevnum.roman = @maindisplay.text        # take the current number and store all its property values in @prevnum
        @prevnum.m = @currentnum.m
        @prevnum.d = @currentnum.d
        @prevnum.c = @currentnum.c
        @prevnum.l = @currentnum.l
        @prevnum.x = @currentnum.x
        @prevnum.v = @currentnum.v
        @prevnum.i = @currentnum.i
        @prevnum.cm = @currentnum.cm
        @prevnum.cd = @currentnum.cd
        @prevnum.xc = @currentnum.xc
        @prevnum.xl = @currentnum.xl
        @prevnum.ix = @currentnum.ix
        @prevnum.iv = @currentnum.iv
        @prevnum.arabic = @currentnum.arabic
        @operation = "+"                                        # for now, just have addition
 #        @prevnum.roman = @currentnum.roman    #  already set this from maindisplay
        update_altdisplay(@prevnum.roman)       # then display that number in the altdisplay
    end

    def total_to_prev
        @prevnum.roman = @maindisplay.text
        @prevnum.m = @nextnum.m
        @prevnum.d = @nextnum.d
        @prevnum.c = @nextnum.c
        @prevnum.l = @nextnum.l
        @prevnum.x = @nextnum.x
        @prevnum.v = @nextnum.v
        @prevnum.i = @nextnum.i
        @prevnum.arabic = @arabictotaled
        @prevnum.mstore = @nextnum.mstore
        @operation = "+"
    end

    def prev_to_current
        @currentnum.roman = @altdisplay.text        # take the number (a subtotal) and store all its property values in @currentnum
        @currentnum.m = @prevnum.m
        @currentnum.d = @prevnum.d
        @currentnum.c = @prevnum.c
        @currentnum.l = @prevnum.l
        @currentnum.x = @prevnum.x
        @currentnum.v = @prevnum.v
        @currentnum.i = @prevnum.i
        @currentnum.cm = @prevnum.cm
        @currentnum.cd = @prevnum.cd
        @currentnum.xc = @prevnum.xc
        @currentnum.xl = @prevnum.xl
        @currentnum.ix = @prevnum.ix
        @currentnum.iv = @prevnum.iv
        @currentnum.arabic = @prevnum.arabic
        @operation = "+"                                        # for now, just have addition
 #        @currentnum.roman = @prevnum.roman    #  already set this from maindisplay
        @prevnum.m = ""  # now clear all the prevnum accumulators (so our state is "a single number has been entered")
        @prevnum.d = ""
        @prevnum.c = ""
        @prevnum.l = ""
        @prevnum.x = ""
        @prevnum.v = ""
        @prevnum.i = ""
        @prevnum.cm = ""
        @prevnum.cd = ""
        @prevnum.xc = ""
        @prevnum.xl = ""
        @prevnum.ix = ""
        @prevnum.iv = ""
        @prevnum.roman = ""
        @prevnum.arabic = 0
        update_altdisplay(" ")       # then blank the altdisplay
    end

    def reset_active
    #  allow all number keys to be pressed
        @mbutton.enabled = true
        @dbutton.enabled = true
        @cbutton.enabled = true
        @lbutton.enabled = true
        @xbutton.enabled = true
        @vbutton.enabled = true
        @ibutton.enabled = true
    end

    def reset_display
        if @maindisplay.text == " "   #  If the maindisplay is already blank, then this is a second press, so we're clearing the alt display and the accumulators. And main display is blank so we don't have to update it
            update_altdisplay(" ")
            @prevnum.roman = ""
            @currentnum.roman = ""
        else
            @maindisplay.text = ""   #  And if  maindisplay isn't blank, then that's all we're resetting
            update_maindisplay(" ")  # update_maindisplay appends what we send it, so that's why the previous line sets maindisplay.text to "" instead of " "
        end # if
    end

    def reset_prev
        @prevnum.roman = ""
    end

    def update_maindisplay(lastkey)     # add each key to the display as it's pressed
        @maindisplay.text += lastkey
        @maindisplay.sizeToFit
        @maindisplay.frame = [[0, 110], [self.view.frame.size.width , 70]]
        @maindisplay.textAlignment = UITextAlignmentRight
    end

    def update_altdisplay(aromanumber)    # replace the number being shown in the alt display
        @altdisplay.text = aromanumber
        @altdisplay.textAlignment = UITextAlignmentRight
        @altdisplay.sizeToFit
        @altdisplay.frame = [[0, 10], [self.view.frame.size.width , 48]]
    end

    def update_arabicdisplay(anumber)    # update arabic number each time a number key is pressed
        @arabicdisplay.text = "#{anumber}"
        @arabicdisplay.sizeToFit
        @arabicdisplay.frame = [[0, 55], [self.view.frame.size.width , 70]]
        @arabicdisplay.textAlignment = UITextAlignmentRight
    end

    def display_prev_in_alt(aromanumber)  #  pass in prevnum
        if @maindisplay.text == " "
            if @altdisplay.text == " "
                if @prevnum.roman.length > 0
                    update_altdisplay(aromanumber)
                end  # if prev
            end  # if alt
            return
        end  # if main
    end  # def display_prev_in_alt



#   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
#
#   ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
    def add_numbers(prev, current)
#         do real calculation
#         total = prev + current
#        For display, need to use i, x and c correctors
        @arabictotaled = 0

# first get the i's right
        case 
        when @nextnum.i.length >= 5  # We can have up to 8 i's, so we'll move 5 (if there are that many) to the V's column
            @nextnum.v += "V"
            5.times { |i| @nextnum.i.chop!}
            @arabictotaled += @nextnum.i.length   # the "leftover" i's are each 1 in the arabictotal; this case settles what number goes into the i's column and adds that many to arabictotaled
        when @nextnum.i.length == 4
#            iflag = true    # when we're checking X's, we'll need to know this
            unless @nextnum.v.length % 2 == 1   # if there are 1 or 3 V's, don't display "IV" — instead we'll need "IX"
                @nextnum.iv += "IV"
            end  # unless
            @arabictotaled += 4
        when @nextnum.i.length < 4
            @arabictotaled += @nextnum.i.length
        end  # case

# now do the v's
# at most we can have 3 v's (say we added XII + IV, then the X gets converted to V + IIIII to handle the Iminus and then later IIIII gets converted back to V)
        case @nextnum.v.length
        when 3
            @nextnum.v = "V"
            @nextnum.x += "X"
            @arabictotaled += 5
            if @nextnum.i.length == 4
                @nextnum.iv = ""
                @nextnum.ix = "IX"
            end
        when 2
            @nextnum.v = ""
            @nextnum.x += "X"
            # we do not increment arabictotal since the V's column is empty
        when 1
            @arabictotaled += 5
            if @nextnum.i.length == 4
                @nextnum.iv = ""
                @nextnum.ix = "IX"
            end
        end # case

        case 
        when @nextnum.x.length >= 5
            @nextnum.l += "L"
            5.times { |i| @nextnum.x.chop!}
            @arabictotaled += (@nextnum.x.length * 10)
        when @nextnum.x.length == 4
#            xflag = true    # when we're checking C's, we'll need to know this
            unless @nextnum.l.length % 2 == 1   # if there are 1 or 3 L's, don't display "XL" — instead we'll need "XC"
                @nextnum.xl += "XL"
            else @nextnum.xc +="XC"
            end # unless
            @arabictotaled += 40
        when @nextnum.x.length < 4
            @arabictotaled += (@nextnum.x.length * 10)
        end  # case

        case @nextnum.l.length
        when 3
            @nextnum.l ="L"
            @nextnum.c += "C"
            @arabictotaled += 50
        when 2
            @nextnum.l = ""
            @nextnum.c += "C"
        when 1
            @arabictotaled += 50
        end # case

        case
        when @nextnum.c.length >= 5
            @nextnum.d += "D"
            5.times { |i| @nextnum.c.chop!}
            @arabictotaled += (@nextnum.c.length * 100)
        when @nextnum.c.length == 4
            @nextnum.d += "D"
            @nextnum.c = ""
            @nextnum.cd = "CD"
            @arabictotaled += 400
        when @nextnum.c.length < 4
            @arabictotaled += (@nextnum.c.length * 100) 
        end  # case

        case @nextnum.d.length
        when 3
            @nextnum.d ="D"
            @nextnum.m += "M"
            @arabictotaled += 500
        when 2
            @nextnum.d = ""
            @nextnum.m += "M"
        when 1
            @arabictotaled += 500
        end # case

        case @nextnum.m.length
        when 9
            @nextnum.m = "MMM"
            extra = " +MMM+MMM"
            @nextnum.mstore = "MMMMMM"
            @arabictotaled += 9000
        when 8
            @nextnum.m = "MMM"
            extra = " +MMM+MM"
            @nextnum.mstore = "MMMMM"
            @arabictotaled += 8000
        when 7
            @nextnum.m = "MMM"
            extra = " +MMM+M"
            @nextnum.mstore = "MMMM"
            @arabictotaled += 7000
        when 6
            @nextnum.m = "MMM"
            extra = " +MMM"
            @nextnum.mstore = "MMM"
            @arabictotaled += 6000
        when 5
            @nextnum.m = "MMM"
            extra = " +MM"
            @nextnum.mstore = "MM"
            @arabictotaled += 5000
         when 4
            @nextnum.m.chop! 
            extra = " +M"
            @nextnum.mstore = "M"
            @arabictotaled += 4000
        when 1..3
            extra = ""
            @nextnum.mstore = ""
            @arabictotaled += (@nextnum.m.length * 1000)
        when 0
            extra = ""
        end # case

        total = ""
        total += @nextnum.m
        if @nextnum.cm == "CM"
            total += @nextnum.cm   #  3 options: CM, CD or D + C's
        elsif @nextnum.cd == "CD"
            total += @nextnum.cd     
        else
            total += @nextnum.d      
            total += @nextnum.c   #  There are 4 C's stored here if the number is CM or CD but we don't want to display them
        end
        if @nextnum.xc == "XC"    # 3 options: XC, XL or L + X's
            total += @nextnum.xc    
        elsif @nextnum.xl == "XL"
            total += @nextnum.xl    
        else
            total += @nextnum.l       
            total += @nextnum.x
        end
        if @nextnum.ix == "IX"     # 3 options:  IX, IV or V + I's
            total += @nextnum.ix      
        elsif @nextnum.iv == "IV"
            total += @nextnum.iv      
        else
            total += @nextnum.v     
            total += @nextnum.i
        end

#        total = @cbeforem + @mtotal + @dtotal + @xbeforec +@ctotal + @ltotal + @ibeforex + @xtotal + @ibeforev + @vtotal + @nextnum.i
#        @altdisplay.text = extra
        update_altdisplay(extra)
        update_arabicdisplay(@arabictotaled)
 #       if total.length == 0
  #          total = "nihil"
  #          update_arabicdisplay(0)
    #    end
#        total = "MMCXX"
        return total
#        return total, @arabictotaled
#        @maindisplay.text += "#{@prevnum} + #{@nextnum}"  # but not yet
    end  #def  add_numbers

    def diff_numbers(prev, current)
#         first find out which number is larger
#         if prev == current, then return "nihil"
        largernumber = larger_comes_first(prev, current)
#         then do the subtraction
#         if largernumber == prev, subtract current from prev
    #         diff = prev - current
#         else subtract prev from current
    #         diff = current - prev
            diff = "XXI"
        return diff
    end

    def larger_comes_first(a,b)
#        figure out which number is larger and return them in order of size
#         if a > b, then bigger = a
#         if b > a, then bigger = b
#         if b = a, then bigger = a
        bigger = a
        return bigger
    end
#    def initWithNum(num)
#        initWithNibName(nil, bundle:nil)
#        self.ronum = num
#        self
#    end

end