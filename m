Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 07E20C36010
	for <ath12k@archiver.kernel.org>; Tue,  1 Apr 2025 18:53:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZL/4Ftqz6yzUn3vEr32CCIHToFFqUPz99VyHyh4xkCI=; b=45oePLJKVjYy6bgeHNT7eMpqaa
	mNM+qyrgiQ8UEz9gHF+J1JixjNIz8cw0aRFWI312Vm3ZSCGgJ1QmjqEmtAbuHgEpM++VHgi9z14us
	/+Z9TpCyF2JW3dcI1FN1v6Ifd2oWRhZNWTncHtJPB/+Fu1P5NrNYq9ePD9PvMcBMI62tuaxanIChp
	lnptyM+QoGUG8d9JyaeKMe3WJWD8a09E81oUduEZHEU2AqXi6aRArWdFjoHBal7FKTZOLeBQQGbyv
	G13SkDG1AEcE1NhF4COFytc781p0IxLQiWEcwJ4QZpjTNevIAdeywJpabFCmW5uzRqFKQ4mLUqnrT
	MZE3w8fA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzgjl-00000004Agh-2w4m
	for ath12k@archiver.kernel.org;
	Tue, 01 Apr 2025 18:53:25 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzgjj-00000004AgN-2dMj
	for ath12k@lists.infradead.org;
	Tue, 01 Apr 2025 18:53:25 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 531APcEe030908
	for <ath12k@lists.infradead.org>; Tue, 1 Apr 2025 18:53:22 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	ZL/4Ftqz6yzUn3vEr32CCIHToFFqUPz99VyHyh4xkCI=; b=cV/5FeIHc+qrm86X
	AF8L7HvzePLLgi7syLzCP1PpcPmjzpO1tCZI2qlfYoVJMZLv4LcC7MoUHlvXJkBK
	FBe55ZilojHUYLM4Dat5sYjNuFWOOJrYUJePVDk0WzercaKgZ0qLUBdIo8czGGcV
	yiQbYBxO+PaM2zGC77pdSyuhSxy99kmPc4lWlSxipNnQrVITGQn39yGcq/LpTu9u
	yPInAHjgRYLfoUhcFLJHeiwwsJxBtA3Fg52iw6b0+fe57cndvumz8/bhVTHO0kSg
	zLNISHfi+SiCLem8nk/KQETe2miQ55Hlu/SsZUJwumfJke9DiFV+v3EWwG2vQrYU
	2wuCjw==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 45recphcjx-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 18:53:22 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-2265a09dbfcso10463315ad.0
        for <ath12k@lists.infradead.org>; Tue, 01 Apr 2025 11:53:22 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743533602; x=1744138402;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZL/4Ftqz6yzUn3vEr32CCIHToFFqUPz99VyHyh4xkCI=;
        b=n1oHwSKE3aFZTtXKYdLSJSESMz9m3IliWKfauP1uR1YhSiaXLg2/IesmM60jG4/HGJ
         iYXV/gGowQKNi1sPvRGLYGjiPoFvimcj7Wvw/9PCShjvFzyCJZnQaXNS6xXLSDDoMpRk
         cmJmCKpz6nuqzDFNl23J+QOo91SSuPiwlzx7W0rgu5I4MlRll54nXZ/jqVcXViLJxdW0
         tOETpF5tFVoCNMWE1OoxNm8kzExOAzzCsKHE8jsQIuH/2VtBOcRi/Eh1Ib7Ol7wZqfp5
         fbqtQLgzmxHqwMOCKjROug2hYG5HFWqsm3dnfMz/jcQmj/KnEwD0w3zcR16VuCZKs5A7
         6CIg==
X-Forwarded-Encrypted: i=1; AJvYcCUHCtgdBFdww00VjSzI7sySqcHC+AIan1xQUbYgaskm4mzEi4nNYYQhXV6NDSVa1pHsjWA7gEU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxV+UEC/CbY5Ws/q3trGqrOTznFu0qLIzLhJxFPe4w0NXQQWqG4
	J+qK8rukJnhS7VFSxl2VNHJ3OJwN4b/8sVPHHtkA8l9NdL8u3bEXK3E7Vcsx+ryRYbQ3H3j4ZKC
	9mzHc4IEw0NcgRisKmdoOe+HXUNrpuFbMzMe7ZNeWboWqAnlVwhSPBHzDgZEd
