<?php include 'connection/connection.php'; ?>
<?php include 'connection/function.php'; ?>

<?php
$action=$_POST['action'];

switch ($action) {


    case 'loan-request-api':
        $fullname=trim(strtoupper($_POST['fullname']));
        $loanamount=trim($_POST['loanamount']);
        $loanduration=trim($_POST['loanduration']);
        $loanrate=1.5;

        if (($fullname=="") || ($loanamount=="") || ($loanduration=="")) {

            $response['response']=001; 
            $response['success']=false;
            $response['message1']="ERROR!";
            $response['message2']="Fill all fields to continue.";

        }else {

            ///////////////////////geting sequence//////////////////////////
            $sequence=$callclass->_get_sequence_count($conn, 'USER');
            $array = json_decode($sequence, true);
            $no= $array[0]['no'];
            $user_id='USER'.date("Ymdhis").$no; 

            $sequence=$callclass->_get_sequence_count($conn, 'TRANS');
            $array = json_decode($sequence, true);
            $no= $array[0]['no'];
            $transaction_id='TRANS'.date("Ymdhis").$no;

            mysqli_query($conn,"INSERT INTO `users_tab`
            (`user_id`, `transaction_id`, `fullname`, `loan_amount`, `loan_duration`, `loan_rate`, `created_at`) VALUES
            ('$user_id','$transaction_id','$fullname','$loanamount','$loanduration','$loanrate', NOW())")or die (mysqli_error($conn));

            $amount = $loanamount;
            $month = $loanduration;
            $SubPayment = $amount / $month;
            for ($b = 1; $b <= $month; $b++) {
                $interest = ($loanrate / 100) * $amount;
                $total = $SubPayment + $interest;
                $amount = $amount - $SubPayment;
                $totalRepayment = $totalRepayment + $total;
                $deduction = $amount + $SubPayment;
            
            mysqli_query($conn,"INSERT INTO `loan_request_transaction`
            (`transaction_id`, `month`, `loan_balance`, `sub_payment`, `interest`, `total_repayment`, `transaction_date`, `system_used`, `ip_address`) VALUES
            ('$transaction_id','$b','$deduction','$SubPayment','$interest','$total', NOW(), '$sysname', '$ip_address')")or die (mysqli_error($conn));

            }
            
            $response['response']=003; 
            $response['success']=true;
            $response['message1']="SUCCESS!";
            $response['message2']="Loan Application Successfully.";
        }
        echo json_encode($response);    
   break;




   case 'fetch-all-users-api':
        $user_id=trim(strtoupper($_POST['user_id']));

        if ($user_id==''){
            $query = mysqli_query($conn, "SELECT * FROM users_tab");
            $check_query= mysqli_num_rows($query);
            if ($check_query>0) {
                
                $response['response'] = 004;
                $response['success'] = true;
                $response['message1'] = "SUCCESS!";
                $response['message2'] = "User Record has been Successfully Fetched.";

                while($fetch_query = mysqli_fetch_all($query, MYSQLI_ASSOC)){
                    $response['data'] = $fetch_query;
                }
            }else{
                $response['response'] = 005;
                $response['success'] = false;
                $response['message1'] = "Error!";
                $response['message2'] = "User record not found for the given user ID.";
            }
        }else{
            $query = mysqli_query($conn, "SELECT * FROM users_tab WHERE user_id='$user_id'");
            
            $response['response'] = 006;
            $response['success'] = true;
            while($fetch_query = mysqli_fetch_assoc($query));{
                $response['data'] = $fetch_query; 
            }
        }
            echo json_encode($response); 
    break;




    case 'fetch-all-loan-requests-api':
        $transaction_id=trim(strtoupper($_POST['transaction_id']));

        $query = mysqli_query($conn, "SELECT transaction_id, fullname, loan_amount, loan_duration, created_at FROM users_tab WHERE transaction_id='$transaction_id'");
        $fetch_query = mysqli_fetch_array($query);

        if ($fetch_query > 0) {
            $transaction_id = $fetch_query['transaction_id'];
            $fullname = $fetch_query['fullname'];
            $loanamount = $fetch_query['loan_amount'];
            $loanduration = $fetch_query['loan_duration'];
            $created_at = $fetch_query['created_at'];

            $response['response'] = 007;
            $response['success'] = true;
            $response['transaction_id'] = $transaction_id;
            $response['fullname'] = $fullname;
            $response['loanamount'] = $loanamount;
            $response['loan_duration'] = $loanduration;
            $response['created_at'] = $created_at;
            $response['message1'] = "SUCCESS!";
            $response['message2'] = "Transaction Record has been Successfully Fetched.";

            $query = mysqli_query($conn, "SELECT * FROM loan_request_transaction WHERE transaction_id='$transaction_id'");
            $fetch_data = array();
            $total_repayment = 0;
            while ($row = mysqli_fetch_assoc($query)) {
                $fetch_data[] = $row;
                $total_repayment += $row['total_repayment'];
            }
            $response['data'] = $fetch_data;
            $response['total_repayment'] = $total_repayment;

        } else {
    
            // $response['response'] = 008;
            $response['success'] = false;
            $response['message1'] = "Transaction ID Error!";
            $response['message2'] = "No records found for the given transaction ID.";
        }

            echo json_encode($response);     
    break;

    
}
?>
