Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B983FC28B20
	for <ath12k@archiver.kernel.org>; Wed,  2 Apr 2025 17:51:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88DKgZh+hbKmrBXZ9bz7zcaMZHz1U1BcV0zNz6QsSUk=; b=ojgqiqmcdZfy9JDzVPOcZvFVco
	Bef3SCX+m4IbmL6mCkaz5/wj30hRX8jHowYRLnts2WaiKdOs28Hgw7pqYS9NU5H5FI4YAd9X1U8At
	Y7t9kjN2es1Q+f2JNzSxmDuYhLdCJb19zusqihzXGXzYP7QG9eMYExsHkpQguY/6eUKFEMAlIIb2D
	PypFlKN9gVSpJXrddswR304KadcDp8qO9tIx5dW1YJWEq4kmIsB9gBsSxd9yPlOmuTxhSz+32STm1
	afP/kywMPq7tOKt2iW2U9EyDVHwuaXF/6vxXFyq32+6kRlD2GflBt21Ewyggt3hnNGD10BPUCUhVf
	1e94rYfg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02FA-00000006qMY-28yB
	for ath12k@archiver.kernel.org;
	Wed, 02 Apr 2025 17:51:16 +0000
Received: from mail-wr1-x430.google.com ([2a00:1450:4864:20::430])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u02F7-00000006qKQ-07KQ
	for ath12k@lists.infradead.org;
	Wed, 02 Apr 2025 17:51:14 +0000
Received: by mail-wr1-x430.google.com with SMTP id ffacd0b85a97d-3995ff6b066so48252f8f.3
        for <ath12k@lists.infradead.org>; Wed, 02 Apr 2025 10:51:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1743616271; x=1744221071; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=88DKgZh+hbKmrBXZ9bz7zcaMZHz1U1BcV0zNz6QsSUk=;
        b=eMCX276rm8arJXazowu27CCFBl/oFmhS8WPFOWnyS8cbg+Jgj/Y3YY82xW0Co4XRMQ
         iP9BSMzve51p+VGvevC9Dxx72vn6kxTku/7/Uw6ks7ASSESL0x7s7E10LgOii9wPswbG
         Y6HxpuhfQnEtp6eGtSkLgYHBWMZnXLS/UOFdlIgfsI4Q/aKEsqKiAEhHSGgfA4SVhCc9
         EHe4bcTnloTKF5oJPWYVpCMaWX6U6DHyXjdu/fGdGCSusST64gRxU1CGlTrWm31bKZ3Y
         fkHmUl5VpuSNkHLL3My9vFa0LgZKQJTZ+Z4wx0W0FSO7xAieiM/0K4B7D7LPdXdHOv2V
         OkKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743616271; x=1744221071;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=88DKgZh+hbKmrBXZ9bz7zcaMZHz1U1BcV0zNz6QsSUk=;
        b=myJ0sBmqoaECOGyY9r7CGicTwxp9XSwt3Db1Ot6MeNpKkjm55z8S1GMGJgIa1y+yHG
         97+J8dhPS/wkXpnFniJTXssagLXxJf1ep8kjRxxiEP30CzQWVfoawuoMgS2yPxH/3E2l
         Bj3cSYoYgNR0chPU5FZ0Tk009wqpt9OY24nXZ7dm5mVbo1QGMzZiqnrYDYbnxzX45Eok
         AWGAPD+m3b2SpsXyxp3JQOmpadrTlEJoZ6gdzb3Jf5Jb9ay2QcSor8K/Qqk3AYVNEm3D
         1RQqLEgT0vhtcWFnp2FhOtlFgoDadbEhtTAmMe0R8Q1ullvdb4QE1yfRAktJzRVOWbS1
         USKw==
X-Forwarded-Encrypted: i=1; AJvYcCUx66RYBC0HvCCG5Rg8CSvdx2FOMHzkurFOWbyn0ZSG6u4adBBTMTdmdF62VJA3BXgGyJAGwsY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yyv+r2TMImDpg1UOzD6lbpJJtAJAWIP+ThcswdbZq4m9P3F/wAw
	iDNLMF8eLaxB0dSxQZmdFS1p9NeTAPZ20QfK4DrOLMHsfqorTVumK8dZc5fIgN2tXAN64uMGSQf
	4njydUFq6ZDp1p3WgO2stKLDk/fGXT8SN
