\version "2.22.0"

\language "english"

\header {
  title = "Nocturno No 3"
  composer = "Franz Liszt, transcription: Mario Parodi"
}


theMusic = {

\time 6/4

% 1
{\voiceTwo \partial 4 g4-3}

% 2
<<
\new Voice \relative {\voiceOne g''8\rest {g, c e c g} g'8\rest {g, c e c g}}
\new Voice \relative {\voiceTwo e'2. e2.}
>>

% 3
<<
\new Voice \relative {\voiceOne g''8\rest {gs, d' e d gs,} g'8\rest {gs, d' e d gs,}}
\new Voice \relative {\voiceTwo e'2.~ e2 e4}
\new Voice \relative {\voiceFour e2.\rest e2.}
>>

%4
<<
\new Voice \relative {\voiceOne g''8\rest {g,! cs e cs g} g'8\rest {g, cs e cs g}}
\new Voice \relative {\voiceTwo e'2 e4 \< f2 e4 \!}
\new Voice \relative {\voiceFour a2. e2.\rest}
>>

}

\score {
  \new Staff <<
    \key c \major
    \theMusic
  >>
}
