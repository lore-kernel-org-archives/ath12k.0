Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0072DC369AB
	for <ath12k@archiver.kernel.org>; Tue, 15 Apr 2025 21:24:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7CXbOtSbMgJkE7dP2Dq4m15xQdFII7zc+JyAszjGgak=; b=vuFypT/qAq5S2BHKYfUvpdpac9
	kCK7f7HxR737GZsJjB469z7RsQqQkadNXKwHGygdXcndLUd2VwCdTPkIsaXt4OY/Q95HhGLqVbA1s
	kAoMHr2CYjV+JfB2WQJHz+kOcSzCoNzjySk9G8Rexw8NY9g7RYsE6nudhwplXpf6w/XieD+n0jE5w
	TEP9cy7V0vtWEYD8clbKxp2XaU68k2g/8Y+FRSL24H7wvY78WqFi9LF6SxOdzdwU+pCSEhNiJ3cYP
	P26BkIc5/k0i86PgYdx6GMfHagKuO3IRxua9I8npEQsdlZUNcymk95zGKhv6kGDUXH5HAoX69FjNi
	/PHddWow==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4nlP-00000007Avz-2apM;
	Tue, 15 Apr 2025 21:24:15 +0000
Received: from mail-wr1-x436.google.com ([2a00:1450:4864:20::436])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4nlM-00000007AvI-3m66
	for ath12k@lists.infradead.org;
	Tue, 15 Apr 2025 21:24:14 +0000
Received: by mail-wr1-x436.google.com with SMTP id ffacd0b85a97d-3914bc3e01aso3474024f8f.2
        for <ath12k@lists.infradead.org>; Tue, 15 Apr 2025 14:24:11 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1744752251; x=1745357051; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7CXbOtSbMgJkE7dP2Dq4m15xQdFII7zc+JyAszjGgak=;
        b=FjBEniUegbtJ+jZRMbYFomDydpuVIxmlPdSE2mk04zCxFCe6Bp+NJsfEryaRfE6lxY
         iU7q9ek1Xy3+VJ1E7WooyNmjgz/Vgdk4asXYba28UevnezKFPJvQMlxKG5+nJs28K0vC
         hJMpgPemHMyZR8tcGzHtHDYb3fM1rWWl/k7lf29OUVPB8kq99iPjMyqP7N86eb3W1Wyg
         vSq1CyE3BZGRjZhT3Kz8IwpkTl9V6kqMVrvNdOYV3b46YhobstFdPbOkeR2XlSg5L8xS
         E03T9630gYHD8uRr8qDued3ZDF6CnA3v1GSRJfxIIFhks8jDkn4w62o3GsOkS51c1fps
         BRKQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744752251; x=1745357051;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7CXbOtSbMgJkE7dP2Dq4m15xQdFII7zc+JyAszjGgak=;
        b=fMU1XgB/lyVMpLZM36nzdXCmDCQsRx05J0ntAlhIBRcGmzdj3t2gEoUSHPQRTgk1IY
         bWrI2mVrmQ3I8HJ+Uo/aHSl3F7+1ESyN4UsD4z6AgEo8L1qyVMqtA4kxBn6Oq4YMbWJc
         jtOF90VUVB1MY9RmLa21eQ3uXgFoQ5xt8a8cGFBhaFuuXuehd4kO/bLVSYBUrNEcm13/
         MSKciMqOS+hxEcWgdL96fHkOs3emUK2ILAiF7CgQ1fdSlIAoZBLHgTYOMrC/U58C4eUC
         6i75rVi1ONUgow/73Hny5dAs7KQwXuDCY7xAotvbFnhQjnv7yyayWaaL13BZd3rqazek
         owag==
X-Forwarded-Encrypted: i=1; AJvYcCU8t77a9Q5Civ42q1xJr/+Zn03Lq5DOdJ6sbmsBjiL00oPLnY5diSzvk9mI1VOjruqv9QdGKGI=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxc0jZAh3r65bALFcSDsStlIBCksGCMzUEQhE/2dfHrlm/mB7/q
	PbsCnMoBCYnri47nFc53PrQycQp3ymC2eJkswecPH6o/KQLImmbt8N1qfKdFyhBoEj2l5Ho+H1T
	dWjg3VHLGrsqr4Mxfo7ri26Lw05TE1j0X
