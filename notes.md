# react

## multi page application (MPA)

- uses multiple or different pages to render the user interface
- pros
  - simple development
  - Search Engine Optimization is already enabled
  - rendered on the server
- cons
  - dependent on constant internet connection
  - every page gets rendered completely (for every page, browser sends a request to the server and reloads the entire page)
  - feels slower than single page application
  - can not work offline
- approach: php, python, Java

## single page application (SPA)

- the web application contains only one html page (index.html) and rest of the functionality is integrated using JS
- pros
  - the application does not reload the page every time
  - the entire application gets loaded in the browser only for the first time
  - once the application gets loaded, it never reloads again
  - SPA is faster than MPA approach
  - constant internet connection is not required for the user interface
  - SPA can work offline (since the application can be cached)
- cons
  - since the entire application gets loaded for the first time only, it takes more time to load the application compared to MPA
  - SEO is not by default possible since the page gets rendered on the client side (which can be fixed by using third party libraries like NextJS)
- approach: angular, react, vuejs

## react

- is a library to develop single page application
- developed by Meta for facebook and later got open sourced in 2013
- characteristics
  - unlike the angular or vuejs (both of them are frameworks), the react is a library
  - it has less memory footprint (it requires less memory compared to angular or vuejs)
  - uses JSX (JavaScript and XML together)
  - has component-oriented architecture (everything in React is a component)
    - a react application is just a hierarchy of components
  - deployment of react application very simple
- react ecosystem
  - package manager
    - used to create react application
    - e.g. vite, create-react-app
  - global state management
    - used for mantaining and sharing the state globally in the application
    - e.g. Redux, Context, Zustand
  - calling and caching the API results
    - e.g. TanStack Query, Redux Query
  - client side routing
    - used to add mulitple pages/screens/components
    - e.g. React Router, TanStack Router

## create react application

- using CDN (content delivery network)
  - use the react cdn links in your html page to add react library

  ```javascript
    <script crossorigin src="https://unpkg.com/react@18/umd/react.development.js"></script>
    <script crossorigin src="https://unpkg.com/react-dom@18/umd/react-dom.development.js"></script>
  ```

  - react.development.js: used to add the core react functionality
  - react-dom.development.js: used create a virtual DOM

    ```javascript
    // get the object of root div tag
    const divRoot = document.getElementById('root')
    console.log(divRoot)

    // create a root for rendering the react application
    const root = ReactDOM.createRoot(divRoot)
    console.log(root)

    // create a react element
    // h1: is the type of html element to be created
    // {}: there are no options used while rendering the h1
    // '...': contents which will be rendered inside the h1 element
    const h1 = React.createElement('h1', {}, 'welcome to react application')
    console.log(h1)

    // render the react element inside the root
    root.render(h1)
    ```

  - ReactDOM.createRoot()
    - used to create a react root element
    - the root element is responsible for rendering the react components
    - parameters
      - domNode: dom element where the react application gets loaded
  - React.createElement()
    - used to create the React Elements
    - only react elements can be rendered inside the react root
    - parameters
      - element type: type of element to be created
      - options: options used for rendering the element
      - contents:
        - contents to be rendered inside the element
        - could be a string (contents of an element)
        - could be an array of child react elements

    - babel
      - it is a Javascript compiler that compiles the modern (next generation) syntax to the legacy (old) one
      - add the following cdn link to your react application
        - <script src="https://unpkg.com/@babel/standalone/babel.min.js"></script>

- using package manager
  - tool used to manage a react/angular/vuejs project
  - e.g. vite, create-react-app, next.js: create-next-app (Server Sided Rendering), expo (react native)
  - vite
    - build tool to manage (create, upgrade) react application

    ```bash
      # create react application
      > npm create vite@latest

      # project-name: name of the project and directory (app1)
      # select a framework: react
      # select a variant: javascript
      # Install with npm and start now?: No

      # go the project directory
      > cd app1

      # install the node packages
      > npm install

      # start the react application
      > npm run dev
      # note: this will start the project on 5173 port
      # visit http://localhost:5173 on the browser

    ```

