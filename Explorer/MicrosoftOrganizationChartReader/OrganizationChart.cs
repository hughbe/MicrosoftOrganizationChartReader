using System;
using System.Collections.Generic;
using System.IO;
using System.Text;

namespace OrganizationChartReader
{
    public class OrganizationChart
    {
        public IReadOnlyList<(ushort id, byte[] data)> Records { get; set; }

        public OrganizationChart(Stream stream)
        {
            if (stream == null)
            {
                throw new ArgumentNullException(nameof(stream));
            }

            using var reader = new BinaryReader(stream);
            if (Encoding.ASCII.GetString(reader.ReadBytes(4)) != "UOCF")
            {
                throw new Exception("Invalid file signature");
            }

            var records = new List<(ushort id, byte[] data)>();
            while (stream.Position < stream.Length)
            {
                ushort id = reader.ReadUInt16();
                if (id >= 0x4000)
                {
                    records.Add((id, Array.Empty<byte>()));
                }
                else
                {
                    ushort length = reader.ReadUInt16();
                    records.Add((id, reader.ReadBytes((int)length)));
                }
            }

            Records = records;
        }
    }
}
