using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public class BorderRecord
    {
        public ushort Size { get; set; }

        public BorderStyle Style { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown1 { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        public LineStyle LineStyle { get; set; }

        public Color Color { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown3 { get; set; }

        public BorderRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Style = (BorderStyle)reader.ReadUInt16();
            Unknown1 = reader.ReadUInt16();
            Unknown2 = reader.ReadUInt16();
            LineStyle = (LineStyle)reader.ReadUInt16();
            Color = reader.ReadOrganizationChartColor();
            Unknown3 = reader.ReadUInt16();
        }

        public enum BorderStyle : ushort
        {
            None = 0x00,
            Single1 = 0x01,
            Hairline = 0x0A,
            Single2 = 0x0C,
            Single3 = 0x0D,
            Single4 = 0x0E,
            Double1 = 0x1F,
            Double2 = 0x16,
            Double3 = 0x29,
            Double4 = 0x17,
            Double5 = 0x33,
            Double6 = 0x18
        }
    }
}
