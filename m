Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23EB2C369AB
	for <ath12k@archiver.kernel.org>; Fri, 18 Apr 2025 21:18:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iLhknTSKa7QG3Ced6fkSZ5QDkbgf8M9fWFLCJ1iZON4=; b=iwzvluO3GMpZOwA3KND+m5zFqu
	OhWVhds4M+UiFPFil0wIw8A8OhdX01lTSgsFu2zCEcGXEUle4nP0CTz5JOeWKTGdtDt4YHRJXXWQ3
	H8G2CGK9mG09dsjUO61wka1DR3eXm5Hc4T6DFwamxDACnQFqCMMnntQOp0xkb2meE8Z8bd9PajFEF
	W8GyslkWUwEcvU+UabnDdUbOnwbobuT1zhFG9UR3APFt9kmHTLbczROPxzxGSURXQjFQjuvqpaJXO
	JpGPVaKfmHio3rXOHe1yDCs9U+qRneeKTrT8WpIzhv3l+0+sJ3L0AMazv3wtVHzzPdMkw8J5NsrHC
	qua6iOsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5t6J-00000000JKC-3c31;
	Fri, 18 Apr 2025 21:18:19 +0000
Received: from mail-wm1-x32e.google.com ([2a00:1450:4864:20::32e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u5t6H-00000000JIw-0qWX
	for ath12k@lists.infradead.org;
	Fri, 18 Apr 2025 21:18:18 +0000
Received: by mail-wm1-x32e.google.com with SMTP id 5b1f17b1804b1-43cf848528aso17158765e9.2
        for <ath12k@lists.infradead.org>; Fri, 18 Apr 2025 14:18:16 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745011095; x=1745615895; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=iLhknTSKa7QG3Ced6fkSZ5QDkbgf8M9fWFLCJ1iZON4=;
        b=kRJXW45VyWeLwfpKFODqRLAN2+AtxfOZrCJy537acMn+KX1IruSSO9cQgzLSBryuin
         vLQuagHZgPHVl1bX3mP4ItUksAO+ofRPSmSuqBfIrulXMqFo+LulQ10GaDjKepME4P61
         CTuzsj/LRK57cASTX+RVdvQ+RTrHGcmfdpI7bgacmJOUYLWlP8oCPdm8DiFJ43EMBG7o
         6fBpc3Up4abvlhl4eWxl/JCS7JDkxu5zJSqrBn9y0mqg6z8ckgyxIr+yTKXuR7s5HAi0
         EyqmAD1pthplP5gO6Jfu6+xLKXBGHgqMSr2GqarVfg6jE/fcxkfhKAdaoc38EIvOL+FD
         PSUQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745011095; x=1745615895;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=iLhknTSKa7QG3Ced6fkSZ5QDkbgf8M9fWFLCJ1iZON4=;
        b=GiG1S39D1b4Btpp8/O4OGLPMVFvhgvbkSivKNqjwa8yBPISm4WMrKAd79akWtZzoWx
         s0Lg1uZHvMuvZzvIEtsgGfak/5EmjNpJl+QbPc9nJLIe+gx5P2kWYxuWdx5be5tO7dU5
         ETWeOgpIHqy3MP3Ga9lm0whK7iJRIq5Ye3I90IrutixPq2iZ6+xaMIx+MxgkKMnr8v+8
         sPUGXXnqM1Rq6wlcFgNmQSlTtjXkmtiULFrs3FSISMl/CVD6xGJzG74HbswDqvRgGgeH
         +DiyAeXLnbwSBx7H/vuX2bc0gPj3nocmXSsYyDbakzfbafgjNaZzQfICzCK/fj17sbkW
         YTVw==
X-Forwarded-Encrypted: i=1; AJvYcCWIV7VLzcfV9fF9MrYM9jOeatms41ca3moTw50Ah+BHZLfFdyg/qRbp6dkRAqi0iT8T+J//u/8=@lists.infradead.org
X-Gm-Message-State: AOJu0YwaQ8BgiWppPL3/tKr0JbUSpp8aJIs0haSCt7+393c8cxlOaVBq
	qS8+PzIlWpvdfOqwClbMaAoDS+x+371EDlVZCie8oxHhr8UiwOb2GNSAMCVxcvQwVFl3gEJVZuv
	n0ob3Qf4pZU+ezDq7KsmTg0344Lo=
X-Gm-Gg: ASbGnctqbBJ1pEPuBUoT/VZi+HdTaRKJAlJw9QukoNmFQpPRWALR1YDRyV4xIG27PTn
	bxIKK9wyJZfhKdOxg2QqwPzD/2LoGzJMy0UPzPTq8+3Wav9gMDZLeirjqrWrMuxN3dFVnuHxHrp
	9Yp3KGf8Vy5tE/Mu5m25nA
X-Google-Smtp-Source: AGHT+IHJj4mKOnrqc4ce2dDda85++mr1menfi+bEQ650HKCnvrCE2nPrC0otQqiR8xaVHyzrN66ZwYIi9pc2etsTa3M=
X-Received: by 2002:a05:600c:54c7:b0:43d:7a:471f with SMTP id
 5b1f17b1804b1-440707602a9mr15794895e9.18.1745011094578; Fri, 18 Apr 2025
 14:18:14 -0700 (PDT)
MIME-Version: 1.0
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com> <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com> <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com> <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com> <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com> <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com> <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
 <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
In-Reply-To: <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Fri, 18 Apr 2025 16:18:03 -0500
X-Gm-Features: ATxdqUG_x4FXI5tD2Q2Xf0NBq_I8YGF_FK0S94VQEfuOOiUTqcYZbuYfnSY4FA8
Message-ID: <CAMb39_n89hBL_GvfXb7Jw9h5-h-+Qg-3GyqvpahL7MT5ewpvJw@mail.gmail.com>
Subject: Re: ath12k: No 6GHz Wireless found
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250418_141817_250014_6865D17D 
X-CRM114-Status: GOOD (  54.21  )
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

On Tue, Apr 15, 2025 at 4:23=E2=80=AFPM Walt Holman <waltholman09@gmail.com=
> wrote:
>
> On Thu, Apr 10, 2025 at 10:32=E2=80=AFAM Walt Holman <waltholman09@gmail.=
com> wrote:
> >
> > On Thu, Apr 10, 2025 at 3:26=E2=80=AFAM Kang Yang <kang.yang@oss.qualco=
mm.com> wrote:
> > >
> > >
> > >
> > > On 4/10/2025 3:37 AM, Walt Holman wrote:
> > > > On Tue, Apr 8, 2025 at 4:17=E2=80=AFAM Kang Yang <quic_kangyang@qui=
cinc.com> wrote:
> > > >>
> > > >>
> > > >>
> > > >> On 4/8/2025 1:49 AM, Walt Holman wrote:
> > > >>> Attached is a small packet capture where I did an 'iw wlp99s0 sca=
n'
> > > >>> and also deactivated and reactivated wireless while the scan was
> > > >>> ongoing. Hopefully there's something interesting for you in there=
.
> > > >>> Also, I've take 3 screenshots showing the configs of the wireless=
 AP
> > > >>> for the 6ghz network. The first screen is just the definition of =
the
> > > >>> network. No advanced settings are used. The 2nd screen shows the
> > > >>> channels and radio enabled. The 3rd screen has the advanced
> > > >>> (professional) settings for the network. I believe I changed 'Agi=
le
> > > >>> Multiband' to enabled, but other settings are their defaults. Hop=
e
> > > >>> some of this helps. Let me know if you need anything else. Thanks=
,
> > > >>>
> > > >>
> > > >> Your packets are Ethernet packets. I need wireless packets.
> > > >>
> > > >>
> > > >> Not sure if you know how to add a seperate monitor interface to ca=
pture
> > > >> 6 G channels' packet on your AP(you can google for specific comman=
d).
> > > >>
> > > >>
> > > >> Also, please capture firmware log:
> > > >>
> > > >> 1. sudo apt install trace-cmd
> > > >> 2. sudo trace-cmd record -e ath12k_wmi_diag
> > > >> 3. run test
> > > >> 4. "ctrl c" to stop recording:
> > > >> Hit Ctrl^C to stop recording
> > > >> ^CCPU0 data recorded at offset=3D0xdf5000
> > > >>       2605056 bytes in size
> > > >> Then share the trace.dat to us.
> > > >>
> > > >> So you need to:
> > > >> 1. try to capture wireless packets.
> > > >> 2. capture firmware log(trade.data).
> > > >> 3. save kernel/wpa_supplicant/iw logs.
> > > >>
> > > >>
> > > >>
> > > >>
> > > >>
> > > >>> -Walt
> > > >>>
> > > >>> On Sun, Apr 6, 2025 at 8:58=E2=80=AFPM Kang Yang <quic_kangyang@q=
uicinc.com> wrote:
> > > >>>>
> > > >>>>
> > > >>>>
> > > >>>> On 4/4/2025 12:04 AM, Walt Holman wrote:
> > > >>>>> On Thu, Apr 3, 2025 at 3:20=E2=80=AFAM Kang Yang <quic_kangyang=
@quicinc.com> wrote:
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>>>>> On 4/3/2025 1:48 AM, Walt Holman wrote:
> > > >>>>>>> On Tue, Apr 1, 2025 at 9:48=E2=80=AFPM Kang Yang <quic_kangya=
ng@quicinc.com> wrote:
> > > >>>>>>
> > > >>>>>>>>
> > > >>>>>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
> > > >>>>>>>> I can get 6 GHz AP and connect to it.
> > > >>>>>>>>
> > > >>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_time=
stamp
> > > >>>>>>>> 2023-12-06 04:05 fw_build_id
> > > >>>>>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V=
1.0_V2.0_SILICONZ-3
> > > >>>>>>>>
> > > >>>>>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
> > > >>>>>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
> > > >>>>>>>>              TSF: 606308271476 usec (7d, 00:25:08)
> > > >>>>>>>>              freq: 6275
> > > >>>>>>>>              beacon interval: 100 TUs
> > > >>>>>>>>              capability: ESS Privacy SpectrumMgmt ShortSlotT=
ime (0x0511)
> > > >>>>>>>>              signal: -17.00 dBm
> > > >>>>>>>>              last seen: 52 ms ago
> > > >>>>>>>>              Information elements from Probe Response frame:
> > > >>>>>>>>              SSID: MLO-KANG-6G
> > > >>>>>>>> and other 6 GHz APs:
> > > >>>>>>>>             SSID: 6G-gxia
> > > >>>>>>>>             SSID: NETGEAR97-6G
> > > >>>>>>>>             =E2=80=A6=E2=80=A6
> > > >>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>> kernel log:
> > > >>>>>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
> > > >>>>>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (lo=
cal
> > > >>>>>>>> address=3D00:03:7f:37:12:54)
> > > >>>>>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3=
)
> > > >>>>>>>> [88158.041895] wls1: authenticated
> > > >>>>>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
> > > >>>>>>>> [88158.044291] wls1: determined local STA to be EHT, BW limi=
ted to 320 MHz
> > > >>>>>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1=
/3)
> > > >>>>>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (ca=
pab=3D0x511
> > > >>>>>>>> status=3D0 aid=3D4)
> > > >>>>>>>> [88158.089090] wls1: associated
> > > >>>>>>>>
> > > >>>>>>>> I can even connect to it by Ubuntu GUI.
> > > >>>>>>>>
> > > >>>>>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also =
please make
> > > >>>>>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly u=
pdate to the
> > > >>>>>>>> latest version).
> > > >>>>>>>>
> > > >>>>>>>> If you still cannot find 6 GHz AP, you can set debug_mask to=
 0xffffffff
