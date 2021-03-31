package rvcore.TileLink

import chisel3._
import chisel3.util._

/**
 * Base class for TileLink channels
 * @param w     Width of the data bus in bytes. Must be a power of two.
 * @param a     Width of each address field in bits
 * @param z     Width of each size field in bits
 * @param o     Number of bits needed to disambiguate per-link master sources
 * @param i     Number of bits needed to disambiguate per-link slave sinks
 */
abstract class TileLinkChannel (
                        w:   Int,
                        a:   Int,
                        z:   Int,
                        o:   Int,
                        i:   Int
                      ) extends Bundle {
  require(isPow2(w))
  val corrupt:  Bool  // Corruption was detected
  val valid:    Bool  // The sender is offering progress on an operation
  val ready:    Bool  // The receiver accepted the offered progress
}

//----------------------------------------------------------------------------------------------------------------------

/**
 * Bundle for the TileLink channel A.
 *
 * For more information see: [[https://sifive.cdn.prismic.io/sifive%2Fcab05224-2df1-4af8-adee-8d9cba3378cd_tilelink-spec-1.8.0.pdf#glo%3AA]]
 * @param w     Width of the data bus in bytes. Must be a power of two.
 * @param a     Width of each address field in bits
 * @param z     Width of each size field in bits
 * @param o     Number of bits needed to disambiguate per-link master sources
 * @param i     Number of bits needed to disambiguate per-link slave sinks
 */
class ChannelA (
                 w:   Int,
                 a:   Int,
                 z:   Int,
                 o:   Int,
                 i:   Int
               ) extends TileLinkChannel(w,a,z,o,i) {
  val opcode    = Output(UInt(3.W))     // Operation code. Identifies the type of message carried by the channel
  val param     = Output(UInt(3.W))     // Parameter code. Meaning depends on `opcode`; specifies a transfer of caching permissions or a sub-opcode
  val size      = Output(UInt(z.W))     // Logarithm of the operation size: 2^n bytes
  val source    = Output(UInt(o.W))     // Unique, per-link master source identifier
  val address   = Output(UInt(a.W))     // Target byte address of the operation. Must be aligned to `size`
  val mask      = Output(UInt(w.W))     // Byte lane select for messages with data
  val data      = Output(UInt((8*w).W)) // Data payload for messages with data
  val corrupt   = Input(Bool())         // The data in this beat is corrupt

  val valid     = Output(Bool())        // The sender is offering progress on an operation
  val ready     = Input(Bool())         // The receiver accepted the offered progress
}

//----------------------------------------------------------------------------------------------------------------------

/**
 * Bundle for the TileLink channel D.
 *
 * For more information see: [[https://sifive.cdn.prismic.io/sifive%2Fcab05224-2df1-4af8-adee-8d9cba3378cd_tilelink-spec-1.8.0.pdf#glo%3AA]]
 * @param w     Width of the data bus in bytes. Must be a power of two.
 * @param a     Width of each address field in bits
 * @param z     Width of each size field in bits
 * @param o     Number of bits needed to disambiguate per-link master sources
 * @param i     Number of bits needed to disambiguate per-link slave sinks
 */
class ChannelD (
                 w:   Int,
                 a:   Int,
                 z:   Int,
                 o:   Int,
                 i:   Int
               ) extends TileLinkChannel(w,a,z,o,i) {
  val opcode    = Output(UInt(3.W))     // Operation code. Identifies the type of message carried by the channel
  val param     = Output(UInt(2.W))     // Parameter code. Meaning depends on `opcode`; specifies a transfer of caching permissions or a sub-opcode
  val size      = Output(UInt(z.W))     // Logarithm of the operation size: 2^n bytes
  val source    = Output(UInt(o.W))     // Unique, per-link master source identifier
  val sink      = Output(UInt(i.W))     // Unique, per-link slave sink identifier
  val denied    = Output(Bool())        // The slave was unable to service the request
  val data      = Output(UInt((8*w).W)) // Data payload for messages with data
  val corrupt   = Input(Bool())         // Corruption was detected in the data payload

  val valid     = Output(Bool())        // The sender is offering progress on an operation
  val ready     = Input(Bool())         // The receiver accepted the offered progress
}