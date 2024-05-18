use project2;

select * from base2;

#1 Manufacture Qty
Select sum(Manufactured_Qty) as Manufactured_qty from base2;

#2 Rejected Qty 
Select sum(Rejected_Qty) as Rejected_qty from base2;

#3 Wastage Qty
Select sum(wastage_Qty) as wastage_qty from base2;

#4 Processed Qty
Select sum(processed_Qty) as Processed_Qty from base2;

#5 Employee Wise Rejected Qty
select Emp_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by emp_name order by Sum_of_Rejected_qty desc;	
select Emp_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by emp_name order by Sum_of_Rejected_qty;	

# Employee Wise Rejected Qty (Top 10):
select Emp_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by emp_name order by Sum_of_Rejected_qty desc limit 10;	


#6  Machine Wise Rejected Qty :
select Machine_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by Machine_name order by Sum_of_Rejected_qty desc;	
select Machine_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by Machine_name order by Sum_of_Rejected_qty;	

# Machine Wise Rejected Qty (Top 10) :
select Machine_name,sum(Rejected_Qty) as Sum_of_Rejected_Qty from Base2 where Rejected_qty > 0 group by Machine_name order by Sum_of_Rejected_qty desc limit 10;

#7 Production Comparison trend 
select * from base2;
Select End_time,TotalQty,Totalvalue from base2;
Select End_time,sum(TotalQty) as TotalQty,round(sum(Totalvalue),2) as Totalvalue from base2 group by End_time order by End_time;

#8 Manufacture Vs Rejected
Select sum(Manufactured_qty) as Manufactured_qty,sum(Rejected_qty) as Rejected_qty from Base2;

#9 Department Wise Manufacture Vs Rejected
Select Department_name,sum(Manufactured_qty) as Manufactured_qty,sum(Rejected_qty) as Rejected_qty from Base2 group by Department_name;

#10 Delivery Period wise Manufactured, Rejected,processed ,produced ,total Qty:
Select Delivery_Period_,sum(Manufactured_qty) as Manufactured_qty,sum(Rejected_qty) as Rejected_qty,sum(Processed_qty) as processed_Qty,sum(produced_qty) as produced_qty,sum(totalqty) as Total_qty from Base2 group by Delivery_period_;

# Delivery Period wise Manufactured, Rejected,processed ,produced ,total Qty %:
SELECT Delivery_Period_,SUM(Manufactured_qty) as Manufactured_qty,sum(Rejected_qty) as Rejected_qty,sum(Processed_qty) as processed_Qty,sum(produced_qty) as produced_qty,cONCAT(ROUND((SUM(TotalQty) * 100 / (SELECT SUM(TotalQty) as total_qty FROM base2)), 2), '%') AS total_qty
FROM base2 GROUP BY delivery_period_;

#11 Operation wise Manufactured & Total Qty:
select * from base2;
Select Operation_name,sum(Manufactured_qty) as Manufactured_qty,sum(Totalqty) as Total_qty from Base2 group by Operation_name;

#12 Operation wise Rejected Qty:
Select operation_name,sum(Rejected_qty) as Rejected_qty from Base2 group by operation_name;

#13 Machine wise Rejected Qty (Top 10):
Select machine_name,sum(Rejected_qty) as Rejected_qty from Base2 group by machine_name order by rejected_qty desc limit 10;

#14 Daywise Avg Balance 
Select End_time,Avg(Balance_qty) as Balance_qty from Base2 group by end_time order by End_time;