> > > >>>>>>>> to get ath12k logs. Then give it to us.
> > > >>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>>> -Walt
> > > >>>>>>>>>
> > > >>>>>>>>
> > > >>>>>>>
> > > >>>>>>> OK, I retested with the wt-ath 033125 tagged build. This incl=
uded the
> > > >>>>>>> patch the Jeff suggested I try, but the rest of the tree was =
clean.
> > > >>>>>>> Still no 6ghz Wifi. I'm attaching a log file of the boot and =
first few
> > > >>>>>>> seconds with the debug mask turned on. I noticed that if I rm=
mod the
> > > >>>>>>> module and then modprobe it, it complains about not finding
> > > >>>>>>> firmware-2.bin, however, I thought that was only for the qcn =
based
> > > >>>>>>> chip? The HW info from dmesg looks like this:
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>> I cannot find this tag...
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>     From the log, the 6 GHz channel should work. When scan is =
triggered, FW
> > > >>>>>> shall send probe req on these channels. If AP send probe resp,=
 station
> > > >>>>>> shall find the AP.
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>>>>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
> > > >>>>>>> 0xdd800000-0xdd9fffff 64bit]: assigned
> > > >>>>>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device (0000=
 -> 0002)
> > > >>>>>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
> > > >>>>>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name: wcn785=
0 hw2.0
> > > >>>>>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation fa=
iled
> > > >>>>>>> (7077888 B type 1), will try later with sma
> > > >>>>>>> ll size
> > > >>>>>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2 chip_fami=
ly 0x4
> > > >>>>>>> board_id 0xff soc_id 0x40170200
> > > >>>>>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
> > > >>>>>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
> > > >>>>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1=
.0_V2.0_SILICONZ-
> > > >>>>>>>
> > > >>>>>>> Also, I noticed when looking through the debug logs there are=
 the
