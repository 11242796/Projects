using Microsoft.Maui;
using Microsoft.Maui.Controls;
using Microsoft.Extensions.DependencyInjection;
using Weather.Data;
using System.Net.Http;

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
            mainPage.BindingContext = new MainPageViewModel(weatherForecastService);

            var navigationPage = new NavigationPage(mainPage);
            MainPage = navigationPage;
        }
    }

    public class MainPageViewModel : BindableObject
    {
        private WeatherForecastService _weatherForecastService;
        private WeatherForecast[] _forecasts;

        public WeatherForecast[] Forecasts
        {
            get => _forecasts;
            set
            {
                _forecasts = value;
                OnPropertyChanged();
            }
        }

        public MainPageViewModel(WeatherForecastService weatherForecastService)
        {
            _weatherForecastService = weatherForecastService;
            LoadForecasts();
        }

        private async void LoadForecasts()
        {
            Forecasts = await _weatherForecastService.GetForecastAsync(DateTime.Now);
        }
    }
}
