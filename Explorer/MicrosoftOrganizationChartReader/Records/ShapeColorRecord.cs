using System.ComponentModel;
using System.Drawing;
using System.IO;

namespace OrganizationChartReader
{
    public class ShapeColorRecord
    {
        public ushort Size { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown1 { get; set; }

        public Color Color { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        public ShapeColorRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Unknown1 = reader.ReadUInt16();
            Color = reader.ReadOrganizationChartColor();
            Unknown2 = reader.ReadUInt16();
        }
    }
}
