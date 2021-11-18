---
marp: true
_class: invert
theme: gaia
paginate: true
footer: 'Future Tech Corp, CSE 3901'
style: |
  section footer {
      text-align: left;
      font-size:15px;
  }
---

<!--
_class: lead gaia
_paginate: false
_backgroundColor: #42b983
_footer: 'Future Tech Corp, CSE 3901. | This presentation is based on Vue.js 3'
-->

# How Vue.js works?

from source code's perspective

---

# Agenda

![bg right w:8cm contrast](https://vuejs.org/images/logo.svg)

- what is Vue.js & why from source code?
- How vue.js compile?
- Look into effect.ts file

---

## What is Vue?

- By Evan You (尤雨溪)
- progressive framework for building user interfaces
- layer by layer from the bottom up

## Why from source code?

- You should use it only if you know it well.
- There is no secret if you can view inside a software from source code.

---

<!--
_class: lead gaia
_paginate: false
_backgroundColor: #42b983
-->

## Welcome to the source code world of Vue.js

---

# How Vue.js compile

- the entry file is `packages/vue/index.ts `

```javascript
// This entry is the "full-build" that includes both the runtime
// and the compiler, and supports on-the-fly compilation of the template option.
import { initDev } from './dev'...

const compileCache: Record<string, RenderFunction> = Object.create(null)

function compileToFunction( ...
  // code of the compileToFunction
  }

```

---

# How Vue.js compile

Dependency injection compile function to runtime
=>
runtime calls compiling function `compileToFunction`
=>
return result including code
=>
Pass code as a parameter to the constructor, and pass the generated function to render
=>
Return the render function as the compiled result

---

```javascript
  // The wildcard import results in a huge object with every export
  // with keys that cannot be mangled, and can be quite heavy size-wise.
  // In the global build we know `Vue` is available globally so we can avoid
  // the wildcard object.
  const render = (
    __GLOBAL__ ? new Function(code)() : new Function('Vue', code)(runtimeDom)
  ) as RenderFunction

  // mark the function as runtime compiled
  ;(render as InternalRenderFunction)._rc = true

  return (compileCache[key] = render)
}

registerRuntimeCompiler(compileToFunction) //line 87 of index.ts

export { compileToFunction as compile }
export * from '@vue/runtime-dom'
```

---

```javascript
    template = el ? el.innerHTML : ``
  }

  const { code } = compile( //line 47 of index.ts
    template,
    extend(
      {
        hoistStatic: true,
        onError: __DEV__ ? onError : undefined,
        onWarn: __DEV__ ? e => onError(e, true) : NOOP
      } as CompilerOptions,
      options
    )
  )
```

---

# A simple example

```javascript
<template>
  <div>Hello, World!</div>
</template>
```

```javascript
//after compile with vue
const _Vue = Vue;
return function render(_ctx, _cache) {
  with (_ctx) {
    const { openBlock: _openBlock, createBlock: _createBlock } = _Vue;
    return _openBlock(), _createBlock('div', null, 'Hello, World!');
  }
};
```

---

```javascript
      )
    warn(codeFrame ? `${message}\n${codeFrame}` : message)
  }

  // The wildcard import results in a huge object with every export
  // with keys that cannot be mangled, and can be quite heavy size-wise.
  // In the global build we know `Vue` is available globally so we can avoid
  // the wildcard object.
  const render = ( //line 77 of index.ts
    __GLOBAL__ ? new Function(code)() : new Function('Vue', code)(runtimeDom)
  ) as RenderFunction

  // mark the function as runtime compiled
  ;(render as InternalRenderFunction)._rc = true
```

---

# What is hoistStatic?

- When the Vue compiler finds some nodes or attributes that will not change during the compilation process, it will mark these nodes.
- Then in the process of generating code strings, the compiler will find these static nodes, staticize them, and serialize them into strings, thereby reducing compilation and rendering costs.

---

# Here is some examples

```javascript
<div>
  <span class='foo'>Static</span>
  <span>{{ dynamic }}</span>
</div>
```

- Vue could hoistStatic the node <span class="foo">

---

```javascript
<div id='foo' class='bar'>
  {{ text }}
</div>
```

- Vue 3 could skip the node, just hoistStatic id="foo" abd class="bar"

---

# How hoistStatic improve performace?

```javascript
<div>
  <div>
    <span class='foo'></span>
    <span class='foo'></span>
    <span class='foo'></span>
    <span class='foo'></span>
    <span class='foo'></span>
  </div>
</div>
```

---

# Without hoistStatic

```javascript
const {
  createVNode: _createVNode,
  openBlock: _openBlock,
  createBlock: _createBlock
} = Vue;

return function render(_ctx, _cache) {
  return (
    _openBlock(),
    _createBlock('div', null, [
      _createVNode('div', null, [
        _createVNode('span', { class: 'foo' }),
        _createVNode('span', { class: 'foo' }),
        _createVNode('span', { class: 'foo' }),
        _createVNode('span', { class: 'foo' }),
        _createVNode('span', { class: 'foo' })
      ])
    ])
  );
};
```

---

# With hoistStatic

```javascript
const {
  createVNode: _createVNode,
  createStaticVNode: _createStaticVNode,
  openBlock: _openBlock,
  createBlock: _createBlock
} = Vue;

const _hoisted_1 = /*#__PURE__*/ _createStaticVNode(
  '<div><span class="foo"></span><span class="foo"></span><span class="foo"></span><span class="foo"></span><span class="foo"></span></div>',
  1
);

return function render(_ctx, _cache) {
  return _openBlock(), _createBlock('div', null, [_hoisted_1]);
};
```

- It will generate a variable \_hoisted*1 and mark it with /*#**PURE**\_/.
- \_hoisted_1 calls createStaticVNode to create a static node by passing a string of parameters.

---

# How Vue achieve hoistStatic?

```javascript
export function transform(root: RootNode, options: TransformOptions) {
  const context = createTransformContext(root, options)
  // traverse all nodes and transfer
  traverseNode(root, context)
  //if the option of hoistStatic is true，do hoistStatic
  if (options.hoistStatic) {
    hoistStatic(root, context)
  }
  if (!options.ssr) {
    createRootCodegen(root, context)
  }
  ...
}
```

---

# How hoistStatic achieve?

```javascript
export function hoistStatic(root: RootNode, context: TransformContext) {
  walk(
    root,
    context,
    // root node can not be staticize
    isSingleElementRoot(root, root.children[0])
  );
}
```

---

# How walk achieve?

```javascript
function walk(
  node: ParentNode,
  context: TransformContext,
  doNotHoistNode: boolean = false
) {
  let hasHoistedNode = false
  let canStringify = true

  const { children } = node
  for (let i = 0; i < children.length; i++) {
    const child = children[i]
    ...
  }

  if (canStringify && hasHoistedNode && context.transformHoist) {
    context.transformHoist(children, context, node)
  }
}
```

---

<!--
_class: lead

-->

# Look into effect.ts file

---

# How does Vue track changes?

- Vue can always notify the update and re-render the component immediately.
  &nbsp;
  &nbsp;
- How does these realized?
  &nbsp;
  -Use an effect function to track the currently running function
  -Collect dependencies, distribute, and updates

---

# The realization of effect

effect（） - packages/reactivity/src/effect.ts - Line 145

```javascript
export function effect<T = any>(
  fn: () => T,
  options?: ReactiveEffectOptions
): ReactiveEffectRunner {
  // If it is already an effect function,
  // take the original function directly
  if ((fn as ReactiveEffectRunner).effect) {
    fn = (fn as ReactiveEffectRunner).effect.fn
  }
```

---

```javascript
// create effect
const _effect = new ReactiveEffect(fn)
if (options) {
  extend(_effect, options)
  if (options.scope) recordEffectScope(_effect, options.scope)
}
// If lazy is not true, execute effect directly once.
// The lazy of the calculated property is true
if (!options || !options.lazy) {
  _effect.run()
}
// return
const runner = _effect.run.bind(_effect) as ReactiveEffectRunner
runner.effect = _effect
return runner
}
```

---

### ReactiveEffect()

- packages/reactivity/src/effect.ts - Line 53
  &nbsp;
- Use the stack data structure `EffectStack` to debug the execution of the `effect` before dependency collection

- Ensure the highest priority of the current `effect` and clear the memory of the collected dependencies in time

- Executed fn() -> trigger the getter of target[key] -> trigger the `track` for dependency collection

---

## Collect dependencies

### track()

- packages/reactivity/src/effect.ts - Line 188
  &nbsp;
- Dependency collector, which is responsible for collecting dependencies and putting them into the dependency management center (targetMap)

---

```javascript
export function track(target: object, type: TrackOpTypes, key: unknown) {
  // If no effect is currently activated, no collection is required
  if (!isTracking()) {
    return
  }
  // Get target from targetMap
  let depsMap = targetMap.get(target)
  if (!depsMap) {
    // If not, create one
    targetMap.set(target, (depsMap = new Map()))
  }
  // Get the dep set corresponding to the key
  let dep = depsMap.get(key)
  if (!dep) {
    // create one if not have
    depsMap.set(key, (dep = createDep()))
  }
```

---

## trackEffects()

- packages/reactivity/src/effect.ts - Line 212
- Active `effect` is collected into the corresponding effect set, that is, `Dep`.
  &nbsp;
- Dep.n: n is the abbreviation of `newTracked`, indicating whether it is the latest collection (whether it is the current layer)

- Dep.w: w is the abbreviation of `wasTracked`, indicating whether it has been collected to avoid repeated collection

---

```javascript
export function trackEffects(
  dep: Dep,
  debuggerEventExtraInfo?: DebuggerEventExtraInfo
) {
  let shouldTrack = false
  // If the number of nested layers of effect does not exceed max
  if (effectTrackDepth <= maxMarkerBits) {
    if (!newTracked(dep)) {
      // Mark new dependency
      dep.n |= trackOpBit
      // Dependencies that have been collected do not need to be collected repeatedly
      shouldTrack = !wasTracked(dep)
    }
  } else {
    // Switch to clear dependency mode when it exceeds
    shouldTrack = !dep.has(activeEffect!)
  }
  // if can collect
  if (shouldTrack) {
    // Collect the currently active effect as a dependency
    dep.add(activeEffect!)
    // The currently active effect collects the dep collection
    activeEffect!.deps.push(dep)
  }
}
```

---

## trigger()

- packages/reactivity/src/effect.ts - Line 243
- Responsible for obtaining the responsive function according to the mapping relationship, and then sending a notice to `riggerEffects` to update.

## TriggerEffects()

- packages/reactivity/src/effect.ts - Line 330
- Execute the effect function

---

## In the end

&nbsp;
The analysis of source code is done by Future Tech Corp.

If you have any suggestions or questions about our understanding of the source code, or you are interested in the source code or other aspects of Vue.JS, we are very willing to communicate and share with you!!

---

# Reference

[1] https://v3.cn.vuejs.org/guide
[2] https://github.com/vuejs/vue-next (This is the repo for vue3)
