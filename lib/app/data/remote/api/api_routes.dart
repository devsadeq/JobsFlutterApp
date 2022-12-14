class ApiRoutes {
  static const BASE_URL = "https://kasmtj.pythonanywhere.com";
  static const _API = "/api";

  static const JOBS = "$_API/jobs/";
  static const POSITIONS = "$_API/meta/get_all_job_titles";
  static const SEARCH = "$_API/companies/search";
  static const COMPANIES = "$_API/companies/";
  static const COMPANY_REGISTER = "$_API/auth/company_signup";
  static const CUSTOMER_REGISTER = "$_API/auth/customer_signup";
  static const LOGIN = "$_API/auth/login";
  static const CUSTOMERS = "$_API/customers";
  static const SAVED_JOBS = "$CUSTOMERS/get_all_saved_jobs/";
  static const TOGGLE_SAVE = "$CUSTOMERS/save/";
  static const APPLICATIONS = "$_API/applications/";
  static const JOB_APPLY = "$CUSTOMERS/Aplly/";
}