X-Gm-Gg: ASbGncvFOPR86NXGL/HJjMlJOGkArf4BwFRkQJYmKFI+HkBby+y1nW2nlJhMTdMAMa1
	HFPEfy+0w63e55IhOXHq4OnB7UPcDg5mDxnoIIzxXxWrryNiUiOl97xtqECAXX744PThmtOxuiD
	K7wypF22YK4H2iT8EZYnEI4NtkWK06DPxjWLr6rnnLVsOuY7Zm4ny3NWpw+WIWIK5ivTo22LF8e
	r7hsaDNqH01CxMp3jtmAV/NX3cF5p4TZHcHDiIBJnRNmCeLcRiIpwoFn2FXXS4pF9apRGhDjspF
	cm12w107QCfxbr1Qbr7s+RWLHBX3Ahp4qfK7QOB916MWyUD5W/G6jWpDyV/CokP0Ipyg9Eo=
X-Received: by 2002:a05:6a00:1152:b0:736:ab21:8a69 with SMTP id d2e1a72fcca58-73980011f9emr21026387b3a.0.1743533601549;
        Tue, 01 Apr 2025 11:53:21 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFMQEXHpi6stTMJfC35tSSD13kibCPgrZLWk8XYa/x7oecvtFu/dglqbCm5380gaoR9gIAuYQ==
X-Received: by 2002:a05:6a00:1152:b0:736:ab21:8a69 with SMTP id d2e1a72fcca58-73980011f9emr21026350b3a.0.1743533600927;
        Tue, 01 Apr 2025 11:53:20 -0700 (PDT)
Received: from [10.227.110.203] (i-global254.qualcomm.com. [199.106.103.254])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-73970e2b296sm9334628b3a.71.2025.04.01.11.53.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 01 Apr 2025 11:53:20 -0700 (PDT)
Message-ID: <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com>
Date: Tue, 1 Apr 2025 11:53:19 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: ath12k: No 6GHz Wireless found
To: Walt Holman <waltholman09@gmail.com>, linux-wireless@vger.kernel.org,
        "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
From: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: Dl9bc-vSizUqbOmkkcTl8pf0F4QL5s7g
X-Proofpoint-ORIG-GUID: Dl9bc-vSizUqbOmkkcTl8pf0F4QL5s7g
X-Authority-Analysis: v=2.4 cv=J4Sq7BnS c=1 sm=1 tr=0 ts=67ec3622 cx=c_pps a=JL+w9abYAAE89/QcEU+0QA==:117 a=JYp8KDb2vCoCEuGobkYCKw==:17 a=IkcTkHD0fZMA:10 a=XR8D0OoHHMoA:10 a=bC-a23v3AAAA:8 a=COk6AnOGAAAA:8 a=VwQbUJbxAAAA:8 a=jjLhybl4US9ETGpZeO0A:9
 a=QEXdDO2ut3YA:10 a=-FEs8UIgK8oA:10 a=324X-CrmTo6CU4MGRt3R:22 a=FO4_E8m0qiDe52t0p3_H:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1095,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-04-01_07,2025-04-01_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 priorityscore=1501
 clxscore=1015 bulkscore=0 mlxlogscore=999 malwarescore=0 mlxscore=0
 spamscore=0 phishscore=0 suspectscore=0 impostorscore=0 lowpriorityscore=0
 adultscore=0 classifier=spam authscore=0 authtc=n/a authcc= route=outbound
 adjust=0 reason=mlx scancount=1 engine=8.19.0-2502280000
 definitions=main-2504010116
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_115323_697349_186C7C4A 
X-CRM114-Status: GOOD (  17.95  )
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

