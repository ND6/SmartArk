using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Text.Json.Serialization;
using System.Threading.Tasks;
using System.Windows.Forms;
using BusinessLayer;
using DITest.Models;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;

namespace DITest
{
    
    public partial class Form1 : Form
    {
        private ILogger _logger;
        private IBusinessLayer _businessLayer;
        private IConfiguration _configuration;
        private ClientDBContext _context;
        public Form1(ILogger<Form1> logger,IBusinessLayer businessLayer,IConfiguration configuration, ClientDBContext context)
        {
            _logger = logger;
            _businessLayer = businessLayer;
            _configuration = configuration;
            _context = context;

            var sLogging3 = _configuration.GetSection("Logging");
            var sAllowedHosts3 = _configuration["AllowedHosts"];
            var s3 = _configuration["ServerURL"];


            InitializeComponent();
            _logger.LogInformation($"Form1 start {DateTime.Now}");
        }

        private void button1_Click(object sender, EventArgs e)
        {
            _logger.LogInformation($"Business start {DateTime.Now}");


            _businessLayer.PerformBusiness();
            richTextBox1.AppendText($"business off ");
            var cabinet = _context.DjboxTable.ToList();

            richTextBox1.AppendText($"Cabinet: {JsonConvert.SerializeObject(cabinet)}");

            _logger.LogInformation($"Business end {DateTime.Now}");
        }

        private void Form1_FormClosed(object sender, FormClosedEventArgs e)
        {
            _logger.LogWarning($"Form1_FormClosed {DateTime.Now}");

        }
    }
}
