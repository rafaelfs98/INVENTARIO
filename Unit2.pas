unit Unit2;

interface
uses
  classes, SysUtils, Windows, ComCtrls;

type
  { TMinhaThread }

  TMinhaThread = class(TThread)
  private
    FTempo       : Integer;
    FProgressBar : TProgressBar;

  public
    //Tempo: Integer;
    procedure Progress;
    procedure Execute; override;
    constructor Create(BarraProgresso: TProgressBar; Tempo: integer); overload;
  end;

var
  nFor: Integer;

implementation

constructor TMinhaThread.Create(BarraProgresso: TProgressBar; Tempo: integer);
begin
  inherited Create(True);
  FProgressBar := BarraProgresso;
  FTempo       := Tempo;
end;

procedure TMinhaThread.Execute;
begin
  for nFor := 0 to 100 do
  begin
    Sleep(FTempo);
    Synchronize(Progress);
  end;
end;

procedure TMinhaThread.Progress;
begin
  FProgressBar.StepIt;
end;

end.
