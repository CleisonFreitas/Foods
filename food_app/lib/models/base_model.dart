abstract class BaseModel {
  Map<String, dynamic> getJsonRelation(String chave, dynamic valor) {
    return valor != null ? {chave: valor} : {};
  }
}