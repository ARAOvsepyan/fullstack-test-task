import Auth from "./scenes/auth";
import Dashboard from "./scenes/dashboard";


export const authRoutes = [
    {
        path: '/',
        Element: <Dashboard/>
    },
    {
      path: "/auth",
      element: <Auth />
    },
]