On 3/30/2025 7:28 AM, Walt Holman wrote:
> Hello,
> 
> I have a wcn7850 hw2.0 based m.2 wireless card in my laptop and am
> unable to see or connect to 6Ghz networks. I have an ASUS BE30000 wifi
> router setup with a separate 6ghz only network, which my phone and
> other laptops can connect to. I'm unable to even see this network on
> this particular laptop. Months ago (maybe September), I could see it
> occasionally, but now it never shows up. I'm using firmware from
> git://git.kernel.org/pub/scm/linux/kernel/git/firmware/linux-firmware.git
> and track the kernels pretty closely. I'm currently running 6.14.0
> built from source. Any suggestions? Some HW info is below:
> 
> 63:00.0 Network controller: Qualcomm Technologies, Inc WCN785x Wi-Fi
> 7(802.11be) 320MHz 2x2 [FastConnect 7800
> ] (rev 01)
>        Subsystem: Quectel Wireless Solutions Co., Ltd. Device 8000
>        Control: I/O- Mem+ BusMaster+ SpecCycle- MemWINV- VGASnoop-
> ParErr- Stepping- SERR- FastB2B- DisINTx+
>        Status: Cap+ 66MHz- UDF- FastB2B- ParErr- DEVSEL=fast >TAbort+
> <TAbort- <MAbort- >SERR- <PERR- INTx-
>        Latency: 0, Cache Line Size: 64 bytes
>        Interrupt: pin ? routed to IRQ 111
>        IOMMU group: 19
>        Region 0: Memory at dd800000 (64-bit, non-prefetchable) [size=2M]
>        Capabilities: [40] Power Management version 3
>                Flags: PMEClk- DSI- D1- D2- AuxCurrent=0mA
> PME(D0+,D1-,D2-,D3hot+,D3cold+)
>                Status: D0 NoSoftRst+ PME-Enable- DSel=0 DScale=0 PME-
>        Capabilities: [50] MSI: Enable+ Count=16/32 Maskable+ 64bit-
>                Address: fee00000  Data: 0000
>                Masking: ffff8000  Pending: 00000000
>        Capabilities: [70] Express (v2) Endpoint, IntMsgNum 0
>                DevCap: MaxPayload 128 bytes, PhantFunc 0, Latency L0s
> unlimited, L1 unlimited
>                        ExtTag- AttnBtn- AttnInd- PwrInd- RBE+ FLReset-
> SlotPowerLimit 75W TEE-IO-
>                DevCtl: CorrErr+ NonFatalErr+ FatalErr+ UnsupReq+
>                        RlxdOrd+ ExtTag- PhantFunc- AuxPwr- NoSnoop+
>                        MaxPayload 128 bytes, MaxReadReq 512 bytes
>                DevSta: CorrErr- NonFatalErr- FatalErr- UnsupReq-
> AuxPwr+ TransPend-
>                LnkCap: Port #0, Speed 8GT/s, Width x2, ASPM L0s L1,
> Exit Latency L0s <1us, L1 <64us
>                        ClockPM- Surprise- LLActRep- BwNot- ASPMOptComp+
>                LnkCtl: ASPM L1 Enabled; RCB 64 bytes, LnkDisable- CommClk+
>                        ExtSynch+ ClockPM- AutWidDis- BWInt- AutBWInt-
>                LnkSta: Speed 8GT/s, Width x1 (downgraded)
>                        TrErr- Train- SlotClk+ DLActive- BWMgmt- ABWMgmt-
>                DevCap2: Completion Timeout: Range ABCD, TimeoutDis+
> NROPrPrP- LTR+
>                         10BitTagComp- 10BitTagReq- OBFF Not Supported,
> ExtFmt- EETLPPrefix-
>                         EmergencyPowerReduction Not Supported,
> EmergencyPowerReductionInit-
>                         FRS- TPHComp+ ExtTPHComp-
>                         AtomicOpsCap: 32bit- 64bit- 128bitCAS-
>                DevCtl2: Completion Timeout: 50us to 50ms, TimeoutDis-
>                         AtomicOpsCtl: ReqEn-
>                         IDOReq- IDOCompl- LTR+ EmergencyPowerReductionReq-
>                         10BitTagReq- OBFF Disabled, EETLPPrefixBlk-
>                LnkCap2: Supported Link Speeds: 2.5-8GT/s, Crosslink-
> Retimer- 2Retimers- DRS-
>                LnkCtl2: Target Link Speed: 8GT/s, EnterCompliance- SpeedDis-
>                         Transmit Margin: Normal Operating Range,
> EnterModifiedCompliance- ComplianceSOS-
>                         Compliance Preset/De-emphasis: -6dB
> de-emphasis, 0dB preshoot
>                LnkSta2: Current De-emphasis Level: -3.5dB,
> EqualizationComplete+ EqualizationPhase1+
>                         EqualizationPhase2+ EqualizationPhase3+
> LinkEqualizationRequest-
>                         Retimer- 2Retimers- CrosslinkRes: unsupported
>        Capabilities: [100 v2] Advanced Error Reporting
>                UESta:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> UnxCmplt- RxOF- MalfTLP-
>                        ECRC- UnsupReq- ACSViol- UncorrIntErr-
> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                UEMsk:  DLP- SDES- TLP- FCP- CmpltTO- CmpltAbrt-
> UnxCmplt- RxOF- MalfTLP-
>                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                UESvrt: DLP+ SDES+ TLP- FCP+ CmpltTO- CmpltAbrt-
> UnxCmplt- RxOF+ MalfTLP+
>                        ECRC- UnsupReq- ACSViol- UncorrIntErr+
> BlockedTLP- AtomicOpBlocked- TLPBlockedErr-
>                        PoisonTLPBlocked- DMWrReqBlocked- IDECheck-
> MisIDETLP- PCRC_CHECK- TLPXlatBlocked-
>                CESta:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> AdvNonFatalErr- CorrIntErr- HeaderOF-
>                CEMsk:  RxErr- BadTLP- BadDLLP- Rollover- Timeout-
> AdvNonFatalErr+ CorrIntErr+ HeaderOF+
>                AERCap: First Error Pointer: 00, ECRCGenCap+ ECRCGenEn-
> ECRCChkCap+ ECRCChkEn-
>                        MultHdrRecCap- MultHdrRecEn- TLPPfxPres- HdrLogCap-
>                HeaderLog: 00000000 00000000 00000000 00000000
>        Capabilities: [148 v1] Secondary PCI Express
>                LnkCtl3: LnkEquIntrruptEn- PerformEqu-
>                LaneErrStat: 0
>        Capabilities: [158 v1] Transaction Processing Hints
>                No steering table available
>        Capabilities: [1e4 v1] Latency Tolerance Reporting
>                Max snoop latency: 1048576ns
>                Max no snoop latency: 1048576ns
>        Capabilities: [1ec v1] L1 PM Substates
>                L1SubCap: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+
> ASPM_L1.1+ L1_PM_Substates+
>                          PortCommonModeRestoreTime=70us PortTPowerOnTime=0us
>                L1SubCtl1: PCI-PM_L1.2+ PCI-PM_L1.1+ ASPM_L1.2+ ASPM_L1.1+
>                           T_CommonMode=0us LTR1.2_Threshold=166912ns
>                L1SubCtl2: T_PwrOn=90us
>        Kernel driver in use: ath12k_pci
>        Kernel modules: ath12k
> 
> root@walt-ROG-zephyrus:~# iw reg get
> global
> country US: DFS-FCC
>         (902 - 904 @ 2), (N/A, 30), (N/A)
>         (904 - 920 @ 16), (N/A, 30), (N/A)
>         (920 - 928 @ 8), (N/A, 30), (N/A)
>         (2400 - 2472 @ 40), (N/A, 30), (N/A)
>         (5150 - 5250 @ 80), (N/A, 23), (N/A), AUTO-BW
>         (5250 - 5350 @ 80), (N/A, 24), (0 ms), DFS, AUTO-BW
>         (5470 - 5730 @ 160), (N/A, 24), (0 ms), DFS
>         (5730 - 5850 @ 80), (N/A, 30), (N/A), AUTO-BW
>         (5850 - 5895 @ 40), (N/A, 27), (N/A), NO-OUTDOOR, AUTO-BW, PASSIVE-SCAN
>         (5925 - 7125 @ 320), (N/A, 12), (N/A), NO-OUTDOOR, PASSIVE-SCAN
>         (57240 - 71000 @ 2160), (N/A, 40), (N/A)
> 
> phy#0 (self-managed)
> country na: DFS-UNSET
>         (2402 - 2472 @ 40), (N/A, 20), (N/A)
>         (2457 - 2482 @ 20), (N/A, 20), (N/A), PASSIVE-SCAN
>         (5170 - 5330 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5490 - 5730 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5735 - 5895 @ 160), (N/A, 20), (N/A), AUTO-BW, PASSIVE-SCAN
>         (5945 - 7125 @ 320), (N/A, 30), (N/A), AUTO-BW, PASSIVE-SCAN
> 

I added the ath12k list to make sure this has the proper attention.
Since you are building from source, can you please test with the following patch:
https://msgid.link/20250401020840.357-1-quic_kangyang@quicinc.com

This is in my pending queue.

/jeff


