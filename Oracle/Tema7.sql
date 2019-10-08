create or replace type address as object
(house_no varchar2(10),
street varchar2(30),
city varchar2(20),
state varchar2(10),
pincode varchar2(10));

create or replace type customer as object
(code number(5),
name varchar2(30),
contact_no varchar2(12),
addr address,
member procedure display
);

set serveroutput on;
DECLARE 
   residence address; 
BEGIN 
   residence := address('103A', 'M.G.Road', 'Jaipur', 'Rajasthan','201301'); 
   dbms_output.put_line('House No: '|| residence.house_no); 
   dbms_output.put_line('Street: '|| residence.street); 
   dbms_output.put_line('City: '|| residence.city); 
   dbms_output.put_line('State: '|| residence.state); 
   dbms_output.put_line('Pincode: '|| residence.pincode); 
END;

CREATE OR REPLACE TYPE rectangle AS OBJECT 
(length number, 
 width number, 
 member function enlarge( inc number) return rectangle, 
 member procedure display, 
 map member function measure return number 
);


CREATE OR REPLACE TYPE BODY rectangle AS 
   MEMBER FUNCTION enlarge(inc number) return rectangle IS 
   BEGIN 
      return rectangle(self.length + inc, self.width + inc); 
   END enlarge;  
   MEMBER PROCEDURE display IS 
   BEGIN  
      dbms_output.put_line('Length: '|| length); 
      dbms_output.put_line('Width: '|| width); 
   END display;  
   MAP MEMBER FUNCTION measure return number IS 
   BEGIN 
      return (sqrt(length*length + width*width)); 
   END measure; 
END; 

DECLARE 
   r1 rectangle; 
   r2 rectangle; 
   r3 rectangle; 
   inc_factor number := 7; 
BEGIN 
   r1 := rectangle(3, 4); 
   r2 := rectangle(5, 7); 
   r3 := r1.enlarge(inc_factor); 
   r3.display;  
   IF (r1 > r2) THEN -- calling measure function 
      r1.display; 
   ELSE 
      r2.display; 
   END IF; 
END; 

