\version "2.22.0"

\language "english"

\header {
  title = "Nocturno No 3"
  composer = "Franz Liszt, transcription: Mario Parodi"
}


theMusic = {

\time 6/4

% measure 0
{\voiceTwo \partial 4 g4-3}

% measure 1
<<
\new Voice \relative {\voiceOne g''8\rest {g, c e c g} g'8\rest {g, c e c g}}
\new Voice \relative {\voiceTwo e'2. e2.}
>>

% measure 2
<<
\new Voice \relative {\voiceOne g''8\rest {gs, d' e d gs,} g'8\rest {gs, d' e d gs,}}
\new Voice \relative {\voiceTwo e'2.~ e2 e4}
\new Voice \relative {\voiceFour e2.\rest e2.}
>>

% measure 3
<<
\new Voice \relative {\voiceOne g''8\rest {g,! cs e cs g} g'8\rest {g, cs e cs g}}
\new Voice \relative {\voiceTwo e'2 e4 \< f2 e4 \!}
\new Voice \relative {\voiceFour a2. e2.\rest}
>>

% measure 4
<<
\new Voice \relative {\voiceOne g''8\rest {fs, c' e c fs,} g'8\rest {fs, c' e c fs,}}
\new Voice \relative {\voiceTwo e'2. \> a,2 \! a4 \!}
>>

% measure 5
<<
\new Voice \relative {\voiceOne g''8\rest {f, g e' g, f} g'8\rest {f, g b g f}}
\new Voice \relative {\voiceTwo a4 b c e2 d4}
>>

% measure 6
<<
\new Voice \relative {\voiceOne g''8\rest {e, g c g e} g'8\rest {e, g c g e}}
\new Voice \relative {\voiceTwo c'2.~ c4 a4\rest g4}
>>

}

\score {
  \new Staff <<
    \key c \major
    \theMusic
  >>
}
