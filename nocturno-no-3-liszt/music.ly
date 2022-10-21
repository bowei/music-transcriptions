\version "2.22.2"


theMusic = \relative {
  \time 6/4
  g \bar "|"
  c d e f g a
  c d e f g a
  c d e f g a
}

\score {
  \new Staff <<
    \key c \major
    \theMusic
  >>
}