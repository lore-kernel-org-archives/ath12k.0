Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29D91C36010
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=brQMt7KRwFhUPNaYkRwQiw3naGxlWQjOv0I1qKaBsaM=; b=cCrmthL1AVR8Wlm0ycEU6VOQ6v
	ycBKKBC/lXr2f1w39nJ0tiiwx0ZDV1gyC7QNgNxaMn/FQjZdh1gIs1Z7yinZs4KEmL5YXYy/dq03T
	LSURVNZuGPXBaVuueaQ+6Z8hqzhAkKKGbz8stJXnbOvzpp99vuY4GZ95Xov/o7rXsbBpoDfjWL2We
	h4SJVUY6zHJEWkvVnmh8ARxD4o2D+91EHuq9zMR6V+mIJFYLJiiAiQXYsTifoxOlfyt4t8CcntsoT
	6YZ1imNfMD/V8f0l6djdmDXAx8fR0oYkHYciPtRnDl60TPRnEJuRUZN3Luy529mcWCWV7ZKIkBG2t
	3tzSd2+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzj6p-00000004Rur-3lm7
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 21:25:23 +0000
Received: from mail-wm1-x32b.google.com ([2a00:1450:4864:20::32b])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzj2v-00000004RPT-0AQH
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 21:21:22 +0000
Received: by mail-wm1-x32b.google.com with SMTP id 5b1f17b1804b1-43ce71582e9so43468075e9.1
        for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 14:21:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743542479; x=1744147279; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=brQMt7KRwFhUPNaYkRwQiw3naGxlWQjOv0I1qKaBsaM=;
        b=EHBAot6f/l/+FY/cIGVdOjB6dveogJBNMbrdCu6Kv+PTX3tKM2kIeUKCzfK51yBB6X
         l0/d0zYPedk0Fg/niTF03JSPnAbnXm4Hi8km+pm8V9ooZt7pxI3Rz5aAudRuSosyYwws
         EfyWkyUORWuU1qzWrFahHpKUxUW0IOTK35xb6XaBW7y6ben4OwWhZzx2ufpcGX8JXISN
         dVktvD2CXmOlNwFxVnYnwIGT2zQVyjNbJtOHB56ozu9bkBNiVb5SNiHpXWhVq/HSrZYI
         6Ywe66y2e+SmEKdWX/18XXvtbWLkx+V3YTLkdx4/2RinD7BSekUKNAnHSTVn29VgEsG8
         Iq8Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743542479; x=1744147279;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=brQMt7KRwFhUPNaYkRwQiw3naGxlWQjOv0I1qKaBsaM=;
        b=IwxgHqsurQKLD3XQ7O3yhQycdP+cYef/QpU/Nxr4fcr61yAxOX5aHX9fAMjzmxbnqq
         jiBG23nLwgf4NwabXJM/n75Gyq9XZY9k7Ca0btoN2Tgiwxy/mMcMbPQIiwKqNlfANxFl
         LKVQ5uX2VTV2ah+whyz2+yfk3qMn9P0MK90F2WQDqpt6S2RFdCizUod+yRsTsqqS6OBE
         1EMsmGdPgKlB9NAjDe3GUKKco4oR8tlp3wBt83TF+Frm1qgJa36m6Em1PJ4dP5R10Mnw
         Tp3Ej69UOGuQGyobfrkGbrjaWVNryr2vhUPNV6WVKevhaP+vErIWfegPylYPTVY7rjKj
         FLew==
X-Forwarded-Encrypted: i=1; AJvYcCUd4NaMcDUSPYAEupmSy+in9wDD51qHchHayN8H43ObWyVwZF689GhTiG+eCP32O/9X4UR7GDM=@lists.infradead.org
X-Gm-Message-State: AOJu0YzXsB5gxQYn/1kDnu4z0mLLHskZ2ki0cF39BhUob9ZPN9LwNQp3
	x4zuvkst6SXLLPlb8g135clhh2I/yn8vGmjECfgFBHy/feJ7F22MHz5Ff0C+3XNNhF6lzzurl76
	rzu06GiuM5PEzB9aUmldMLABFKyE=
X-Gm-Gg: ASbGnctVX7oGSHZICTGlDz88X06J24cVpX7kyMY2td0/SA6pDFngUYl8YTskKfw65T4
	ajpG6ncgHGjKHW5+xeVvu273qvWtb1HDtbLiMvd5agd0T2Us28EVeNyLWlWLLYXTmrs/EoJchtR
	/8MY48JNw6RsU9Z+MIHP2M9JW2
