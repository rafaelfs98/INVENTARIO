unit InventarioMobile;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.StdCtrls,
  FMX.Layouts, FMX.Edit, FMX.Controls.Presentation, FMX.Objects, FMX.TabControl,
  System.Actions, FMX.ActnList, FMX.StdActns, FMX.MediaLibrary.Actions,
  DataPak.Android.BarcodeScanner, System.ImageList, FMX.ImgList, FMX.Effects,
  Data.DB, Datasnap.DBClient, IdBaseComponent, IdComponent, IdTCPConnection,
  IdTCPClient, IdHTTP, FMX.ScrollBox, FMX.Memo, FireDAC.Stan.Intf,
  FireDAC.Stan.Option, FireDAC.Stan.Error, FireDAC.UI.Intf, FireDAC.Phys.Intf,
  FireDAC.Stan.Def, FireDAC.Stan.Pool, FireDAC.Stan.Async, FireDAC.Phys,
  FireDAC.Phys.SQLite, FireDAC.Phys.SQLiteDef, FireDAC.Stan.ExprFuncs,
  FireDAC.FMXUI.Wait, FireDAC.Stan.Param, FireDAC.DatS, FireDAC.DApt.Intf,
  FireDAC.DApt, FireDAC.Comp.DataSet, FireDAC.Comp.Client,System.IOUtils,
  FMX.ListView.Types, FMX.ListView.Appearances, FMX.ListView.Adapters.Base,
  Loading, uFormat, uFancyDialog,System.Permissions,u99Permissions,UnitCamera,

  {$IFDEF  MSWINDOWS}
  MidasLib,
  {$ENDIF}



      {$IFDEF ANDROID}
    Androidapi.Jni.JavaTypes,
    Androidapi.Jni.GraphicsContentViewText,
    FMX.Helpers.Android,
    Androidapi.NativeActivity,
    Androidapi.Helpers,
    Androidapi.JNIBridge,
    Androidapi.JNI.Net,
    FMX.Platform.Android,
    FMX.MobilePreview,
    AndroidAPI.jni.OS,
    AndroidApi.Jni.App,
    idUri,
   {$ENDIF}


    FMX.ListView,FMX.Ani, FireDAC.Phys.SQLiteWrapper.Stat;






type
  TForm1 = class(TForm)
    tabComntrol1: TTabControl;
    tbInicial: TTabItem;
    tbContagem: TTabItem;
    tbConfiguração: TTabItem;
    Rectangle1: TRectangle;
    Rectangle2: TRectangle;
    Rectangle3: TRectangle;
    ToolBar1: TToolBar;
    SpeedButton1: TSpeedButton;
    Label1: TLabel;
    Label2: TLabel;
    Edit1: TEdit;
    Label3: TLabel;
    Edit2: TEdit;
    Layout1: TLayout;
    StyleBook1: TStyleBook;
    ActionList1: TActionList;
    Layout2: TLayout;
    Rectangle4: TRectangle;
    S: TImage;
    ImageList1: TImageList;
    lbDescricao: TLabel;
    tbLogin: TTabItem;
    Rectangle5: TRectangle;
    ToolBar7: TToolBar;
    SpeedButton8: TSpeedButton;
    Rectangle6: TRectangle;
    Image6: TImage;
    edtSenha: TEdit;
    edtLogin: TEdit;
    Button1: TButton;
    ShadowEffect3: TShadowEffect;
    Label8: TLabel;
    IdHTTP1: TIdHTTP;
    Rectangle7: TRectangle;
    ToolBar4: TToolBar;
    Label5: TLabel;
    SpeedButton3: TSpeedButton;
    Layout5: TLayout;
    Label14: TLabel;
    edtLoja: TEdit;
    Label16: TLabel;
    edtServProduto: TEdit;
    btnGravaConfig: TButton;
    FDCon: TFDConnection;
    FDPhysSQLiteDriverLink1: TFDPhysSQLiteDriverLink;
    FDqCarga: TFDQuery;
    ToolBar2: TToolBar;
    SpeedButton2: TSpeedButton;
    Label6: TLabel;
    chbSalvaFone: TCheckBox;
    tbExportar: TTabItem;
    Rectangle8: TRectangle;
    ToolBar3: TToolBar;
    Label9: TLabel;
    Layout4: TLayout;
    Button4: TButton;
    lvProdutos: TListView;
    SpeedButton5: TSpeedButton;
    FDqCarga2: TFDQuery;
    SpeedButton4: TSpeedButton;
    ImageList2: TImageList;
    abreContagem: TChangeTabAction;
    abreConfig: TChangeTabAction;
    abreExporta: TChangeTabAction;
    voltaMenu: TChangeTabAction;
    Layout6: TLayout;
    Image2: TImage;
    Image3: TImage;
    Image7: TImage;
    Image8: TImage;
    Rectangle9: TRectangle;
    AniIndicator1: TAniIndicator;
    cdsInventario: TClientDataSet;
    cdsInventariocod: TStringField;
    cdsInventarioqtd: TFloatField;
    Button2: TButton;
    edtEmail: TEdit;
    Label10: TLabel;
    rctAndamento: TRectangle;
    lbContagem: TLabel;
    ShadowEffect1: TShadowEffect;
    Layout7: TLayout;
    Layout3: TLayout;
    Image5: TImage;
    Label4: TLabel;
    Label7: TLabel;
    Image1: TImage;
    SpeedButton6: TSpeedButton;
    Layout8: TLayout;
    Rectangle10: TRectangle;
    Rectangle11: TRectangle;
    Label11: TLabel;
    lvMotivo: TListView;
    Layout9: TLayout;
    rctCancelar: TRectangle;
    Label12: TLabel;
    Label13: TLabel;
    Image9: TImage;
    Rectangle12: TRectangle;
    Label15: TLabel;
    Rectangle13: TRectangle;
    Label17: TLabel;
    Image10: TImage;
    Rectangle14: TRectangle;
    Label18: TLabel;
    Image11: TImage;
    Rectangle15: TRectangle;
    Label19: TLabel;
    Image12: TImage;
    Rectangle16: TRectangle;
    Label20: TLabel;
    Image13: TImage;
    Rectangle17: TRectangle;
    Label21: TLabel;
    Image14: TImage;
    Rectangle18: TRectangle;
    Label22: TLabel;
    Image15: TImage;
    Rectangle19: TRectangle;
    Rectangle20: TRectangle;
    Rectangle21: TRectangle;
    Rectangle22: TRectangle;
    lbPreco: TLabel;
    procedure FormShow(Sender: TObject);
    procedure BarcodeScanner1ScanResult(Sender: TObject; AResult: string);
    function appBarcondeScann():Boolean;
    procedure Button1Click(Sender: TObject);
    procedure atualizaProduto();
    procedure Image5Click(Sender: TObject);
    procedure SpeedButton8Click(Sender: TObject);
    procedure SpeedButton1Click(Sender: TObject);
    procedure conexao();
    procedure btnGravaConfigClick(Sender: TObject);
    procedure SpeedButton3Click(Sender: TObject);
    procedure Image1Click(Sender: TObject);
    procedure SpeedButton2Click(Sender: TObject);
    procedure CarregaConfig();
    procedure Edit2Exit(Sender: TObject);
    procedure FormCloseQuery(Sender: TObject; var CanClose: Boolean);
    procedure FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
    procedure edtServProdutoClick(Sender: TObject);
    Function exportar(codigo:string;descricao:string;qtd:Real;tipo:String):string;
    procedure lancaAvaria(codigo:string;qtd:String);
    function flancaAvaria(codigo:string;qtd:String):string;
    procedure SpeedButton4Click(Sender: TObject);
    procedure Button4Click(Sender: TObject);
    procedure Image2Click(Sender: TObject);
    procedure Image3Click(Sender: TObject);
    procedure Image7Click(Sender: TObject);
    procedure Image8Click(Sender: TObject);
    procedure ExportaProdutos();
    procedure mandaEmail();
    procedure Button2Click(Sender: TObject);
    procedure SpeedButton6Click(Sender: TObject);
    procedure restornaMotivo(loja:integer);
    procedure addListaMotivos(cod, descricao: String);
    procedure rctCancelarClick(Sender: TObject);
    procedure lvMotivoItemClick(const Sender: TObject;
      const AItem: TListViewItem);
    procedure Image9Click(Sender: TObject);
    procedure Rectangle12Click(Sender: TObject);
    procedure Rectangle13Click(Sender: TObject);
    procedure Rectangle14Click(Sender: TObject);
    procedure Rectangle16Click(Sender: TObject);
    procedure Rectangle15Click(Sender: TObject);
    procedure Rectangle17Click(Sender: TObject);
    procedure Rectangle18Click(Sender: TObject);
    procedure lancaRequiDev(codigo, qtd,tipo: String);
    procedure Edit1Typing(Sender: TObject);
    procedure FDConAfterConnect(Sender: TObject);
    procedure atualizaColaborador();
     procedure ClickFechar(Sender: TObject);
   //{$IFDEF MSWINDOWS}
    procedure ClickItem(Sender: TObject);
    procedure FormCreate(Sender: TObject);
    procedure FormDestroy(Sender: TObject);
    procedure Edit2KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
      Shift: TShiftState);
  // { {$ELSE}
  //  procedure ClickItem(Sender: TObject; const Point: TPointF);}
