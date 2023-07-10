using Microsoft.Maui.Controls;

namespace Weather
{
    public partial class MainPage : ContentPage
    {
        public MainPage()
        {
            InitializeComponent();

            var label = new Label
            {
                Text = "Welcome to Weather App",
                HorizontalOptions = LayoutOptions.Center,
                VerticalOptions = LayoutOptions.Center
            };

            Content = label;
        }
    }
}
