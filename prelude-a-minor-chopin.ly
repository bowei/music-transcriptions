
\version "2.22.0"
\language "english"

\header{
title = "Prelude in A minor (Op. 28, No. 7)"
composer = "Frederic Chopin"
arranger = "(arr. for guitar)"
}

\score {
  \new Staff {
    \key a \major
    \time 3/4
    % measure 1
    \partial 4 e'
    % measure 2
    <<
	\new Voice {
	     \voiceOne
	     {cs''8. d''16 <gs' b'>4 <gs' b'>4}
	}
	\new Voice {
	     \voiceTwo
	     {e4 <e d'> <e d'>}
	}
    >>
    % measure 3
    <<
	\new Voice {
	     \voiceOne
	     <gs' b'>2
	     <d'' fs''>4
	}
	\new Voice {
	     \voiceTwo
	     <e d'>2
	}
    >>
    % measure 4
    <<
	\new Voice {
	     \voiceOne
	     <bs' ds''>8. <cs'' e''>16
	     <cs'' a''>4 <cs'' a''>4
	}
	\new Voice {
	     \voiceTwo
	     a4 a a
	}
    >>
    % measure 5
    <<
	\new Voice {
	     \voiceOne
	     <cs'' a''>2
	     <e' cs''>4
	}
	\new Voice {
	     \voiceTwo
	     a2
	}
    >>
    % measure 6
    <<
	\new Voice {
	     \voiceOne
	     <cs' as'>8. <d' b'>16
	     <fs' d''>4
	     <fs' d''>4
	}
	\new Voice {
	     <<
		% holding e instead of playing again, seems a bit muddy.
		{\voiceTwo e2.} \\
	     	{s4 b b}
	     >>
	}
    >>
    % measure 8
    <<
	\new Voice {
	     \voiceOne
	     <fs' d''>2
	     <d' gs'>4
	}
	\new Voice {
	     \voiceTwo
	     <e b>
	}
    >>
  }
}