//    {$ENDIF}}


  private

    { Private declarations }
  public
    { Public declarations }
    sTipo:string;
    sEndereco:string;
    sEmail:string;
    sLoja:string;
    salva:Integer;
    lendo:Integer;
    memo:TMemo;
    diag:TFancyDialog;
    cdsProduto,cdsmotivo:TClientDataSet;
    codMotivo:string;
    cdsGuiatemp,cdscolabtemp,cdsGrupotemp,cdsProdTemp:TClientDataSet;
    permissao : T99Permissions;
    //fScanManager: TScanManager;
   // BloqueioTela:TJPowerManager_WakeLock;
  end;

var
  Form1: TForm1;

implementation




{$R *.fmx}


function TForm1.appBarcondeScann: Boolean;
 { var
  Intent:JIntent;
  Info: JApplicationInfo;}
begin
   {try

     Result := False;

     Info := SharedActivityContext.getPackageManager.getApplicationInfo(
       StringToJString('com.google,zxing.client.android'),0);

       if Info.packageName.equals(StringToJString('com.google.zxing.client.android')) then
         begin
           Result := True;
         end;

   except on E: Exception do
     begin

       try

         Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_VIEW);
         Intent.setData(TJnet_Uri.JavaClass.parse(StringToJString(
           'https://play.google.com/store/apps/details?id=com.google.zxing.client.android')));
         Intent.setPackage(StringToJString('com.android.vending'));
         SharedActivity.startActivity(Intent);
         SharedActivity.finishActivity(0);
       except
         ShowMessage('Erro ao abrir Google Play');
       end;
     end;

   end;   }


end;

procedure TForm1.atualizaColaborador;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
   +'<soapenv:Header/>'
   +'<soapenv:Body>'
   +'<urn:expCadColaborador soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
   +'<loja xsi:type="xsd:int">?1?</loja>'
   +'</urn:expCadColaborador>'
   +'</soapenv:Body>'
   +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    LItem : TListViewItem;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;