X-Gm-Gg: ASbGnctGvHtAc9myKFgggZexJocOh+lyyNGItKy+d8JFCX2MsYd6vbhPIwQDzGN8Rt/
	zvoML/hipanoJcvTJOR8fQai55d5vZLZqu289Qotgo8pnc0A4qQRouqS+4XHKlksPMNlk8M5Wl/
	VSTuSglSQHMdKLp2kxW3I8
X-Google-Smtp-Source: AGHT+IGjNItEav3xtYgAA6hnTJ1+2SP9QtjGOx+o/ja810ruiy66xTePEDuh26WCCVlNDc4RdAym6tUhkAUKPX/gmoM=
X-Received: by 2002:a5d:59a2:0:b0:39c:310a:f87e with SMTP id
 ffacd0b85a97d-39ee2737483mr701606f8f.16.1744752250422; Tue, 15 Apr 2025
 14:24:10 -0700 (PDT)
MIME-Version: 1.0
References: <CAMb39_ngQs8=FUML5QXMh2RmEZBZ2NwUHefhGoTkGtHat+KWJA@mail.gmail.com>
 <f45323db-ce4d-4374-9c93-0be4d0645fcd@oss.qualcomm.com> <CAMb39_ki7F1XgezyVfb9Tkm9D-FZE0XK3RcSYtFmFf0jP8-M_Q@mail.gmail.com>
 <dc0abf98-862b-47f5-ae71-749c68cffc73@quicinc.com> <CAMb39_kUUv24q6QUq9B9+TEUMrUhu12-8WJadzB53nMPhcAZSQ@mail.gmail.com>
 <ef81db9e-99cb-4802-b17f-94eb623a8b32@quicinc.com> <CAMb39_m+4dNBDbkZmn-rDA7T+u84y-dx1jSfmPNWnse=R1=gCw@mail.gmail.com>
 <18788f02-e374-4aa6-ac4a-fd53bc93754c@quicinc.com> <CAMb39_=G_TEL1pbeF_PAZLQh-JOFcncSfqZChPmEj63NjsEOLA@mail.gmail.com>
 <16ccbe02-b315-40d1-8600-232b592d4dd6@quicinc.com> <CAMb39_n4tyrzS=-j0L+ekJVer=KiZyDYFhMqrrcpr9py_itU9w@mail.gmail.com>
 <0933d8d6-5b72-40df-95f8-69f6fbbdfde7@oss.qualcomm.com> <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
In-Reply-To: <CAMb39_nHO_TbHPQawdLVY8nt3yt4wDuEHyEuzMa-p5Ab1n94sA@mail.gmail.com>
From: Walt Holman <waltholman09@gmail.com>
Date: Tue, 15 Apr 2025 16:23:59 -0500
X-Gm-Features: ATxdqUGKqHp8G5OSVPp3xgUB9CUBAzarjjF-3Or8Fz0EDZz0I970buBDWXOaCRk
Message-ID: <CAMb39_nQ-uyKAqCz1HEUDt5qjszbhzf3oikVcvzHcVwt4_qt=A@mail.gmail.com>
Subject: Re: ath12k: No 6GHz Wireless found
To: Kang Yang <kang.yang@oss.qualcomm.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>, linux-wireless@vger.kernel.org, 
	"ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250415_142412_961983_E938A58A 
X-CRM114-Status: GOOD (  47.63  )
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

