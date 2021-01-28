using System.IO;

namespace OrganizationChartReader
{
    public class BoxTextPartTypeRecord
    {
        public BoxTextPartType Type { get; set; }
        
        public BoxTextPartTypeRecord(BinaryReader reader)
        {
            Type = (BoxTextPartType)reader.ReadUInt16();
        }

        public enum BoxTextPartType : ushort
        {
            TopLevel = 0x01,
            Comment = 0x02,
        }
    }
}
