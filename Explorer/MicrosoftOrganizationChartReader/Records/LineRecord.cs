using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public class LineRecord
    {
        public ushort Size { get; set; }

        public LineStyle Style { get; set; }

        public ushort Thickness { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown1 { get; set; }

        public Color Color { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        public LineRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Style = (LineStyle)reader.ReadUInt16();
            Thickness = reader.ReadUInt16();
            Unknown1 = reader.ReadUInt16();
            Color = reader.ReadOrganizationChartColor();
            Unknown2 = reader.ReadUInt16();
        }
    }
}
