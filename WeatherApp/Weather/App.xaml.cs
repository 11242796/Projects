using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Extensions.DependencyInjection;
using Weather.Data;
using System;
using System.Net.Http;
using System.Threading.Tasks;

namespace Weather
{
    public partial class App : Application
    {
        public App()
        {
            InitializeComponent();
            OnMauiInitialized();
        }

        private void OnMauiInitialized()
        {
            var services = new ServiceCollection();
            services.AddSingleton<HttpClient>();
            services.AddSingleton<WeatherForecastService>();

            var serviceProvider = services.BuildServiceProvider();
            var weatherForecastService = serviceProvider.GetService<WeatherForecastService>();

            var mainPage = new MainPage();
            var mainPageViewModel = new MainPageViewModel(weatherForecastService);
            mainPage.BindingContext = mainPageViewModel;

            var navigationPage = new NavigationPage(mainPage);
            MainPage = navigationPage;

            // Load the forecasts when the app starts
            mainPageViewModel.LoadForecastsAsync();
        }
    }

    public class MainPageViewModel : BindableObject
    {
        private WeatherForecastService _weatherForecastService;
        private WeatherForecast[] _forecasts;
        private bool _isLoading;

        public WeatherForecast[] Forecasts
        {
            get => _forecasts;
            set
            {
                _forecasts = value;
                OnPropertyChanged();
            }
        }

        public bool IsLoading
        {
            get => _isLoading;
            set
            {
                _isLoading = value;
                OnPropertyChanged();
            }
        }

        public MainPageViewModel(WeatherForecastService weatherForecastService)
        {
            _weatherForecastService = weatherForecastService;
        }

        public async Task LoadForecastsAsync()
        {
            try
            {
                IsLoading = true;
                Forecasts = await _weatherForecastService.GetForecastAsync(DateTime.Now);
            }
            catch (Exception ex)
            {
                // Handle error scenario, log the error, or display an error message
                Console.WriteLine($"Error loading forecasts: {ex.Message}");
            }
            finally
            {
                IsLoading = false;
            }
        }
    }
}
