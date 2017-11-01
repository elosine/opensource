b = Buffer.read(s, "/Users/yangj14/Documents/GitHub/opensource/sc/sitar.wav");

c = Buffer.read(s, "/Users/yangj14/Documents/GitHub/opensource/sc/match.wav");

SynthDef( \sampy, {
	arg buf, rate=1, loop=0;
	var sig;
	sig = PlayBuf.ar(1, buf, rate, loop:loop, doneAction:2);
	Out.ar(0, sig);
}).add;

a = Synth(\sampy, [\buf, b, \loop, 0] );
d = Synth(\sampy, [\buf, c, \loop, 0] );