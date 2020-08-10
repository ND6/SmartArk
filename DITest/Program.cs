using BusinessLayer;
using CDataAccessLayer;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Serilog;
using System;
using System.Windows.Forms;
using DITest.Models;
using Microsoft.Extensions.Configuration;
using Serilog.Formatting.Json;

namespace DITest
{
    static class Program
    {
        /// <summary>
        ///  The main entry point for the application.
        /// </summary>
        [STAThread]
        static void Main()
        {
            Log.Logger = new LoggerConfiguration()
                .WriteTo.File("logs/serilog.log")
                // .WriteTo.File(new JsonFormatter(), "./logs/Serilog.json")
                .CreateLogger();

            var builder = new HostBuilder()
                .ConfigureAppConfiguration((context, configurationBuilder) =>
                {
                    // // Add ini configuration files...
                    // configurationBuilder.AddIniFile("Config.ini", optional: true);
                    // // laod XML files...
                    // configurationBuilder.AddXmlFile("Config.xml", optional: true);
                    // Add other configuration files...
                    configurationBuilder.AddJsonFile("Custom.json", optional: true);

                })
                .ConfigureServices((hostContext, services) =>
                {
                    services.AddDbContext<ClientDBContext>();
                    services.AddSingleton<Form1>();
                    services.AddScoped<IBusinessLayer, BusinessLayer.BusinessLayer>();
                    services.AddScoped<IDataAccessLayer, CDataAccessLayer.CDataAccessLayer>();

                })
                .ConfigureLogging((hostContext, logging) =>
                {
                    logging.AddSerilog();
                });

            var host = builder.Build();

            using (var serviceScope = host.Services.CreateScope())
            {
                var services = serviceScope.ServiceProvider;
                try
                {
                    var form1 = services.GetRequiredService<Form1>();
                    var clientDBContext = services.GetRequiredService<ClientDBContext>();
                    // Application.SetHighDpiMode(HighDpiMode.SystemAware);
                    // Application.EnableVisualStyles();
                    // Application.SetCompatibleTextRenderingDefault(true);
                    Application.Run(form1);
                }
                catch (Exception e)
                {
                    Console.WriteLine(e);
                    throw;
                }
            }

            // Application.SetHighDpiMode(HighDpiMode.SystemAware);
            // Application.EnableVisualStyles();
            // Application.SetCompatibleTextRenderingDefault(false);
            // Application.Run(new Form1());
        }
    }



}
