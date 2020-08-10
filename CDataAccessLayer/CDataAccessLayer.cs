using Microsoft.Extensions.Logging;
using System;
using Microsoft.Extensions.Logging.Abstractions;

namespace CDataAccessLayer
{
    public class CDataAccessLayer : IDataAccessLayer
    {

        private readonly ILogger _logger;
        public CDataAccessLayer(ILogger<CDataAccessLayer> logger)
        {

            _logger = logger ?? NullLogger<CDataAccessLayer>.Instance;
        }
        public void Create()
        {
            _logger.LogInformation("CDataAccessLayer {CDataAccessLayerEvent} at {dateTime}", "Started", DateTime.UtcNow);


            _logger.LogInformation("CDataAccessLayer {CDataAccessLayerEvent} at {dateTime}", "Ended", DateTime.UtcNow);
        }
    }
}