X-Google-Smtp-Source: AGHT+IHdXNWd5eq30kJsTbsYWSieLZ5+j2awy73MHQEiOTSgKk1nYM59UJcyKmdI1traddMuHFFbUC155pHv7hgQpG4=
X-Received: by 2002:a05:600c:138d:b0:43c:f44c:72b7 with SMTP id
 5b1f17b1804b1-43db61ff68bmr147565705e9.14.1743542478516; Tue, 01 Apr 2025
 14:21:18 -0700 (PDT)
MIME-Version: 1.0
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com>
In-Reply-To: <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Tue, 1 Apr 2025 16:21:07 -0500
X-Gm-Features: AQ5f1JoSZf-yy1EmaTbK8BPUbzxITVZm8Kp_D6XmMMWHmn5GIZ4NzT5J0_vT_mY
Message-ID: <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
Subject: Re: ath12k: No 6GHz Wireless found
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-wireless@vger.kernel.org, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_142121_084783_CCF8ABE0 
X-CRM114-Status: GOOD (  21.64  )
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Unsubscribe: <https://lists.infradead.org/mailman/options/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Apr 1, 2025 at 1:53=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> On 3/30/2025 7:28 AM, Walt Holman wrote:
> > Hello,
> >
> > I have a wcn7850 hw2.0 based m.2 wireless card in my laptop and am
> > unable to see or connect to 6Ghz networks. I have an ASUS BE30000 wifi
> > router setup with a separate 6ghz only network, which my phone and
> > other laptops can connect to. I'm unable to even see this network on
> > this particular laptop. Months ago (maybe September), I could see it
> > occasionally, but now it never shows up. I'm using firmware from
> > git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.g=
it
> > and track the kernels pretty closely. I'm currently running 6.14.0
> > built from source. Any suggestions? Some HW info is below:
> >
> > 63:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi
> > 7(802.11be) 320MHz 2x2 [FastConnect 7800
> > ] (rev 01)
> >        Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
> >        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> > ParErr- Stepping- SERR- FastB2B- DisINTx+
> >        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbort+
> > <TAbort- <MAbort- >SERR- <PERR- INTx-
> >        Latency: 0, Cache Line Size: 64 bytes
> >        Interrupt: pin ? routed to IRQ 111
> >        IOMMU group: 19
> >        Region 0: Memory at dd800000 (64-bit, non-prefetchable) [size=3D=
2M]
> >        Capabilities: [40] Power Management version 3
> >                Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
> > PME(D0+,D1-,D2-,D3hot+,D3cold+)
> >                Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0 PM=
E-
> >        Capabilities: [50] MSI: Enable+ Count=3D16/32 Maskable+ 64bit-
> >                Address: fee00000  Data: 0000
> >                Masking: ffff8000  Pending: 00000000
> >        Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> >                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
> > unlimited, L1 unlimited
> >                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> > SlotPowerLimit 75W TEE-IO-
> >                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> >                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> >                        MaxPayload 128 bytes, MaxReadReq 512 bytes
> >                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
> > AuxPwr+ TransPend-
> >                LnkCap: Port #0, Speed 8GT/s, Width x2, ASPM L0s L1,
> > Exit Latency L0s <1us, L1 <64us
> >                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
> >                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommC=
lk+
> >                        ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt-
> >                LnkSta: Speed 8GT/s, Width x1 (downgraded)
> >                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt=
-
> >                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
> > NROPrPrP- LTR+
> >                         10BitTagComp- 10BitTagReq- OBFF Not Supported,
> > ExtFmt- EETLPPrefix-
> >                         EmergencyPowerReduction Not Supported,
> > EmergencyPowerReductionInit-
> >                         FRS- TPHComp+ ExtTPHComp-
> >                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> >                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
> >                         AtomicOpsCtl: ReqEn-
> >                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionR=
eq-
> >                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> >                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
> > Retimer- 2Retimers- DRS-
> >                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- Spee=
dDis-
> >                         Transmit Margin: Normal Operating Range,
> > EnterModifiedCompliance- ComplianceSOS-
> >                         Compliance Preset/De-emphasis: -6dB
> > de-emphasis, 0dB preshoot
> >                LnkSta2: Current De-emphasis Level: -3.5dB,
> > EqualizationComplete+ EqualizationPhase1+
> >                         EqualizationPhase2+ EqualizationPhase3+
> > LinkEqualizationRequest-
> >                         Retimer- 2Retimers- CrosslinkRes: unsupported
> >        Capabilities: [100 v2] Advanced Error Reporting
> >                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> > UnxCmplt- RxOF- MalfTLP-
> >                        ECRC- UnsupReq- ACSViol- UncorrIntErr-
> > BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> > MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> > UnxCmplt- RxOF- MalfTLP-
> >                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
> > BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> > MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
> > UnxCmplt- RxOF+ MalfTLP+
> >                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
> > BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> > MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> > AdvNonFatalErr- CorrIntErr- HeaderOF-
> >                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> > AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> >                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
> > ECRCChkCap+ ECRCChkEn-
> >                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogC=
ap-
> >                HeaderLog: 00000000 00000000 00000000 00000000
> >        Capabilities: [148 v1] Secondary PCI Express
> >                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> >                LaneErrStat: 0
> >        Capabilities: [158 v1] Transaction Processing Hints
> >                No steering table available
> >        Capabilities: [1e4 v1] Latency Tolerance Reporting
> >                Max snoop latency: 1048576ns
> >                Max no snoop latency: 1048576ns
> >        Capabilities: [1ec v1] L1 PM Substates
> >                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
> > ASPM_L1.1+ L1_PM_Substates+
> >                          PortCommonModeRestoreTime=3D70us PortTPowerOnT=
ime=3D0us
> >                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.=
1+
> >                           T_CommonMode=3D0us LTR1.2_Threshold=3D166912n=
s
> >                L1SubCtl2: T_PwrOn=3D90us
> >        Kernel driver in use: ath12k_pci
> >        Kernel modules: ath12k
> >
> > root@walt-ROG-zephyrus:~# iw reg get
> > global
> > country US: DFS-FCC
> >         (902 - 904 @ 2), (N/A, 30), (N/A)
> >         (904 - 920 @ 16), (N/A, 30), (N/A)
> >         (920 - 928 @ 8), (N/A, 30), (N/A)
> >         (2400 - 2472 @ 40), (N/A, 30), (N/A)
> >         (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
> >         (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
> >         (5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
> >         (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
> >         (5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, PASS=
IVE-SCAN
> >         (5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
> >         (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> >
> > phy#0 (self-managed)
> > country na: DFS-UNSET
> >         (2402 - 2472 @ 40), (N/A, 20), (N/A)
> >         (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> >         (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >         (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >         (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >         (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PASSIVE-SCAN
> >
>
> I added the ath12k list to make sure this has the proper attention.
> Since you are building from source, can you please test with the followin=
g patch:
> https://msgid.link/20250401020840.357-1-quic_kangyang@quicinc.com
>
> This is in my pending queue.
>
> /jeff
>

Hi Jeff,

No dice on the 6Ghz networks. It fixed up the registration info, but I
still don't see any 6Ghz networks. Even from an 'iw wlp99s0 scan'

global
country US: DFS-FCC
       (902 - 904 @ 2), (N/A, 30), (N/A)
       (904 - 920 @ 16), (N/A, 30), (N/A)
       (920 - 928 @ 8), (N/A, 30), (N/A)
       (2400 - 2472 @ 40), (N/A, 30), (N/A)
       (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
       (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
       (5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
       (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
       (5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, PASSIVE-S=
CAN
       (5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
       (57240 - 71000 @ 2160), (N/A, 40), (N/A)

phy#0 (self-managed)
country US: DFS-FCC
       (2402 - 2472 @ 40), (6, 30), (N/A)
       (5170 - 5250 @ 80), (6, 24), (N/A), AUTO-BW
       (5250 - 5330 @ 80), (6, 24), (0 ms), DFS, AUTO-BW
       (5490 - 5730 @ 160), (6, 24), (0 ms), DFS, AUTO-BW
       (5735 - 5855 @ 80), (6, 30), (N/A), AUTO-BW
       (5855 - 5925 @ 40), (6, 30), (N/A), NO-OUTDOOR, AUTO-BW
       (5925 - 7125 @ 320), (N/A, 30), (N/A), NO-OUTDOOR, AUTO-BW


-Walt

