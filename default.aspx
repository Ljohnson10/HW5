<%@ Page Language="VB" AutoEventWireup="false" CodeFile="default.aspx.vb" Inherits="_Default" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title></title>
    <link rel="stylesheet" type="text/css" href="Styles.css"/>
</head>
<body>
    <form id="form1" runat="server">
   
    <header>
    Lucas Johnson's Loan Calculator
    </header>
      <div id="Content">   
        <br /><br />
     
            
        Loan Amount:<asp:TextBox ID="tbLoanAmt" runat="server"></asp:TextBox>
        &nbsp;
            <span class="errorMessage">
                <asp:RequiredFieldValidator ID="rfv_name" runat="server" 
                     ControlToValidate="tbLoanAmt" 
                     ErrorMessage="** Please enter a loan amount.">
                </asp:RequiredFieldValidator>
            </span>
            <span class="errorMessage"> 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator2" runat="server" 
                    ControlToValidate="tbLoanAmt" 
                    ErrorMessage="** Please enter a valid loan amount." 
                    ValidationExpression="(?=.)^\$?(([1-9][0-9]{0,2}(,[0-9]{3})*)|[0-9]+)?(\.[0-9]{1,2})?$">
                </asp:RegularExpressionValidator>
            </span>
        <br /><br />
        Annual Interest %: <asp:TextBox ID="tbAnnualInterest" runat="server" ></asp:TextBox>
        &nbsp;
            <span class="errorMessage">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
                     ControlToValidate="tbAnnualInterest" 
                     ErrorMessage="** Please enter interest rate.">
                </asp:RequiredFieldValidator>

            </span>
             <span class="errorMessage"> 
                <asp:RegularExpressionValidator ID="RegularExpressionValidator1" runat="server" 
                    ControlToValidate="tbAnnualInterest" 
                    ErrorMessage="** Please enter a valid interest rate." 
                    ValidationExpression="^(?:[1-9]\d*(?:\.\d+)?|0\.0*[1-9]\d*)$">
                </asp:RegularExpressionValidator>
            </span>
        <br /><br />

        Loan Term (Yrs): <asp:TextBox ID="tbLoanTerm" runat="server" ></asp:TextBox>
        &nbsp;
            <span class="errorMessage">
                <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
                     ControlToValidate="tbLoanTerm" 
                     ErrorMessage="** Please enter a loan term.">
                </asp:RequiredFieldValidator>
            </span>
           <span class="errorMessage"> 
                <asp:RegularExpressionValidator ID="regex_term" runat="server" 
                    ControlToValidate="tbLoanTerm" 
                    ErrorMessage="** Please enter a valid loan term" 
                    ValidationExpression="^1*(40|[0-3]?[0-9])$">
                </asp:RegularExpressionValidator>
            </span>
        <br /><br />

        <asp:Button ID="btnCalcPmt" runat="server" Text="Calculate" />
        
        &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
        <asp:Button ID="Button1" runat="server" Text="Clear" />
        
        <br />
            
        </div>
        <% If Not IsPostBack Then %>
            <p> Welcome to my mortgage calculator. Please complete the field above to have your monthly payment and loan repayment schedule calculated for you.</p>
        <% Else%>
        <br />
                
        Monthly Payment: &nbsp; <asp:Label ID="lblMonthlyPmt" runat="server"></asp:Label>
        
        <br /><br />
        
        <asp:GridView ID="loanGridView" runat="server" >
            <RowStyle CssClass="row" />
            <AlternatingRowStyle CssClass="altRow" />
        </asp:GridView>
        <br /> 
        <%End If%>
    </form>
</body>
</html>