X-Gm-Gg: ASbGnctvZKTQIPfgC0GYe3AYUstPppflh3b389GtZPV/UAUbnxvxMhNRJ0ATWytkXF/
	toiJyYTdRMdglBGd7pfvi9cDy/vI528UgjR5WENBgNISj6NFCzHvolq91QtAIhKTySBka8JrKy8
	fs75+Dd4uijvv8TVKSbsCEVr0a
X-Google-Smtp-Source: AGHT+IF7Bxnij6eOzKakh4ZD23IxBFYpKtdGUfocBNUUc0cnlgTNdSmCu0odAAJocOjlPidWQQMir4/vHr+iq3fosws=
X-Received: by 2002:a05:6000:381:b0:39c:1f0a:ee0 with SMTP id
 ffacd0b85a97d-39c1f0a0f69mr8810844f8f.2.1743616271004; Wed, 02 Apr 2025
 10:51:11 -0700 (PDT)
MIME-Version: 1.0
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com> <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
In-Reply-To: <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Wed, 2 Apr 2025 12:50:59 -0500
X-Gm-Features: AQ5f1JrdtxaAkq5bIKmbENCXzuYO6a-5yzjfw0l4A8Q9w8Rv0MC8NX73lQlYNE4
Message-ID: <CAMb39_kcv7QR5rw8Y=zaEd2gLNYbZVnjSBPNJdm0izQwoLPvZQ@mail.gmail.com>
Subject: Re: ath12k: No 6GHz Wireless found
To: Kang Yang <quic_kangyang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_105113_070424_68581B07 
X-CRM114-Status: GOOD (  28.76  )
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

Almost forgot. I've been running Kubuntu 24.10 until recently and am
now running the Beta of Kubuntu 25.04, which is the most recent
version available. My wpa_supplicant is built with 6Ghz support as I'm
running this OS on my other machines and both of them can connect to
my 6Ghz network. They are using different chipsets of course.

-Walt

On Tue, Apr 1, 2025 at 9:48=E2=80=AFPM Kang Yang <quic_kangyang@quicinc.com=
> wrote:
>
>
>
> On 4/2/2025 5:21 AM, Walt Holman wrote:
> > On Tue, Apr 1, 2025 at 1:53=E2=80=AFPM Jeff Johnson
> > <jeff.johnson@oss.qualcomm.com> wrote:
> >>
> >> On 3/30/2025 7:28 AM, Walt Holman wrote:
> >>> Hello,
> >>>
> >>> I have a wcn7850 hw2.0 based m.2 wireless card in my laptop and am
> >>> unable to see or connect to 6Ghz networks. I have an ASUS BE30000 wif=
i
> >>> router setup with a separate 6ghz only network, which my phone and
> >>> other laptops can connect to. I'm unable to even see this network on
> >>> this particular laptop. Months ago (maybe September), I could see it
> >>> occasionally, but now it never shows up. I'm using firmware from
> >>> git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware=
.git
> >>> and track the kernels pretty closely. I'm currently running 6.14.0
> >>> built from source. Any suggestions? Some HW info is below:
> >>>
> >>> 63:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi
> >>> 7(802.11be) 320MHz 2x2 [FastConnect 7800
> >>> ] (rev 01)
> >>>         Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
> >>>         Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> >>> ParErr- Stepping- SERR- FastB2B- DisINTx+
> >>>         Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=3Dfast >TAbo=
rt+
> >>> <TAbort- <MAbort- >SERR- <PERR- INTx-
> >>>         Latency: 0, Cache Line Size: 64 bytes
> >>>         Interrupt: pin ? routed to IRQ 111
> >>>         IOMMU group: 19
> >>>         Region 0: Memory at dd800000 (64-bit, non-prefetchable) [size=
=3D2M]
> >>>         Capabilities: [40] Power Management version 3
> >>>                 Flags: PMEClk- DSI- D1- D2- AuxCurrent=3D0mA
> >>> PME(D0+,D1-,D2-,D3hot+,D3cold+)
> >>>                 Status: D0 NoSoftRst+ PME-Enable- DSel=3D0 DScale=3D0=
 PME-