> > > >>>>>>> occasional WARNING statements from a BUG it appears. They tra=
ce back
> > > >>>>>>> to the mac.c file inside the ath12k code. There should be som=
e in the
> > > >>>>>>> debug log that's attached. Let me know if I can do anything e=
lse.
> > > >>>>>>> Thanks,
> > > >>>>>>>
> > > >>>>>>
> > > >>>>>>
> > > >>>>>> I have never seen this warning on my upstream setup...Not sure=
 if you
> > > >>>>>> have changed anything or using the correct code base.
> > > >>>>>>
> > > >>>>>> Jeff merged this patch-set into ath-202504021602. Can you try =
on this
> > > >>>>>> branch?
> > > >>>>>>
> > > >>>>>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/ath/=
ath.git/
> > > >>>>>> git pull
> > > >>>>>> git reset --hard ath-202504021602
> > > >>>>>> compile and install...
> > > >>>>>>
> > > >>>>>> Also make sure that the firmware you used is from the same fol=
der, don't
> > > >>>>>> mix with other folders:
> > > >>>>>> linux-firmware/ath12k/WCN7850/hw2.0
> > > >>>>>>
> > > >>>>>> 1. rmmod/insmod(debug_mask=3D0xffff)
> > > >>>>>> 2. iw reg get
> > > >>>>>> 3. iw reg set US
> > > >>>>>> 4. iw xxx scan
> > > >>>>>> wait and collect logs.
> > > >>>>>>
> > > >>>>>> don't do anything else.
> > > >>>>>>
> > > >>>>>>
> > > >>>>>> Also, can you show me your AP configuration.
> > > >>>>>> If you have another 6 GHz AP, you can have a try(better differ=
ent brands).
> > > >>>>>>
> > > >>>>
> > > >>>> Thanks for testing.
> > > >>>>
> > > >>>> Could you share your AP configuration?
> > > >>>>
> > > >>>>
> > > >>>>>>
> > > >>>>>> If you have sniffer, could please capture packets during testi=
ng?
> > > >>>>
> > > >>>>
> > > >>>> Can you capture packets during the testing? I need to check prob=
e req
> > > >>>> and probe resp.
> > > >>>>
> > > >>>>>>
> > > >>>>>> Thanks!
> > > >>>>>>
> > > >>>>>>> -Walt
> > > >>>>>>
> > > >>>>> OK, I cloned and built the kernel based on your instructions in=
 your
