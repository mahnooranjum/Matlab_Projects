%% *Assignment 3*
% *EE851 Advanced Digital Communication Systems*
% 
% _Instructor: Dr Rizwan Ahmad_
% 
% _Prepared by: Ali Hassan_
% 
% *Submitted by: Mahnoor Anjum* 
% 
% *Registration Number: 330720*
%% 
% 
%% *Question 1*
% An Internet Service Provider (ISP) uses a compression technique to encode 
% the message before transmitting over the network. Consider that the message 
% contains the following characters with their frequencies as shown in the table. 
% (Note that each character in input message takes 1 bytecompression and the technique 
% used is Huffman Coding,)
% 
% 
% 
% Write a program Huffman coding algorithm to find the code words for the symbols.

Character = ['a' 'b' 'c' 'd' 'e' 'f']';
Frequency = [5 9 12 13 16 45]';
T = table(Character, Frequency);
% T.Probability = T.Frequency / sum(T.Frequency);
T = sortrows(T,'Frequency');
T.State = T.Frequency;
code = ['-' '-' '-' '-' '-' "-"];
T
while length(unique(T.State)) ~= 1
T_u = unique(T.State);
[v, idx] = mink(T_u, 2);
temp = T_u(idx(1)) +  T_u(idx(2));
code(T.State == T_u(idx(1))) = append(code(T.State == T_u(idx(1))), 'L');
code(T.State == T_u(idx(2))) = append(code(T.State == T_u(idx(2))), 'R');
T.State(T.State == T_u(idx(1)) | T.State == T_u(idx(2))) = temp;
T
end
for i=1:length(code)
    code(i) = replace(code(i), 'L', '0');
    code(i) = replace(code(i), 'R', '1');
    code(i) = reverse(code(i));
    disp([T.Character(i) code(i)]);
end
%% *Question 2* 
% A Telecom company uses a compression technique to encode the source message 
% before transmitting it over the network Consider that the source emits six symbols 
% (x1,x2, x3...x6) with probabilities 0.3, 0.25, 0.2, 0.1, 0.1 and 0.05, respectively. 
% Construct a Shannon-Fano code for this source. 


Character = ["x1" 'x2' 'x3' 'x4' 'x5' 'x6']';
Probability = [0.3 0.25 0.2 0.1 0.1 0.05]';
T = table(Character, Probability)
%%
code = ['-' '-' '-' '-' '-' "-"];
T.Temp = cumsum(T.Probability);
val  = 1;
summa = 0;
split = 0;
for i=1:4
    val = val/2;
    summa = summa + val;
    [~,idx] = (min(abs(T.Temp - (summa))));
    code(split+1:idx) = append(code(split+1:idx),'0');
    code(idx+1:end) = append(code(idx+1:end),'1');
    split = idx;
end
code(1) = append(code(1),'0');
code(2) = append(code(2),'1');

for i=1:length(code)
    disp([T.Character(i) code(i)]);
end
%% *Question 3*
% You are required to investigate the properties of a simple channel code (Turbo 
% and Convolutional code) by using MATLAB. You will encode (using Turbo and Convolutional 
% coders) and decode (using Viterbi algorithm). Consider that 10000 binary bits 
% sequence is transmitted with and without transmission errors. Channel coding 
% adds extra data bits to make the transmission of data more robust to disturbances 
% present on the transmission channel. The purpose of this assignment is to build 
% a simple coder to reduce errors in a noisy binary channel. In this assignment, 
% Turbo and Convolutional coding will be applied to reduce the transmission errors. 
% Examine the length of the transmission sequence before and after channel coding. 
% Relate that to the code parameters (n and k)? How many consecutive errors can 
% your channel code correct?
% 
% *Hints*
%% 
% * *This code has _K_ = 2, _k_ = 2, _n_ = 3, and a rate of 2/3.*
% * *The generator functions for this code are _g_1 = [1011], _g_2 = [1101], 
% _g_3 = [1010]*
%% 
% 

