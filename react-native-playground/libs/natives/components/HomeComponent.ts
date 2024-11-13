import type { HostComponent, ViewProps } from 'react-native';
import codegenNativeComponent from 'react-native/Libraries/Utilities/codegenNativeComponent';

export interface HomeComponentProps extends ViewProps {
  initialized: boolean;
  visible: boolean;
}

export default codegenNativeComponent<HomeComponentProps>(
  'HomeComponent'
) as HostComponent<HomeComponentProps>;