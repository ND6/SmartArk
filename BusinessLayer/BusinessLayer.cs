using CDataAccessLayer;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Logging.Abstractions;
using System;

namespace BusinessLayer
{
    public class BusinessLayer : IBusinessLayer
    {

        private readonly ILogger _logger;
        private readonly IDataAccessLayer _dataAccess;

        public BusinessLayer(ILogger<BusinessLayer> logger, IDataAccessLayer dataAccess)
        {

            _logger = logger ?? NullLogger<BusinessLayer>.Instance;
            _dataAccess = dataAccess;
        }

        public IDataAccessLayer DataAccess => _dataAccess;

        public void PerformBusiness()
        {
            _logger.LogInformation("BusinessLayer {BusinessLayerEvent} at {dateTime}", "Started", DateTime.UtcNow);

            // Perform Business Logic here
            _dataAccess.Create();

            _logger.LogInformation("BusinessLayer {BusinessLayerEvent} at {dateTime}", "Ended", DateTime.UtcNow);

        }
    }
}
