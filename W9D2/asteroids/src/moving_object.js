import { CONSTANTS } from "./game";

export default class MovingObject {
  constructor({pos, vel, radius, color}) {
    this.pos = pos;
    this.vel = vel;
    this.radius = radius;
    this.color = color;
  }

  draw(ctx) {
    ctx.fillStyle = this.color;
    ctx.beginPath();

    ctx.arc(
      this.pos[0],
      this.pos[1],
      this.radius,
      0,
      2 * Math.PI,
      false
    )

    ctx.fill();
  }

  move() {
    this.pos[0] += this.vel[0];
    this.pos[1] += this.vel[1];

    this.pos[0] += CONSTANTS.DIM_X;
    this.pos[0] %= CONSTANTS.DIM_X;

    this.pos[1] += CONSTANTS.DIM_Y;
    this.pos[1] %= CONSTANTS.DIM_Y;
  }

  collidesWith(otherObject) {
  }
}