> >>>         Capabilities: [50] MSI: Enable+ Count=3D16/32 Maskable+ 64bit=
-
> >>>                 Address: fee00000  Data: 0000
> >>>                 Masking: ffff8000  Pending: 00000000
> >>>         Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
> >>>                 DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0=
s
> >>> unlimited, L1 unlimited
> >>>                         ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLRese=
t-
> >>> SlotPowerLimit 75W TEE-IO-
> >>>                 DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
> >>>                         RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
> >>>                         MaxPayload 128 bytes, MaxReadReq 512 bytes
> >>>                 DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
> >>> AuxPwr+ TransPend-
> >>>                 LnkCap: Port #0, Speed 8GT/s, Width x2, ASPM L0s L1,
> >>> Exit Latency L0s <1us, L1 <64us
> >>>                         ClockPM- Surprise- LLActRep- BwNot- ASPMOptCo=
mp+
> >>>                 LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- Co=
mmClk+
> >>>                         ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt=
-
> >>>                 LnkSta: Speed 8GT/s, Width x1 (downgraded)
> >>>                         TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWM=
gmt-
> >>>                 DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
> >>> NROPrPrP- LTR+
> >>>                          10BitTagComp- 10BitTagReq- OBFF Not Supporte=
d,
> >>> ExtFmt- EETLPPrefix-
> >>>                          EmergencyPowerReduction Not Supported,
> >>> EmergencyPowerReductionInit-
> >>>                          FRS- TPHComp+ ExtTPHComp-
> >>>                          AtomicOpsCap: 32bit- 64bit- 128bitCAS-
> >>>                 DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis=
-
> >>>                          AtomicOpsCtl: ReqEn-
> >>>                          IDOReq- IDOCompl- LTR+ EmergencyPowerReducti=
onReq-
> >>>                          10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
> >>>                 LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
> >>> Retimer- 2Retimers- DRS-
> >>>                 LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- S=
peedDis-
> >>>                          Transmit Margin: Normal Operating Range,
> >>> EnterModifiedCompliance- ComplianceSOS-
> >>>                          Compliance Preset/De-emphasis: -6dB
> >>> de-emphasis, 0dB preshoot
> >>>                 LnkSta2: Current De-emphasis Level: -3.5dB,
> >>> EqualizationComplete+ EqualizationPhase1+
> >>>                          EqualizationPhase2+ EqualizationPhase3+
> >>> LinkEqualizationRequest-
> >>>                          Retimer- 2Retimers- CrosslinkRes: unsupporte=
d
> >>>         Capabilities: [100 v2] Advanced Error Reporting
> >>>                 UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> >>> UnxCmplt- RxOF- MalfTLP-
> >>>                         ECRC- UnsupReq- ACSViol- UncorrIntErr-
> >>> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >>>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> >>> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >>>                 UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> >>> UnxCmplt- RxOF- MalfTLP-
> >>>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+
> >>> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >>>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> >>> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >>>                 UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
> >>> UnxCmplt- RxOF+ MalfTLP+
> >>>                         ECRC- UnsupReq- ACSViol- UncorrIntErr+
> >>> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
> >>>                         PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> >>> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
> >>>                 CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> >>> AdvNonFatalErr- CorrIntErr- HeaderOF-
> >>>                 CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> >>> AdvNonFatalErr+ CorrIntErr+ HeaderOF+
> >>>                 AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenE=
n-
> >>> ECRCChkCap+ ECRCChkEn-
> >>>                         MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrL=
ogCap-
> >>>                 HeaderLog: 00000000 00000000 00000000 00000000
> >>>         Capabilities: [148 v1] Secondary PCI Express
> >>>                 LnkCtl3: LnkEquIntrruptEn- PerformEqu-
> >>>                 LaneErrStat: 0
> >>>         Capabilities: [158 v1] Transaction Processing Hints
> >>>                 No steering table available
> >>>         Capabilities: [1e4 v1] Latency Tolerance Reporting
> >>>                 Max snoop latency: 1048576ns
> >>>                 Max no snoop latency: 1048576ns
> >>>         Capabilities: [1ec v1] L1 PM Substates
> >>>                 L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
> >>> ASPM_L1.1+ L1_PM_Substates+
> >>>                           PortCommonModeRestoreTime=3D70us PortTPower=
OnTime=3D0us
> >>>                 L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_=
L1.1+
> >>>                            T_CommonMode=3D0us LTR1.2_Threshold=3D1669=
12ns
> >>>                 L1SubCtl2: T_PwrOn=3D90us
> >>>         Kernel driver in use: ath12k_pci
> >>>         Kernel modules: ath12k
> >>>
> >>> root@walt-ROG-zephyrus:~# iw reg get
> >>> global
> >>> country US: DFS-FCC
> >>>          (902 - 904 @ 2), (N/A, 30), (N/A)
> >>>          (904 - 920 @ 16), (N/A, 30), (N/A)
> >>>          (920 - 928 @ 8), (N/A, 30), (N/A)
> >>>          (2400 - 2472 @ 40), (N/A, 30), (N/A)
> >>>          (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
> >>>          (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
> >>>          (5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
> >>>          (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
> >>>          (5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, P=
ASSIVE-SCAN
> >>>          (5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-S=
CAN
> >>>          (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> >>>
> >>> phy#0 (self-managed)
> >>> country na: DFS-UNSET
> >>>          (2402 - 2472 @ 40), (N/A, 20), (N/A)
> >>>          (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
> >>>          (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >>>          (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >>>          (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
> >>>          (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PASSIVE-SCAN
> >>>
> >>
> >> I added the ath12k list to make sure this has the proper attention.
> >> Since you are building from source, can you please test with the follo=
wing patch:
> >> https://msgid.link/20250401020840.357-1-quic_kangyang@quicinc.com
> >>
> >> This is in my pending queue.
> >>
> >> /jeff
> >>
> >
> > Hi Jeff,
> >
> > No dice on the 6Ghz networks. It fixed up the registration info, but I
> > still don't see any 6Ghz networks. Even from an 'iw wlp99s0 scan'
> >
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
> > country US: DFS-FCC
> >         (2402 - 2472 @ 40), (6, 30), (N/A)
> >         (5170 - 5250 @ 80), (6, 24), (N/A), AUTO-BW
> >         (5250 - 5330 @ 80), (6, 24), (0 ms), DFS, AUTO-BW
> >         (5490 - 5730 @ 160), (6, 24), (0 ms), DFS, AUTO-BW
> >         (5735 - 5855 @ 80), (6, 30), (N/A), AUTO-BW
> >         (5855 - 5925 @ 40), (6, 30), (N/A), NO-OUTDOOR, AUTO-BW
> >         (5925 - 7125 @ 320), (N/A, 30), (N/A), NO-OUTDOOR, AUTO-BW
> >
> >
>
> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
> I can get 6 GHz AP and connect to it.
>
> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_timestamp
> 2023-12-06 04:05 fw_build_id
> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILI=
CONZ-3
>
> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
> BSS 62:03:7f:12:64:64(on wls1) -- associated
>          TSF: 606308271476 usec (7d, 00:25:08)
>          freq: 6275
>          beacon interval: 100 TUs
>          capability: ESS Privacy SpectrumMgmt ShortSlotTime (0x0511)
>          signal: -17.00 dBm
>          last seen: 52 ms ago
>          Information elements from Probe Response frame:
>          SSID: MLO-KANG-6G
> and other 6 GHz APs:
>         SSID: 6G-gxia
>         SSID: NETGEAR97-6G
>         =E2=80=A6=E2=80=A6
>
>
> kernel log:
> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (local
> address=3D00:03:7f:37:12:54)
> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
> [88158.041895] wls1: authenticated
> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
> [88158.044291] wls1: determined local STA to be EHT, BW limited to 320 MH=
z
> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1/3)
> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (capab=3D0x511
> status=3D0 aid=3D4)
> [88158.089090] wls1: associated
>
> I can even connect to it by Ubuntu GUI.
>
> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also please make
> sure that your wpa_supplicant/iw support 6 GHz(or directly update to the
> latest version).
>
> If you still cannot find 6 GHz AP, you can set debug_mask to 0xffffffff
> to get ath12k logs. Then give it to us.
>
>
> > -Walt
> >
>

