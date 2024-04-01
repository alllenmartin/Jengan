from django.db import models
from django.contrib.auth.models import AbstractUser


class CustomUser(AbstractUser):
    email = models.EmailField(unique=True)
    otp = models.CharField(max_length=4, null=True, blank=True) 

    def __str__(self):
        return self.username
    
class ProductCharges(models.Model):
    OnApprovedAmount = "On Approved Amount"
    OnNetAmount="On Net Amount"
    
    charge_choices = {
     OnApprovedAmount : "On Approved Amount",
     OnNetAmount: "On Net Amount"   
    }

    charge_code = models.CharField(unique=True,max_length=250)
    charge_description = models.CharField(max_length=250)
    charge_amont= models.DecimalField(decimal_places=2,max_digits=10000,)
    use_percentage = models.BooleanField()
    percentage=models.DecimalField(decimal_places=2,max_digits=10000,)
    charge_option= models.CharField(choices=charge_choices,
        default=OnApprovedAmount,max_length=250)
    product_code = models.CharField(max_length=250)
    minimum=models.DecimalField(decimal_places=2,max_digits=10000,)
    maximum=models.DecimalField(decimal_places=2,max_digits=10000,)
    additional_charges=models.DecimalField(decimal_places=2,max_digits=10000,)
    excise_duty=models.DecimalField(decimal_places=2,max_digits=10000,)

class Loans(models.Model):
    FullDisbursement= "Full Disbursement"
    PartialDisbursement = "Partial Disbursement"

    modeofdisbursement = {
        FullDisbursement:"Full Disbursement",
        PartialDisbursement : "Partial Disbursement"
    }

    Loan_No= models.CharField(unique=True,max_length=250)
    Application_Date = models.DateField()
    Product_Type= models.CharField(max_length=250)
    Member_No=models.CharField(max_length=250)
    Requested_Amount=models.DecimalField(decimal_places=2,max_digits=10000,)
    Approved_Amount=models.DecimalField(decimal_places=2,max_digits=10000,)
    Interest=models.DecimalField(decimal_places=2,max_digits=10000,)
    Member_Name=models.CharField(max_length=250)
    Approval_Date= models.DateField()
    Installments=models.DecimalField(decimal_places=2,max_digits=10000,)
    Installment_Period= models.DateField()
    Repayment=models.DecimalField(decimal_places=2,max_digits=10000,)
    Approved= models.BooleanField()
    Dibursement_Date = models.DateField()
    Mode_of_Disbursement = models.CharField(choices=modeofdisbursement,
        default=FullDisbursement,max_length=250)
    Grace_Period  = models.DateField()
    Fully_Disbursed = models.BooleanField()
    Loan_Rejection_Reason=models.CharField(max_length=250)
    Outstanding_Balance =models.DecimalField(decimal_places=2,max_digits=10000,)
    Outstanding_Interest=models.DecimalField(decimal_places=2,max_digits=10000,)
    Loan_Principal_Repayment=models.DecimalField(decimal_places=2,max_digits=10000,)
    Loan_Interest_Repayment=models.DecimalField(decimal_places=2,max_digits=10000,)
    Defaulter_Loan=models.DecimalField(decimal_places=2,max_digits=10000,)
    Defaulted_Amount=models.DecimalField(decimal_places=2,max_digits=10000,)

    
