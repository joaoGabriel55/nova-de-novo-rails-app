import { createRoot } from "react-dom/client";

export default function render(id, component) {
  const element = document.getElementById(id);
  if (element) {
    const root = createRoot(document.getElementById(id));
    root.render(component);
  }
}
