class Api {

  static const baseUrl = "http://172.252.13.74:5007/api/v1";

  static const login = "$baseUrl/auth/login"; // done
  static const userRegister = "$baseUrl/users/register"; // done
  static const registerVerify = "$baseUrl/otp/verify-otp"; // done
  static const resendOtp = "$baseUrl/otp/resend-otp"; // done
  static const resetForgetPassword =
      "$baseUrl/auth/reset-forgotten-password"; // done

}