using System.ComponentModel;
using System.IO;
using System.Text;

namespace OrganizationChartReader
{
    public class FontNameRecord
    {
        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Index { get; set; }
        public string Value { get; set; }

        public FontNameRecord(BinaryReader reader)
        {
            Index = reader.ReadUInt16();
            Value = Encoding.ASCII.GetString(reader.ReadBytes((int)reader.BaseStream.Length - 2));
        }
    }
}
