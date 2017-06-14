using System;
using System.Collections.Generic;
using System.ComponentModel;
using System.Data;
using System.Drawing;
using System.Diagnostics;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Windows.Forms;
using System.IO.Ports;

namespace Kati
{
    public partial class Form1 : Form
    {
        public Form1()
        {
            InitializeComponent();
            getAvailablePorts();
        }
        void getAvailablePorts()
        {
            String[] ports = SerialPort.GetPortNames();
            comboBox1.Items.AddRange(ports);
        }

        private void comboBox2_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button3_Click(object sender, EventArgs e)
        {
            try
            {
                if (comboBox1.Text == "" || comboBox2.Text == "")
                {
                    textBox2.Text = "Please select port settings";

                }
                else
                {
                    serialPort1.PortName = comboBox1.Text;
                    serialPort1.BaudRate = Convert.ToInt32(comboBox2.Text);
                    serialPort1.Open();
                    progressBar1.Value = 100;
                    button1.Enabled = true;
                    button2.Enabled = true;
                    button3.Enabled = false;
                    button4.Enabled = true;
                    button5.Enabled = true;
                    button6.Enabled = true;
                    button7.Enabled = true;
                    button8.Enabled = true;
                    button9.Enabled = true;
                    button10.Enabled = true;
                    button11.Enabled = true;
                    button12.Enabled = true;
                    button13.Enabled = true;
                    button14.Enabled = true;
                    button15.Enabled = true;
                    button16.Enabled = true;
                    button17.Enabled = true;
                    comboBox1.Enabled = false;
                    comboBox2.Enabled = false;
                    textBox2.Text = "Ready";
                }
            }
            catch (UnauthorizedAccessException)
            {
               textBox2.Text = "Unauthorized Access";
            }
        }

        private void button4_Click(object sender, EventArgs e)
        {
            serialPort1.Close();
            progressBar1.Value = 0;
            button1.Enabled = false;
            button2.Enabled = false;            
            button3.Enabled = true;
            button4.Enabled = false;
            button5.Enabled = false;
            button6.Enabled = false;
            button7.Enabled = false;
            button8.Enabled = false;
            button9.Enabled = false;
            button10.Enabled = false;
            button11.Enabled = false;
            button12.Enabled = false;
            button13.Enabled = false;
            button14.Enabled = false;
            button15.Enabled = false;
            button16.Enabled = false;
            button17.Enabled = false;
            comboBox1.Enabled = true;
            comboBox2.Enabled = true;
            textBox2.Text = "";

        }


        private void button2_Click(object sender, EventArgs e)
        {
            try
            {
                textBox2.Text = serialPort1.ReadLine();

            }
            catch (TimeoutException)
            {
                textBox2.Text = "Timeout Exception";
            }
        }

        private void comboBox1_SelectedIndexChanged(object sender, EventArgs e)
        {

        }

        private void button5_Click(object sender, EventArgs e)
        {
            while (button5 = ){
                byte[] mBuffer = new byte[1];
                mBuffer[0] = 0x30; //ASCII "0".
                serialPort1.Write(mBuffer, 0, mBuffer.Length);
            }
        }

        private void button6_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x31; //ASCII "1".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button7_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x32; //ASCII "2".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button8_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x33; //ASCII "3".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button9_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x34; //ASCII "4".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button10_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x35; //ASCII "5".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button11_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x36; //ASCII "6".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button12_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x37; //ASCII "7".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button13_Click(object sender, EventArgs e)
        {
            
            {
                byte[] mBuffer = new byte[1];
                mBuffer[0] = 0x38; //ASCII "8".
                serialPort1.Write(mBuffer, 0, mBuffer.Length);
            }         
        }

        private void button14_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x39; //ASCII "9".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void Form1_Load(object sender, EventArgs e)
        {

        }

        private void textBox1_TextChanged(object sender, EventArgs e)
        {

        }

        private void button1_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x3A; //ASCII "A".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button2_Click_1(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x3B; //ASCII "B".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button15_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x3C; //ASCII "C".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
        }

        private void button16_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x3D; //ASCII "D".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);
            
        }

        private void textBox2_TextChanged(object sender, EventArgs e)
        {

        }

        private void button17_Click(object sender, EventArgs e)
        {
            byte[] mBuffer = new byte[1];
            mBuffer[0] = 0x3E; //ASCII "E".
            serialPort1.Write(mBuffer, 0, mBuffer.Length);

        }

        private void button18_Click(object sender, EventArgs e)
        {
            Process yourProcess = new Process();
            yourProcess.StartInfo.FileName = @"PICPgm/winpicpgm.exe";

            yourProcess.Start();
        }
    }
}
