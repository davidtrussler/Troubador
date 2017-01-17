// Sets the default server to variable s and boots it
// Server.default = s = Server.internal.boot;
s.boot;

// load the vocal channel into buffer
~buffer_voc = Buffer.readChannel(s, '/Users/davidtrussler/Documents/Music/Troubador-no-more/src/How-can-we-tell.aiff', 0, -1, [0]);

// load the guitar channel into buffer
~buffer_gtr = Buffer.readChannel(s, '/Users/davidtrussler/Documents/Music/Troubador-no-more/src/How-can-we-tell.aiff', 0, -1, [1]);

// Play both channels of the sound source
{PlayBuf.ar(1, [~buffer_voc, ~buffer_gtr], 1)}.play;

// Free the memory
~buffer.free;

// Quits the server booted above
s.quit;