> > > >>>>> last email. Originally, the result was identical to my last ema=
il,
> > > >>>>> including the WARNINGS. The .config I use is configured for a f=
ully RT
> > > >>>>> PREEMPT kernel, which I wondered if that was why I was receivin=
g the
> > > >>>>> WARNING. So I configured it as a Low Latency PREEMPT Desktop wi=
thout
> > > >>>>> the RT_PREEMPT and that eliminated the WARNING. However, still =
no 6Ghz
> > > >>>>> networks. The firmware I'm using is straight from kernel.org GI=
T and I
> > > >>>>> do a 'make install; make dedup' to install it. I believe it sho=
uld be
> > > >>>>> good. Attached is the latest log file.
> > > >>>>>
> > > >>>>> -Walt
> > > >>>>
> > > >>
> > > >
> > > >
> > > > Sorry for the top-post earlier. I can't figure out how to capture t=
he
> > > > wireless packets as my chip/driver combo doesn't support monitor mo=
de.
> > >
> > > Your AP also cannot capture wireless packets?
> > > log in AP by usbserial or ssh.
> > > Try to enter command line. use iw command to create monitor interface=
.
> > > Then use tcpdump to capture packets.
> > >
> > > > I've attached a tarball that contains the trace data and additional
> > > > firmware logs from the kernel.log file. Anything else you need, jus=
t
> > > > ask. Thanks for your help,
> > >
> > >
> > > Your AP mac address?
> > > Need it to help check the fw log.
> > >
> > >
> > > >
> > > > -Walt
> > >
> >
> > Sorry, the AP doesn't have tcpdump available on it. Also, this is a
> > mesh setup with 3 nodes total. The main AP and 2 mesh nodes. I'm
> > within 10 feet of one of the nodes and it's MAC for the wireless 6ghz
> > network is: 10:7C:61:6F:2A:CA
> >
> > -Walt
>
> The other 2 node 6ghz mac addresses are:
> 10:7C:61:6F:1F:11   - Router
> 10:7C:61:6F:32:92   - Node
>
> The first MAC address I gave you earlier was a node located
> approximately 5 feet from where the laptop is.
>
> -Walt

Well, I'm running into a brick wall it seems trying to get 6Ghz
enabled on this. I tried the ath-next-20250418 tag just now and still
don't see or connect to my 6Ghz network. I applied the patches in:
https://lore.kernel.org/linux-wireless/20250418-ath12k-6g-lp-vlp-v1-0-c869c=
86cad60@quicinc.com/T/#t

hoping that would help, but alas, no 6Ghz networks. I see that MLO and
other nice fixes are coming in 6.16, but without 6Ghz, they'll do me
no good. I'm really wondering if it's a firmware issue that excludes
my chip or something. Again, anything I can do to help, let me know.
Thanks,

-Walt