On Thu, Apr 10, 2025 at 10:32=E2=80=AFAM Walt Holman <waltholman09@gmail.co=
m> wrote:
>
> On Thu, Apr 10, 2025 at 3:26=E2=80=AFAM Kang Yang <kang.yang@oss.qualcomm=
.com> wrote:
> >
> >
> >
> > On 4/10/2025 3:37 AM, Walt Holman wrote:
> > > On Tue, Apr 8, 2025 at 4:17=E2=80=AFAM Kang Yang <quic_kangyang@quici=
nc.com> wrote:
> > >>
> > >>
> > >>
> > >> On 4/8/2025 1:49 AM, Walt Holman wrote:
> > >>> Attached is a small packet capture where I did an 'iw wlp99s0 scan'
> > >>> and also deactivated and reactivated wireless while the scan was
> > >>> ongoing. Hopefully there's something interesting for you in there.
> > >>> Also, I've take 3 screenshots showing the configs of the wireless A=
P
> > >>> for the 6ghz network. The first screen is just the definition of th=
e
> > >>> network. No advanced settings are used. The 2nd screen shows the
> > >>> channels and radio enabled. The 3rd screen has the advanced
> > >>> (professional) settings for the network. I believe I changed 'Agile
> > >>> Multiband' to enabled, but other settings are their defaults. Hope
> > >>> some of this helps. Let me know if you need anything else. Thanks,
> > >>>
> > >>
> > >> Your packets are Ethernet packets. I need wireless packets.
> > >>
> > >>
> > >> Not sure if you know how to add a seperate monitor interface to capt=
ure
> > >> 6 G channels' packet on your AP(you can google for specific command)=
.
> > >>
> > >>
> > >> Also, please capture firmware log:
> > >>
> > >> 1. sudo apt install trace-cmd
> > >> 2. sudo trace-cmd record -e ath12k_wmi_diag
> > >> 3. run test
> > >> 4. "ctrl c" to stop recording:
> > >> Hit Ctrl^C to stop recording
> > >> ^CCPU0 data recorded at offset=3D0xdf5000
> > >>       2605056 bytes in size
> > >> Then share the trace.dat to us.
> > >>
> > >> So you need to:
> > >> 1. try to capture wireless packets.
> > >> 2. capture firmware log(trade.data).
> > >> 3. save kernel/wpa_supplicant/iw logs.
> > >>
> > >>
> > >>
> > >>
> > >>
> > >>> -Walt
> > >>>
> > >>> On Sun, Apr 6, 2025 at 8:58=E2=80=AFPM Kang Yang <quic_kangyang@qui=
cinc.com> wrote:
> > >>>>
> > >>>>
> > >>>>
> > >>>> On 4/4/2025 12:04 AM, Walt Holman wrote:
> > >>>>> On Thu, Apr 3, 2025 at 3:20=E2=80=AFAM Kang Yang <quic_kangyang@q=
uicinc.com> wrote:
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>> On 4/3/2025 1:48 AM, Walt Holman wrote:
> > >>>>>>> On Tue, Apr 1, 2025 at 9:48=E2=80=AFPM Kang Yang <quic_kangyang=
@quicinc.com> wrote:
> > >>>>>>
> > >>>>>>>>
> > >>>>>>>> Test on 6.14.0-rc5-wt-ath+, with the firmware you used.
> > >>>>>>>> I can get 6 GHz AP and connect to it.
> > >>>>>>>>
> > >>>>>>>> ath12k_pci 0000:03:00.0: fw_version 0x100301e1 fw_build_timest=
amp
> > >>>>>>>> 2023-12-06 04:05 fw_build_id
> > >>>>>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.=
0_V2.0_SILICONZ-3
> > >>>>>>>>
> > >>>>>>>> yk@yk-Mayan:~$ sudo iw wls1 scan | tee iw_scan.log:
> > >>>>>>>> BSS 62:03:7f:12:64:64(on wls1) -- associated
> > >>>>>>>>              TSF: 606308271476 usec (7d, 00:25:08)
> > >>>>>>>>              freq: 6275
> > >>>>>>>>              beacon interval: 100 TUs
> > >>>>>>>>              capability: ESS Privacy SpectrumMgmt ShortSlotTim=
e (0x0511)
> > >>>>>>>>              signal: -17.00 dBm
> > >>>>>>>>              last seen: 52 ms ago
> > >>>>>>>>              Information elements from Probe Response frame:
> > >>>>>>>>              SSID: MLO-KANG-6G
> > >>>>>>>> and other 6 GHz APs:
> > >>>>>>>>             SSID: 6G-gxia
> > >>>>>>>>             SSID: NETGEAR97-6G
> > >>>>>>>>             =E2=80=A6=E2=80=A6
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>>>> kernel log:
> > >>>>>>>> [88158.033218] wls1: Inserted STA 62:03:7f:12:64:64
> > >>>>>>>> [88158.033232] wls1: authenticate with 62:03:7f:12:64:64 (loca=
l
> > >>>>>>>> address=3D00:03:7f:37:12:54)
> > >>>>>>>> [88158.033242] wls1: send auth to 62:03:7f:12:64:64 (try 1/3)
> > >>>>>>>> [88158.041895] wls1: authenticated
> > >>>>>>>> [88158.041914] wls1: moving STA 62:03:7f:12:64:64 to state 2
> > >>>>>>>> [88158.044291] wls1: determined local STA to be EHT, BW limite=
d to 320 MHz
> > >>>>>>>> [88158.045719] wls1: associate with 62:03:7f:12:64:64 (try 1/3=
)
> > >>>>>>>> [88158.067045] wls1: RX AssocResp from 62:03:7f:12:64:64 (capa=
b=3D0x511
> > >>>>>>>> status=3D0 aid=3D4)
> > >>>>>>>> [88158.089090] wls1: associated
> > >>>>>>>>
> > >>>>>>>> I can even connect to it by Ubuntu GUI.
> > >>>>>>>>
> > >>>>>>>> Can you update to 6.14.0-rc5-wt-ath+ and have a retry? Also pl=
ease make
> > >>>>>>>> sure that your wpa_supplicant/iw support 6 GHz(or directly upd=
ate to the
> > >>>>>>>> latest version).
> > >>>>>>>>
> > >>>>>>>> If you still cannot find 6 GHz AP, you can set debug_mask to 0=
xffffffff
> > >>>>>>>> to get ath12k logs. Then give it to us.
> > >>>>>>>>
> > >>>>>>>>
> > >>>>>>>>> -Walt
> > >>>>>>>>>
> > >>>>>>>>
> > >>>>>>>
> > >>>>>>> OK, I retested with the wt-ath 033125 tagged build. This includ=
ed the
> > >>>>>>> patch the Jeff suggested I try, but the rest of the tree was cl=
ean.
> > >>>>>>> Still no 6ghz Wifi. I'm attaching a log file of the boot and fi=
rst few
> > >>>>>>> seconds with the debug mask turned on. I noticed that if I rmmo=
d the
> > >>>>>>> module and then modprobe it, it complains about not finding
> > >>>>>>> firmware-2.bin, however, I thought that was only for the qcn ba=
sed
> > >>>>>>> chip? The HW info from dmesg looks like this:
> > >>>>>>>
> > >>>>>>
> > >>>>>> I cannot find this tag...
> > >>>>>>
> > >>>>>>
> > >>>>>>     From the log, the 6 GHz channel should work. When scan is tr=
iggered, FW
> > >>>>>> shall send probe req on these channels. If AP send probe resp, s=
tation
> > >>>>>> shall find the AP.
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>>> [    6.070282] ath12k_pci 0000:63:00.0: BAR 0 [mem
> > >>>>>>> 0xdd800000-0xdd9fffff 64bit]: assigned
> > >>>>>>> [    6.070310] ath12k_pci 0000:63:00.0: enabling device (0000 -=
> 0002)
> > >>>>>>> [    6.071249] ath12k_pci 0000:63:00.0: MSI vectors: 16
> > >>>>>>> [    6.071254] ath12k_pci 0000:63:00.0: Hardware name: wcn7850 =
hw2.0
> > >>>>>>> [    6.596331] ath12k_pci 0000:63:00.0: qmi dma allocation fail=
ed
> > >>>>>>> (7077888 B type 1), will try later with sma
> > >>>>>>> ll size
> > >>>>>>> [    6.604041] ath12k_pci 0000:63:00.0: chip_id 0x2 chip_family=
 0x4