## react project hierarchy

- node_modules:
  - contains the required packages to develop or run the application
  - will be created every time npm install command is executed
- public
  - directory which contains the files which need public access
  - e.g. css files, images, audio or video files
- src
  - main.jsx
    - contains the application startup code
    - acts like entry point for the react application
  - App.jsx
    - first or root component used to start the application
    - every application has one root component named App
    - this component loads other application components
  - index.css
    - contains the global css rules (which are shared among all the components of the application)
  - App.css
    - contains the css rules used in App.jsx file or App component
  - assets
    - directory which contains assets (images, audio and video)
  - pages
    - directory which contains the application pages/screen (components)
  - services
    - directory which contains the services which are used to connect the frontend with backend
  - components
    - directory which contains the reusable components
- .gitignore
  - file used by git to ignore the files or directories while committing the code to the repository
  - e.g. node_modules, dist
- eslint.config.js
  - linter is program used to detect the lint warning or error to check the code quality
  - file used to configure the JS linter
- index.html
  - only html file in the project which contains the react root (div with an id root)
  - this file gets loaded initially when the project starts
- package.json
  - contains list of dependencies, script and application config
- package-lock.json
  - contains the list of packages installed in node_modules directory along with their versions
- vite.config.js
  - used to configure the vite project manager
  - it used to start the react sub-system

## react application startup process

- npm run dev (vite command) is executed
- vite starts a lite web server on default port 5173
- server loads the file named index.html
- index.html loads the startup file named src/main.jsx
- main.jsx creates a react root by using a function createRoot()
- loads the root component named App from src/App.jsx

## JSX

- combination of JavaScript and XML (html) syntax together
- by default react does not understand the jsx syntax
- rather, react depends upon a JS compiler known as babel to transform the JSX syntax to plain JS code

### interpolation

- creating a string using value(s) of variable(s)
- used to create the element contents dynamically
- interpolation with simple variable

```javascript
const firstName = 'John'
const h1 = <h1>Welcome {firstName}</h1>
```

- interpolation with an object

```javascript
const person = { firstName: 'John', lastName: 'Doe' }
const div = (
  <div>
    <h1>First Name: {person.firstName}</h1>
    <h1>Last Name: {person['lastName']}</h1>
  </div>
)
```

- interpolation with an array of values

```javascript
const courses = ['DAC', 'DMC', 'DBDA', 'DITISS']
const container = courses.map((course) => {
  return (
    <div>
      <strong>{course}</strong>
    </div>
  )
})
```

- interpolation with array of objects

```javascript
// array of objects
const persons = [
  { name: 'person1', age: 30, address: 'pune' },
  { name: 'person2', age: 40, address: 'mumbai' },
  { name: 'person3', age: 50, address: 'karad' },
]

// create element to render the persons
const container = persons.map((person) => {
  return (
    <div>
      <div>name: {person.name}</div>
      <div>age: {person.age}</div>
      <div>address: {person['address']}</div>
      <hr />
    </div>
  )
})
```

## component

- is a reusable entity
- contains
  - data (optional)
  - business logic (optional)
  - logic to render UI using JSX (mandatory)
- types of components
  - class component (legacy)
  - functional component (modern)

## props

- props stands for properties
- it is an object which contains the data to be passed from parent to child component
- this is the only way a parent can pass some data to the immediate child component

## state

- is an object maintained by the component within itself
- used to render the component conditionally
- when state changes, the component re-renders
- if a component maintains its state, it is known as stateful component
- if a component does not maintain its state, it is known as stateless component

## react hook

- is special function which starts with `use`
- can be used only in functional components
- must be called outside any inner function
- useState
  - used to maintain a state inside a functional component
  - accepts
    - initial value: used to set the initial value of the state member
  - returns
    - array with two values
      - value1: getter to read the current value of the state member
      - value2: reference to a setter function to update the state member
