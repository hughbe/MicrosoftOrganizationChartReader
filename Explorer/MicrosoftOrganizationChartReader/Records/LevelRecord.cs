using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class LevelRecord
    {
        public ushort Size { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown1 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown3 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown4 { get; set; }

        public ushort Count { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown5 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown6 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public byte Unknown7 { get; set; }

        public LevelRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Unknown1 = reader.ReadUInt16();
            Unknown2 = reader.ReadUInt16();
            Unknown3 = reader.ReadUInt16();
            Unknown4 = reader.ReadUInt16();
            Count = reader.ReadUInt16();
            Unknown5 = reader.ReadUInt16();
            Unknown6 = reader.ReadUInt16();
            Unknown7 = reader.ReadByte();
        }
    }
}