m4 = [0 1 0 1 0 1 0 1 0 1 0 1 0 1 0 1 ]';
m3 = [0 0 1 1 0 0 1 1 0 0 1 1 0 0 1 1 ]';
m2 = [0 0 0 0 1 1 1 1 0 0 0 0 1 1 1 1 ]';
m1 = [0 0 0 0 0 0 0 0 1 1 1 1 1 1 1 1 ]';
T  = table(m1, m2, m3, m4);
T.x1 = mod(T.m1+T.m3+T.m4,2);
T.x2 = mod(T.m1+T.m3+T.m4,2);
T.x3 = mod(T.m1+T.m3,2);
T
% An example of encoding 10000 
m = [1 0 0 0 0];
transmissionOrder = fliplr(m);
K = 2; k=2; n=3;
output = [];
temp = zeros(1, length(m));
stream = cat(2, temp, transmissionOrder);
for i=0:3
    temp = circshift(stream,i*k);
    b1 = T.x1(T.m1 == temp(1) & T.m2 == temp(2) & T.m3 == temp(3) & T.m4 == temp(4));
    b2 = T.x2(T.m1 == temp(1) & T.m2 == temp(2) & T.m3 == temp(3) & T.m4 == temp(4));
    b3 = T.x3(T.m1 == temp(1) & T.m2 == temp(2) & T.m3 == temp(3) & T.m4 == temp(4));
    output = [output b3 b2 b1];
end
output = fliplr(output)
%% 
% * *For Turbo Encoder use the same convolutional coder twice and use interleaver 
% (Interleaver is used to provide randomness to the input sequences or to improver 
% burst error correction capacity*.*) for the second coder as shown in block diagram 
% below.*
%% 
% *Code rate 2/8* 
% 
% 
% 
% *Case 1 (without transmission errors)*
%% 
% * Generate 10000 bits binary sequence.
% * Encode the data using Turbo and Convolutional code.
% * Consider the channel is ideal.
% * Decode the encoded data using Viterbi.
% * Compare with the input data sequence.
% * Plot the BER for both Turbo and convolutional coders

K = 2; k=2; n=3;
g1 = [1 0 1 1]; g1 = bi2oct(g1);
g2 = [1 1 0 1]; g2 = bi2oct(g2);
g3 = [1 0 1 0]; g3 = bi2oct(g3);
pPatternVec = [0 0 0 1 1 1]';
trellis = poly2trellis(4, [g1 g2 g3])
N = 10000;
interlvrindices = randperm(N);
hConEnc = comm.ConvolutionalEncoder(trellis, ...
                                    'PuncturePatternSource','Property', ...
                                    'PuncturePattern', pPatternVec);
hTurEnc = comm.TurboEncoder(trellis, interlvrindices);
hcDec = comm.ViterbiDecoder(trellis, 'InputFormat','Hard', ...
                                    'PuncturePatternSource','Property',...
                                    'PuncturePattern',pPatternVec);
htDec = comm.TurboDecoder(trellis, interlvrindices);
hcError  = comm.ErrorRate;
htError = comm.ErrorRate;

iters = 100;
BERT = zeros(1,iters);
BERC = zeros(1,iters);
data = randi([0 1],N,1);

for i=1:iters
    encodedData = step(hConEnc, data);
    receivedBits = step(hcDec, encodedData);
    errorsC = step(hcError, data, receivedBits);
    encodedData = step(hTurEnc, data);
    receivedBits = step(htDec, encodedData);
    errorsT = step(htError, data, receivedBits);
    reset(hcError);
    reset(htError);
    BERC(i) = errorsC(1);
    BERT(i) = errorsT(1);
end

