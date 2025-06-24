emploee=[['ahmed','2000',"comm","200"],['marwan','20003',"power","20"]]
data=[]
counter=-1
while 1:
    print("1-enter emploee:\n2-search by name :\n3-delete emploee :\n4-show all emploee:\n5-quit:\n")
    process=int(input("enter procss\n"))
    if(process==1):
        data.append(input("enter the name:"))
        data.append(input("enter the salary:"))
        data.append(input("enter the depatment:"))
        data.append(input("enter the id:"))
        emploee.append(data)
        
    elif(process==2): 
        name=input("enter the name :\n ")
        for i in emploee:
            counter=counter +1
            if(name==i[0]):
                print(f"{name} is on location {emploee[counter]}")
                break
    elif(process==3):
        name=input("enter the name :\n ")
        for i in emploee:
            if(name==i[0]):
                emploee.remove(i)
                break  
    elif process==4:
        print(emploee)
    elif process==5:
        break
    else:
        print("not valid")

                     
       
                