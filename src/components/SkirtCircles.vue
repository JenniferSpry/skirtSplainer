<template>
  <div>
    <svg xmlns="http://www.w3.org/2000/svg" width="320" height="320">
      <path :d="pathArc" stroke="black" fill="none" stroke-width="2" fill-opacity="0.5"/>
      <path :d="pathEllipse1" stroke="blue" fill="none"/>
      <path :d="pathEllipse2" stroke="blue" fill="none"/>
      <path :d="pathEllipse3" stroke="blue" fill="none"/>
      <circle :cx="endArcX" :cy="endArcY" r="4" fill="red"/>
      <circle :cx="startArcX" :cy="startArcY" r="4" fill="red"/>
    </svg>
  </div>
</template>

<script>
export default {
  name: 'SkirtCircles',
  props: {
    startArcX: {
      type: Number,
      default: 110,
    },
    startArcY: {
      type: Number,
      default: 215,
    },
    rx: { // elypsen radius
      type: Number,
      default: 50,
    },
    ry: { // elypsen radius
      type: Number,
      default: 60,
    },
    xAxisRotation: {
      type: Number,
      default: 0,
    },
    largeArcFlag: { // langen weg, oder kurzen?
      type: Number,
      default: 0,
    },
    sweepFlag: { // welche elypse?
      type: Number,
      default: 1,
    },
    endArcX: {
      type: Number,
      default: 150.71,
    },
    endArcY: {
      type: Number,
      default: 170.29,
    },
  },
  computed: {
    pathArc() {
      return `M 10 315
           L ${this.startArcX} ${this.startArcY}
           A ${this.rx} ${this.ry} ${this.xAxisRotation} ${this.largeArcFlag} ${this.sweepFlag} ${this.endArcX} ${this.endArcY}
           L 315 10`;
    },
    pathEllipse1() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation} ${1} ${0} ${this.endArcX} ${this.endArcY}`;
    },
    pathEllipse2() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation} ${1} ${1} ${this.endArcX} ${this.endArcY}`;
    },
    pathEllipse3() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation} ${0} ${0} ${this.endArcX} ${this.endArcY}`;
    },
  },
};
</script>
