while 1:
    correct_pass=4542
    Balance_inquiry=50000
    print("wlcome to our Bank")
    PIN=int(input("Enter your 4-digit numper:"));
    while 1:
        if PIN!=correct_pass:
            print("invalid password:\n")
            break
        else:              
            while 1:
                print("1-withdraw\n2-Balance Inquiry\n3-Fast cash\n4-quit\n")
                process=int(input("choose Process :\n"))
                if process==1:
                    while 1:
                        withdraw=int(input("enter with draw amount(multiple of 100):"))
                        if withdraw % 100 ==0 :
                            if withdraw<Balance_inquiry :
                                print(withdraw)
                                print("TRRRRRRRRRRRRRR")
                                print(f"the remaining Balance_inquiry={Balance_inquiry-withdraw}$\n")
                                break
                            else:
                                print("no enough money my brother")
                        else:
                            print("not multiple try again\n")
                            continue
                elif process==2:
                    print(f"your Balance = {Balance_inquiry}$\n\n\n")
                elif process==3:
                        print("1-500$\n 2-1000$\n3-5000\n4-10000\n5-50000\n")
                        print("enter number:")
                        amount=int(input())
                        if amount==1:
                            Balance_inquiry=Balance_inquiry-500
                        elif amount==2:
                            Balance_inquiry=Balance_inquiry-1000
                        elif amount==3:
                            Balance_inquiry=Balance_inquiry-5000
                        elif amount==4:
                            Balance_inquiry=Balance_inquiry-10000   
                        elif amount==5:
                            Balance_inquiry=Balance_inquiry-50000
                        else:
                            print("not right chosse!")      
                elif process==4:
                    break
                else:
                    print("wrong process !")
                    continue
        break      
      