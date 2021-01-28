using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class ConnectorRecord
    {
        public ushort Size { get; set; }

        public ushort OriginIndex { get; set; }

        public ushort OriginLevel { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown3 { get; set; }

        public ushort TargetIndex { get; set; }

        public ushort TargetLevel { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown4 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown5 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown6 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown7 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown8 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown9 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown10 { get; set; }

        public ConnectorRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            OriginIndex = reader.ReadUInt16();
            OriginLevel = reader.ReadUInt16();
            Unknown3 = reader.ReadUInt16();
            TargetIndex = reader.ReadUInt16();
            TargetLevel = reader.ReadUInt16();
            Unknown4 = reader.ReadUInt16();
            Unknown5 = reader.ReadUInt16();
            Unknown6 = reader.ReadUInt16();
            Unknown7 = reader.ReadUInt16();
            Unknown8 = reader.ReadUInt16();
            Unknown9 = reader.ReadUInt16();
            Unknown10 = reader.ReadUInt16();
        }
    }
}