figure(), hold on, grid on, box on; 
plot(BERC, "r", "LineWidth",2);
plot(BERT, "b", "LineWidth",2);
legend("Convolutional Code", "Turbo Code"); 
xlabel("Iteration Number"); ylabel("BER");
title("BER in an Ideal Channel");
%% 
% *Case 2 (with transmission errors)*
%% 
% * Generate 10000 bits binary sequence.
% * Encode the data using Turbo and Convolutional code.
% * Consider the channel is AWGN or generate a 10000 bits binary array for error. 
% Pass the encoded data and without encoded data through channel  
% * Decode the encoded data using Viterbi.
% * Compare with the input data sequence.
% * Plot the BER for both Turbo and convolutional coders

clear;
K = 2; k=2; n=3;
g1 = [1 0 1 1]; g1 = bi2oct(g1);
g2 = [1 1 0 1]; g2 = bi2oct(g2);
g3 = [1 0 1 0]; g3 = bi2oct(g3);
pPatternVec = [0 0 0 1 1 1]';
trellis = poly2trellis(4, [g1 g2 g3])
N = 1000;
interlvrindices = randperm(N);
hConEnc = comm.ConvolutionalEncoder(trellis, ...
                                    'PuncturePatternSource','Property', ...
                                    'PuncturePattern', pPatternVec);
hTurEnc = comm.TurboEncoder(trellis, interlvrindices);
hrChan = comm.AWGNChannel('NoiseMethod', ...
                            'Signal to noise ratio (SNR)',...
                            'SNR',3);
hcChan = comm.AWGNChannel('NoiseMethod', ...
                            'Signal to noise ratio (SNR)',...
                            'SNR',3);
htChan = comm.AWGNChannel('NoiseMethod', ...
                            'Signal to noise ratio (SNR)',...
                            'SNR',3);
hcDec = comm.ViterbiDecoder(trellis, 'InputFormat','Hard', ...
                                    'PuncturePatternSource','Property',...
                                    'PuncturePattern',pPatternVec);
htDec = comm.TurboDecoder(trellis, interlvrindices);
hcError  = comm.ErrorRate;
htError  = comm.ErrorRate;
hrError  = comm.ErrorRate;

iters = 100;
BERT = zeros(1,iters);
BERC = zeros(1,iters);
BERR = zeros(1,iters);
data = randi([0 1],N,1);
for i=1:iters

    rawSent = data;
    receivedSignal = step(hrChan, rawSent);
    receivedBits = double(receivedSignal<0);
    errorsR = step(hrError, data, receivedBits);
    encodedData = step(hConEnc, data);
    receivedSignal = step(hcChan, encodedData);
    receivedBits = step(hcDec, receivedSignal);
    errorsC = step(hcError, data, receivedBits);
    encodedData = step(hTurEnc, data);
    receivedSignal = step(htChan, encodedData);
    receivedBits = step(htDec, receivedSignal);
    errorsT = step(htError, data, receivedBits);
    reset(htError); % reset(htChan); reset(htDec); reset(hTurEnc);
    reset(hcError); % reset(hcChan); reset(hcDec); reset(hConEnc);
    reset(hrError); % reset(hrChan); 
    BERR(i) = errorsR(1);
    BERT(i) = errorsT(1);
    BERC(i) = errorsC(1);
end
figure(), hold on, grid on, box on; 
plot(BERR, "g", "LineWidth",2);
plot(BERC, "r", "LineWidth",2);
plot(BERT, "b", "LineWidth",2);
xlabel("Iteration Number"); ylabel("BER");
legend("Raw code", "Convolutional code", "Turbo code"),title("BER in AWGN channel");
%% 
% *Interleaver*
% 
% One of the simplest procedures for doing interleaving the data is to divide 
% the whole transmitted binary sequence data into two arrays. The first array 
% contains the first 50 % of the binary sequence data and the last 50 % of the 
% binary sequence data containing the second array. Make a new data array that 
% contains one element of the first array after this second element of the second 
% array. The new data array is called the interleaved array of the data.
%% Helper functions


%% 
%