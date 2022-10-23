\version "2.22.0"

\language "english"

\header {
  title = "Nocturno No. 3"
  subtitle = "(Guitar)"
  arranger = "Arr. Mario Parodi"
  composer = "Franz Liszt"
}


% https://lsr.di.unimi.it/LSR/Snippet?id=952

Prefix = \markup {
  %% uncomment/comment these lines for C, C slashed, B or B slashed prefix :
  \roman C
  %\combine \roman C \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  %\roman B
  %\combine \roman B \translate #'(0.65 . -0.25) \override #'(thickness . 1.2) \draw-line #'(0 . 1.8)
  %%%%%%%%%%%%
  \hspace #0.2
}

#(define-markup-command (prefix layout props string-qty) (integer?)
  (interpret-markup layout props
    (if (member string-qty (iota 4 2 1))
        #{
           \markup {
             \override #'(font-family . typewriter)
             \concat {
               \fontsize #-4 {
                   \raise #.5 #(number->string string-qty)
                   \hspace #-.2
                   \raise #.2 "/"
                   \hspace #-.2
                   "6"
                 }
               \Prefix
             }
           }
        #}
        #{ \markup\Prefix #})))

startBarre =
#(define-event-function (arg-string-qty str)
  ((integer?) markup?)
  (let* ((pre-fix
           (if arg-string-qty #{ \markup \prefix #arg-string-qty #} Prefix))
         (mrkp (markup #:upright #:concat (pre-fix str #:hspace 0.3))))

    (define (width grob text-string)
      (let* ((layout (ly:grob-layout grob))
             (props (ly:grob-alist-chain
                       grob
                       (ly:output-def-lookup layout 'text-font-defaults))))
      (interval-length
        (ly:stencil-extent
          (interpret-markup layout props (markup text-string))
          X))))
    #{
      \tweak after-line-breaking
        #(lambda (grob)
          (let* ((mrkp-width (width grob mrkp))
                 (line-thickness (ly:staff-symbol-line-thickness grob)))
           (ly:grob-set-nested-property!
             grob
             '(bound-details left padding)
             (+ (/ mrkp-width -4) (* line-thickness 2)))))
      \tweak font-size -2
      \tweak style #'line
      \tweak bound-details.left.text #mrkp
      \tweak bound-details.left.attach-dir -1
      \tweak bound-details.left-broken.text ##f
      \tweak bound-details.left-broken.attach-dir -1
      %% adjust the numeric values to fit your needs:
      \tweak bound-details.left-broken.padding 1.5
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right.attach-dir 2
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.right.text
        \markup
          \with-dimensions #'(0 . 0) #'(-.3 . 0)
          \draw-line #'(0 . -1)
      \startTextSpan
    #}))

#(define startHalfBarre startBarre)

startModernBarre =
#(define-event-function (fretnum partial)
   (number? number?)
    #{
      \tweak bound-details.left.text
        \markup
          \small \bold \concat {
          %\Prefix
          #(format #f "~@r" fretnum)
          \hspace #.2
          \lower #.3 \fontsize #-2 #(number->string partial)
          \hspace #.5
        }
      \tweak font-size -1
      \tweak font-shape #'upright
      \tweak style #'dashed-line
      \tweak dash-fraction #0.3
      \tweak dash-period #1
      \tweak bound-details.left.stencil-align-dir-y #0.35
      \tweak bound-details.left.padding 0.25
      \tweak bound-details.left.attach-dir -1
      \tweak bound-details.left-broken.text ##f
      \tweak bound-details.left-broken.attach-dir -1
      %% adjust the numeric values to fit your needs:
      \tweak bound-details.left-broken.padding 1.5
      \tweak bound-details.right-broken.padding 0
      \tweak bound-details.right.padding 0.25
      \tweak bound-details.right.attach-dir 2
      \tweak bound-details.right-broken.text ##f
      \tweak bound-details.right.text
        \markup
          \with-dimensions #'(0 . 0) #'(-.3 . 0)
          \draw-line #'(0 . -1)
      \startTextSpan
   #})

stopBarre = \stopTextSpan

theMusic = {

\new Staff
\key c \major
\time 6/4

% measure 0
{
\voiceTwo
\tempo "poco allegro con affetto"
\partial 4 g4-3
}

% measure 1
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {g, c e c g} g'8\rest {g, c e c g}
}
\new Voice \relative {
	\voiceTwo
	e'2. e2.
}
>>

% measure 2
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {gs, d' e d gs,} g'8\rest {gs, d' e d gs,}
}
\new Voice \relative {
	\voiceTwo
	e'2.~ e2 e4
}
\new Voice \relative {
	\voiceFour
	e2.\rest e2.
}
>>

% measure 3
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {g,! cs e cs g} g'8\rest {g, cs e cs g}
}
\new Voice \relative {
	\voiceTwo
	e'2 e4 \< f2 e4 \!
}
\new Voice \relative {
	\voiceFour
	a2. e2.\rest
}
>>

% measure 4
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {fs,_\4 \> c'_\3 e c fs, \!} g'8\rest {fs, c' e c fs,}
}
\new Voice \relative {
	\voiceTwo
	e'2._\5 a,2 \! a4
}
>>

% measure 5
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {f,! g e' g, f} g'8\rest {f,_\4 g b g f}
}
\new Voice \relative {
	\voiceTwo
	a4 b c e2_\5 d4_\5
}
>>

% measure 6
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {e, g c g e} g'8\rest {e, g c g e}
}
\new Voice \relative {
	\voiceTwo
	c'2.~ c4 a4\rest g4
}
>>

% measure 7
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {g, c e c g} g'8\rest {g, c e c g}
}
\new Voice \relative {
	\voiceTwo
	e'2. e2.
}
>>

% measure 8
<<
\new Voice \relative {
	\voiceOne
	g''8\rest \< {gs, d' e d gs,} g'8\rest {gs, d' e d gs, \!}
}
\new Voice \relative {
	\voiceTwo
	e'2.~ e2 e4
}
\new Voice \relative {
	\voiceFour
	e2.\rest bf'4. a4\rest
}
>>

% measure 9
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {g,! cs e cs g} g'8\rest {g, cs e cs g}
}
\new Voice \relative {
	\voiceTwo
	e'2 e4 f2 e4
}
\new Voice \relative {
	\voiceFour
	a4
}
>>

% measure 10
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {fs,_\4 c'_\3 a' e_\2 c} {d, c'_\3 d_\2 a' <fs a,> d}
}
\new Voice \relative {
	\voiceTwo a2. a2\rest a4
}
>>

% measure 11
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {d, f b g f} g'8\rest {f,_\4 g b g f}
}
\new Voice \relative {
	\voiceTwo
	a4 b c e2_\5 d4_\5
}
>>

% measure 12
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {e, g c g e} {c e c' g e c}
}
\new Voice \relative {
	\voiceTwo
	c'2. f,2\rest f8\rest c'
}
>>

% measure 13
<<
\new Voice \relative {
	\voiceOne
	g''8\rest \startHalfBarre #3 "I" {f, c' af f g'8\rest}
	{g8\rest f, c' af f g'8\rest}
	\stopBarre
}
\new Voice \relative {
	\voiceTwo
	c'2~ c8 b c2~ c8 d8
}
>>

% measure 14
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {g, e' c g e} {c g' e' c g g'\rest}
}
\new Voice \relative {
	\voiceTwo
	e'2. f,2\rest f8\rest e'
}
>>

% measure 15
<<
\new Voice \relative {
	\voiceOne
	g''8\rest {a, e' c a g'\rest} {g\rest a, e' c a g'\rest}
}
\new Voice \relative {
	\voiceTwo
	e'2~ e8 ds e2~ e8 fs
}
>>

% measure 16, 17, 18
<<
\new Voice \relative {
	\voiceOne
	g''8\rest \startBarre "IV" {b, e gs e b} {g'\rest b, e gs e b}
	g'8\rest {cs, e gs e cs} {g'\rest cs, e gs e cs}
	g'8\rest {bs, ds gs ds bs} {g'\rest gs, bs ds bs gs}
	\stopBarre
}
\new Voice \relative {
	\voiceTwo
	gs'2. gs2.
	<gs cs,>2.~ <gs cs,>2.
	<gs gs,>2.~\arpeggio <ds gs,>2.
}
>>

% measure 19, 20, 21
<<
\new Voice \relative {
	\voiceOne
	g''8\rest \startBarre "I" af, c f c af
	g'\rest f, af c af f
	\stopBarre

	g'8\rest \startBarre "III" g, b d b g \stopBarre
	g'\rest \startBarre "I" af, c f c af \stopBarre
	g'8\rest g, b d b g
	g'\rest \startBarre "I" af, c f c af \stopBarre
}
\new Voice \relative {
	\voiceTwo
	<af f'>2.~ \arpeggio af2 c4
	<g d'>2. <af f'>2 \arpeggio ef'4
	d4_\5 cs_\5 d_\5 <af f'>2 \arpeggio ef'4
}
>>

% measure 22, 23, 24, 25
<<
\new Voice \relative {
	\voiceOne
	g''8\rest g, b d b g
	g'8\rest c, d af' d, c
}

\new Voice \relative {
	\voiceTwo
	%22
	d'4 cs d af'2.
	%23
	af4^\fermata \tempo "slowly" g f ef d c
	%24
	b g'\rest g\rest
	g,8 \startBarre "III" d' f b d f
	%25
	af g \stopBarre

	s2 % invisible rest so the run below can be done as grace notes

	%% rapid run section (64th notes according to the score)
	\grace {
	<af,, c>4 <g b> <c f> <b d>
	<f' af> <d g> <c' af> <g b>
	<c^\3 f^\2> <b^\0 d^\3> <f'^\3 af!^\2> <d^\4 g^\3>
	<af'^\2 c^\1> <g^\3 b^\2> <c f> <d b>
	af' g af g
	<c, f> <b d> <af! c> <g b>
	<af! c> <g b> <f af!> <d g>

	<c^\3 f^\2> \startHalfBarre #3 "III" <b! d> <c f> <b d> \stopBarre


	\bar ""
	\break

	 <c af!> <b g> <af! f> <g d>
	<f af> <g d> <f c>

	<d b!> <c f>  % 13 of these slides
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b> <c f>
	<d b>

	} % end of run

 	c'4\rest
	c\rest^\fermata
	fs |
	\bar "||"
}
>>

% Measure 26 TODO
<<
\key ef \major

\new Voice \relative {
	\voiceOne
	g''8\rest g, b d b g
	g'8\rest c, d af' d, c
}
>>

}

\score { \theMusic }
