using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class ShapeRecord
    {
        public ushort Size { get; set; }

        public ShapeType Type { get; set; }

        public uint Y { get; set; }

        public uint X { get; set; }

        public uint Width { get; set; }

        public uint Height { get; set; }

        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown2 { get; set; }

        public ShapeRecord(BinaryReader reader)
        {
            Size = reader.ReadUInt16();
            Type = (ShapeType)reader.ReadUInt16();
            Y = reader.ReadUInt32();
            X = reader.ReadUInt32();
            Width = reader.ReadUInt32();
            Height = reader.ReadUInt32();
            Unknown2 = reader.ReadUInt16();
        }

        public enum ShapeType
        {
            Rectangle = 0x01,
            Text = 0x02,
            HorizontalLine = 0x03,
            VerticalLine = 0x04,
            CustomLine = 0x05
        }
    }
}
