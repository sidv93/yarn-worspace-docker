import logo from './logo.svg';
import './App.css';
import { Button } from 'lib';
import 'lib/dist/style.css';

function App() {
  return (
    <div className="App">
      <header className="App-header">
        <img src={logo} className="App-logo" alt="logo" />
        <p>
          Welcome to admin
        </p>
        <Button type="primary" text="hello" onClick={() => console.log('hello')} />
        <a
          className="App-link"
          href="https://reactjs.org"
          target="_blank"
          rel="noopener noreferrer"
        >
          Learn React
        </a>
      </header>
    </div>
  );
}

export default App;
