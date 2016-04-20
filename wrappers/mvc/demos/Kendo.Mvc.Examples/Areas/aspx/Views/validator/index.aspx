<%@Page Title="" Language="C#" MasterPageFile="~/Areas/aspx/Views/Shared/Web.Master" Inherits="System.Web.Mvc.ViewPage<dynamic>" %>
<asp:Content ContentPlaceHolderID="MainContent" runat="server">
 <div class="demo-section k-content">
        <div id="tickets">
            <form id="ticketsForm">
                <ul id="fieldlist">
                    <li>
                        <label for="fullname" class="required">Your Name</label>
                    <%:Html.Kendo().TextBox()
                              .Name("fullname")
                              .HtmlAttributes(new { placeholder = "Full name", required = "required", validationmessage = "Enter {0}", style = "width:200px" })
                     %>
                </li>
                <li>
                    <label for="search" class="required">Movie</label>
                    <%:Html.Kendo().TextBox()
                              .Name("search")
                              .HtmlAttributes(new { type = "search", placeholder = "Full name", required = "required", validationmessage = "Select movei", style = "width:200px" })
                    %>
                    <span class="k-invalid-msg" data-for="search"></span>
                </li>
                <li>
                    <label for="time">Start time</label>
                    <%:Html.Kendo()
                              .DropDownList()
                              .Name("time")
                              .HtmlAttributes(new { required = "required", data_required_msg = "Select start time", style = "width: 220px" })
                              .BindTo(new[] {
                                  new SelectListItem { Text="14:00" },
                                  new SelectListItem { Text="15:30" },
                                  new SelectListItem { Text="17:00" },
                                  new SelectListItem { Text="20:15" }
                              })
                    %>
                    <span class="k-invalid-msg" data-for="time"></span>
                </li>
                <li>
                    <label for="amount">Amount</label>
                    <%:Html.Kendo()
                              .NumericTextBox()
                              .Name("amount")
                              .Value(1)
                              .HtmlAttributes(new { max = "10", min = "1", required = "required", data_max_msg = "Enter value between 1 and 10", style = "width:200px" })
                    %>
                    <span class="k-invalid-msg" data-for="Amount"></span>
                </li>
                <li>
                    <label for="email" class="required">Email</label>
                    <%:Html.Kendo().TextBox()
                              .Name("email")
                              .HtmlAttributes(new { placeholder = "e.g. myname@example.net", required = "required", type = "email", data_email_msg = "Email format is not valid", style = "width: 200px;" })
                    %>
                </li>
                <li>
                    <label for="tel" class="required">Phone</label>
                    <%:Html.Kendo().TextBox()
                              .Name("tel")
                              .HtmlAttributes(new { placeholder = "Enter a ten digit number", pattern = "\\d{10}", required = "required", type = "tel", validationmessage = "Enter at least ten digits", style = "width: 200px;" })
                    %>
                </li>
                <li  class="accept">
                    <label>Terms of Service</label>
                    <input type="checkbox" name="Accept" required validationMessage="Acceptance is required" /> <p>I accept the terms of service.</p>
                </li>
                <li class="confirm">
                    <button class="k-button k-primary" type="submit">Submit</button>
                </li>
                <li class="status">
                </li>
            </ul>
        </form>
    </div>
</div>
<script>
    $(function () {
        var validator = $("#ticketsForm").kendoValidator().data("kendoValidator");
        var status = $(".status");

        $("form").submit(function (event) {
            event.preventDefault();
            if (validator.validate()) {
                status.text("Hooray! Your tickets has been booked!")
                    .removeClass("invalid")
                    .addClass("valid");
            } else {
                status.text("Oops! There is invalid data in the form.")
                    .removeClass("valid")
                    .addClass("invalid");
            }
        });
    });

</script>
<style>
    #fieldlist {
        margin: 0;
        padding: 0;
    }

    #fieldlist li {
        list-style: none;
        padding-bottom: .7em;
        text-align: left;
    }

    #fieldlist label {
        display: block;
        padding-bottom: .3em;
        font-weight: bold;
        text-transform: uppercase;
        font-size: 12px;
        color: #444;
    }

    #fieldlist li.status {
        text-align: center;
    }

    #fieldlist li .k-widget:not(.k-tooltip),
    #fieldlist li .k-textbox {
        margin: 0 5px 5px 0;
    }

    .confirm {
        padding-top: 1em;
    }

    .valid {
        color: green;
    }

    .invalid {
        color: red;
    }

    #fieldlist li input[type="checkbox"] {
        margin: 0 5px 0 0;
    }

    span.k-widget.k-tooltip-validation {
        display: inline-block;
        width: 160px;
        text-align: left;
        border: 0;
        padding: 0;
        margin: 0;
        background: none;
        box-shadow: none;
        color: red;
    }

    .k-tooltip-validation .k-warning {
        display: none;
    }
</style>
</asp:Content>