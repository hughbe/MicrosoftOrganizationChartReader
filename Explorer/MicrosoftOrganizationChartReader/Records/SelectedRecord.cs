using System.ComponentModel;
using System.IO;

namespace OrganizationChartReader
{
    public class SelectedRecord
    {
        [TypeConverter(typeof(HexTypeConverter))]
        public ushort Unknown { get; set; }

        public SelectedRecord(BinaryReader reader)
        {
            Unknown = reader.ReadUInt16();
        }
    }
}