begin
  try
    try

      Retorno := TStringStream.Create(EmptyStr);
      sListaPedido:= sListaProduto;
      sListaPedido:= StringReplace(sListaPedido,'?1?',sLoja,[rfReplaceAll]);
      Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

      IdHTTP1.Request.ContentType := 'text/xml';
      IdHTTP1.Request.Charset := 'utf-8';
      IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#expCadColaborador';
      IdHTTP1.ProtocolVersion := pv1_1;
      IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
        //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ICliente',Solicit, Retorno);
        IdHTTP1.Post('http://'+sendereco+'/soap/ISRI',Solicit, Retorno);
      except
        exit;
      end;

      sRetorno:= Retorno.DataString;



      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);


      iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
      iPosFinal   := Pos('</xml>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);



      Retorno := TStringStream.Create(sRetorno);

      cdscolabtemp:= TClientDataSet.Create(nil);
      cdscolabtemp.FieldDefs.Add('COD_COLABORADOR',ftInteger);
      cdscolabtemp.FieldDefs.Add('NOME',ftString,30);
      cdscolabtemp.FieldDefs.Add('FUNCAO',ftInteger);
      cdscolabtemp.FieldDefs.Add('COMISSAO',ftBoolean);
      cdscolabtemp.FieldDefs.Add('ACESSO',ftString,300);
      cdscolabtemp.FieldDefs.Add('LOGIN',ftString,30);
      cdscolabtemp.FieldDefs.Add('SENHA',ftString,10);

      cdscolabtemp.CreateDataSet;
      cdscolabtemp.Open;
      cdscolabtemp.LogChanges:= False;

      cdscolabtemp.LoadFromStream(Retorno);


      with FDqCarga do
       begin
         Close;
         sql.Clear;
         sql.Add('DELETE FROM COLABORADOR WHERE COD_COLABORADOR <> 0');
         ExecSQL;
       end;


      cdscolabtemp.First;
      while not cdscolabtemp.eof do
        begin
          with FDqCarga do
           begin
             Close;
             sql.Clear;
             sql.Add('INSERT INTO COLABORADOR VALUES');
             sql.Add('(:ID,:NOME,:SENHA)');
             ParamByName('ID').AsInteger := cdscolabtemp.FieldByName('COD_COLABORADOR').AsInteger;
             ParamByName('NOME').AsString := cdscolabtemp.FieldByName('NOME').AsString;
             ParamByName('SENHA').AsString := cdscolabtemp.FieldByName('SENHA').AsString;
             ExecSQL;

           end;
           cdscolabtemp.Next;
        end;

       // ShowMessage('USUÁRIOS ATUALIZADOS');

    except
      //ShowMessage('Falha no processo de importação');
    end;
  finally
    if(Assigned(Retorno))then
      Retorno.DisposeOf;

    if(Assigned(Solicit))then
      Solicit.DisposeOf;
  end;

end;

procedure TForm1.atualizaProduto;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                          +'<soapenv:Header/>'
                          +'<soapenv:Body>'
                          +'<urn:expCadProdReduzido soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                          +'<loja xsi:type="xsd:int">?1?</loja>'
                          +'</urn:expCadProdReduzido>'
                          +'</soapenv:Body>'
                          +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    icont:Integer;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?1?',sLoja,[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#expCadProdReduzido';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
//      IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
    except
      ShowMessage('falha na conexao ');
      exit;
    end;

    sRetorno:= Retorno.DataString;

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

    iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
    iPosFinal   := Pos('</xml>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);


    Retorno := TStringStream.Create(sRetorno);

    with FDqCarga do
     begin
       close;
       SQL.Clear;
       SQL.Add('DELETE FROM PRODUTO');
       ExecSQL;
     end;

    cdsProduto:= TClientDataSet.Create(nil);
    cdsProduto.FieldDefs.Add('COD_PRODUTO',ftString,14);
    cdsProduto.FieldDefs.Add('DESCRICAO',ftString,60);
    cdsProduto.FieldDefs.Add('UNIDADE',ftString,2);
    cdsProduto.FieldDefs.Add('COD_NCM',ftString,8);
    cdsProduto.FieldDefs.Add('CEST',ftString,7);
    cdsProduto.FieldDefs.Add('ST',ftString,4);
    cdsProduto.FieldDefs.Add('ALIQUOTA',ftString,2);
    cdsProduto.FieldDefs.Add('ICMS_IN',ftCurrency);
    cdsProduto.FieldDefs.Add('CFOP_IN',ftString,4);
    cdsProduto.FieldDefs.Add('CSTPC',ftInteger);
    cdsProduto.FieldDefs.Add('ALI_PIS_DEBITO',ftCurrency);
    cdsProduto.FieldDefs.Add('ALI_COFINS_DEBITO',ftCurrency);
    cdsProduto.FieldDefs.Add('COMPRA',ftCurrency);
    cdsProduto.FieldDefs.Add('VENDA',ftCurrency);
    cdsProduto.FieldDefs.Add('ESTOQUE',ftCurrency);
    cdsProduto.FieldDefs.Add('COD_GRUPO',ftInteger);
    cdsProduto.FieldDefs.Add('COD_SUBGRUPO',ftInteger);
    cdsProduto.CreateDataSet;
    cdsProduto.Open;
    cdsProduto.LogChanges:= False;
    cdsProduto.LoadFromStream(Retorno);
    cdsProduto.First;
    icont := 0;
    if not cdsProduto.IsEmpty then
     begin


        //  lbContagem.Text := 'Download '+IntToStr(icont)+' de '+formatFloat('0',cdsProduto.RecordCount);

       while NOT cdsProduto.Eof do
         begin
            with FDqCarga do
             begin
               close;
               SQL.Clear;
               SQL.Add('INSERT INTO PRODUTO (');
               SQL.Add('CODIGO,DESCRICAO,COMPRA,VENDA');
               SQL.Add(') VALUES (');
               SQL.Add(':CODIGO,:DESCRICAO,:COMPRA,:VENDA)');
               ParamByName('CODIGO').AsString    := cdsProduto.FieldByName('COD_PRODUTO').AsString;
               ParamByName('DESCRICAO').AsString := cdsProduto.FieldByName('DESCRICAO').AsString;
               ParamByName('COMPRA').AsFloat     := cdsProduto.FieldByName('COMPRA').AsFloat;
               ParamByName('VENDA').AsFloat      := cdsProduto.FieldByName('VENDA').AsFloat;
               ExecSQL;
             end;

           // lbContagem.Text := 'Download '+IntToStr(icont)+' de '+formatFloat('0',cdsProduto.RecordCount);
             icont := icont + 1;
             cdsProduto.Next;
         end;

     end
    else
     begin
       ShowMessage('Retorno Vazio');
     end;


  except
    ShowMessage('Falha da importação de produtos');
  end;


end;

procedure TForm1.BarcodeScanner1ScanResult(Sender: TObject; AResult: string);
begin
   Edit2.Text := AResult;
   ShowMessage(AResult);

   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from produto where codigo = :cod');
      ParamByName('cod').AsString := Edit2.Text;
      Open();
    end;

   if not FDqCarga.IsEmpty then
    begin
      lbDescricao.Text := FDqCarga.FieldByName('DESCRICAO').AsString;
     end
   else
      lbDescricao.Text := 'PRODUTO NÃO CADASTRADO';



end;

procedure TForm1.btnGravaConfigClick(Sender: TObject);
begin

 try
  with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('UPDATE CONFIG SET LOJA = :LOJA,ENDERECO = :ENDERECO, SALVA_FONE = :SALVA,EMAIL=:EMAIL');

    if chbSalvaFone.IsChecked then
        ParamByName('SALVA').AsInteger := 1
     else
        ParamByName('SALVA').AsInteger := 0;

     ParamByName('LOJA').AsInteger := StrToInt(edtLoja.Text);
     ParamByName('ENDERECO').AsString := edtServProduto.Text;
     ParamByName('EMAIL').AsString := edtEmail.Text;

     ExecSQL;
   end;
   CarregaConfig;

   diag.Show(TIconDialog.Success,'Que bom!','Dados Salvos com sucesso');
 except
   on E:Exception do
     diag.Show(TIconDialog.Error,'Que pena!','algo errado aconteceu '+e.Message);

 end;

  voltaMenu.ExecuteTarget(self);

end;

procedure TForm1.Button1Click(Sender: TObject);
var fd:TFDQuery;
begin

   fd :=TFDQuery.Create(self);
   fd.Connection := FDCon;

   with fd do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from colaborador where nome = :nome and senha = :senha');
      ParamByName('nome').AsString  := edtLogin.Text;
      ParamByName('senha').AsString := edtSenha.Text;
      Open();
    end;

    if not fd.IsEmpty then
      begin
        tabComntrol1.ActiveTab := tbInicial;
        sTipo := 'I';
      end
    else
      begin
        diag.Show(TIconDialog.Error,'Quem pena!','Login ou senha errada')
      end;






end;

procedure TForm1.Button2Click(Sender: TObject);
begin

    memo := tmemo.Create(self);
    memo.Visible := False;
  with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select codigo,descricao,tipo,sum(qtd) as qtd from contagem');
      sql.Add('group by codigo,descricao,tipo');
      Open();
    end;
   if not FDqCarga.IsEmpty then
    begin
      FDqCarga.First;
       while not FDqCarga.eof do
        begin
          memo.Lines.Add(FDqCarga.FieldByName('CODIGO').AsString+','+formatFloat('0.000',FDqCarga.FieldByName('QTD').AsCurrency));
         FDqCarga.Next;
        end;

    end
   else
    begin
      ShowMessage('Não há nada para Exportar');
    end;

    mandaEmail;

end;

procedure TForm1.Button4Click(Sender: TObject);
var
 I:Integer;
begin
    TLoading.Show(form1,'Aguarde ...');
  TThread.CreateAnonymousThread(procedure
    begin
      ExportaProdutos;
       tthread.Synchronize(nil,procedure
       begin
         tloading.hide;
         voltaMenu.ExecuteTarget(self);
       end);
    end).start;;

    diag.Show(TIconDialog.Success, 'Sucesso', 'Produtos Exportados com sucesso!');



end;

procedure TForm1.CarregaConfig;
begin
with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM CONFIG');
     Open();
   end;

   edtLoja.Text := FDqCarga.FieldByName('loja').AsString;
   edtServProduto.Text := FDqCarga.FieldByName('ENDERECO').AsString;
   edtEmail.Text := FDqCarga.FieldByName('EMAIL').AsString;

   sLoja     := FDqCarga.FieldByName('loja').AsString;
   sEndereco := FDqCarga.FieldByName('ENDERECO').AsString;
   sEmail := FDqCarga.FieldByName('EMAIL').AsString;

   if FDqCarga.FieldByName('SALVA_FONE').AsInteger = 1 then
     begin
       chbSalvaFone.IsChecked := True;
       salva := 1;
     end
   else
     begin
       chbSalvaFone.IsChecked := False;
       salva := 0;
     end;

end;

procedure TForm1.ClickFechar(Sender: TObject);
begin
   //
end;

procedure TForm1.ClickItem(Sender: TObject);
begin
  Application.Terminate;
end;

procedure TForm1.conexao;
begin
  with FDCon do
    begin
       {$IFDEF IOS}
       Params.Values['DriverID']:= 'SQLite';
        try
              Params.Values['Database']:= TPath.combine(Tpath.getDocumentsPath,'INVENTARIO.s3db');
              Connected := True;
        except on E.Exception do
                raise Exception.Create('Error de conexão com o banco de Dados: '+ E.message);
        end;
        {$ENDIF}

        {$IFDEF ANDROID}
        Params.Values['DriverID']:= 'SQLite';
        try
              Params.Values['Database']:= TPath.combine(Tpath.getDocumentsPath,'INVENTARIO.s3db');
              Connected := True;
        except
            ShowMessage('erro de conexao');
        end;
        {$ENDIF}

       {$IFDEF MSWINDOWS}
        try
            Params.Values['Database']:= 'D:\producao\android\INVENTARIO MOBILE\banco\INVENTARIO.s3db';
            Connected := True;
        except
           ShowMessage('erro de conexão');
        end;
        {$ENDIF}

    end;
end;

procedure TForm1.Edit1Typing(Sender: TObject);
begin
  Formatar(Edit1,TFormato.Peso);
end;

procedure TForm1.Edit2Exit(Sender: TObject);
begin
  { cdsProduto.Filtered := False;
   cdsProduto.Filter := 'COD_PRODUTO = '+chr(39)+Edit2.Text+chr(39);
   cdsProduto.Filtered := True;


   if not cdsProduto.IsEmpty then
    begin
      lbDescricao.Text := cdsProdutoDESCRICAO.AsString;
     end
   else
      lbDescricao.Text := 'PRODUTO NÃO CADASTRADO';}

   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select * from produto where codigo = :cod');
      ParamByName('cod').AsString := Edit2.Text;
      Open();
    end;

   if not FDqCarga.IsEmpty then
    begin
      lbDescricao.Text := FDqCarga.FieldByName('DESCRICAO').AsString;
      lbPreco.Text     := formatfloat('0.00',FDqCarga.FieldByName('VENDA').AsFloat);
     end
   else
      lbDescricao.Text := 'PRODUTO NÃO CADASTRADO';



end;

procedure TForm1.Edit2KeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
begin
  if key = vkReturn then
    begin
     with FDqCarga do
      begin
        Close;
        sql.Clear;
        sql.Add('select * from produto where codigo = :cod');
        ParamByName('cod').AsString := Edit2.Text;
        Open();
      end;

     if not FDqCarga.IsEmpty then
      begin
        lbDescricao.Text := FDqCarga.FieldByName('DESCRICAO').AsString;
        lbPreco.Text     := formatfloat('0.00',FDqCarga.FieldByName('VENDA').AsFloat);
       end
     else
        lbDescricao.Text := 'PRODUTO NÃO CADASTRADO';
    end;
end;

procedure TForm1.edtServProdutoClick(Sender: TObject);
begin
  edtServProduto.SelStart := Length(edtServProduto.Text);
end;

procedure TForm1.ExportaProdutos;

begin
  with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select codigo,descricao,tipo,sum(qtd) as qtd from contagem');
      sql.Add('group by codigo,descricao,tipo');
      Open();
    end;
   if not FDqCarga.IsEmpty then
    begin
      FDqCarga.First;
       while not FDqCarga.eof do
        begin
           if FDqCarga.FieldByName('TIPO').AsString = 'F' then
            begin
              if flancaAvaria(FDqCarga.FieldByName('CODIGO').AsString,FDqCarga.FieldByName('qtd').AsString) = '1' then
                begin
                   with FDqCarga2 do
                   begin
                     Close;
                     sql.Clear;
                     sql.Add('DELETE FROM CONTAGEM WHERE CODIGO = :COD');
                     ParamByName('COD').AsString := FDqCarga.FieldByName('CODIGO').AsString;
                     ExecSQL;
                   end;
                end
            end
           else
            begin
              if exportar(FDqCarga.FieldByName('CODIGO').AsString,'',FDqCarga.FieldByName('QTD').AsFloat,FDqCarga.FieldByName('TIPO').AsString) = '1' then
                begin
                  with FDqCarga2 do
                   begin
                     Close;
                     sql.Clear;
                     sql.Add('DELETE FROM CONTAGEM WHERE CODIGO = :COD');
                     ParamByName('COD').AsString := FDqCarga.FieldByName('CODIGO').AsString;
                     ExecSQL;
                   end;
                end;
            end;

         FDqCarga.Next;
        end;

    end;

end;

function TForm1.exportar(codigo, descricao: string; qtd: Real; tipo: String):String;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:Contagem soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?loja?</loja>'
                     +'<sCodProduto xsi:type="xsd:string">?cpd?</sCodProduto>'
                     +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
                     +'<sCONTTIPO xsi:type="xsd:string">?tipo?</sCONTTIPO>'
                     +'</urn:Contagem>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
begin

  try

    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?loja?',sLoja,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cpd?',codigo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',StringReplace(FloatToStr(qtd),',','.',[rfReplaceAll,rfIgnoreCase]),[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?tipo?',tipo,[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#Contagem';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
           // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
        IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
      except
        on E:Exception do
         begin
           ShowMessage('erro'+e.Message);
         end;

      end;

      sRetorno:= Retorno.DataString;

      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

      iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
      iPosFinal   := Pos('</return>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

      Result := sRetorno;

  except
    ShowMessage('Falha no lançamento ');
  end;

end;

procedure TForm1.FDConAfterConnect(Sender: TObject);
begin

   FDCon.ExecSQL('CREATE TABLE IF NOT EXISTS colaborador (cod_colaborador INTEGER, nome varchar(30), senha varchar(6));');
   FDCon.ExecSQL('INSERT OR IGNORE INTO colaborador (cod_colaborador,nome,senha) VALUES (0, '+chr(39)+'SRI'+chr(39)+', '+chr(39)+'740516'+chr(39)+');');
   FDCon.ExecSQL('CREATE TABLE sqlitestudio_temp_table AS SELECT * FROM produto;');
   FDCon.ExecSQL('DROP TABLE produto;');
   FDCon.ExecSQL('CREATE TABLE produto (codigo VARCHAR (14),descricao VARCHAR (60),compra NUMERIC (15, 2), venda NUMERIC (15, 2));');
   FDCon.ExecSQL('INSERT INTO produto (codigo,descricao,compra,venda) SELECT codigo,descricao,compra,venda FROM sqlitestudio_temp_table;');
   FDCon.ExecSQL('DROP TABLE sqlitestudio_temp_table;');


end;

function TForm1.flancaAvaria(codigo, qtd: String): string;
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:lancaAvaria soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<cod_produto xsi:type="xsd:string">?cdp?</cod_produto>'
                     +'<motivo xsi:type="xsd:string">?mtv?</motivo>'
                     +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:lancaAvaria>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    rQtd:Real;
    sQtd:string;
begin
  codMotivo := '0';
  try
    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?mtv?',codMotivo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?lja?',sLoja,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cdp?',codigo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',StringReplace(qtd,',','.',[rfReplaceAll,rfIgnoreCase]),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#lancaAvaria';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
           // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
        IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
      except
        ShowMessage('Não consegui me conectar com o servidor'+#13+' tente novamente ou verifique sua conexão'+#13+' :( ');
        Exit
      end;

      sRetorno:= Retorno.DataString;

      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

      iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
      iPosFinal   := Pos('</return>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

     Result := sRetorno;

  except
    ShowMessage('Falha no lançamento ');
  end;

end;

procedure TForm1.FormCloseQuery(Sender: TObject; var CanClose: Boolean);
begin

  {if lendo = 1 then
   begin


   end;}


  diag.Show(TIconDialog.Question,'Atenção'
                                ,'Deseja mesmo fechar o app'
                                ,'OK'
                                ,ClickItem
                                ,'Não'
                                ,ClickFechar);
  
end;

procedure TForm1.FormCreate(Sender: TObject);
begin

 permissao := T99Permissions.Create;
 diag := TFancyDialog.Create(Form1);
end;

procedure TForm1.FormDestroy(Sender: TObject);
begin
permissao.DisposeOf;
end;

procedure TForm1.FormKeyUp(Sender: TObject; var Key: Word; var KeyChar: Char;
  Shift: TShiftState);
var
   Fechar : Boolean;
begin
    if Key = vkHardwareBack then
      begin

        if tabComntrol1.ActiveTab = tbContagem then
         begin
           key := 0;
           voltaMenu.ExecuteTarget(self);
           Exit;
         end;

        if tabComntrol1.ActiveTab = tbConfiguração then
         begin
           key := 0;
           voltaMenu.ExecuteTarget(self);
           Exit;
         end;

        if tabComntrol1.ActiveTab = tbExportar then
         begin
           key := 0;
           voltaMenu.ExecuteTarget(self);
           Exit;
         end;







        key := 0;
        FormCloseQuery(Sender, Fechar);
      end;
end;

procedure TForm1.FormShow(Sender: TObject);
begin

  tabComntrol1.TabPosition := TTabPosition.None;
  tabComntrol1.ActiveTab := tbInicial;
  conexao;
  diag := TFancyDialog.Create(Form1);
  CarregaConfig;
  sTipo := 'I';
 // restornaMotivo(1);

    if NOT permissao.VerifyCameraAccess then
        permissao.Camera(nil, nil)
     else

end;

procedure TForm1.Image1Click(Sender: TObject);
var valor:String;
begin

  if ((Length(Trim(Edit1.Text))<1))  then
   begin
     ShowMessage('Quantidade Inválida');
     Exit;
   end;

  if ((Length(Trim(Edit2.Text))<1) or (Length(Trim(Edit2.Text))>14))  then
   begin
     ShowMessage('Codigo Inválido');
     Exit;
   end;

  valor := StringReplace(Edit1.Text,'.',',',[rfReplaceAll,rfIgnoreCase]);

  if salva = 1 then
   begin
     try
       with FDqCarga do
        begin
          Close;
          sql.Clear;
          sql.Add('INSERT INTO CONTAGEM (');
          SQL.Add('CODIGO');
          SQL.Add(',DESCRICAO');
          SQL.Add(',QTD');
          SQL.Add(',DATA');
          SQL.Add(',TIPO');
          SQL.Add(')VALUES(');
          SQL.Add(':COD');
          SQL.Add(',:DESC');
          SQL.Add(',:QTD');
          SQL.Add(',:DATA');
          SQL.Add(',:TIPO)');
          ParamByName('COD').AsString     := Edit2.Text;
          ParamByName('DESC').AsString    := lbDescricao.Text;
          ParamByName('QTD').AsCurrency   := StrToFloat(valor);
          ParamByName('DATA').AsDate      := Date;
          ParamByName('TIPO').AsString    := sTipo;
          ExecSQL;
        end;

     except
         ShowMessage('Falha no lançamento ');
         Exit;
     end;

     Edit1.Text := '1';
     Edit2.Text := '';
     lbDescricao.Text := '';
     Edit2.SetFocus;

   end
  else
   begin
    if sTipo = 'F' then
     begin
        lancaAvaria(Edit2.Text,valor);

     end
    else
    if exportar(Edit2.Text,'',StrToFloat(valor),sTipo) = '1' then
      begin

       with FDqCarga do
        begin
          close;
          sql.Clear;
          sql.Add('select * from config');
          Open();
        end;

       { if FDqCarga.FieldByName('SCAN_RAPIDO').AsInteger = 1 then
          begin

            BarcodeScanner1.Scan;
            Self.Tag := 1;
          end;}


         Edit1.Text := '1';
         Edit2.Text := '';
         lbDescricao.Text := '';
         Edit2.SetFocus;
      end
    else
      begin
        ShowMessage('Falha no lançamento ');
      end;

   end;




end;

procedure TForm1.Image2Click(Sender: TObject);
begin
  Layout7.Height := 204;
  abreContagem.ExecuteTarget(self);
  Edit2.SetFocus;
  sTipo := 'D';

end;

procedure TForm1.Image3Click(Sender: TObject);
begin
  Edit1.Text := '1';
  Layout7.Height := 124;
  abreContagem.ExecuteTarget(self);
  sTipo := 'P';

end;

procedure TForm1.Image5Click(Sender: TObject);
begin
   {
  BarcodeScanner1.Scan;
  lendo := 1;

 { if Assigned(fScanManager) then
    fScanManager.Free;

  fScanManager := TScanManager.Create(tipo,nil);

  Camera.Quality := FMX.Media.TVideoCaptureQuality.MediumQuality;
  Camera.Active := False;
  Camera.Kind := FMX.Media.TCameraKind.BackCamera;
  Camera.FocusMode := FMX.Media.TFocusMode.ContinuousAutoFocus;
  Camera.Active := True;     }
end;

procedure TForm1.Image7Click(Sender: TObject);
begin
  Edit1.Text := '1';
  abreContagem.ExecuteTarget(self);
  sTipo := 'F';
 // Layout8.Visible := True;

end;

procedure TForm1.Image8Click(Sender: TObject);
  var LItem:TListViewItem;
  txt:TListItemText;
begin

   lvProdutos.Items.Clear;
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select codigo,descricao,sum(qtd) as qtd from contagem group by codigo,descricao');
      Open();
    end;
   if not FDqCarga.IsEmpty then
    begin
      FDqCarga.First;
       while not FDqCarga.eof do
        begin

         LItem := lvProdutos.Items.Add;

           with LItem do
            begin

               txt := TListItemText(Objects.FindDrawable('Text1'));
               txt.Text := 'Codigo : '+FDqCarga.FieldByName('codigo').AsString;
               txt.Font.Size := 11;


               txt := TListItemText(Objects.FindDrawable('Text2'));
               txt.Text := FDqCarga.FieldByName('descricao').AsString;
               txt.Font.Size := 12;
               txt.Font.Style := [TFontStyle.fsBold];
               txt.WordWrap := True;

               txt := TListItemText(Objects.FindDrawable('Text3'));
               txt.Text := 'Quantidade : '+formatfloat('0.000',FDqCarga.FieldByName('qtd').AsCurrency);
               txt.Font.Size := 11;
            end;

            {  LItem.Text := FDqCarga.FieldByName('codigo').AsString+' : '+FDqCarga.FieldByName('descricao').AsString;
               LItem.Detail := FDqCarga.FieldByName('codigo').AsString;
               LItem.Data[ TMultiDetailAppearanceNames.Detail1 ] := '  '+formatfloat('0.00',FDqCarga.FieldByName('qtd').AsFloat);
            }

         FDqCarga.Next;
        end;
        lvProdutos.EndUpdate;
    end;

   abreExporta.ExecuteTarget(self);
end;

procedure TForm1.Image9Click(Sender: TObject);
begin

  


        FrmCamera.ShowModal(procedure(ModalResult: TModalResult)
        begin
            Edit2.Text := FrmCamera.codigo;
            with FDqCarga do
            begin
              Close;
              sql.Clear;
              sql.Add('select * from produto where codigo = :cod');
              ParamByName('cod').AsString := Edit2.Text;
              Open();
            end;

           if not FDqCarga.IsEmpty then
            begin
              lbDescricao.Text := FDqCarga.FieldByName('DESCRICAO').AsString;
              lbPreco.Text     := formatfloat('0.00',FDqCarga.FieldByName('VENDA').AsFloat);
             end
           else
              lbDescricao.Text := 'PRODUTO NÃO CADASTRADO';


        end);

end;

procedure TForm1.lancaAvaria(codigo: string; qtd: String);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:lancaAvaria soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<cod_produto xsi:type="xsd:string">?cdp?</cod_produto>'
                     +'<motivo xsi:type="xsd:string">?mtv?</motivo>'
                     +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:lancaAvaria>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    rQtd:Real;
    sQtd:string;
begin
  codMotivo := '0';
  try
    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?mtv?',codMotivo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?lja?',sLoja,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cdp?',codigo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',StringReplace(qtd,',','.',[rfReplaceAll,rfIgnoreCase]),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#lancaAvaria';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
           // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
        IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
      except
        ShowMessage('Não consegui me conectar com o servidor'+#13+' tente novamente ou verifique sua conexão'+#13+' :( ');
        Exit
      end;

      sRetorno:= Retorno.DataString;

      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

      iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
      iPosFinal   := Pos('</return>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

      if sRetorno = '0' then
        begin
          ShowMessage('o produto não foi localizado no servidor');
        end;
     if sRetorno = '1' then
        begin
          Edit1.Text := '';
          Edit2.Text := '';
          lbDescricao.Text := '';
          Edit2.SetFocus;
        end;
      


  except
    ShowMessage('Falha no lançamento ');
  end;

end;

procedure TForm1.lancaRequiDev(codigo,qtd,tipo: String);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:lancaRequisicao_devolucao soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'<cod_produto xsi:type="xsd:string">?cdp?</cod_produto>'
                     +'<motivo xsi:type="xsd:string">?mtv?</motivo>'
                     +'<qtd xsi:type="xsd:double">?qtd?</qtd>'
                     +'<erro xsi:type="xsd:string">?</erro>'
                     +'</urn:lancaRequisicao_devolucao>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    rQtd:Real;
    sQtd:string;
    codMotivo :String;
begin
  codMotivo := '0';
  try
    Retorno := TStringStream.Create(EmptyStr);
    sListaPedido:= sListaProduto;
    sListaPedido:= StringReplace(sListaPedido,'?mtv?',codMotivo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?lja?',sLoja,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?cdp?',codigo,[rfReplaceAll]);
    sListaPedido:= StringReplace(sListaPedido,'?qtd?',StringReplace(qtd,',','.',[rfReplaceAll,rfIgnoreCase]),[rfReplaceAll]);
    Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

    IdHTTP1.Request.ContentType := 'text/xml';
    IdHTTP1.Request.Charset := 'utf-8';
    IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#lancaRequisicao_devolucao';
    IdHTTP1.ProtocolVersion := pv1_1;
    IdHTTP1.ConnectTimeout := 5000;
    IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
      try
           // IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
        IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
      except
        ShowMessage('Não consegui me conectar com o servidor'+#13+' tente novamente ou verifique sua conexão'+#13+' :( ');
        Exit
      end;

      sRetorno:= Retorno.DataString;

      sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
      sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

      iPosInicial := Pos('<return xsi:type="xsd:int">',sRetorno)+27;
      iPosFinal   := Pos('</return>',sRetorno);
      sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

      if sRetorno = '0' then
        begin
          ShowMessage('o produto não foi localizado no servidor');
        end;
     if sRetorno = '1' then
        begin
          Edit1.Text := '';
          Edit2.Text := '';
          lbDescricao.Text := '';
          Edit2.SetFocus;
        end;



  except
    ShowMessage('Falha no lançamento ');
  end;

end;

procedure TForm1.lvMotivoItemClick(const Sender: TObject;
  const AItem: TListViewItem);
begin

  codMotivo := lvMotivo.Items[lvMotivo.Selected.Index].Detail;
  Layout8.Visible := False;
end;

procedure TForm1.mandaEmail;
var
  Destinatario : string;
  {Intent : JIntent;
  Destinatarios: TJavaObjectArray<JString>;
  AttachmentFile: JFile;
  Uri: Jnet_Uri;
  Attachment:JString;}
begin
                      {
  Destinatario := sEmail;
  Destinatarios := TJavaObjectArray<JString>.Create(1);

  Intent := TJIntent.JavaClass.init(TJIntent.JavaClass.ACTION_SEND_MULTIPLE);
  Destinatarios.Items[0] := StringToJString(Destinatario);
  Intent.putExtra(TJIntent.JavaClass.EXTRA_EMAIL, Destinatarios);
  Intent.putExtra(TJIntent.JavaClass.EXTRA_SUBJECT, StringToJString('E-mail de Teste'));
  Intent.putExtra(TJIntent.JavaClass.EXTRA_TEXT, StringToJString(memo.Lines.Text));
  Intent.setPackage(stringtoJString('com.google.android.gm'));
  //Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM,uri);
  {Attachment := StringToJString(TPath.combine(Tpath.getDocumentsPath,'INVENTARIO.XML'));


   AttachmentFile := TJFile.JavaClass.init(Attachment);
   Uri := TJnet_Uri.JavaClass.fromFile(AttachmentFile);
   Intent.putExtra(TJIntent.JavaClass.EXTRA_STREAM, TJParcelable.Wrap((Uri as ILocalObject).GetObjectID));
   }
                        {
  Intent.setType(StringToJString('plain/text'));
  SharedActivity.startActivity(TJIntent.JavaClass.createChooser(Intent,
  StrToJCharSequence('Qual aplicativo deseja usar?')));

                       }
end;

procedure TForm1.rctCancelarClick(Sender: TObject);
begin
  Layout8.Visible := False;
end;

procedure TForm1.Rectangle12Click(Sender: TObject);
var valor:String;
begin
  if sTipo = 'P' then
    Edit1.Text := '1';

  if ((Length(Trim(Edit1.Text))<1))  then
   begin
     diag.Show(TIconDialog.Error,'Atenção','Quantidade Inválida');
     Exit;
   end;

  if ((Length(Trim(Edit2.Text))<1) or (Length(Trim(Edit2.Text))>14))  then
   begin
     diag.Show(TIconDialog.Error,'Atenção','Digite um codigo');
     Exit;
   end;

  valor := StringReplace(Edit1.Text,'.',',',[rfReplaceAll,rfIgnoreCase]);

  if salva = 1 then
   begin
     try
       with FDqCarga do
        begin
          Close;
          sql.Clear;
          sql.Add('INSERT INTO CONTAGEM (');
          SQL.Add('CODIGO');
          SQL.Add(',DESCRICAO');
          SQL.Add(',QTD');
          SQL.Add(',DATA');
          SQL.Add(',TIPO');
          SQL.Add(')VALUES(');
          SQL.Add(':COD');
          SQL.Add(',:DESC');
          SQL.Add(',:QTD');
          SQL.Add(',:DATA');
          SQL.Add(',:TIPO)');
          ParamByName('COD').AsString     := Edit2.Text;
          ParamByName('DESC').AsString    := lbDescricao.Text;
          ParamByName('QTD').AsCurrency   := StrToFloat(valor);
          ParamByName('DATA').AsDate      := Date;
          ParamByName('TIPO').AsString    := sTipo;
          ExecSQL;
        end;

     except
        diag.Show(TIconDialog.Error,'Atenção','Falha no lançamento ');
         Exit;
     end;

     Edit1.Text := '';
     Edit2.Text := '';
     lbDescricao.Text := '';
     lbPreco.Text := '';
     Edit2.SetFocus;

   end
  else
   begin

    if ((sTipo = 'R')or(sTipo = 'E')) then
     begin
        if sTipo = 'R' then
          lancaRequiDev(Edit2.Text,valor,'1')
        else
          lancaRequiDev(Edit2.Text,valor,'2')
     end
    else
    if sTipo = 'F' then
     begin
        lancaAvaria(Edit2.Text,valor);

     end
    else
    if exportar(Edit2.Text,'',StrToFloat(valor),sTipo) = '1' then
      begin

       with FDqCarga do
        begin
          close;
          sql.Clear;
          sql.Add('select * from config');
          Open();
        end;

       { if FDqCarga.FieldByName('SCAN_RAPIDO').AsInteger = 1 then
          begin

            BarcodeScanner1.Scan;
            Self.Tag := 1;
          end;}


         Edit1.Text := '';
         Edit2.Text := '';
         lbDescricao.Text := '';
         lbPreco.Text := '';
         Edit2.SetFocus;
      end
    else
      begin
       diag.Show(TIconDialog.Error,'Atenção','Falha no lançamento');
      end;

   end;



end;

procedure TForm1.Rectangle13Click(Sender: TObject);
begin
  label1.Text     := 'ETIQUETAS';
  Edit1.Text := '1';
  Layout7.Height := 124;
  abreContagem.ExecuteTarget(self);
  sTipo := 'P';

end;

procedure TForm1.Rectangle14Click(Sender: TObject);
begin
  label1.Text     := 'INVENTÁRIO';
  Layout7.Height := 204;
  Edit1.Text := '';
  abreContagem.ExecuteTarget(self);
  Edit2.SetFocus;
  sTipo := 'D';
end;

procedure TForm1.Rectangle15Click(Sender: TObject);
begin
  label1.Text     := 'AVARIA';
  Edit1.Text := '';
  abreContagem.ExecuteTarget(self);
  sTipo := 'F';
  Layout7.Height := 204;
 // Layout8.Visible := True;

end;

procedure TForm1.Rectangle16Click(Sender: TObject);
var LItem:TListViewItem;
  txt:TListItemText;
begin

   lvProdutos.Items.Clear;
   with FDqCarga do
    begin
      Close;
      sql.Clear;
      sql.Add('select codigo,descricao,sum(qtd) as qtd from contagem group by codigo,descricao');
      Open();
    end;
   if not FDqCarga.IsEmpty then
    begin
      FDqCarga.First;
       while not FDqCarga.eof do
        begin

         LItem := lvProdutos.Items.Add;

           with LItem do
            begin

               txt := TListItemText(Objects.FindDrawable('Text1'));
               txt.Text := 'Codigo : '+FDqCarga.FieldByName('codigo').AsString;
               txt.Font.Size := 11;


               txt := TListItemText(Objects.FindDrawable('Text2'));
               txt.Text := FDqCarga.FieldByName('descricao').AsString;
               txt.Font.Size := 12;
               txt.Font.Style := [TFontStyle.fsBold];
               txt.WordWrap := True;

               txt := TListItemText(Objects.FindDrawable('Text3'));
               txt.Text := 'Quantidade : '+formatfloat('0.000',FDqCarga.FieldByName('qtd').AsCurrency);
               txt.Font.Size := 11;
            end;

            {  LItem.Text := FDqCarga.FieldByName('codigo').AsString+' : '+FDqCarga.FieldByName('descricao').AsString;
               LItem.Detail := FDqCarga.FieldByName('codigo').AsString;
               LItem.Data[ TMultiDetailAppearanceNames.Detail1 ] := '  '+formatfloat('0.00',FDqCarga.FieldByName('qtd').AsFloat);
            }

         FDqCarga.Next;
        end;
        lvProdutos.EndUpdate;
    end;

   abreExporta.ExecuteTarget(self);

end;

procedure TForm1.Rectangle17Click(Sender: TObject);
begin
  label1.Text     := 'REQUISIÇÃO';
  Layout7.Height := 204;
  abreContagem.ExecuteTarget(self);
  Edit2.SetFocus;
  sTipo := 'R';
end;

procedure TForm1.Rectangle18Click(Sender: TObject);
begin
  label1.Text     := 'DEVOLUÇÃO';
  Layout7.Height := 204;
  abreContagem.ExecuteTarget(self);
  Edit2.SetFocus;
  sTipo := 'E';
end;

procedure TForm1.restornaMotivo(loja: integer);
const sListaProduto = '<soapenv:Envelope xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:xsd="http://www.w3.org/2001/XMLSchema" xmlns:soapenv="http://schemas.xmlsoap.org/soap/envelope/" xmlns:urn="urn:uSRIIntf-ISRI">'
                     +'<soapenv:Header/>'
                     +'<soapenv:Body>'
                     +'<urn:retornaAvariaMotivo soapenv:encodingStyle="http://schemas.xmlsoap.org/soap/encoding/">'
                     +'<loja xsi:type="xsd:int">?lja?</loja>'
                     +'</urn:retornaAvariaMotivo>'
                     +'</soapenv:Body>'
                     +'</soapenv:Envelope>';
var sErro, sNumPedido,sRetorno, sCupom, sLinha, sCab : string;
    iTermino, iPosInicial, iPosFinal, i, iTamanho, iItem :integer;
    Retorno , Solicit: TStringStream;
    sListaPedido: string;
    icont:Integer;
begin

  try

  Retorno := TStringStream.Create(EmptyStr);
  sListaPedido:= sListaProduto;
  sListaPedido:= StringReplace(sListaPedido,'?lja?',sLoja,[rfReplaceAll]);
  Solicit := TStringStream.Create(sListaPedido, TEncoding.UTF8);

  IdHTTP1.Request.ContentType := 'text/xml';
  IdHTTP1.Request.Charset := 'utf-8';
  IdHTTP1.ConnectTimeout := 5000;
  IdHTTP1.Request.CustomHeaders.Values['SOAPAction'] := 'urn:uSRIIntf-ISRI#retornaAvariaMotivo';
  IdHTTP1.ProtocolVersion := pv1_1;
  IdHTTP1.HTTPOptions := IdHTTP1.HTTPOptions + [hoKeepOrigProtocol];
    try
      //IdHTTP1.Post('http://sriservicos.com.br/integrasri/IntegraSRI.dll/soap/ISRI',Solicit, Retorno);
      IdHTTP1.Post('http://'+sEndereco+'/soap/ISRI',Solicit, Retorno);
    except
      ShowMessage('falha na conexao ');
      exit;
    end;

    sRetorno:= Retorno.DataString;

    sRetorno := StringReplace(sRetorno,'&gt;','>',[rfReplaceAll,rfIgnoreCase]);
    sRetorno := StringReplace(sRetorno,'&lt;','<',[rfReplaceAll,rfIgnoreCase]);

    iPosInicial := Pos('<xml xsi:type="xsd:string">',sRetorno)+29;
    iPosFinal   := Pos('</xml>',sRetorno);
    sRetorno := copy(sRetorno,iPosInicial,iPosFinal-iPosInicial);

    Retorno := TStringStream.Create(sRetorno);

    cdsmotivo:= TClientDataSet.Create(nil);
    cdsmotivo.FieldDefs.Add('COD_TIPO',ftString,14);
    cdsmotivo.FieldDefs.Add('DESCRICAO',ftString,60);
    cdsmotivo.CreateDataSet;
    cdsmotivo.Open;
    cdsmotivo.LogChanges:= False;
    cdsmotivo.LoadFromStream(Retorno);
    cdsmotivo.First;
    icont := 0;
    if not cdsmotivo.IsEmpty then
     begin

       while NOT cdsmotivo.Eof do
         begin

            addListaMotivos(cdsmotivo.FieldByName('COD_TIPO').AsString,cdsmotivo.FieldByName('DESCRICAO').AsString);

             cdsmotivo.Next;
         end;

     end
    else
     begin
       ShowMessage('Retorno Vazio');
     end;


  except
    ShowMessage('Falha da importação de produtos');
  end;


end;

procedure TForm1.SpeedButton1Click(Sender: TObject);
begin
  Edit1.Text := '';
  Edit2.Text := '';
  lbDescricao.Text := '';
  lbPreco.Text := '';
  voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.addListaMotivos(cod,descricao:String);
 var lItem:TListViewItem;
     txt:TListItemText;
begin
   lItem := lvMotivo.Items.Add;

   with lItem do
    begin
      txt := TListItemText(Objects.FindDrawable('Text1'));
      txt.Text := descricao;
      txt.Font.Style := [TFontStyle.fsBold];

      Detail := cod;
    end



end;

procedure TForm1.SpeedButton2Click(Sender: TObject);
begin
   abreConfig.ExecuteTarget(self);


  with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM CONFIG');
     Open();
   end;

   edtLoja.Text := FDqCarga.FieldByName('loja').AsString;
   edtServProduto.Text := FDqCarga.FieldByName('ENDERECO').AsString;
 {
   if FDqCarga.FieldByName('INSERIR_QTD').AsInteger = 1 then
       chbQtdautomacatica.IsChecked := True
    else
       chbQtdautomacatica.IsChecked := False;

    if FDqCarga.FieldByName('USA_CAMERA').AsInteger = 1 then
       chbDesativaCamera.IsChecked := True
    else
       chbDesativaCamera.IsChecked := False;

   if FDqCarga.FieldByName('SCAN_RAPIDO').AsInteger = 1 then
       chbScanRapido.IsChecked := True
   else
       chbScanRapido.IsChecked := False;   }

   if FDqCarga.FieldByName('SALVA_FONE').AsInteger = 1 then
       chbSalvaFone.IsChecked := True
   else
       chbSalvaFone.IsChecked := False;



end;

procedure TForm1.SpeedButton3Click(Sender: TObject);
begin
 voltaMenu.ExecuteTarget(self);
end;

procedure TForm1.SpeedButton4Click(Sender: TObject);
var t:TThread;
 I:Integer;
begin

     { MessageDlg('Deseja fazer a importação agora ? ',
      System.UITypes.TMsgDlgType.mtInformation,
      [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
      procedure(const BotaoPressionado: TModalResult)
        begin
        case BotaoPressionado of
            mrYes: begin

                 Rectangle9.Visible := True;
                 RctAndamento.Visible := True;

                // AniIndicator1.Visible := True;
                 AniIndicator1.Enabled := True;
                begin
                   t := TThread.CreateAnonymousThread(procedure
                    begin         }
                      // processo
                    TLoading.Show(Form1,'Aguarde ...');
                    TThread.CreateAnonymousThread(procedure
                      begin
                        atualizaColaborador;
                        atualizaProduto;

                        TThread.Synchronize(nil,procedure
                          begin
                            TLoading.hide;
                            diag.Show(TIconDialog.Success, 'Sucesso', 'Dados Sincronizado com sucesso!');

                          end);
                      end).Start;


                                   {
                      t.Synchronize(nil,procedure
                       begin
                         Rectangle9.Visible := False;
                         rctAndamento.Visible := False;

                         {
                         AniIndicator1.Enabled := False;

                       end);

                    end);

                    t.Start;
                end;
                                      }
                 //rCtanimacaoOpacidade.Visible := True;
                 //rCtanimacao.Visible := True;
                // AniIndicator1.Enabled := True;
                 {atualizaProduto;
                 atualizaPreco;}

                                     {


              end;
            mrNo: begin
                //
              end;
          end;
        end
      );
                                    }


  //atualizaProduto;

end;

procedure TForm1.SpeedButton6Click(Sender: TObject);
var LItem:TListViewItem;
  txt:TListItemText;
begin
  MessageDlg('Deseja realmente apagar todos os Registros?',
    System.UITypes.TMsgDlgType.mtInformation,
    [System.UITypes.TMsgDlgBtn.mbYes, System.UITypes.TMsgDlgBtn.mbNo], 0,
    procedure(const BotaoPressionado: TModalResult)
      begin
      case BotaoPressionado of
          mrYes: begin
              with FDqCarga2 do
               begin
                 Close;
                 sql.Clear;
                 sql.Add('DELETE FROM CONTAGEM ');
                 ExecSQL;
               end;

                lvProdutos.Items.Clear;
                 with FDqCarga do
                  begin
                    Close;
                    sql.Clear;
                    sql.Add('select codigo,descricao,sum(qtd) as qtd from contagem group by codigo,descricao');
                    Open();
                  end;
                 if not FDqCarga.IsEmpty then
                  begin
                    FDqCarga.First;
                     while not FDqCarga.eof do
                      begin

                       LItem := lvProdutos.Items.Add;

                         with LItem do
                          begin

                             txt := TListItemText(Objects.FindDrawable('Text1'));
                             txt.Text := 'Codigo : '+FDqCarga.FieldByName('codigo').AsString;
                             txt.Font.Size := 11;


                             txt := TListItemText(Objects.FindDrawable('Text2'));
                             txt.Text := FDqCarga.FieldByName('descricao').AsString;
                             txt.Font.Size := 12;
                             txt.Font.Style := [TFontStyle.fsBold];
                             txt.WordWrap := True;

                             txt := TListItemText(Objects.FindDrawable('Text3'));
                             txt.Text := 'Quantidade : '+formatfloat('0.000',FDqCarga.FieldByName('qtd').AsCurrency);
                             txt.Font.Size := 11;
                          end;

                          {  LItem.Text := FDqCarga.FieldByName('codigo').AsString+' : '+FDqCarga.FieldByName('descricao').AsString;
                             LItem.Detail := FDqCarga.FieldByName('codigo').AsString;
                             LItem.Data[ TMultiDetailAppearanceNames.Detail1 ] := '  '+formatfloat('0.00',FDqCarga.FieldByName('qtd').AsFloat);
                          }

                       FDqCarga.Next;
                      end;
                      lvProdutos.EndUpdate;
                  end;







            end;
          mrNo: begin
              //
            end;
        end;
      end
    );
end;

procedure TForm1.SpeedButton8Click(Sender: TObject);
begin
  tabComntrol1.ActiveTab := tbConfiguração;

  with FDqCarga do
   begin
     Close;
     sql.Clear;
     sql.Add('SELECT * FROM CONFIG');
     Open();
   end;

   edtLoja.Text := FDqCarga.FieldByName('loja').AsString;
   edtServProduto.Text := FDqCarga.FieldByName('ENDERECO').AsString;


end;

end.
