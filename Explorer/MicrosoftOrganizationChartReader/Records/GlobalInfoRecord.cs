using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public class GlobalInfoRecord
    {
        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown1 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown3 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown4 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown5 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown6 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown7 { get; set; }

        public GlobalGroupsStyle GroupsStyle { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown8 { get; set; }

        public GlobalInfoRecord(BinaryReader reader)
        {
            Unknown1 = reader.ReadUInt16();
            Unknown2 = reader.ReadUInt16();
            Unknown3 = reader.ReadUInt16();
            Unknown4 = reader.ReadUInt16();
            Unknown5 = reader.ReadUInt16();
            Unknown6 = reader.ReadUInt16();
            Unknown7 = reader.ReadUInt16();
            GroupsStyle = (GlobalGroupsStyle)reader.ReadUInt16();
            Unknown8 = reader.ReadUInt16();
        }

        public enum GlobalGroupsStyle: ushort
        {
            Style1 = 0x00,
            Style2 = 0x02,
            Style3 = 0x03,
            Style4 = 0x04,
            Style5 = 0x05,
            CoManager = 0x22,
        }
    }
}