> > >>>>>>> board_id 0xff soc_id 0x40170200
> > >>>>>>> [    6.604044] ath12k_pci 0000:63:00.0: fw_version 0x100301e1
> > >>>>>>> fw_build_timestamp 2023-12-06 04:05 fw_build_id
> > >>>>>>> QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0=
_V2.0_SILICONZ-
> > >>>>>>>
> > >>>>>>> Also, I noticed when looking through the debug logs there are t=
he
> > >>>>>>> occasional WARNING statements from a BUG it appears. They trace=
 back
> > >>>>>>> to the mac.c file inside the ath12k code. There should be some =
in the
> > >>>>>>> debug log that's attached. Let me know if I can do anything els=
e.
> > >>>>>>> Thanks,
> > >>>>>>>
> > >>>>>>
> > >>>>>>
> > >>>>>> I have never seen this warning on my upstream setup...Not sure i=
f you
> > >>>>>> have changed anything or using the correct code base.
> > >>>>>>
> > >>>>>> Jeff merged this patch-set into ath-202504021602. Can you try on=
 this
> > >>>>>> branch?
> > >>>>>>
> > >>>>>> git clone https://git.kernel.org/pub/scm/linux/kernel/git/ath/at=
h.git/
> > >>>>>> git pull
> > >>>>>> git reset --hard ath-202504021602
> > >>>>>> compile and install...
> > >>>>>>
> > >>>>>> Also make sure that the firmware you used is from the same folde=
r, don't
> > >>>>>> mix with other folders:
> > >>>>>> linux-firmware/ath12k/WCN7850/hw2.0
> > >>>>>>
> > >>>>>> 1. rmmod/insmod(debug_mask=3D0xffff)
> > >>>>>> 2. iw reg get
> > >>>>>> 3. iw reg set US
> > >>>>>> 4. iw xxx scan
> > >>>>>> wait and collect logs.
> > >>>>>>
> > >>>>>> don't do anything else.
> > >>>>>>
> > >>>>>>
> > >>>>>> Also, can you show me your AP configuration.
> > >>>>>> If you have another 6 GHz AP, you can have a try(better differen=
t brands).
> > >>>>>>
> > >>>>
> > >>>> Thanks for testing.
> > >>>>
> > >>>> Could you share your AP configuration?
> > >>>>
> > >>>>
> > >>>>>>
> > >>>>>> If you have sniffer, could please capture packets during testing=
?
> > >>>>
> > >>>>
> > >>>> Can you capture packets during the testing? I need to check probe =
req
> > >>>> and probe resp.
> > >>>>
> > >>>>>>
> > >>>>>> Thanks!
> > >>>>>>
> > >>>>>>> -Walt
> > >>>>>>
> > >>>>> OK, I cloned and built the kernel based on your instructions in y=
our
> > >>>>> last email. Originally, the result was identical to my last email=
,
> > >>>>> including the WARNINGS. The .config I use is configured for a ful=
ly RT
> > >>>>> PREEMPT kernel, which I wondered if that was why I was receiving =
the
> > >>>>> WARNING. So I configured it as a Low Latency PREEMPT Desktop with=
out
> > >>>>> the RT_PREEMPT and that eliminated the WARNING. However, still no=
 6Ghz
