(asdf:load-systems :cl-pure-data/alsa :bordeaux-threads :serapeum)

;; Start PD & Alsa.
(progn
  (setf pda:*alsa-device* "sysdefault")
  (pd:init-default-hooks)
  (pd:init-audio 0 2 44100)
  (pd:message "pd" "dsp" 1))

(bt:make-thread
 (lambda ()
   (loop
     (pd:process #() 100)
     (libpd:libpd-queued-receive-pd-messages)))
 :name "PD playback")

(eval-when (:compile-toplevel :load-toplevel :execute)
  (defvar c0 16.35)
  (defvar c#0 17.32)
  (defvar d0 18.35)
  (defvar d#0 19.45)
  (defvar e0 20.60)
  (defvar f0 21.83)
  (defvar f#0 23.12)
  (defvar g0 24.50)
  (defvar g#0 25.96)
  (defvar a0 27.50)
  (defvar a#0 29.14)
  (defvar b0 30.87)
  (defvar c1 32.70)
  (defvar c#1 34.65)
  (defvar d1 36.71)
  (defvar d#1 38.89)
  (defvar e1 41.20)
  (defvar f1 43.65)
  (defvar f#1 46.25)
  (defvar g1 49.00)
  (defvar g#1 51.91)
  (defvar a1 55.00)
  (defvar a#1 58.27)
  (defvar b1 61.74)
  (defvar c2 65.41)
  (defvar c#2 69.30)
  (defvar d2 73.42)
  (defvar d#2 77.78)
  (defvar e2 82.41)
  (defvar f2 87.31)
  (defvar f#2 92.50)
  (defvar g2 98.00)
  (defvar g#2 103.83)
  (defvar a2 110.00)
  (defvar a#2 116.54)
  (defvar b2 123.47)
  (defvar c3 130.81)
  (defvar c#3 138.59)
  (defvar d3 146.83)
  (defvar d#3 155.56)
  (defvar e3 164.81)
  (defvar f3 174.61)
  (defvar f#3 185.00)
  (defvar g3 196.00)
  (defvar g#3 207.65)
  (defvar a3 220.00)
  (defvar a#3 233.08)
  (defvar b3 246.94)
  (defvar c4 261.63)
  (defvar c#4 277.18)
  (defvar d4 293.66)
  (defvar d#4 311.13)
  (defvar e4 329.63)
  (defvar f4 349.23)
  (defvar f#4 369.99)
  (defvar g4 392.00)
  (defvar g#4 415.30)
  (defvar a4 440.00)
  (defvar a#4 466.16)
  (defvar b4 493.88)
  (defvar c5 523.25)
  (defvar c#5 554.37)
  (defvar d5 587.33)
  (defvar d#5 622.25)
  (defvar e5 659.25)
  (defvar f5 698.46)
  (defvar f#5 739.99)
  (defvar g5 783.99)
  (defvar g#5 830.61)
  (defvar a5 880.00)
  (defvar a#5 932.33)
  (defvar b5 987.77)
  (defvar c6 1046.50)
  (defvar c#6 1108.73)
  (defvar d6 1174.66)
  (defvar d#6 1244.51)
  (defvar e6 1318.51)
  (defvar f6 1396.91)
  (defvar f#6 1479.98)
  (defvar g6 1567.98)
  (defvar g#6 1661.22)
  (defvar a6 1760.00)
  (defvar a#6 1864.66)
  (defvar b6 1975.53)
  (defvar c7 2093.00)
  (defvar c#7 2217.46)
  (defvar d7 2349.32)
  (defvar d#7 2489.02)
  (defvar e7 2637.02)
  (defvar f7 2793.83)
  (defvar f#7 2959.96)
  (defvar g7 3135.96)
  (defvar g#7 3322.44)
  (defvar a7 3520.00)
  (defvar a#7 3729.31)
  (defvar b7 3951.07)
  (defvar c8 4186.01)
  (defvar c#8 4434.92)
  (defvar d8 4698.63)
  (defvar d#8 4978.03)
  (defvar e8 5274.04)
  (defvar f8 5587.65)
  (defvar f#8 5919.91)
  (defvar g8 6271.93)
  (defvar g#8 6644.88)
  (defvar a8 7040.00)
  (defvar a#8 7458.62)
  (defvar b8 7902.13)
  (defvar note-names
    '(c0 c#0 d0 d#0 e0 f0 f#0 g0 g#0 a0 a#0 b0 c1 c#1 d1 d#1 e1 f1
      f#1 g1 g#1 a1 a#1 b1 c2 c#2 d2 d#2 e2 f2 f#2 g2 g#2 a2 a#2 b2
      c3 c#3 d3 d#3 e3 f3 f#3 g3 g#3 a3 a#3 b3 c4 c#4 d4 d#4 e4 f4
      f#4 g4 g#4 a4 a#4 b4 c5 c#5 d5 d#5 e5 f5 f#5 g5 g#5 a5 a#5 b5
      c6 c#6 d6 d#6 e6 f6 f#6 g6 g#6 a6 a#6 b6 c7 c#7 d7 d#7 e7 f7
      f#7 g7 g#7 a7 a#7 b7 c8 c#8 d8 d#8 e8 f8 f#8 g8 g#8 a8 a#8 b8)))

(pd:defproxy metronome (bpm)
  (s "metro" (metro (loadbang) :1 (expr "(60/$f1)*1000" bpm)))
  (s "metro2" (metro (loadbang) :1 (expr "(60/$f1)*500" bpm)))
  (s "metro4" (metro (loadbang) :1 (expr "(60/$f1)*250" bpm)))
  (s "metro8" (metro (loadbang) :1 (expr "(60/$f1)*125" bpm)))
  (s "metro16" (metro (loadbang) :1 (expr "(30/$f1)*125" bpm))))

(metronome 60)

(pd:defproxy kick ()
  (dac~ (hip~ 1 (cos~ (-~ 0.25 (*~ 20 (sqrt~ (line~ (:msg "0, 1 150" (r "metro"))))))))))

(pd:defproxy bass (freq)
  (dac~ (hip~ 1 (osc~ (*~ (line~ (:msg "0, 1 100" (r "metro")))
                          :1 freq)))))

(pd:defproxy melody ()
  (:array "melody" #.(list c2 d#2 f2 g2 a2 g2 f2 d#2))
  (dac~ (hip~ 1 (osc~ (tabread~ "melody" (mod 8 (:cnt (r "metro2"))))))))

(pd:defproxy rawprint ()
  (print (r "metro")))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/additive-synthesis.html
(pd:defproxy add-synth (sine-freq saw-freq)
  (dac~ (*~ 0.5
            (phasor~ saw-freq)
            (osc~ sine-freq))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/amplitude-modulation.html
(pd:defproxy am-synth (sine-freq saw-freq)
  (dac~ (*~ (phasor~ saw-freq)
            :1 (osc~ sine-freq))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/amplitude-modulation.html
(pd:defproxy tremolo-synth (sine-freq trem-freq)
  (dac~ (*~ (osc~ sine-freq)
            :1 (*~ 0.5 (+~ 1 (osc~ trem-freq))))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/frequency-modulation.html
(pd:defproxy freq-mod (base-freq mod-freq mod-amount)
  (dac~ (osc~ (+~ base-freq
                  :1 (*~ (osc~ mod-freq)
                         :1 mod-amount)))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/square-waves.html
(pd:defproxy square-osc (base-freq pulse-width)
  (dac~ (expr~ "$v1 > $v2" (phasor~ base-freq)
               :1 (/ 100 pulse-width))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/square-waves.html
(pd:defproxy square-mod (base-freq pulse-width)
  (dac~ (expr~ "$v1 > $v2" (phasor~ base-freq)
               :1 (abs~ (osc~ (/ 100 pulse-width))))))

;; http://archive.flossmanuals.net/pure-data/audio-tutorials/square-waves.html
;; beep-beep-beep
(pd:defproxy rhythmic-osc (freq1 freq2 gate)
  (dac~ (expr~ "$v1 || $v2"
               (expr~ "$v1 && $v2"
                      (expr~ "$v1 > 0.5" (phasor~ freq1))
                      :1 (expr~ "$v1 > 0.5" (phasor~ freq2)))
               :1 (expr~ "$v1 > 0.5" (phasor~ gate)))))

(pd:defproxy low-pass (freq)
  (dac~ (lop~ (noise~) :1 freq)))

(pd:defproxy perfect-noise ()
  (dac~ (lop~ (noise~) :1 300)))

(pd:defproxy high-pass (freq)
  (dac~ (hip~ (noise~) :1 freq)))

(pd:defproxy band-pass (freq resonance)
  (dac~ (bp~ 220 1 (noise~) :1 freq :2 resonance)))

(pd:defproxy voltage-control (&optional (center-freq 800) (mod-freq 0.25) (mod-amount 10000) (resonance 6))
  (dac~ (vcf~ 220 1 (noise~) :1 (+~ center-freq (*~ (osc~ mod-freq) :1 mod-amount)) :2 resonance)))

(pd:defproxy arr ()
  (:array "hello" (1 2 3 4 5 6 7))
  (dac~ (*~ 0.5 (phasor~ 500)
            (osc~ 300))))

;;; http://archive.flossmanuals.net/pure-data/audio-tutorials/envelope-generator.html

(pd:defproxy envelope ()
  (:array "pitch_envelope"
          (125 427 304 742 530 61 531 289 654 739 545 511 576 587 219 877 638 812 319 535
 71 210 469 223 259 942 183 698 243 589 660 488 707 668 710 727 184 335 931 172
 412 538 514 708 410 610 649 200 220 783 619 293 143 146 602 798 173 516 339
 213 923 976 728 706 175 534 115 396 511 162 832 832 537 237 335 738 663 750
 968 148 166 853 673 234 580 340 467 423 851 805 99 233 380 119 908 956 861 510
 515 670 400 819 31 476 848 658 271 536 88 552 567 431 713 530 674 713 544 397
 19 493 235 630 511 657 638 134 644 135 158 748 735 553 181 246 707 65 328 380
 872 695 209 836 953 309 43 245 927 816 164 473 913 841 549 611 621 796 48 284
 979 285 931 192 368 533 476 172 477 434 850 492 373 454 261 428 591 577 790
 783 263 444 248 905 330 468 203 715 492 535 363 970 96 368 309 908 965 974 527
 241 901 821 306 797 278 138 669 524 421 911 955 734 591 527 76 167 257 429 852
 611 970 95 389 637 521 366 126 394 63 930 902 883 923 282 865 171 791 695 634
 268 380 117 129 918 224 58 689 500 541 373 755 257 996 357 514 381 366 439 958
 858 561 631 370 754 254 278 570 654 665 731 743 317 900 740 549 388 120 62 87
 989 230 715 812 235 973 896 76 422 417 531 46 887 754 450 752 591 792 403 415
 594 81 441 224 332 557 570 456 138 364 622 256 791 203 519 850 37 603 237 18
 835 701 484 564 366 893 97 303 484 869 889 532 389 459 238 281 863 904 188 545
 113 126 644 967 607 299 412 639 530 753 636 943 624 26 645 110 508 307 87 395
 55 547 92 595 51 767 551 950 734 15 876 157 563 145 948 723 851 595 463 376 32
 727 55 680 690 268 615 28 990 241 653 851 448 234 740 347 696 209 259 720 378
 812 548 610 955 785 682 63 362 352 500 525 176 242 526 116 695 213 276 365 741
 242 813 792 722 101 388 532 218 534 839 399 284 994 521 137 246 37 921 327 913
 172 615 758 449 218 98 889 658 716 714 269 433 910 673 399 844 869 9 652 993
 950 903 481 878 640 820 533 18 636 720 561 449 476 494 337 449 286 844 737 388
 612 572 710 499 65 999 614 570 971 874 738 791 629 518 896 425 856 743 920 428
 730 196 869 731 5 931 895 228 294 713 168 224 814 552 639 970 753 84 528 352
 670 507 712 404 711 255 359 366 207 616 455 18 759 91 90 706 362 309 442 705
 684 192 864 328 155 425 171 830 740 79 510 178 533 864 193 897 402 148 775 998
 992 425 227 642 605 716 268 993 605 571 98 729 267 41 818 934 188 886 964 937
 378 173 88 122 593 760 179 800 798 269 371 638 208 417 184 982 310 150 329 913
 468 57 726 295 198 92 451 141 821 866 273 111 816 659 906 319 587 344 102 41
 848 833 595 604 921 934 766 913 804 773 56 106 336 977 782 558 348 608 176 47
 232 717 12 550 714 130 297 130 948 238 976 999 718 714 975 131 416 764 213 538
 885 86 713 947 120 666 235 981 665 479 190 133 545 467 445 772 847 216 816 25
 424 156 140 886 698 299 46 704 167 980 791 231 811 377 582 531 124 954 715 817
 838 913 517 975 112 162 915 651 671 823 259 3 368 364 123 396 185 973 87 489
 398 271 137 745 50 172 421 641 101 120 806 769 638 519 961 828 922 97 370 547
 378 876 94 663 341 748 236 314 776 352 385 626 999 627 164 59 465 553 290 730
 849 321 110 640 981 601 357 407 459 298 320 763 329 920 448 262 991 610 301
 736 96 218 36 337 38 336 830 674 651 857 928 705 785 459 922 126 78 32 332 246
 279 852 897 399 761 930 575 77 903 227 161 713 659 601 93 492 528 146 807 972
 879 89 515 905 989 467 62 250 437 874 9 82 456 334 772 907 264 263 464 528 552
 569 588 605 335 307 10 973 924 571 976 651 417 761 433 759 468 548 494 301 747
 274 500 204 558 696 705 217 747 352 450 384 162 648 831 68 400 823 99 353 722
 401 615 661 672 512 252 494 483 207 764 334 502 301 134 440 459 234 613 939
 818 880 213 596 855 634 289 961 964 864 846 556 196 741 797 262 184 695 751
 617 193 107 698 842 708 293 550 141 319 418 962 950 936 166 218 686 627 774
 597 535 672 220 469 875 663 785 735 783 950 684 860 245 365 576 969 670 740
 491 812 106 249 192 188 255 933 187 43 115 351 877 962 124 792 942 189 111 271
 195 121 219 921 305 725 290 740 37 318 305 741 4 949 720 124 401 242 248 998
 769 88 863 25 935))
  (dac~ (osc~ (tabread "pitch_envelope" (line (:msg "999 8000"))))))

;;; http://archive.flossmanuals.net/pure-data/audio-tutorials/amplifier.html

(pd:defproxy osc-ramp (freq)
  (dac~ (*~ (osc~ freq) :1 (vline~ (:msg "1 1000, 0.7 1000 1000, 0 1000 3000")))))

(pd:defproxy tabread-ramp (freq)
  (:array "audio_envelope"
          (610 991 758 560 222 448 12 918 668 227 107 530 631 211 330 187 681 52 229 953
               613 289 799 688 512 930 624 601 803 671 180 18 823 991 889 519 422 779 455 705
               95 759 553 999 50 952 937 815 333 771 499 364 960 692 115 753 953 534 950 621
               833 997 42 658 15 119 326 922 10 9 730 72 224 990 293 281 385 581 734 911 999
               525 562 352 978 524 710 48 527 885 141 709 28 456 247 534 843 514 766))
  (dac~ (*~ (osc~ freq) :1 (tabread4~ "audio_envelope" (line~ (:msg "99 4000"))))))

;; `readsf~' is a simple way to play an audio file. Especially with a metronome.
(pd:defproxy play-a-file ()
  (dac~ (readsf~
         (:msg
          "open "
          "~/git/pd-playground/focusrite-drum-pack/SAMPLES/Kick.aif" ", 1"
          (r "metro2")))))

(pd:release)

;;; A mess of a livecoding

;; Cool ones:
(list f5 d5 d5 e5 f5 d5 a#5 f5
      a#5 d5 f5 f5 g5 b5 g5 g5)
(list f5 g5 e5 e5 c5 f5 g5 b5
      d5 c5 e5 e5 e5 d5 e5 c5)

;; Cool samples:
;; Kicks
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_Kick_21.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DUBSTEP_THERAPY/DTS_SOUNDS_AND_FX/DTS_Kit_10_Kick_01.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/ESSENTIAL_EDM_2/EDM2_SOUNDS_AND_FX/EDM2_Kit_1_Kick_2.wav"
;; Claps
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/CAPSUN_PRESENTS_TRAP/CPN_SOUNDS_AND_FX/CPN_CLAP_05.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_Clap_05.wav"
;; Snares
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DUBSTEP_THERAPY/DTS_SOUNDS_AND_FX/DTS_Kit_10_Snare_02.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_Snare_09.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_Snare_03.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/CAPSUN_PRESENTS_TRAP/CPN_SOUNDS_AND_FX/CPN_SNARE_01.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/CAPSUN_PRESENTS_TRAP/CPN_SOUNDS_AND_FX/CPN_SNARE_10.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DUBSTEP_THERAPY/DTS_SOUNDS_AND_FX/DTS_Kit_10_Snare_01.wav"
;; Hats & cymbals
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/CAPSUN_PRESENTS_TRAP/CPN_SOUNDS_AND_FX/CPN_HI_HAT_09.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_High_Hat_05.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_High_Hat_16.wav"
;; Melodic & bass
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DAUWD_HOUSE_AND_ELECTRONICA/DWD_SOUNDS_AND_FX/DWD_808MCong2.wav"
"~/git/pd-playground/loopmasters/LOOPMASTERS4GigPack/LOOPMASTERS_2014/DUBSTEP_THERAPY/DTS_SOUNDS_AND_FX/DTS_Bass_A_09.wav"

(pd:defproxy full ()
  (:array "melody" #.(loop repeat 32 collect (elt (list c5 d5 e5 f5 g5 a5 b5) (random 7))))
  (:array "bass" #.(loop repeat 4 collect (elt (list a3 c3 e3 g3) (random 4))))
  (:array "kick" #.(loop repeat 8 collect (elt (list 0 2) (random 2))))
  (:array "hat" #.(loop repeat 8 collect (elt (list 0 1.5) (random 2))))
  (dac~ (hip~ 1
              (*~ (readsf~
                   (:msg
                    "open "
                    "~/git/pd-playground/focusrite-drum-pack/ROCK/120BPM/Fill_2_120.aif" ", 1"
                    (r "metro")))
                  :1 (tabread~ "kick" (mod 8 (:cnt (r "metro2")))))
              (*~ (readsf~
                   (:msg
                    "open " "~/git/pd-playground/focusrite-drum-pack/SAMPLES/Hat_Closed_1.aif" ", 1"
                    (r "metro4")))
                  :1 (tabread~ "hat" (mod 8 (:cnt (r "metro2")))))
              ;; (*~ 0.5 (phasor~ (tabread~ "melody" (mod 32 (:cnt (r "metro4"))))))

              ;; (cos~ (*~ (*~ 25 (sqrt~ (line~ (:msg "0, 1 200" (r "metro2")))))
              ;;           :1 (tabread~ "kick" (mod 8 (:cnt (r "metro2"))))))

              ;; TODO: Add and use let-binding to cl-pure-data proxies.
              ;; (*~ 0.5
              ;;     (phasor~ (tabread~ "bass" (mod 4 (:cnt (r "metro2")))))
              ;;     (osc~ (tabread~ "bass" (mod 4 (:cnt (r "metro2"))))))
              )))

(full)
(full-off)

;; To properly detach everything.
(pd:release)
