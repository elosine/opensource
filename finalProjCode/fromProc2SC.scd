b = Bus.control(s);
OSCdef( \ctl1, {
	arg msg;
	var val, pitch;
	val = msg[1].asFloat;
	pitch = val.linlin(0.0, 1.0, 48.0, 72.0);
	b.set(pitch);
	msg.postln;
}, "/ctl1");
SynthDef(\siney, {
	arg pitch=60;
	var sig, freq;
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig);
}).add;
a = Synth(\siney);
a.map(\pitch, b);

s.meter

