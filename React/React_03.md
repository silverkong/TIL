# React 03



### 사용자와 상호작용하는 컴포넌트 만들기

Square 컴포넌트를 클릭하면 “X”가 체크되도록 만들어봅시다. 먼저 Square 컴포넌트의 `render()` 함수에서 반환하는 버튼 태그를 아래와 같이 변경해주세요.

```
class Square extends React.Component {
  render() {
    return (
      <button className="square" onClick={function() { console.log('click'); }}>        {this.props.value}
      </button>
    );
  }
}
```



다음 단계로 Square 컴포넌트를 클릭한 것을 “기억하게” 만들어 “X” 표시를 채워 넣으려고 합니다. 무언가를 “기억하기”위해 component는 **state**를 사용합니다.

React 컴포넌트는 생성자에 `this.state`를 설정하는 것으로 state를 가질 수 있습니다. `this.state`는 정의된 React 컴포넌트에 대해 비공개로 간주해야 합니다. 이제 Square의 현재 값을 `this.state`에 저장하고 Square를 클릭하는 경우 변경하겠습니다.

우선 클래스에 생성자를 추가하여 state를 초기화합니다.

```
class Square extends React.Component {
  constructor(props) {    super(props);    this.state = {      value: null,    };  }
  render() {
    return (
      <button className="square" onClick={() => console.log('click')}>
        {this.props.value}
      </button>
    );
  }
}
```



이제 Square를 클릭할 때 현재 state 값을 표시하기 위해 `render` 함수를 변경할 것입니다.

- `<button>` 태그 안 `this.props.value`를 `this.state.value`로 변경해주세요.
- `onClick={...}` 이벤트 핸들러를 `onClick={() => this.setState({value: 'X'})}`로 변경해주세요.
- 가독성을 높이기 위해 `className`과 `onClick` props를 별도의 줄에 넣어주세요.

이와 같은 변경 후에 Square의 `render` 함수에서 반환하는 `<button>` 태그는 아래의 형태와 같습니다.

```
class Square extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      value: null,
    };
  }

  render() {
    return (
      <button
        className="square"        onClick={() => this.setState({value: 'X'})}      >
        {this.state.value}      </button>
    );
  }
}
```

Square의 `render` 함수 내부에서 `onClick` 핸들러를 통해 `this.setState`를 호출하는 것으로 React에게 `<button>`을 클릭할 때 Square가 다시 렌더링해야 한다고 알릴 수 있습니다. 업데이트 이후에 Square의 `this.state.value`는 `'X'`가 되어 게임 판에서 `X`가 나타나는 것을 확인할 수 있습니다. 어떤 Square를 클릭하던 `X`가 나타날 것입니다.

컴포넌트에서 `setState`를 호출하면 React는 자동으로 컴포넌트 내부의 자식 컴포넌트 역시 업데이트합니다.