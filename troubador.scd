// Boots the server
s.boot;

// Make a buffer object for each channel and allocate memory to it
(
var audio = '/Users/davidtrussler/MusicProduction/Troubador/src/How-can-we-tell.aiff';

// load the vocal channel into buffer
var buffer_v = Buffer.readChannel(s, audio, 0, -1, [0]);

// load the guitar channel into buffer
var buffer_g = Buffer.readChannel(s, audio, 0, -1, [1]);

audio.postln;
buffer_v.postln;
buffer_g.postln;

// Play both simultaneously in different pan positions
{
	Pan2.ar(PlayBuf.ar(1, buffer_v, 1), 1) +
	Pan2.ar(PlayBuf.ar(1, buffer_g, 1), -1);
}.play;

// Free the memory
// buffer_v.free;
// buffer_g.free;
)

// Quit the server
s.quit;
