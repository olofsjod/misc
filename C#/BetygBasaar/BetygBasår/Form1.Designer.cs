namespace BetygBasårForms
{
    partial class Form1
    {
        /// <summary>
        /// Required designer variable.
        /// </summary>
        private System.ComponentModel.IContainer components = null;

        /// <summary>
        /// Clean up any resources being used.
        /// </summary>
        /// <param name="disposing">true if managed resources should be disposed; otherwise, false.</param>
        protected override void Dispose(bool disposing)
        {
            if (disposing && (components != null))
            {
                components.Dispose();
            }
            base.Dispose(disposing);
        }

        #region Windows Form Designer generated code

        /// <summary>
        /// Required method for Designer support - do not modify
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Form1));
            this.label1 = new System.Windows.Forms.Label();
            this.MatematikCbox = new System.Windows.Forms.ComboBox();
            this.label2 = new System.Windows.Forms.Label();
            this.label3 = new System.Windows.Forms.Label();
            this.label4 = new System.Windows.Forms.Label();
            this.MatematikDbox = new System.Windows.Forms.ComboBox();
            this.MatematikEbox = new System.Windows.Forms.ComboBox();
            this.FysikAbox = new System.Windows.Forms.ComboBox();
            this.FysikBbox = new System.Windows.Forms.ComboBox();
            this.KemiAbox = new System.Windows.Forms.ComboBox();
            this.label5 = new System.Windows.Forms.Label();
            this.label6 = new System.Windows.Forms.Label();
            this.SummaPoäng = new System.Windows.Forms.Label();
            this.label_summa = new System.Windows.Forms.Label();
            this.SuspendLayout();
            // 
            // label1
            // 
            this.label1.AutoSize = true;
            this.label1.Location = new System.Drawing.Point(14, 9);
            this.label1.Name = "label1";
            this.label1.Size = new System.Drawing.Size(66, 13);
            this.label1.TabIndex = 0;
            this.label1.Text = "Matematik C";
            // 
            // MatematikCbox
            // 
            this.MatematikCbox.DisplayMember = "A";
            this.MatematikCbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.MatematikCbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.MatematikCbox.Location = new System.Drawing.Point(159, 6);
            this.MatematikCbox.Name = "MatematikCbox";
            this.MatematikCbox.Size = new System.Drawing.Size(121, 21);
            this.MatematikCbox.TabIndex = 1;
            this.MatematikCbox.ValueMember = "A";
            this.MatematikCbox.SelectedIndexChanged += new System.EventHandler(this.MatematikCbox_SelectedIndexChanged);
            // 
            // label2
            // 
            this.label2.AutoSize = true;
            this.label2.Location = new System.Drawing.Point(14, 37);
            this.label2.Name = "label2";
            this.label2.Size = new System.Drawing.Size(67, 13);
            this.label2.TabIndex = 2;
            this.label2.Text = "Matematik D";
            // 
            // label3
            // 
            this.label3.AutoSize = true;
            this.label3.Location = new System.Drawing.Point(14, 65);
            this.label3.Name = "label3";
            this.label3.Size = new System.Drawing.Size(66, 13);
            this.label3.TabIndex = 3;
            this.label3.Text = "Matematik E";
            // 
            // label4
            // 
            this.label4.AutoSize = true;
            this.label4.Location = new System.Drawing.Point(14, 93);
            this.label4.Name = "label4";
            this.label4.Size = new System.Drawing.Size(41, 13);
            this.label4.TabIndex = 4;
            this.label4.Text = "Fysik A";
            // 
            // MatematikDbox
            // 
            this.MatematikDbox.DisplayMember = "A";
            this.MatematikDbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.MatematikDbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.MatematikDbox.Location = new System.Drawing.Point(159, 34);
            this.MatematikDbox.Name = "MatematikDbox";
            this.MatematikDbox.Size = new System.Drawing.Size(121, 21);
            this.MatematikDbox.TabIndex = 5;
            this.MatematikDbox.ValueMember = "A";
            this.MatematikDbox.SelectedIndexChanged += new System.EventHandler(this.MatematikDbox_SelectedIndexChanged);
            // 
            // MatematikEbox
            // 
            this.MatematikEbox.DisplayMember = "A";
            this.MatematikEbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.MatematikEbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.MatematikEbox.Location = new System.Drawing.Point(159, 62);
            this.MatematikEbox.Name = "MatematikEbox";
            this.MatematikEbox.Size = new System.Drawing.Size(121, 21);
            this.MatematikEbox.TabIndex = 6;
            this.MatematikEbox.ValueMember = "A";
            this.MatematikEbox.SelectedIndexChanged += new System.EventHandler(this.MatematikEbox_SelectedIndexChanged);
            // 
            // FysikAbox
            // 
            this.FysikAbox.DisplayMember = "A";
            this.FysikAbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.FysikAbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.FysikAbox.Location = new System.Drawing.Point(159, 90);
            this.FysikAbox.Name = "FysikAbox";
            this.FysikAbox.Size = new System.Drawing.Size(121, 21);
            this.FysikAbox.TabIndex = 7;
            this.FysikAbox.ValueMember = "A";
            this.FysikAbox.SelectedIndexChanged += new System.EventHandler(this.FysikAbox_SelectedIndexChanged);
            // 
            // FysikBbox
            // 
            this.FysikBbox.DisplayMember = "A";
            this.FysikBbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.FysikBbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.FysikBbox.Location = new System.Drawing.Point(159, 118);
            this.FysikBbox.Name = "FysikBbox";
            this.FysikBbox.Size = new System.Drawing.Size(121, 21);
            this.FysikBbox.TabIndex = 8;
            this.FysikBbox.ValueMember = "A";
            this.FysikBbox.SelectedIndexChanged += new System.EventHandler(this.FysikBbox_SelectedIndexChanged);
            // 
            // KemiAbox
            // 
            this.KemiAbox.DisplayMember = "A";
            this.KemiAbox.DropDownStyle = System.Windows.Forms.ComboBoxStyle.DropDownList;
            this.KemiAbox.Items.AddRange(new object[] {
            "A",
            "B",
            "C",
            "D",
            "E",
            "F"});
            this.KemiAbox.Location = new System.Drawing.Point(159, 146);
            this.KemiAbox.Name = "KemiAbox";
            this.KemiAbox.Size = new System.Drawing.Size(121, 21);
            this.KemiAbox.TabIndex = 9;
            this.KemiAbox.ValueMember = "A";
            this.KemiAbox.SelectedIndexChanged += new System.EventHandler(this.KemiAbox_SelectedIndexChanged);
            // 
            // label5
            // 
            this.label5.AutoSize = true;
            this.label5.Location = new System.Drawing.Point(14, 121);
            this.label5.Name = "label5";
            this.label5.Size = new System.Drawing.Size(41, 13);
            this.label5.TabIndex = 10;
            this.label5.Text = "Fysik B";
            // 
            // label6
            // 
            this.label6.AutoSize = true;
            this.label6.Location = new System.Drawing.Point(14, 149);
            this.label6.Name = "label6";
            this.label6.Size = new System.Drawing.Size(40, 13);
            this.label6.TabIndex = 11;
            this.label6.Text = "Kemi A";
            // 
            // SummaPoäng
            // 
            this.SummaPoäng.BackColor = System.Drawing.SystemColors.Control;
            this.SummaPoäng.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.SummaPoäng.Font = new System.Drawing.Font("Microsoft Sans Serif", 36F, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.SummaPoäng.Location = new System.Drawing.Point(0, 218);
            this.SummaPoäng.Name = "SummaPoäng";
            this.SummaPoäng.Size = new System.Drawing.Size(292, 55);
            this.SummaPoäng.TabIndex = 13;
            this.SummaPoäng.Text = "0";
            this.SummaPoäng.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // label_summa
            // 
            this.label_summa.Dock = System.Windows.Forms.DockStyle.Bottom;
            this.label_summa.Font = new System.Drawing.Font("Microsoft Sans Serif", 12F, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, ((byte)(0)));
            this.label_summa.Location = new System.Drawing.Point(0, 198);
            this.label_summa.Name = "label_summa";
            this.label_summa.Size = new System.Drawing.Size(292, 20);
            this.label_summa.TabIndex = 14;
            this.label_summa.Text = "Summa";
            this.label_summa.TextAlign = System.Drawing.ContentAlignment.MiddleCenter;
            // 
            // Form1
            // 
            this.AutoScaleDimensions = new System.Drawing.SizeF(6F, 13F);
            this.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font;
            this.ClientSize = new System.Drawing.Size(292, 273);
            this.Controls.Add(this.label_summa);
            this.Controls.Add(this.SummaPoäng);
            this.Controls.Add(this.label6);
            this.Controls.Add(this.label5);
            this.Controls.Add(this.KemiAbox);
            this.Controls.Add(this.FysikBbox);
            this.Controls.Add(this.FysikAbox);
            this.Controls.Add(this.MatematikEbox);
            this.Controls.Add(this.MatematikDbox);
            this.Controls.Add(this.label4);
            this.Controls.Add(this.label3);
            this.Controls.Add(this.label2);
            this.Controls.Add(this.MatematikCbox);
            this.Controls.Add(this.label1);
            this.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog;
            this.Icon = ((System.Drawing.Icon)(resources.GetObject("$this.Icon")));
            this.MaximizeBox = false;
            this.Name = "Form1";
            this.Text = "BetygBasår";
            this.ResumeLayout(false);
            this.PerformLayout();

        }

        #endregion

        private System.Windows.Forms.Label label1;
        private System.Windows.Forms.ComboBox MatematikCbox;
        private System.Windows.Forms.Label label2;
        private System.Windows.Forms.Label label3;
        private System.Windows.Forms.Label label4;
        private System.Windows.Forms.ComboBox MatematikDbox;
        private System.Windows.Forms.ComboBox MatematikEbox;
        private System.Windows.Forms.ComboBox FysikAbox;
        private System.Windows.Forms.ComboBox FysikBbox;
        private System.Windows.Forms.ComboBox KemiAbox;
        private System.Windows.Forms.Label label5;
        private System.Windows.Forms.Label label6;
        private System.Windows.Forms.Label SummaPoäng;
        private System.Windows.Forms.Label label_summa;
    }
}

