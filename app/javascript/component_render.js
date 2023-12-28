import { createRoot } from "react-dom/client";

export default function componentRender(id, component) {
  document.addEventListener("DOMContentLoaded", () => {
    const element = document.getElementById(id);
    if (element) {
      const root = createRoot(document.getElementById(id));
      root.render(component);
    }
  });
}
