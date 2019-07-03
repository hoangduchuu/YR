class BaseMapper<MODDEL, ENTITY> {
  MODDEL mapFrom(ENTITY entity) {}

  ENTITY mapTo(MODDEL model) {}
}
