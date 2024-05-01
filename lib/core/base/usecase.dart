abstract class BaseUsecase<Ret, In> {
  Ret call(In inputs);
}
