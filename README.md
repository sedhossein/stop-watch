# Digital Stop Watch


## Aim:
Using Xilinx ISE design and simulate a digital stop watch module to count in milliseconds.
• Use 1 KHz as primary clock in design.
• Module will have three inputs Start, Stop and Reset to control the stop watch.
• Use an 8-bit counter for milliseconds count.
## Procedure:
For designing a stop watch - I used the following pointers:
• defined 3 input variable viz start, stop and reset and a clock variable clock and an 8 bit output
variable named output.
• defined clock period as 1 ms
• defined a state machine with 3 states viz s0, s1 and s2
• initialized PS and NS as s0
• defined a clock process for the clock variable with at every rising edge PS is changing to NS and
other state changes are simulated with the different input conditions.
States are defined as follows:
• s0: s0 is the initial state where counter is ”00000000” and counter will not increase
• s1: s1 is the counting state. When the state is s1, counter will increase by 1 after every 1 ms
• s2: s2 is the stopped state. At this state counter will poses a value but will not increase until start
is triggered


| Present State | NS at start | NS at stop |  NS at reset |
| --- | --- | --- | --- |
| s0 | s1 | s0 | s0 |
| s1 | s1 | s2 | s0 |
| s2 | s1 | s2 | s0 |
