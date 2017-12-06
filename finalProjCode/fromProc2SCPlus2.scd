b = Bus.control(s);
~b1 = Bus.control(s);
OSCdef (\sensor1, {
	arg msg;
	var val;
	val = msg[1].asFloat;
	val = val.linlin(0.0, 1.0, 48.0, 72.0);
	b.set(val); //sets the control bus value
	// val.postln;
}, "/sensor1" );


OSCdef (\hbtm, {
	d = Synth( \sampy, [\buf, c] );
	d.map(\rate, ~b1);
}, "/hbtm" );


OSCdef (\cx, {
	arg msg;
	var val;
	val = msg[1];
	val = val.linlin(0.0, 1.0, 0.1, 13.0);
	~b1.set(val);
	~b1.getSynchronous;
}, "/cx" );


SynthDef(\siney, {
	arg pitch=60;
	var freq, sig;
	freq = pitch.midicps;
	sig = SinOsc.ar(freq);
	Out.ar(0, sig);
}).add;

c = Buffer.read(s, "/Users/yangj14/Documents/GitHub/opensource/finalProjCode/glitch.wav")

SynthDef(\sampy, {
	arg buf, rate=1;
	var sig;
	sig = PlayBuf.ar(1, buf, rate:rate, doneAction:2);
	Out.ar(0, sig);
}).add;
d = Synth( \sampy, [\buf, c] );





a = Synth(\siney);
a.map(\pitch, b);








