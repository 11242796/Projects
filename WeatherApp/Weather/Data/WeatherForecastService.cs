using System;
using System.Net.Http;
using System.Net.Http.Json;
using System.Threading.Tasks;

namespace Weather.Data
{
    public class WeatherForecastService
    {
        private readonly HttpClient _httpClient;

        public WeatherForecastService(HttpClient httpClient)
        {
            _httpClient = httpClient;
        }

        public async Task<WeatherForecast[]> GetForecastAsync(DateTime startDate)
        {
            string apiUrl = "https://api.weatherapi.com/v1/forecast.json?key=0a8b438b34msh1f611f0922d153dp19e7c6jsn28a65a432c99&q=London&days=7";
            var response = await _httpClient.GetFromJsonAsync<WeatherApiResponse>(apiUrl);

            // Extract the necessary data from the response and create an array of WeatherForecast objects
            // Adjust this logic based on the structure of the API response
            return response?.Forecast?.ForecastDay?.Select(forecastDay => new WeatherForecast
            {
                Date = forecastDay.Date,
                TemperatureC = (int)forecastDay.Day?.AvgTemperatureC,
                Summary = forecastDay.Day?.Condition?.Text ?? string.Empty
            }).ToArray();
        }
    }

    public class WeatherApiResponse
    {
        public Forecast Forecast { get; set; }
    }

    public class Forecast
    {
        public ForecastDay[] ForecastDay { get; set; }
    }

    public class ForecastDay
    {
        public DateTime Date { get; set; }
        public Day Day { get; set; }
    }

    public class Day
    {
        public double AvgTemperatureC { get; set; }
        public Condition Condition { get; set; }
    }

    public class Condition
    {
        public string Text { get; set; }
    }
}
