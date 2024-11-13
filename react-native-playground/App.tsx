
import NativeComponet from './libs/natives/components/NativeComponent';

const App = () => {
  return (
    <NativeComponet
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