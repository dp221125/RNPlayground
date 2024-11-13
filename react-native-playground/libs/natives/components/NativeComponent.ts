import type { HostComponent, ViewProps } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface NativeComponentProps extends ViewProps {
  initialized: boolean;
  visible: boolean;
}

export default codegenNativeComponent<NativeComponentProps>(
  'NativeComponent'
) as HostComponent<NativeComponentProps>;