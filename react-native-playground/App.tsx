
import HomeComponent from './libs/natives/components/HomeComponent';

const App = () => {
  return (
    <HomeComponent
      style={{
        width: '100%',
        height: '100%',
      }}
      initialized={true}
      visible={true}
    />
  );
};

export default App;