---
layout: post
title:  "Form initializtion and autofill"
date:   2017-5-3
visible: 1
---

<p class="intro"><span class="dropcap">F</span>orms are a common way to collect data in enterprise applications. As an enterprise application platform, Ebaas has focused on making forms easy to build and simple to use. There are several form-related tutorials. This tutorial describes how to open a form with initial values and fill values automatically. 
</p>

We are going to use the Issue Tracking application as an example, which is outlined in the “Build your first application with Ebaas” tutorial. If you haven't read the post, I recommend you read it first.

## Form Initialization

It is a common requirement that some of the fields in a form are initialized with values when opening a new form. For example, when you open the form for a new issue, you would like to have "Submit By", "Submit Date" and "Status" initialized with Today's date, your name, and "Open" status respectively. In Ebaas, you implement the logic of a form initialization in a data model.

#### Step 1: Open the DesignStudio

You launch the DesignStudio at Start->Ebaas->DesignStudio.

#### Step 2: Open the data model

Select the existing data model, named TDM, which contains the “Issues” class, log in as the admin user. The username for the admin user is "admin" and the default password is "admin" too. 

#### Step 3: Implement an initialization code of the “Issues” class

Select the “Issues” class node under “Classes” node in the tree to view the settings of the class on the right.

Find the "Initialization Code" setting under "Methods" category, click on the button at the end of the input field to launch a code editor.

<img src="{{'/assets/img/2017-05-03-Fig1.png' | prepend: site.baseurl }}" alt="">
Fig. 1: Set up initialization logic for Issues

The code editor allows you to write initialization logic in C# code. It is not supposed to write a complex logic with lots of code in this place. For the issue form, you can enter the following lines of code in the editor, and click “OK” to compile and close.

{% highlight ruby %}
this.Instance.SetValue("Status", "Open");
this.Instance.SetValue("SubmitDate", CurrentDate); 
this.Instance.SetValue("SubmitBy", CurrentUser); 
this.Instance.SetValue("Progress", 0);
{% endhighlight %}

where:

this.Instance.SetValue(attributeName, attributeValue)

The line above is a way of setting a value to an attribute of an instance currently loaded in a form.
The CurrentDate is a built-in function for getting Today’s date, and CurrentUser for getting the user who opens the form. Fig. 2 shows the editor containing the code.

<img src="{{'/assets/img/2017-05-03-Fig2.png' | prepend: site.baseurl }}" alt="">
Fig. 2: Write code in the code editor

#### Step 3: Save the data model

Click the icon on the toolbar (see Fig. 4) to save the data model to the database.

<img src="{{'/assets/img/2017-05-03-Fig3.png' | prepend: site.baseurl }}" alt="">
Fig. 3: Saving the data model to the database

#### Step 4: Test the form

First, use a recommended web browser to connect to the application at http: // localhost: 8080.  You can use “demo1”, one of the demo accounts, to log in. The password for “demo1” user is “888”.

Next, click on the “Issue Tracking” menu item on the “Home” page to get to the page.

Click the green "Add" button on the top right to open a new issue, and you can see that a few fields have been initialized with values you set in the initialization code (See Fig. 4).

<img src="{{'/assets/img/2017-05-03-Fig4.png' | prepend: site.baseurl }}" alt="">
Fig. 4: A new form initialized with values

Note that you may have to restart the Ebaas server if you fail to observe the effects.

## Form Autofill

Commonly, some of the fields in a form can be related logically, which means a change of a field may result in changes in some other fields. For example, you may want to have the value of the "Progress" change to 100 automatically when the “Status” of the issue is “Fixed”, rather than change it manually. 

To meet this requirement, you implement the logic in a data model too.

#### Step 1: Implement the callback code
 
The right place to code this logic is the "Callback Function Code" of the "Issue" class.

Click the "Callback Function Code" setting to open the code editor, write the following code to the editor (See Fig. 5)

<img src="{{'/assets/img/2017-05-03-Fig5.png' | prepend: site.baseurl }}" alt="">
Fig. 5: Callback code

if (this.Property == "Status")
{
 string status = this.Instance.GetString("Status");
  if (status == "Fixed")
  {
      this.Instance.SetValue("Progress", 100);
  }
}

Where the code if (this.Property == “Status”) makes sure that this block of code is executed if the callback is invoked by the event of a value change of the “Status” attribute.

#### Step 2: Enable callback on “Status” attribute

Next, you need to enable the callback on the “Status” attribute by setting the “Invoke Callback” to “True” (See Fig. 6).

<img src="{{'/assets/img/2017-05-03-Fig6.png' | prepend: site.baseurl }}" alt="">
Fig. 6: Enabling callback on the attribute

Finally, save the updated data model to the database.

#### Step 3: Test the form

Now, go back to the “Issue Tracking” page, open the edit form for an existing issue, change the value of the “Status” to “Fixed”, the value of “Progress” is changed to 100. (See Fig. 7)

<img src="{{'/assets/img/2017-05-03-Fig7.png' | prepend: site.baseurl }}" alt="">
Fig. 7: Form autofill

I have briefly described how to implement form initialization and autofill. There are more advanced features, such as sequence number generation, cascade attributes, and more, which will be described in other topics.
