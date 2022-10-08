# React 2



### Props를 통해 데이터 전달하기

본격적으로 시작하기 위해 Board 컴포넌트에서 Square 컴포넌트로 데이터를 전달해 봅시다.

자습서를 따를 때 복사/붙여넣기가 아니라 손으로 직접 코드를 작성하길 추천합니다. 이렇게 하면 코드를 몸으로 기억하고 이해력을 더 높일 수 있습니다.

Square에 `value` prop을 전달하기 위해 Board의 `renderSquare` 함수 코드를 수정해주세요.

```react
class Board extends React.Component {
  renderSquare(i) {
    return <Square value={i} />;  }
}
```



값을 표시하기 위해 Square의 `render` 함수에서 `{/* TODO */}`를 `{this.props.value}`로 수정해주세요.

```react
class Square extends React.Component {
  render() {
    return (
      <button className="square">
        {this.props.value}      </button>
    );
  }
}
```



변경 전에는

[![React Devtools](https://ko.reactjs.org/static/1566a4f8490d6b4b1ed36cd2c11fe4b6/6a91e/tictac-empty.png)](https://ko.reactjs.org/static/1566a4f8490d6b4b1ed36cd2c11fe4b6/6a91e/tictac-empty.png)

변경 후에는 렌더링 된 결과에서 각 사각형에 숫자가 표시됩니다.

[![React Devtools](https://ko.reactjs.org/static/685df774da6da48f451356f33f4be8b2/01bf6/tictac-numbers.png)](https://ko.reactjs.org/static/685df774da6da48f451356f33f4be8b2/01bf6/tictac-numbers.png)