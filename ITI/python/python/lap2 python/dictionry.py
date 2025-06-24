counter=-1
employe={"employe1":{"name":"marwan",
                     "Salary":"12550",
                     "Department":"AUC",
                     "ID":"20015"},
         "employe2":{"name":"ahmed",
                     "Salary":"125",
                     "Department":"power",
                     "ID":"205"}}
while 1:
    print("1-enter emploee:\n2-search by name :\n3-delete emploee :\n4-show all emploee:\n5-quit:\n")
    process=int(input("enter procss\n"))
    if(process==1):
        number=input("enter the number of employe:")
        name=input("enter the name:\n")
        ID=input("enter the id:\n")
        salary=input("enter the salary:")
        Department=input("enter the department:")
        
        employe.update({number:{"name":name,
                             "Salary":salary,
                             "Department":Department,
                             "ID":ID}})
        print(employe)
    elif(process==2): 
        name=input("enter the name :\n ")
        for i in employe:
            if(name==employe[i]["name"]):
                print(f"{employe[i]}")
                break
    elif(process==3): 
        name=input("enter the name :\n ")
        for i in employe:
            if(name==employe[i]["name"]):
                employe.pop(i)
                print(employe)
                break
    elif process==4:
        print(employe)
    elif process==5:
        break
    else:
        print("not valid process")
            
    