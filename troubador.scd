// Boots the server
s.boot;

a = '/Users/davidtrussler/MusicProduction/Troubador/src/How-can-we-tell.aiff';

// Read chunk:gtr_chord file into Buffer memory
(
var startFrame = 474275;
var length = 274318;

b = Buffer.readChannel(
	s, // server
	a, // path
	startFrame, // start frame
	length, // number of frames
	1 // channels
)
)

b.plot;
b.free;

// Play file in buffer with PlayBuf UGen
// Set synth to free itself when action is done
(
x = SynthDef(
	'tutorial-PlayBuff', // name
	{ // ugenGraphFunc
		arg out = 0,
		bufnum;
		Out.ar(
			out,
			PlayBuf.ar(
				1, // numChannels
				bufnum, // bufnum
				loop: 1
			)
		);
	}
).play(s, [\out, 0, \bufnum, b]);
)

x.free;

// Quit the server
s.quit;
