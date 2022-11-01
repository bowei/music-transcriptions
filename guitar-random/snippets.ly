\version "2.22.0"
\language "english"

\header{
  title = "Guitar snippets"
}

snippet = {
	\new Staff
	\key a \minor
	\time 4/4

	\repeat volta 2 {
	\new Voice \relative {
		\voiceOne
		a8 e' <a c>4 <b d>2
		a,4 <g' c e>8 a' <g, b fs'>2
		c,8 <g' c e>8~ <g c e>4 <g, d' g d'>2
		<e' a cs>4. <f as d>8 <e a cs>2
	}
	}
}

\score {
	\snippet
	\midi{}
}
