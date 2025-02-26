/*
MIT License

Copyright (c) 2025 Alin-Tudor Sferle

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
*/

package header_types;

typedef struct packed {
    logic [55:0]  preamble;
    logic [7:0]   sfd;
    logic [47:0]  dest_addr;
    logic [47:0]  source_addr;
    logic [15:0]  frame_type;
  } eth_frame_header;

  typedef struct packed {
    logic [ 3:0]  version;
    logic [ 3:0]  ihl;
    logic [ 7:0]  tos;
    logic [15:0]  total_length;
    logic [15:0]  identification;
    logic         pause;
    logic         df;
    logic         mf;
    logic [12:0]  fragment_offset;
    logic [ 7:0]  ttl;
    logic [ 7:0]  protocol;
    logic [15:0]  hdr_checksum;
    logic [31:0]  source_address;
    logic [31:0]  dest_address;

    // 20 bytes + 40 bytes - 10 * 4 bytes
    logic [31:0]  options_p1;
    logic [31:0]  options_p2;
    logic [31:0]  options_p3;
    logic [31:0]  options_p4;
    logic [31:0]  options_p5;
    logic [31:0]  options_p6;
    logic [31:0]  options_p7;
    logic [31:0]  options_p8;
    logic [31:0]  options_p9;
    logic [31:0]  options_p10;
  } ipv4_pckt_header;

  typedef struct packed {
    logic [3:0] version;
    logic [7:0] traffic_class;
    logic [19:0] flow_label;
    logic [15:0] payload_length;
    logic [7:0] next_header;
    logic [7:0] hop_limit;
    logic [127:0] source_addr;
    logic [127:0] dest_addr;
  } ipv6_pckt_header;

  typedef struct packed {
    logic [15:0]  source_port;
    logic [15:0]  dest_port;
    logic [15:0]  length;
    logic [15:0]  checksum;
  } udp_datagram_header;

  typedef struct packed {
    logic [15:0] source_port;
    logic [15:0] dest_port;
    logic [31:0] sequence_number;
    logic [31:0] ack_number;
    logic [3:0] data_offset;
    logic [3:0] reserved;
    logic cwr;
    logic ece;
    logic urg;
    logic ack;
    logic psh;
    logic rst;
    logic syn;
    logic fin;
    logic [15:0] window;
    logic [15:0] checksum;
    logic [15:0] urgent_pointer;

    // 16 bytes + options - 36 bytes - 9 * 4 bytes fields
    logic [31:0]  options_p1;
    logic [31:0]  options_p2;
    logic [31:0]  options_p3;
    logic [31:0]  options_p4;
    logic [31:0]  options_p5;
    logic [31:0]  options_p6;
    logic [31:0]  options_p7;
    logic [31:0]  options_p8;
    logic [31:0]  options_p9;
  } tcp_segment_header;

  typedef enum logic [1:0] {
    IDLE_TRANSM = 'h0,
    ETH_HDR = 'h1,
    IPV4_HDR = 'h2,
    IPV6_HDR = 'h3,
    UDP_HDR = 'h4,
    TCP_HDR = 'h5
  } state_received_pckt_transm;

endpackage