- useEffect
  - used to implement the component lifecycle methods
  - useEffect accepts 2 parameters
    - 1st: function which gets called in different scenarios
    - 2nd: dependency array
  - scenarios
    - component gets mounted/launched
      - useEffect(() => {}, [])
      - the function gets called immediately after the component is mounted
      - dependency array must be empty
    - component gets unmounted
      - the callback function must return a function as return value
      - the returned function gets called automatically when component gets unmounted
    - component state changed
      - useEffect(() => {})
      - callback function gets called automatically when the state changes
    - component state changed because of a required state member
      - useEffect(() => {}, [statemember])
      - the callback function gets called automatically when the state member changes its value
- useMemo
- useCallback
- useRef

## react routing

- route
  - mapping between a path and respective component (that needs to be launched)
- react by default does not support routing
- to add routing, use third party packages
  - react-router-dom (react router)
  - tanstack-router (tan stack)
- react-router-dom
  - installation: npm install react-router-dom
  - configuring router in react application

  - step 1: add the router in main.jsx

    ```javascript
    import { createRoot } from 'react-dom/client'
    import App from './App.jsx'
    import { BrowserRouter } from 'react-router-dom'

    createRoot(document.getElementById('root')).render(
      <BrowserRouter>
        <App />
      </BrowserRouter>,
    )
    ```

  - step 2: add the route collection

    ```javascript
    import Login from './pages/Login'
    import Register from './pages/Register'
    import Home from './pages/Home'
    import { Routes, Route } from 'react-router-dom'

    function App() {
      return (
        <div>
          <h1>App Component</h1>

          <Routes>
            <Route
              path='/login'
              element={<Login />}
            />
            <Route
              path='/register'
              element={<Register />}
            />
            <Route
              path='/home'
              element={<Home />}
            />
          </Routes>
        </div>
      )
    }

    export default App
    ```

- BrowserRouter
  - object which adds the routing capability in the react application
  - it watches the path and launches the respective component
- linking the components (switching the components)
  - static linking/switching
    - once configured the link wont change in future
    - can be implemented using `<Link>` provided by react-router-dom

    ```javascript

    imoprt {Link} from 'react-router-dom'

    function Login() {

      return <div>
        <Link to="/register">register</Link>
      </div>
    }

    ```

  - dynamic linking/switching
    - used to launch a component dynamically on certain condition
    - use `useNavigate()` react hook to get the navigation object
    - and use the navigation object for switching

    ```javascript

    imoprt {useNavigate} from 'react-router-dom'

    function Login() {
      // get the navigation object
      const navigate = useNavigate()

      const onRegister = () => {
        // navigate to register screen
        navigate('/register')
      }

      return <div>
        <button onClick={onRegister}>register</button>
      </div>
    }

    ```

## react toastify

- used to add toast message to replace the alert dialog
- installation

```bash
# install react-toastify
> npm install react-toastify
```

- configure the toast container in App.jsx

```javascript
import { ToastContainer } from 'react-toastify'

function App() {
  return (
    <div>
      <ToastContainer />
    </div>
  )
}

export default App
```

- show the required toast messages

```javascript
import { toast } from 'react-toastify'

function Login() {
  const onLogin = () => {
    toast.error('please enter email')
  }

  return (
    <div>
      <h2 className='header'>Login</h2>
      <button onClick={onLogin}>Login</button>
    </div>
  )
}

export default Login
```

## axios

- used to call REST APIs from JavaScript frontend
- installation

```bash
# install the axios package
> npm install axios
```

- call an API

```javascript
import axios from 'axios'
import { config } from './config'

export async function getBrands() {
  // send get request
  const response = await axios.get(`${config.baseUrl}/brand`)

  // send the response body
  return response.data
}
```

## web storage

- component of every browser responsible for storing the (string) data (key-value pairs) on client side
- types
  - sessionStorage
    - object to maintain the data till the time browser instance is running
    - used to store the data on client side temporarily
    - when browser instance exits, the session storage gets cleared
  - localStorage
    - object to maintain the data permenantly
    - removal of data has to be done explicitly
