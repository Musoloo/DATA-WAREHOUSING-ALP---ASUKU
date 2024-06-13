using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using MySql.Data.MySqlClient;
using OxyPlot.Wpf;

namespace DW_ETL_Example
{
    public partial class FormAnalysis : Form
    {
        MySqlConnection myConnOLAP;
        MySqlCommand myCmdOLAP = new MySqlCommand();
        MySqlDataAdapter myAdapter;
        DataTable dt;

        public FormAnalysis()
        {
            InitializeComponent();
        }

        private void FormAnalysis_Load(object sender, EventArgs e)
        {
            
            disconnectedOLAPComponent();
        }

        private void btnConnectOLAP_Click(object sender, EventArgs e)
        {
            connToOLAPDB(tbHostOLAP.Text, tbUserOLAP.Text, tbPassOLAP.Text, tbDBNameOLAP.Text);
            connectedOLAPComponent();
        }

        private void btnDiscOLAP_Click(object sender, EventArgs e)
        {
            disconnectedOLAPComponent();
            MessageBox.Show("Koneksi DATA WAREHOUSE / OLAP DIPUTUS!");
            myConnOLAP.Close();
        }

        private void connectedOLAPComponent()
        {
            tbHostOLAP.Enabled = false;
            tbDBNameOLAP.Enabled = false;
            tbUserOLAP.Enabled = false;
            tbPassOLAP.Enabled = false;
            btnConnectOLAP.Enabled = false;
            btnDiscOLAP.Enabled = true;
            lblStatOLAP.Text = "Status OLAP : Connected";
        }

        private void disconnectedOLAPComponent()
        {
            tbHostOLAP.Enabled = true;
            tbDBNameOLAP.Enabled = true;
            tbUserOLAP.Enabled = true;
            tbPassOLAP.Enabled = true;
            btnConnectOLAP.Enabled = true;
            btnDiscOLAP.Enabled = false;
            lblStatOLAP.Text = "Status OLAP : Disconnected";
        }

        private void connToOLAPDB(string host, string user, string pass, string db_name)
        {
            try
            {
                myConnOLAP = new MySqlConnection("SERVER=" + host + ";PORT=3306;UID=" + user + ";PASSWORD=" + pass + ";DATABASE=" + db_name);

                if (myConnOLAP.State == ConnectionState.Closed)
                {
                    myConnOLAP.Open();
                    MessageBox.Show("Berhasil TERKONEKSI ke DATA WAREHOUSE (" + host + ")");
                    lblStatOLAP.Text = "Status OLAP : Connected";
                }
                else if (myConnOLAP.State == ConnectionState.Open)
                {
                    MessageBox.Show("Koneksi masih TERBUKA");
                }
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void FormAnalysis_FormClosing(object sender, FormClosingEventArgs e)
        {
            if (myConnOLAP != null)
                if (myConnOLAP.State == ConnectionState.Open) myConnOLAP.Close();
        }

        private void btnReport1_Click(object sender, EventArgs e)
        {
            try
            {
                string cmdText = "SELECT * FROM Monthly_Sales";

                myAdapter = new MySqlDataAdapter(cmdText, myConnOLAP);
                dt = new DataTable();
                myAdapter.Fill(dt);
                dgvResult.DataSource = dt;
                dgvResult.Refresh();

                chart1.DataSource = dt;
                chart1.Series[0].Name = "Z";
                chart1.Series[0].XValueMember = "month";
                chart1.Series[0].YValueMembers = "total_sales";
                chart1.DataBind();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void btnReport2_Click(object sender, EventArgs e)
        {
            try
            {
                string cmdText = "SELECT * FROM view_gender_anjiing_sering_dibeli";

                myAdapter = new MySqlDataAdapter(cmdText, myConnOLAP);
                dt = new DataTable();
                myAdapter.Fill(dt);
                dgvResult.DataSource = dt;
                dgvResult.Refresh();

                chart1.DataSource = dt;
                chart1.Series[0].Name = "Total Sold";
                chart1.Series[0].XValueMember = "gender";
                chart1.Series[0].YValueMembers = "jumlah_pembelian";
                chart1.DataBind();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }

        private void tbPassOLAP_TextChanged(object sender, EventArgs e)
        {

        }

        private void label5_Click(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            {
                try
                {
                    string cmdText = "SELECT * FROM Most_Purchased_Dog_Category";

                    myAdapter = new MySqlDataAdapter(cmdText, myConnOLAP);
                    dt = new DataTable();
                    myAdapter.Fill(dt);
                    dgvResult.DataSource = dt;
                    dgvResult.Refresh();

                    chart1.DataSource = dt;
                    chart1.Series[0].Name = "Y";
                    chart1.Series[0].XValueMember = "dog_category";
                    chart1.Series[0].YValueMembers = "purchase_count ";

                    chart1.DataBind();
                }
                catch (Exception ex)
                {
                    MessageBox.Show(ex.Message.ToString());
                }
            }
        }

        private void button2_Click(object sender, EventArgs e)
        {

            try
            {
                string cmdText = "SELECT * FROM Most_Frequent_Buyers_Age_Range";

                myAdapter = new MySqlDataAdapter(cmdText, myConnOLAP);
                dt = new DataTable();
                myAdapter.Fill(dt);
                dgvResult.DataSource = dt;
                dgvResult.Refresh();

                chart1.DataSource = dt;
                chart1.Series[0].Name = "X";
                chart1.Series[0].XValueMember = "age_range";
                chart1.Series[0].YValueMembers = "purchase_count";
                chart1.DataBind();
            }
            catch (Exception ex)
            {
                MessageBox.Show(ex.Message.ToString());
            }
        }
    }
}
            
        
