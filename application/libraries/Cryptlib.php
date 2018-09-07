<?php
class Encryption {
    //var $skey = "BDQR345lskdfw9375pq0p1qw2o9i8w3"; // you can change it

    public  function safe_b64encode($string) {
        $data = base64_encode($string);
        $data = str_replace(array('+','/','='),array('-','_',''),$data);
        return $data;
    }

    public function safe_b64decode($string) {
        $data = str_replace(array('-','_'),array('+','/'),$string);
        $mod4 = strlen($data) % 4;
        if ($mod4) {
            $data .= substr('====', $mod4);
        }
        return base64_decode($data);
    }

    public  function encode($string){ 
		
		$output = false;
		$encrypt_method = "AES-256-CBC";
		$secret_key = 'BDQR345lskdfw9375pq0p1qw2o9i8w3';
		$secret_iv = '67859403hgyturmcpqqazplm';
		// hash
		$key = hash('sha256', $secret_key);

		// iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
		$iv = substr(hash('sha256', $secret_iv), 0, 16);		
		
		$output = openssl_encrypt($string, $encrypt_method, $key, 0, $iv);
        $output = base64_encode($output);
		return $output;


        /*if(!$value){return false;}
        $text = $value;
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $crypttext = mcrypt_encrypt(MCRYPT_RIJNDAEL_256, $this->skey, $text, MCRYPT_MODE_ECB, $iv);
        return trim($this->safe_b64encode($crypttext)); */
    }

    public function decode($string){
		$output = false;
		$encrypt_method = "AES-256-CBC";
		$secret_key = 'BDQR345lskdfw9375pq0p1qw2o9i8w3';
		$secret_iv = '67859403hgyturmcpqqazplm';
		// hash
		$key = hash('sha256', $secret_key);

		// iv - encrypt method AES-256-CBC expects 16 bytes - else you will get a warning
		$iv = substr(hash('sha256', $secret_iv), 0, 16);		
		
		$output = openssl_decrypt(base64_decode($string), $encrypt_method, $key, 0, $iv);
		return $output;		
		
		
        /*if(!$value){return false;}
        $crypttext = $this->safe_b64decode($value);  
        $iv_size = mcrypt_get_iv_size(MCRYPT_RIJNDAEL_256, MCRYPT_MODE_ECB);
        $iv = mcrypt_create_iv($iv_size, MCRYPT_RAND);
        $decrypttext = mcrypt_decrypt(MCRYPT_RIJNDAEL_256, $this->skey, $crypttext, MCRYPT_MODE_ECB, $iv);
        return trim($decrypttext);*/
    }
}

/*
$str = "My secret String";

$converter = new Encryption;
$encoded = $converter->encode($str );
$decoded = $converter->decode($encoded);    

echo "$encoded<p>$decoded";
*/
/*Encrypt Decrypt Start here*/

?>