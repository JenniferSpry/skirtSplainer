<template>
  <div class="hello">
    <p>{{ 'hello' }}</p>
    <skirt-circles :ax="parseInt(ax)"></skirt-circles>
    <label>Ax</label>
    <input type="number" v-model="ax">
  </div>
</template>

<script>
import SkirtCircles from './SkirtCircles.vue';

export default {
  name: 'HomePage',
  components: { SkirtCircles },
  data() {
    return {
      ax: 100,
    };
  },
};
</script>
