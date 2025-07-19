using AssestManagementWebApi.Models;
using AssestManagementWebApi.Repository;
using AssestManagementWebApi.Service;
using Microsoft.EntityFrameworkCore;
using System.Text.Json.Serialization;

namespace AssestManagementWebApi
{
    public class Program
    {
        public static void Main(string[] args)
        {
            var builder = WebApplication.CreateBuilder(args);

            // Add services to the container.
            builder.Services.AddControllers().AddJsonOptions(options =>
            {
                options.JsonSerializerOptions.ReferenceHandler = ReferenceHandler.Preserve;
                options.JsonSerializerOptions.WriteIndented = true;
            });

            // 2. Swagger configuration
            builder.Services.AddEndpointsApiExplorer();
            builder.Services.AddSwaggerGen();

            // 3. Add DbContext (replace with your real connection string name)
            builder.Services.AddDbContext<AssetContext>(options =>
                options.UseSqlServer(builder.Configuration.GetConnectionString("DefaultConnection")));

            // 4. Dependency Injection
            builder.Services.AddScoped<IAssetRepository, AssetRepositoryImpl>();
            builder.Services.AddScoped<IAssetService, AssetServiceImpl>();

            var app = builder.Build();

            // 5. Configure the HTTP request pipeline
            if (app.Environment.IsDevelopment())
            {
                app.UseSwagger();
                app.UseSwaggerUI();
            }

            app.UseHttpsRedirection();

            app.UseAuthorization();

            app.MapControllers();

            app.Run();
        }
    }
}