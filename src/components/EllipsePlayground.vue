<template>
  <v-container>
    <v-row justify="center">
      <v-col>
        <v-card>
          <v-card-title>Path - Elliptical Arc Curve</v-card-title>
          <v-card-text>
            <blockquote class="blockquote">
              Elliptical arc curves are curves defined as a portion of an ellipse.
              It is sometimes easier to draw highly regular curves with an elliptical
              arc than with a Bézier curve.
            </blockquote>
            <p>
              <a href="https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#elliptical_arc_curve">https://developer.mozilla.org/en-US/docs/Web/SVG/Attribute/d#elliptical_arc_curve</a>
            </p>
          </v-card-text>
        </v-card>
      </v-col>
    </v-row>
    <v-row justify="center">
      <v-card>
        <svg xmlns="http://www.w3.org/2000/svg" :width="600" :height="320">
          <path :d="pathArc" stroke="rgba(0,0,0,.6)" fill="none" stroke-width="2"/>
          <path :d="pathEllipse1" stroke="#6dcdd6" fill="none"/>
          <path :d="pathEllipse2" stroke="#6dcdd6" fill="none"/>
          <path :d="pathEllipse3" stroke="#6dcdd6" fill="none"/>
          <circle :cx="startArcX" :cy="startArcY" r="4" fill="red"/>
          <circle :cx="endArcX" :cy="endArcY" r="4" fill="blue"/>
        </svg>
      </v-card>
    </v-row>
    <v-row justify="center">
      <v-card :class="'explanation'">
        <v-card-text>
            <div v-for="(part, index) in arcDescription" :key="index">
              <p class="explanation-description">{{ part.description }}</p>
              <p class="large-text">
                <span v-for="(item, index) in part.textParts"
                      :key="index"
                      v-bind:style="{ color: item.color }">
                  {{ item.text }}&nbsp;
                </span>
              </p>
            </div>
        </v-card-text>
      </v-card>
    </v-row>
    <v-row>
      <v-col>
        <v-slider
          v-model="startArcX"
          :label="'start x'"
          thumb-label="always"
          :max="width"
          min="0"
          :color="startArcXColor"
        ></v-slider>
        <v-slider
          v-model="startArcY"
          :label="'start y'"
          thumb-label="always"
          :max="height"
          min="0"
          :color="startArcYColor"
        ></v-slider>
      </v-col>
      <v-col>
        <v-slider
          v-model="endArcX"
          :label="'end x'"
          thumb-label="always"
          :max="width"
          min="0"
          :color="endArcXColor"
        ></v-slider>
        <v-slider
          v-model="endArcY"
          :label="'end y'"
          thumb-label="always"
          :max="height"
          min="0"
          :color="endArcYColor"
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
          :color="rxColor"
        ></v-slider>
        <v-slider
          v-model="ry"
          :label="'Ellipse Radius Y'"
          thumb-label="always"
          :max="height"
          min="0"
          :color="ryColor"
        ></v-slider>
        <v-slider
          v-model="xAxisRotation"
          :label="'Ellipse rotation'"
          thumb-label="always"
          :max="180"
          min="0"
          :color="xAxisRotationColor"
        ></v-slider>
      </v-col>
      <v-col>
        <v-row>
          <v-col>
            <v-switch
              v-model="largeArc"
              label="Large Arc?"
              :color="largeArcColor"
            ></v-switch>
          </v-col>
          <v-col>
            <v-switch
              v-model="sweep"
              label="Which ellipse?"
              :color="sweepColor"
            ></v-switch>
          </v-col>
        </v-row>
      </v-col>
    </v-row>
  </v-container>
</template>

<script>
export default {
  name: 'EllipsePlayground',
  data() {
    return {
      width: 600,
      height: 320,
      startArcX: 260,
      startArcXColor: '#fc3d03',
      startArcY: 180,
      startArcYColor: '#fc9403',
      rx: 50,
      rxColor: '#58cf19',
      ry: 60,
      ryColor: '#96ed68',
      xAxisRotation: 20,
      xAxisRotationColor: '#609c40',
      largeArc: false,
      largeArcColor: '#a330b0',
      sweep: true,
      sweepColor: '#6c30b0',
      endArcX: 340,
      endArcXColor: '#038cfc',
      endArcY: 140,
      endArcYColor: '#031cfc',
    };
  },
  computed: {
    pathArc() {
      return `M 20 ${this.height - 20}
           L ${this.startArcX} ${this.startArcY}
           A ${this.rx} ${this.ry} ${this.xAxisRotation}
           ${this.largeArc ? 1 : 0} ${this.sweep ? 1 : 0}
           ${this.endArcX} ${this.endArcY}
           L ${this.width - 20} 20`;
    },
    arcDescription() {
      return [
        {
          description: 'Move to x y',
          textParts: [
            { text: 'M' },
            { text: '20' },
            { text: `${this.height - 20}` },
          ],
        },
        {
          description: 'Line to x y',
          textParts: [
            { text: 'L' },
            { text: this.startArcX, color: this.startArcXColor },
            { text: this.startArcY, color: this.startArcYColor },
          ],
        },
        {
          description: 'Arc radius-x radius-y x-axis-rotation large-arc-flag sweep-flag x y',
          textParts: [
            { text: 'A' },
            { text: this.rx, color: this.rxColor },
            { text: this.ry, color: this.ryColor },
            { text: this.xAxisRotation, color: this.xAxisRotationColor },
            { text: `${this.largeArc ? 1 : 0}`, color: this.largeArcColor },
            { text: `${this.sweep ? 1 : 0}`, color: this.sweepColor },
            { text: this.endArcX, color: this.endArcXColor },
            { text: this.endArcY, color: this.endArcYColor },
          ],
        },
        {
          description: 'Line to x y',
          textParts: [
            { text: 'L' },
            { text: this.width - 20 },
            { text: '20' },
          ],
        },
      ];
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

<style lang="scss" scoped>
.explanation {
  min-width: 600px;
  margin: 20px 0 60px 0;

  p:last-child {
    margin-bottom: 0;
  }
  .v-card__text {
    padding-top: 0;
  }
}
.explanation-description {
  margin-top: 15px;
  margin-bottom: 5px;
}
.large-text {
  font-size: 2.5em;
  line-height: 1em;
}
</style>
