program Precificacao;

uses
  Vcl.Forms,
  UntPrecif in 'UntPrecif.pas' {FrmPrecif};

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TFrmPrecif, FrmPrecif);
  Application.Run;
end.
