using System.IO;

namespace OrganizationChartReader
{
    public class BoxTextPartIndexRecord
    {
        public BoxTextPartIndex Index { get; set; }

        public BoxTextPartIndexRecord(BinaryReader reader)
        {
            Index = (BoxTextPartIndex)reader.ReadUInt16();
        }

        public enum BoxTextPartIndex : ushort
        {
            Name = 0x00,
            Title = 0x01,
            Comment1 = 0x02,
            Comment2 = 0x03
        }
    }
}
