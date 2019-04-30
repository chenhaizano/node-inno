var Minimize, CloseBtn: HWND; //close btn
	mainBg : Longint; //bg image

	htmlAdBar: HWND;
	adPage: TWizardPage;

//重新设置窗口样式
procedure initMainWindow();
begin
	//beautify window
	with WizardForm do begin
		ClientWidth:=ScaleX({{ui.clientWidth}});
		ClientHeight:=ScaleY({{ui.clientHeight}});
		Center;
		OnMouseDown:=@WizardFormMouseDown;
	end;

	InitFairy(WizardForm.Handle, 0, 20 );

	if {{ui.closeButton.show}} then begin
		AddImgToList(-20, -20, 255, clNone, ExpandConstant('{tmp}\shadow.png'))
	end;

	ShowFairyEx(0);

	//window background
	mainBg:=ImgLoad(WizardForm.Handle, ExpandConstant('{tmp}\bg.png'), 0, 0, ScaleX(WizardForm.ClientWidth), ScaleY(WizardForm.ClientHeight), True, True);

	//minimize btn
	if {{ui.minimizeButton.show}} then begin
		Minimize:=BtnCreate(WizardForm.Handle, ScaleX({{ui.minimizeButton.left}}), ScaleY({{ui.minimizeButton.top}}), ScaleX({{ui.minimizeButton.width}}), ScaleY({{ui.minimizeButton.height}}), ExpandConstant('{tmp}\minimizeBtn.png'), 3, False);
		BtnSetEvent(Minimize, BtnClickEventID, WrapBtnCallback(@MinimizeOnClick, 1));
	end;

	//close btn
	if {{ui.closeButton.show}} then begin
		CloseBtn:=BtnCreate(WizardForm.Handle, ScaleX({{ui.closeButton.left}}), ScaleY({{ui.closeButton.top}}), ScaleX({{ui.closeButton.width}}), ScaleY({{ui.closeButton.height}}), ExpandConstant('{tmp}\closeBtn.png'), 3, False);
		BtnSetEvent(CloseBtn, BtnClickEventID, WrapBtnCallback(@CloseBtnOnClick, 1));
	end;

	ImgApplyChanges(WizardForm.Handle);
end;

procedure setEnableCloseBtn(isEnabled:Boolean);
begin
	BtnSetEnabled(CloseBtn, isEnabled);
end;
