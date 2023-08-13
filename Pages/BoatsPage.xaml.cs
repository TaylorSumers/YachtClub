using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows;
using System.Windows.Controls;
using System.Windows.Data;
using System.Windows.Documents;
using System.Windows.Input;
using System.Windows.Media;
using System.Windows.Media.Imaging;
using System.Windows.Navigation;
using System.Windows.Shapes;
using Boats.Entities;
using static Boats.Entities.AppConnect;

namespace Boats.Pages
{
    /// <summary>
    /// Interaction logic for BoatsPage.xaml
    /// </summary>
    public partial class BoatsPage : Page
    {
        public BoatsPage()
        {
            InitializeComponent();
            dtgBoats.ItemsSource = cont.Boat.ToList(); 
        }

        private void btnDelete_Click(object sender, RoutedEventArgs e)
        {
            var boat = dtgBoats.SelectedItem as Boat;

            if(boat == null)
            {
                MessageBox.Show("Выберите лодку для удаления");
                return;
            }

            if(MessageBox.Show("Вы действительно хотите удалить эту лодку?", "Внимание", MessageBoxButton.YesNo) == MessageBoxResult.Yes)
            {
                try
                {
                    cont.Boat.Remove(boat);
                    cont.SaveChanges();
                    MessageBox.Show("Удалено");
                    dtgBoats.ItemsSource = cont.Boat.ToList();
                }
                catch (Exception ex)
                {
                    MessageBox.Show($"Ошибка при удалении \n{ex.Message}");
                    cont.ChangeTracker.Entries().ToList().ForEach(p => p.Reload()); // Вернуть в нормальное состояние объект, для которого выполнялся Remove
                }
            }
        }

        private void btnCreate_Click(object sender, RoutedEventArgs e)
        {
            var boat = new Boat();
            new BoatInfoWindow(boat).ShowDialog();
            dtgBoats.ItemsSource = cont.Boat.ToList();
        }

        private void btnUpdate_Click(object sender, RoutedEventArgs e)
        {
            var boat = dtgBoats.SelectedItem as Boat;
            new BoatInfoWindow(boat).ShowDialog();

            if(boat ==  null)
            {
                MessageBox.Show("Выберите лодку");
                return;
            }
        }
    }
}
