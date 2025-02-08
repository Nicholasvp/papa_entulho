enum Status {
  disponivel,
  alugado,
  atrasado,
  hoje,
}

Map<String, Status> statusMap = {
  'disponivel': Status.disponivel,
  'alugado': Status.alugado,
  'atrasado': Status.atrasado,
  'hoje': Status.hoje,
};
