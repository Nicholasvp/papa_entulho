enum Status {
  disponivel,
  alugado,
  atrasado,
  vencendo,
}

Map<String, Status> statusMap = {
  'disponivel': Status.disponivel,
  'alugado': Status.alugado,
  'atrasado': Status.atrasado,
  'vencendo': Status.vencendo,
};
