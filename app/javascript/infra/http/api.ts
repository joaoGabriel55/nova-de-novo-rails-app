import axios from "axios";
import { csrfToken } from "./utils/csrf";

export const api = axios.create({
  headers: {
    "Content-Type": "application/json",
    Accept: "application/json",
    "X-CSRF-Token": csrfToken(),
  },
});
