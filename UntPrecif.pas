unit UntPrecif;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, FireDAC.Stan.Intf, FireDAC.Stan.Option,
  FireDAC.Stan.Param, FireDAC.Stan.Error, FireDAC.DatS, FireDAC.Phys.Intf,
  FireDAC.DApt.Intf, Data.DB, Vcl.Grids, Vcl.DBGrids, FireDAC.Comp.DataSet,
  FireDAC.Comp.Client, Vcl.ExtCtrls, Vcl.StdCtrls, Math, ComObj,
  Xml.XMLDoc, Xml.XMLIntf, System.ImageList, Vcl.ImgList;
type
  TFrmPrecif = class(TForm)
    Panel1: TPanel;
    T_Itens: TFDMemTable;
    D_Itens: TDataSource;
    DBGrid1: TDBGrid;
    Tnota: TLabel;
    lFornec: TLabel;
    lBruto: TLabel;
    lLiqui: TLabel;
    OpenDialog1: TOpenDialog;
    edtNota: TEdit;
    edtNome: TEdit;
    edtEmis: TEdit;
    edtVal: TEdit;
    edtNat: TEdit;
    Label2: TLabel;
    Label3: TLabel;
    edtCnpj: TEdit;
    ImageList1: TImageList;
    Button1: TButton;
    Panel2: TPanel;
    Label1: TLabel;
    Label4: TLabel;
    Label5: TLabel;
    Label6: TLabel;
    Label7: TLabel;
    edtFrete: TEdit;
    edtVCusto: TEdit;
    edtPerCFix: TEdit;
    edtPerCVar: TEdit;
    edtMarkup: TEdit;
    CheckBox1: TCheckBox;
    Button2: TButton;
    edtFreteNf: TEdit;
    Label8: TLabel;
    Label9: TLabel;
    edtProd: TEdit;
    Button3: TButton;
    edtICMS: TEdit;
    Label10: TLabel;
    Label11: TLabel;
    Label12: TLabel;
    edtPis: TEdit;
    edtCofins: TEdit;
    CheckBox2: TCheckBox;
    procedure limpar;
    procedure CriarCampos;
    procedure Button1Click(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure Button2Click(Sender: TObject);
    procedure DBGrid1DrawColumnCell(Sender: TObject; const Rect: TRect;
      DataCol: Integer; Column: TColumn; State: TGridDrawState);
    procedure Button3Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrecif: TFrmPrecif;

implementation

{$R *.dfm}

procedure TFrmPrecif.limpar;
begin
  edtNota.enabled := false;
  edtNome.enabled := false;
  edtval.enabled  := false;
  edtEmis.enabled := false;
  edtNat.enabled := false;
  edtCnpj.enabled := false;
  edtFreteNf.enabled  := false;
  edtProd.enabled := false;

  edtNota.text := '';
  edtNome.text := '';
  edtval.text  := '';
  edtEmis.text := '';
  edtNat.text := '';
  edtCnpj.text := '';
  edtFreteNf.text := '';
  edtProd.text := '';
end;

procedure TFrmPrecif.CriarCampos;
begin

  T_Itens.FieldDefs.Clear;
  //dados do xml
  T_Itens.FieldDefs.Add('codigo', ftString, 20);
  T_Itens.FieldDefs.Add('descricao', ftString, 60);
  T_Itens.FieldDefs.Add('unMed', ftString, 10);
  T_Itens.FieldDefs.Add('NCM', ftString, 20);
  T_Itens.FieldDefs.Add('unitario', ftFloat);
  T_Itens.FieldDefs.Add('qtdade', ftFloat);
  T_Itens.FieldDefs.Add('Conversor', ftString);
  T_Itens.FieldDefs.Add('totbruto', ftFloat);
  T_Itens.FieldDefs.Add('descontos', ftFloat);
  T_Itens.FieldDefs.Add('ICMS', ftFloat);
  T_Itens.FieldDefs.Add('ipi', ftFloat);
  T_Itens.FieldDefs.Add('ST', ftFloat);
  T_Itens.FieldDefs.Add('PIS', ftFloat);
  T_Itens.FieldDefs.Add('COFINS', ftFloat);
  T_Itens.FieldDefs.Add('DIFICMS', ftFloat);
  T_Itens.FieldDefs.Add('IBS', ftFloat);
  T_Itens.FieldDefs.Add('CBS', ftFloat);
  T_Itens.FieldDefs.Add('TOTLIQ', ftFloat);

  //dados calculados
  T_Itens.FieldDefs.Add('IMPOSTOS', ftFloat);
  T_Itens.FieldDefs.Add('FRETE', ftFloat);
  T_Itens.FieldDefs.Add('DESPESAS', ftFloat);
  T_Itens.FieldDefs.Add('CUSFIX', ftFloat);
  T_Itens.FieldDefs.Add('CUSVAR', ftFloat);
  T_Itens.FieldDefs.Add('LUCRO', ftFloat);
  T_Itens.FieldDefs.Add('TOTAL', ftFloat);
  T_Itens.FieldDefs.Add('PRECO', ftFloat);
  T_Itens.CreateDataSet;

  T_Itens.FieldByName('codigo').DisplayLabel := 'Código';
  T_Itens.FieldByName('descricao').DisplayLabel := 'Descrição';
  T_Itens.FieldByName('unMed').DisplayLabel := 'Unidade';
  T_Itens.FieldByName('NCM').DisplayLabel := 'NCM';

  T_Itens.FieldByName('unitario').DisplayLabel := 'Vlr Unit.';
  T_Itens.FieldByName('qtdade').DisplayLabel := 'Quantidade';

  T_Itens.FieldByName('totbruto').DisplayLabel := 'Total Bruto';
  T_Itens.FieldByName('descontos').DisplayLabel := 'Descontos';

  T_Itens.FieldByName('ICMS').DisplayLabel := 'ICMS';
  T_Itens.FieldByName('ipi').DisplayLabel := 'IPI';
  T_Itens.FieldByName('ST').DisplayLabel := 'ST';

  T_Itens.FieldByName('PIS').DisplayLabel := 'PIS';
  T_Itens.FieldByName('COFINS').DisplayLabel := 'COFINS';

  T_Itens.FieldByName('DIFICMS').DisplayLabel := 'Dif. ICMS';

  T_Itens.FieldByName('TOTLIQ').DisplayLabel := 'Total Líquido';

  T_Itens.FieldByName('IMPOSTOS').DisplayLabel := 'ICMS,PIS,COFINS';
  T_Itens.FieldByName('FRETE').DisplayLabel := 'Frete';
  T_Itens.FieldByName('DESPESAS').DisplayLabel := 'Despesas';
  T_Itens.FieldByName('CUSFIX').DisplayLabel := 'Custo Fixo';
  T_Itens.FieldByName('CUSVAR').DisplayLabel := 'Custo Variável';
  T_Itens.FieldByName('LUCRO').DisplayLabel := 'Lucro';

  T_Itens.FieldByName('TOTAL').DisplayLabel := 'Total Geral';
  T_Itens.FieldByName('PRECO').DisplayLabel := 'Preço Final';
end;

procedure TFrmPrecif.DBGrid1DrawColumnCell(Sender: TObject;
  const Rect: TRect; DataCol: Integer; Column: TColumn;
  State: TGridDrawState);
begin
  // Cor padrão
  DBGrid1.Canvas.Brush.Color := clWhite;
  DBGrid1.Canvas.Font.Color := clBlack;

  // Campos calculados em vermelho quando preenchidos
  if (Column.FieldName = 'FRETE') or
     (Column.FieldName = 'DESPESAS') or
     (Column.FieldName = 'CUSVAR') or
     (Column.FieldName = 'CUSFIX') or
     (Column.FieldName = 'IMPOSTOS') or
     (Column.FieldName = 'LUCRO') then
  begin
    if Column.Field.AsFloat > 0 then
    begin
      DBGrid1.Canvas.Brush.Color := clRed;
      DBGrid1.Canvas.Font.Color := clWhite;
    end;
  end;

  if (Column.FieldName = 'PRECO') or
     (Column.FieldName = 'TOTAL') then
  begin
    if Column.Field.AsFloat > 0 then
    begin
      DBGrid1.Canvas.Brush.Color := clGreen;
      DBGrid1.Canvas.Font.Color := clWhite;
    end;
  end;

  if (Column.FieldName = 'unitario') or
      (Column.FieldName = 'QTDADE') or
      (Column.FieldName = 'totalbruto')  then
  begin
    DBGrid1.Canvas.Brush.Color := clYellow;
    DBGrid1.Canvas.Font.Color := clBlack;
  end;

  DBGrid1.DefaultDrawColumnCell(Rect, DataCol, Column, State);

end;

procedure TFrmPrecif.Button2Click(Sender: TObject);
var
  Tot, nPreco, nCusto, nLiquido, nImpostos : Double;
begin
  tot := StrToFloat(StringReplace(edtVal.Text, '.', ',', [rfReplaceAll]));

  T_Itens.first;
  while not T_Itens.Eof do
  begin
    nPreco    := 0;
    nLiquido  := 0;
    nImpostos := 0;
    ncusto    := 0;
    nLiquido :=  nLiquido + T_Itens.FieldByName('totbruto').asFloat + T_Itens.FieldByName('IPI').asFloat + T_Itens.FieldByName('ST').asFloat + T_Itens.FieldByName('DIFICMS').asFloat;

    T_Itens.edit;
    if edtFrete.Text <> '' then
    begin
        T_Itens.FieldByName('frete').asFloat := RoundTo((strToFloat(edtFrete.Text) * (nLiquido / tot)), -2);
        nCusto := nCusto + T_Itens.FieldByName('frete').asFloat;
    end
    else T_Itens.FieldByName('frete').asFloat := 0;

    if edtVCusto.Text <> '' then
    begin
        T_Itens.FieldByName('DESPESAS').asFloat := RoundTo((strToFloat(edtVCusto.Text) * (nLiquido / tot)), -2);
        nCusto := nCusto + T_Itens.FieldByName('DESPESAS').asFloat;
    end
    else T_Itens.FieldByName('DESPESAS').asFloat := 0;

    if edtPerCVar.Text <> '' then
    begin
        T_Itens.FieldByName('CUSVAR').asFloat := RoundTo(nLiquido * (strToFloat(edtPerCVar.Text) / 100), -2);
        nCusto := nCusto + T_Itens.FieldByName('CUSVAR').asFloat;
    end
    else T_Itens.FieldByName('CUSVAR').asFloat := 0;

    if edtPerCFix.Text <> '' then
    begin
        T_Itens.FieldByName('CUSFIX').asFloat := RoundTo(nLiquido * (strToFloat(edtPerCFix.Text) / 100), -2);
        nCusto := nCusto + T_Itens.FieldByName('CUSFIX').asFloat;
    end
    else T_Itens.FieldByName('CUSFIX').asFloat := 0;

    if edtIcms.Text <> '' then
        nImpostos := nImpostos + RoundTo(nLiquido * (strToFloat(edtIcms.Text) / 100), -2);
    if edtPis.Text <> '' then
        nImpostos := nImpostos + RoundTo(nLiquido * (strToFloat(edtPis.Text) / 100), -2);
    if edtCofins.Text <> '' then
        nImpostos := nImpostos + RoundTo(nLiquido * (strToFloat(edtCofins.Text) / 100), -2);
    T_Itens.FieldByName('IMPOSTOS').asFloat := nImpostos;

    if edtMarkup.Text <> '' then
    begin
      if CheckBox2.Checked then
        T_Itens.FieldByName('LUCRO').asFloat := RoundTo(((nLiquido + nCusto + nImpostos) / (1 - (StrToFloat(edtMarkup.Text) / 100))) - (nLiquido + nCusto + nImpostos),-2)
      else
        T_Itens.FieldByName('LUCRO').asFloat := RoundTo((nLiquido + nCusto + nImpostos) * (strToFloat(edtMarkup.Text) / 100), -2);
    end
    else T_Itens.FieldByName('LUCRO').asFloat := 0;

    T_Itens.post;

    npreco := ((T_Itens.FieldByName('LUCRO').asFloat + nCusto + nLiquido + nImpostos) / T_Itens.FieldByName('qtdade').asFloat);
    T_Itens.edit;
    T_Itens.FieldByName('TOTAL').asFloat := RoundTo((T_Itens.FieldByName('LUCRO').asFloat + nCusto + nLiquido + nImpostos),-2);
    T_Itens.FieldByName('preco').asFloat := RoundTo(npreco,-2);
    T_Itens.post;

    T_Itens.next;
  end;

end;

procedure ExportarCSV(DataSet: TDataSet; const FileName: string);
var
  SL: TStringList;
  i: Integer;
  Line: string;
begin
  SL := TStringList.Create;
  try
    // Cabeçalho
    Line := '';
    for i := 0 to DataSet.FieldCount - 1 do
      Line := Line + DataSet.Fields[i].DisplayLabel + ';';
    SL.Add(Line);

    // Dados
    DataSet.First;
    while not DataSet.Eof do
    begin
      Line := '';
      for i := 0 to DataSet.FieldCount - 1 do
        Line := Line + DataSet.Fields[i].AsString + ';';

      SL.Add(Line);
      DataSet.Next;
    end;

    SL.SaveToFile(FileName);
  finally
    SL.Free;
  end;
end;

procedure TFrmPrecif.Button3Click(Sender: TObject);
var
  SaveDlg: TSaveDialog;
begin
  SaveDlg := TSaveDialog.Create(nil);
  try
    SaveDlg.Filter := 'Arquivo CSV (*.csv)|*.csv';
    SaveDlg.DefaultExt := 'csv';
    SaveDlg.FileName := 'itens.csv';

    if SaveDlg.Execute then
      ExportarCSV(T_Itens, SaveDlg.FileName);
  finally
    SaveDlg.Free;
  end;
end;

procedure TFrmPrecif.Button1Click(Sender: TObject);
var
  XML: IXMLDocument;
  CabNode: IXMLNode;
  DetNode: IXMLNode;
  ProdNode: IXMLNode;
  i: Integer;
begin
  if OpenDialog1.Execute then
  begin
    if OpenDialog1.FileName = '' then
      exit;
  end
  else
    exit;

  XML := LoadXMLDocument(OpenDialog1.FileName);
  CabNode := XML.DocumentElement
                .ChildNodes['NFe']
                .ChildNodes['infNFe'];

  edtCnpj.Text := CabNode.ChildNodes['emit'].ChildNodes['CNPJ'].Text;
  edtNome.Text := CabNode.ChildNodes['emit'].ChildNodes['xFant'].Text;

  edtNat.text := CabNode.ChildNodes['ide'].ChildNodes['natOp'].Text;
  edtNota.text := CabNode.ChildNodes['ide'].ChildNodes['nNF'].Text
                    + ' / ' +
                    CabNode.ChildNodes['ide'].ChildNodes['serie'].Text;

  edtEmis.text := Copy(CabNode.ChildNodes['ide'].ChildNodes['dhEmi'].Text,1,10);

  edtFreteNF.Text := CabNode.ChildNodes['total'].ChildNodes['ICMSTot'].ChildNodes['vFrete'].Text + CabNode.ChildNodes['total'].ChildNodes['ICMSTot'].ChildNodes['vOutros'].Text;

  edtVal.Text := CabNode.ChildNodes['total']
                           .ChildNodes['ICMSTot']
                           .ChildNodes['vNF'].Text;

  edtProd.Text := CabNode.ChildNodes['total']
                           .ChildNodes['ICMSTot']
                           .ChildNodes['vProd'].Text;

{  lLiqui.Caption := CabNode.ChildNodes['total']
                           .ChildNodes['ICMSTot']
                           .ChildNodes['vLiq'].Text;}

  T_Itens.EmptyDataSet;
  for i := 0 to XML.DocumentElement
                   .ChildNodes['NFe']
                   .ChildNodes['infNFe']
                   .ChildNodes.Count - 1 do
  begin
    DetNode := XML.DocumentElement
                  .ChildNodes['NFe']
                  .ChildNodes['infNFe']
                  .ChildNodes[i];

    if DetNode.NodeName = 'det' then
    begin

      ProdNode := DetNode.ChildNodes['prod'];

      T_Itens.Append;
      // PRODUTO
      T_Itens.FieldByName('codigo').AsString :=
        ProdNode.ChildNodes['cProd'].Text;

      T_Itens.FieldByName('descricao').AsString :=
        ProdNode.ChildNodes['xProd'].Text;

      T_Itens.FieldByName('unMed').AsString :=
        ProdNode.ChildNodes['uCom'].Text;

      T_Itens.FieldByName('NCM').AsString :=
        ProdNode.ChildNodes['NCM'].Text;

      T_Itens.FieldByName('unitario').AsFloat :=
        StrToFloatDef(
          StringReplace(
            ProdNode.ChildNodes['vUnCom'].Text,
            '.', ',', [rfReplaceAll]
          ), 0);

      T_Itens.FieldByName('qtdade').AsFloat :=
        StrToFloatDef(
          StringReplace(
            ProdNode.ChildNodes['qCom'].Text,
            '.', ',', [rfReplaceAll]
          ), 0);

      T_Itens.FieldByName('Conversor').AsString :=
        ProdNode.ChildNodes['uTrib'].Text;
      if CheckBox1.Checked then
        T_Itens.FieldByName('Conversor').Visible := T_Itens.FieldByName('Conversor').AsString <> '';

      T_Itens.FieldByName('totbruto').AsFloat :=
        StrToFloatDef(
          StringReplace(
            ProdNode.ChildNodes['vProd'].Text,
            '.', ',', [rfReplaceAll]
          ), 0);

      T_Itens.FieldByName('descontos').AsFloat :=
        StrToFloatDef(
          StringReplace(
            ProdNode.ChildNodes['vDesc'].Text,
            '.', ',', [rfReplaceAll]
          ), 0);
      if CheckBox1.Checked then
        T_Itens.FieldByName('descontos').Visible := T_Itens.FieldByName('descontos').AsFloat > 0;


      // IMPOSTOS

      // ICMS
      if DetNode.ChildNodes['imposto']
                .ChildNodes['ICMS']
                .ChildNodes.First <> nil then
      begin

        T_Itens.FieldByName('ICMS').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['ICMS']
                     .ChildNodes.First
                     .ChildNodes['vICMS'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);

      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('ICMS').Visible := T_Itens.FieldByName('ICMS').AsFloat > 0;


      // IPI
      if DetNode.ChildNodes['imposto']
                .ChildNodes.FindNode('IPI') <> nil then
      begin

        T_Itens.FieldByName('ipi').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['IPI']
                     .ChildNodes['IPITrib']
                     .ChildNodes['vIPI'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);

      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('ipi').Visible := T_Itens.FieldByName('ipi').AsFloat > 0;

      // ST
      if DetNode.ChildNodes['imposto']
                .ChildNodes['ICMS']
                .ChildNodes.First
                .ChildNodes.FindNode('vICMSST') <> nil then
      begin
        T_Itens.FieldByName('ST').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['ICMS']
                     .ChildNodes.First
                     .ChildNodes['vICMSST'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);

      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('ST').Visible := T_Itens.FieldByName('ST').AsFloat > 0;


      // PIS
      if DetNode.ChildNodes['imposto']
                .ChildNodes.FindNode('PIS') <> nil then
      begin

        T_Itens.FieldByName('PIS').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['PIS']
                     .ChildNodes.First
                     .ChildNodes['vPIS'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);

      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('PIS').Visible := T_Itens.FieldByName('PIS').AsFloat > 0;


      // COFINS
      if DetNode.ChildNodes['imposto']
                .ChildNodes.FindNode('COFINS') <> nil then
      begin

        T_Itens.FieldByName('COFINS').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['COFINS']
                     .ChildNodes.First
                     .ChildNodes['vCOFINS'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);

      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('COFINS').Visible := T_Itens.FieldByName('COFINS').AsFloat > 0;

      // DIF ICMS / DIFAL
      if DetNode.ChildNodes['imposto'].ChildNodes.FindNode('ICMSUFDest') <> nil then
      begin
        T_Itens.FieldByName('DIFICMS').AsFloat :=
          StrToFloatDef(
            StringReplace(
              DetNode.ChildNodes['imposto']
                     .ChildNodes['ICMSUFDest']
                     .ChildNodes['vICMSUFDest'].Text,
              '.', ',', [rfReplaceAll]
            ), 0);
      end
      else
      begin
        T_Itens.FieldByName('DIFICMS').AsFloat := 0;
      end;
      if CheckBox1.Checked then
        T_Itens.FieldByName('DIFICMS').Visible := T_Itens.FieldByName('DIFICMS').AsFloat > 0;

      // CAMPOS FUTUROS (Reforma Tributária)
      T_Itens.FieldByName('IBS').AsFloat := 0;
      T_Itens.FieldByName('CBS').AsFloat := 0;
      if CheckBox1.Checked then
      begin
        T_Itens.FieldByName('IBS').Visible := T_Itens.FieldByName('IBS').AsFloat > 0;
        T_Itens.FieldByName('CBS').Visible := T_Itens.FieldByName('CBS').AsFloat > 0;
      end;


      // TOTAL LÍQUIDO
      T_Itens.FieldByName('TOTLIQ').AsFloat :=
        T_Itens.FieldByName('totbruto').AsFloat -
        T_Itens.FieldByName('descontos').AsFloat;

      T_Itens.Post;
    end;
  end;

  ShowMessage('XML carregado com sucesso.');

end;

procedure TFrmPrecif.FormCreate(Sender: TObject);
begin
  limpar;
  criarcampos;
end;


end.
