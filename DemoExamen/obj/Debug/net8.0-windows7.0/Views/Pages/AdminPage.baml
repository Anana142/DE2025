   M S B A M L   `   `   `  ����E  ADemoExamen, Version=1.0.0.0, Culture=neutral, PublicKeyToken=null?$clr-namespace:DemoExamen.Views.PagesDemoExamen.Views.Pages  5      3clr-namespace:DemoExamen.ToolsDemoExamen.Tools  5      &     DemoExamen.Views.Pages.AdminPage   5      W SPresentationCore, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35\ XPresentationFramework, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35e aSystem.Windows.Controls.Ribbon, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089R NWindowsBase, Version=8.0.0.0, Culture=neutral, PublicKeyToken=31bf3856ad364e35F 9http://schemas.microsoft.com/winfx/2006/xaml/presentation     5      R NSystem.Xaml, Version=8.0.0.0, Culture=neutral, PublicKeyToken=b77a5c561934e089:x,http://schemas.microsoft.com/winfx/2006/xaml     5      Jmc;http://schemas.openxmlformats.org/markup-compatibility/2006     5      @d2http://schemas.microsoft.com/expression/blend/2008     5      6local$clr-namespace:DemoExamen.Views.Pages     5      0toolsclr-namespace:DemoExamen.Tools     5        N� Title$  	AdminPage��5
       � 	Resources 5      /   )DemoExamen.Tools.BooleanToStringConverter   BoleanToStringConverter��%   &	          5   
   6)   5      .��5      � .+�5   
   &   System.Windows.Controls.DataGrid     AutoGenerateColumns$ False��6\      
IsReadOnly$
 True��6x   $��1��6�   ��6   �� *	ListUsers+ �� SelectedItem 66   �� *SelectedUser+   Columns 5      0  *System.Windows.Controls.DataGridTextColumn  5      ,  &System.Windows.Controls.DataGridColumn   Header$ Имя��6%   1  +System.Windows.Controls.DataGridBoundColumn   Binding 62   �� *Name+  5      $ Фамилия��6%    66   �� *
LastName+  5      $ Отчество��6%    67   �� *
Patronymic+  5      $ Роль��6%    63   �� *IdRoleNavigation.Name+  5      $ 
Логин��6%    64   �� *Login+  5      $ Пароль��6%    65   �� *
Password+  5      $/ )Последняя авторизация��6%    6D   �� *LastAuthorization+ �� StringFormat$ 
dd.MM.yyyy��  5      $ Блокировка��6%    69   �� *
IsLocked+	 �� 	Converter#	 [  
 � ContextMenu
 5      �� 5      .@�5      m� $��Изменить��6    m� Command 61   �� *
EditUser+m� 5       $��Добавить��6    61   �� *
CreateUser+5!      5#      5$      5%      