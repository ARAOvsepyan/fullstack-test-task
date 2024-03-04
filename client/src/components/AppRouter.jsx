import { Routes, Route, Navigate } from 'react-router-dom'
import { authRoutes } from '../routes'

const AppRouter = () => {
    return (
        <Routes>
            {authRoutes.map(({path, Element}) =>
                <Route key={path} path={path} element={Element} exact/>
            )}
            <Route path="*" element={<Navigate to ="/dashboard" />}/>
        </Routes>
    )
  }

export default AppRouter;