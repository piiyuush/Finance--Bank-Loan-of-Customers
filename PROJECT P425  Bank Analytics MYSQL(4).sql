create database Bank_Loan_Project ;

select * from finance_1 ;
select * from finance_2 ;

# Total Loan Amount
Select sum(loan_amnt) total_loan_amount from finance_1;

# Total loan issued
Select distinct count(member_id) as number_of_loan_issued
from finance_1;

# Cumulative interest rate
Select avg(int_rate) as cumulative_interest_rate
from finance_1;

# Average funded amount
Select avg(funded_amnt) as average_funded_amount
from finance_1;

#KPI 1  Year wise loan amount Stats
select year(issue_d) as year_of_issue_d , sum(loan_amnt) as total_loan_amt
from finance_1
group by year_of_issue_d
order by year_of_issue_d;

#KPI 2 Grade and sub grade wise revol_bal
select 
grade, sub_grade , sum(revol_bal) as total_revol_bal
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by grade , sub_grade
order by grade , sub_grade ;

#KPI 3 Total Payment for Verified Status Vs Total Payment for Non Verified Status
select verification_status, 
concat('$', format(round(sum(total_pymnt)/1000000,2),2),'M') as total_payment
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by verification_status;

#KPI 4 State wise and last_credit_pull_d wise loan status
select addr_state , last_credit_pull_d, loan_status 
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by addr_state , last_credit_pull_d , loan_status
order by last_credit_pull_d ;

# KPI 5 Home ownership Vs last payment date stats
select home_ownership , last_pymnt_d , 
concat('$', format(round(sum(last_pymnt_amnt)/10000,2),2),'K') as total_amount
from finance_1 inner join finance_2
on(finance_1.id = finance_2.id)
group by home_ownership , last_pymnt_d
order by last_pymnt_d desc , home_ownership DESC ;