> > >>>>> networks. The firmware I'm using is straight from kernel.org GIT =
and I
> > >>>>> do a 'make install; make dedup' to install it. I believe it shoul=
d be
> > >>>>> good. Attached is the latest log file.
> > >>>>>
> > >>>>> -Walt
> > >>>>
> > >>
> > >
> > >
> > > Sorry for the top-post earlier. I can't figure out how to capture the
> > > wireless packets as my chip/driver combo doesn't support monitor mode=
.
> >
> > Your AP also cannot capture wireless packets?
> > log in AP by usbserial or ssh.
> > Try to enter command line. use iw command to create monitor interface.
> > Then use tcpdump to capture packets.
> >
> > > I've attached a tarball that contains the trace data and additional
> > > firmware logs from the kernel.log file. Anything else you need, just
> > > ask. Thanks for your help,
> >
> >
> > Your AP mac address?
> > Need it to help check the fw log.
> >
> >
> > >
> > > -Walt
> >
>
> Sorry, the AP doesn't have tcpdump available on it. Also, this is a
> mesh setup with 3 nodes total. The main AP and 2 mesh nodes. I'm
> within 10 feet of one of the nodes and it's MAC for the wireless 6ghz
> network is: 10:7C:61:6F:2A:CA
>
> -Walt

The other 2 node 6ghz mac addresses are:
10:7C:61:6F:1F:11   - Router
10:7C:61:6F:32:92   - Node

The first MAC address I gave you earlier was a node located
approximately 5 feet from where the laptop is.

-Walt

