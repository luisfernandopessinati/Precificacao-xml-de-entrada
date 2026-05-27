unit UntPecificacao;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, Vcl.ExtCtrls;

type
  TfrmPressificacao = class(TForm)
    Panel1: TPanel;
    Panel2: TPanel;
    edtCaminho: TEdit;
    Button1: TButton;
    OpenDialog1: TOpenDialog;
    Button2: TButton;
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmPressificacao: TfrmPressificacao;

implementation

{$R *.dfm}

procedure TfrmPressificacao.Button2Click(Sender: TObject);
begin
  if OpenDialog1.Execute then
  begin
    // O caminho do arquivo selecionado fica na propriedade FileName
    ShowMessage('Arquivo selecionado: ' + OpenDialog1.FileName);
  end;
end;

end.
