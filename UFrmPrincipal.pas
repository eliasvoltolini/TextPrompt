unit UFrmPrincipal;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes,
  System.Variants, FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics,
  FMX.Dialogs, FMX.Controls.Presentation, FMX.Edit, FMX.Layouts,
  FMX.StdCtrls, FMX.Ani;

type
  TFrmPrincipal = class(TForm)
    sbPrincipal : TScrollBox;
    edNome      : TEdit;
    btnNome     : TClearEditButton;
    lbNome      : TLabel;
    faNome      : TFloatAnimation;
    btnBotao    : TButton;
    procedure faAnimationFinish(Sender: TObject);
    procedure edNomeEnter(Sender: TObject);
    procedure edNomeExit(Sender: TObject);
    procedure Animation(Sender: TObject; Lab: TLabel;
      faAni: TFloatAnimation; Focus: Boolean = True);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  FrmPrincipal: TFrmPrincipal;

implementation

{$R *.fmx}

procedure TFrmPrincipal.faAnimationFinish(Sender: TObject);
begin
  TFloatAnimation(Sender).Inverse := not
    TFloatAnimation(Sender).Inverse;
end;

procedure TFrmPrincipal.Animation(Sender: TObject; Lab: TLabel;
  faAni: TFloatAnimation; Focus: Boolean);
begin

  if faAni.Inverse then
  begin
    if (TEdit(Sender).Text = EmptyStr) And (not Focus) then
    begin
      Lab.Font.Size := 12;
      faAni.Start;
    end;
  end
  else
  begin
    Lab.Font.Size    := 10;
    faAni.StartValue := 0;
    faAni.StopValue  := 22;
    faAni.Start;
  end;

end;

procedure TFrmPrincipal.edNomeEnter(Sender: TObject);
begin
  Animation(edNome, lbNome, faNome);

  if ActiveControl.Name = edNome.Name then
    btnNome.Visible := True;
end;

procedure TFrmPrincipal.edNomeExit(Sender: TObject);
begin
  Animation(edNome, lbNome, faNome, False);
  btnNome.Visible := False;
end;

end.
