<template>
  <div>
    <v-row justify="center">
      <svg xmlns="http://www.w3.org/2000/svg" :width="600" :height="320">
        <path :d="pathArc" stroke="black" fill="none" stroke-width="2" fill-opacity="0.5"/>
        <path :d="pathEllipse1" stroke="#6dcdd6" fill="none"/>
        <path :d="pathEllipse2" stroke="#6dcdd6" fill="none"/>
        <path :d="pathEllipse3" stroke="#6dcdd6" fill="none"/>
        <circle :cx="startArcX" :cy="startArcY" r="4" fill="red"/>
        <circle :cx="endArcX" :cy="endArcY" r="4" fill="blue"/>
      </svg>
    </v-row>
    <v-row>
      <v-col>
        <v-slider
          v-model="startArcX"
          :label="'start x'"
          thumb-label="always"
          :max="width"
          min="0"
          color="red"
        ></v-slider>
        <v-slider
          v-model="startArcY"
          :label="'start y'"
          thumb-label="always"
          :max="height"
          min="0"
          color="red"
        ></v-slider>
      </v-col>
      <v-col>
        <v-slider
          v-model="endArcX"
          :label="'end x'"
          thumb-label="always"
          :max="width"
          min="0"
          color="blue"
        ></v-slider>
        <v-slider
          v-model="endArcY"
          :label="'end y'"
          thumb-label="always"
          :max="height"
          min="0"
          color="blue"
        ></v-slider>
      </v-col>
    </v-row>

    <v-row>
      <v-col>
        <v-slider
          v-model="rx"
          :label="'Ellipse Radius X'"
          thumb-label="always"
          :max="height"
          min="0"
          color="blue"
        ></v-slider>
        <v-slider
          v-model="ry"
          :label="'Ellipse Radius Y'"
          thumb-label="always"
          :max="height"
          min="0"
          color="blue"
        ></v-slider>
        <v-slider
          v-model="xAxisRotation"
          :label="'Ellipse rotation'"
          thumb-label="always"
          :max="180"
          min="0"
          color="blue"
        ></v-slider>
      </v-col>
      <v-col>
        <v-row>
          <v-col>
            <v-switch
              v-model="largeArc"
              label="Large Arc?"
            ></v-switch>
          </v-col>
          <v-col>
            <v-switch
              v-model="sweep"
              label="Which ellipse?"
            ></v-switch>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </div>
</template>

<script>
export default {
  name: 'EllipsePlayground',
  data() {
    return {
      width: 600,
      height: 320,
      startArcX: 110,
      startArcY: 215,
      rx: 50,
      ry: 60,
      xAxisRotation: 0,
      largeArc: false,
      sweep: true,
      endArcX: 150.71,
      endArcY: 170.29,
    };
  },
  computed: {
    pathArc() {
      return `M 10 315
           L ${this.startArcX} ${this.startArcY}
           A ${this.rx} ${this.ry} ${this.xAxisRotation}
           ${this.largeArc ? 1 : 0} ${this.sweep ? 1 : 0}
           ${this.endArcX} ${this.endArcY}
           L 315 10`;
    },
    pathEllipse1() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation}
          ${this.largeArc ? 1 : 0} ${this.sweep ? 0 : 1} ${this.endArcX} ${this.endArcY}`;
    },
    pathEllipse2() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation}
          ${this.largeArc ? 0 : 1} ${this.sweep ? 1 : 0} ${this.endArcX} ${this.endArcY}`;
    },
    pathEllipse3() {
      return `M ${this.startArcX} ${this.startArcY}
          A ${this.rx} ${this.ry} ${this.xAxisRotation}
          ${this.largeArc ? 0 : 1} ${this.sweep ? 0 : 1} ${this.endArcX} ${this.endArcY}`;
    },
  },
};
</script>

<style scoped>
svg {
  border: 1px solid grey;
}
</style>
