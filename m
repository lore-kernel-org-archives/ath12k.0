Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B6BEEC3ABA2
	for <ath12k@archiver.kernel.org>; Mon, 16 Sep 2024 13:40:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eobP6Tsu+oV7rsG6psbuxT51TunBXfd/7Ldz4WKEOsM=; b=K/Rz1MOQHNvPOnytcIzlP1rCBf
	GA5UwqOu6AsCcXNUyavsqu1MuoXk8RmP2N4jF+HBfcKzq3zng5saaKMqUQxkct8xOIpUfN2qOUgWy
	z0UElmo2R1yG0qrtWKomh3zStLiL5L8a7aIKkI24jXq4Bm051WJVDRE5W4JE2Sz5Xl4Vs9JeUcbG8
	LpX6CbZKNIMN1ewWiSRaqaXuUDquxmq1Mg5XKCh2uMqM+O42ugklRo9v22eOPjDbcj89HQeoI4v6y
	2kktP0SOsskM41aHWZaaF1MXm7DpFEbeIDXwWTD5FS29XnvDiDQiCDORvarOGIiE86u6Vuj6Rjrlx
	cF1zmFVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBxS-000000045Rz-1Orn
	for ath12k@archiver.kernel.org;
	Mon, 16 Sep 2024 13:40:02 +0000
Received: from mail-lj1-x231.google.com ([2a00:1450:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sqBxO-000000045RO-4608
	for ath12k@lists.infradead.org;
	Mon, 16 Sep 2024 13:40:01 +0000
Received: by mail-lj1-x231.google.com with SMTP id 38308e7fff4ca-2f759688444so37633171fa.1
        for <ath12k@lists.infradead.org>; Mon, 16 Sep 2024 06:39:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=perenite-com.20230601.gappssmtp.com; s=20230601; t=1726493996; x=1727098796; darn=lists.infradead.org;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eobP6Tsu+oV7rsG6psbuxT51TunBXfd/7Ldz4WKEOsM=;
        b=nJRfuaGZ5keLX/EcUTT2r1fe2jmZbBCS1HoaGGMMF6GqMoZB2MCpyklLrkLDGXbDRm
         lZ0gePvpNafZECLW8n25guExCRj5cVa7MUrbWZgrb4ADKOIeBfsKtE4KukDsTL1EfMkE
         NG8mjwP1xpS4EK2KkhdAzsy/VL/r9j9m/beyL5yh+jYd4tDPxSWyp7Ic5QQxlJiL6AIK
         3C0tJYR0cAaWIYiN7Ujxc5EjD9ENPurRzVEj+TNggHsvotbHXppYE2ki58BEy4I5JgNI
         q8ukcMQHAgAaTVyVWa/CI7Jddngpd8JAjC1G69NNQouQ75KEylkIKwJM6V880hTsfokM
         duXg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1726493996; x=1727098796;
        h=content-transfer-encoding:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eobP6Tsu+oV7rsG6psbuxT51TunBXfd/7Ldz4WKEOsM=;
        b=dR3jtHhA6Efc906F4h3riUF/WM7QvGT2Mhtl75pq+LIVIOyO5AdD0kJSBlzSBTgpWj
         Uj244euzBkIw3cbyNVz2q1QHD32t4DI8xA3sPpBQweTghGzacUzViONgYENx86LwgRHa
         bDQHm3xUCBgprvjN7ZgEZ8J5YYAOlEQ870XjkPez0cfJZg32mAU/k4wtZvtG2sUy4URm
         beZNwR+i7QsBXAKDAftRkBJhNIwNKHMkpcvv4RfBD7ttqnjoN23NHRUmx3CoiP6/ogV6
         xQe36b1UNBduXzn28s2O8jdw2OXDW4dejmFLgjWtCoNCfEAR81cbnHkkKJR4nVIs2npH
         B2Yg==
X-Gm-Message-State: AOJu0Yzel46tvBvpBet7D88Qk9eES6zlhyXLnsVZFWXbwfe+tM9tJg3O
	wCt+rJByo3xDAWuJzfZzGFLWsXaZDgwSEAqDreiw3lh9LNHqdwtJ7ayp8t+7BeIfiNacm/xurWV
	KFIIBDua281sqQ5VJ+q4Y2niwQUFcAc34tI260lkDKr6oAqA=
X-Google-Smtp-Source: AGHT+IHA1fiPD770N3Bn6hIuzF19SbDSBux0aSDTZvzOwBoqSTHNo5n3ZS7v2GkX3acg4TR5d7j5kMgOM63axxXImf8=
X-Received: by 2002:a05:6512:334f:b0:536:7c0d:e554 with SMTP id
 2adb3069b0e04-5367c0de894mr5245226e87.45.1726493995459; Mon, 16 Sep 2024
 06:39:55 -0700 (PDT)
MIME-Version: 1.0
References: <CAGHj7OK5tvjfUkb_oFMwk041mo_41WV0Uu-h2v_0_YQqjTrFyA@mail.gmail.com>
 <87msk8dmts.fsf@kernel.org> <CAGHj7OK2dwy9LbbZWC_WdV0evhmKfjwyn2bTy4Dz5-XNxtcsyQ@mail.gmail.com>
In-Reply-To: <CAGHj7OK2dwy9LbbZWC_WdV0evhmKfjwyn2bTy4Dz5-XNxtcsyQ@mail.gmail.com>
From: Benoit Masson <benoitm@perenite.com>
Date: Mon, 16 Sep 2024 15:39:44 +0200
Message-ID: <CAGHj7OLRyHScHTYpzWEyj1RhfoW1hce761b+eKKcDe0WA943mA@mail.gmail.com>
Subject: Fwd: ath12k driver on Debian 12 - High ping latency and MLO support
 query on 6.11rc7
To: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-Bad-Reply: References and In-Reply-To but no 'Re:' in Subject.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240916_063959_311410_F02E8E13 
X-CRM114-Status: GOOD (  25.35  )
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

Hi Kalle thanks a million for answering and taking the time!

On Mon, Sep 16, 2024 at 10:28=E2=80=AFAM Kalle Valo <kvalo@kernel.org> wrot=
e:
>
> Benoit Masson <benoitm@perenite.com> writes:
>
> > Hello ath12k developers,
> >
> > I'm testing the ath12k driver on Debian 12 with a custom 6.11rc7
> > kernel for an M2 QCNCM865 card.
>
> You didn't provide any dmesg out but I assume this has a WCN7850
> chipset. Please provide output from 'dmesg | grep ath12k' so that we
> know what firmware etc you are using.

Sure here is the dmesg message:
dmesg | grep ath12k
[   49.185903] ath12k_pci 0000:02:00.0: BAR 0 [mem
0xdc600000-0xdc7fffff 64bit]: assigned
[   49.185920] ath12k_pci 0000:02:00.0: enabling device (0000 -> 0002)
[   49.186714] ath12k_pci 0000:02:00.0: MSI vectors: 16
[   49.186718] ath12k_pci 0000:02:00.0: Hardware name: wcn7850 hw2.0
[   49.747963] ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4
board_id 0xff soc_id 0x40170200
[   49.747977] ath12k_pci 0000:02:00.0: fw_version 0x100301e1
fw_build_timestamp 2023-12-06 04:05 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICO=
NZ-3
[   50.188095] ath12k_pci 0000:02:00.0 wlp2s0: renamed from wlan0
[16865.398653] ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4
board_id 0xff soc_id 0x40170200
[16865.398658] ath12k_pci 0000:02:00.0: fw_version 0x100301e1
fw_build_timestamp 2023-12-06 04:05 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICO=
NZ-3
[20300.513950] ath12k_pci 0000:02:00.0: failed to send
HAL_REO_CMD_FLUSH_CACHE cmd, tid 15 (-105)
[20300.513965] ath12k_pci 0000:02:00.0: failed to send
HAL_REO_CMD_FLUSH_CACHE cmd, tid 16 (-105)
[28269.690504] ath12k_pci 0000:02:00.0: Spurious quick kickout for STA
3a:23:51:73:23:26
[28278.156974] ath12k_pci 0000:02:00.0: failed to send
HAL_REO_CMD_FLUSH_CACHE, tid 15 (-105)
[29715.843960] ath12k_pci 0000:02:00.0: failed to send
HAL_REO_CMD_FLUSH_CACHE, tid 15 (-105)
[29715.843974] ath12k_pci 0000:02:00.0: failed to send
HAL_REO_CMD_FLUSH_CACHE, tid 15 (-105)
[45013.847353] ath12k_pci 0000:02:00.0: chip_id 0x2 chip_family 0x4
board_id 0xff soc_id 0x40170200
[45013.847355] ath12k_pci 0000:02:00.0: fw_version 0x100301e1
fw_build_timestamp 2023-12-06 04:05 fw_build_id
QC_IMAGE_VERSION_STRING=3DWLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICO=
NZ-3

I also grep the interface name in case and only found this error:
# dmesg | grep wlp2s0
[27660.154844] wlp2s0: AP bug: VHT capa missing from AssocResp
[27660.154845] wlp2s0: AP bug: VHT operation missing from AssocResp


> > While generally stable, I'm encountering two issues:
> >
> > 1. High ping latency/jitter:
> > - ath12k: 3.5ms to 55ms (40ms jitter)
>
> Is this from network to ath12k or from ath12k to network? I recommend
> testing both.

Below the test both way;
1) From station to access point:
ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=3D1 ttl=3D64 time=3D13.7 ms
64 bytes from 192.168.1.1: icmp_seq=3D2 ttl=3D64 time=3D15.5 ms
64 bytes from 192.168.1.1: icmp_seq=3D3 ttl=3D64 time=3D3.70 ms
64 bytes from 192.168.1.1: icmp_seq=3D4 ttl=3D64 time=3D12.2 ms
64 bytes from 192.168.1.1: icmp_seq=3D5 ttl=3D64 time=3D23.4 ms
64 bytes from 192.168.1.1: icmp_seq=3D6 ttl=3D64 time=3D12.8 ms
64 bytes from 192.168.1.1: icmp_seq=3D7 ttl=3D64 time=3D13.2 ms
64 bytes from 192.168.1.1: icmp_seq=3D8 ttl=3D64 time=3D12.0 ms
64 bytes from 192.168.1.1: icmp_seq=3D9 ttl=3D64 time=3D11.9 ms
64 bytes from 192.168.1.1: icmp_seq=3D10 ttl=3D64 time=3D23.3 ms
64 bytes from 192.168.1.1: icmp_seq=3D11 ttl=3D64 time=3D12.9 ms
64 bytes from 192.168.1.1: icmp_seq=3D12 ttl=3D64 time=3D12.2 ms
64 bytes from 192.168.1.1: icmp_seq=3D13 ttl=3D64 time=3D6.48 ms

2) from access point to station:
ping 192.168.1.169
PING 192.168.1.169 (192.168.1.169): 56 data bytes
64 bytes from 192.168.1.169: seq=3D0 ttl=3D64 time=3D5.582 ms
64 bytes from 192.168.1.169: seq=3D1 ttl=3D64 time=3D4.469 ms
64 bytes from 192.168.1.169: seq=3D2 ttl=3D64 time=3D357.588 ms
64 bytes from 192.168.1.169: seq=3D3 ttl=3D64 time=3D398.582 ms
64 bytes from 192.168.1.169: seq=3D4 ttl=3D64 time=3D419.028 ms
64 bytes from 192.168.1.169: seq=3D5 ttl=3D64 time=3D449.935 ms
64 bytes from 192.168.1.169: seq=3D6 ttl=3D64 time=3D21.677 ms
64 bytes from 192.168.1.169: seq=3D7 ttl=3D64 time=3D3.836 ms
64 bytes from 192.168.1.169: seq=3D8 ttl=3D64 time=3D370.563 ms
64 bytes from 192.168.1.169: seq=3D9 ttl=3D64 time=3D17.126 ms
64 bytes from 192.168.1.169: seq=3D10 ttl=3D64 time=3D3.833 ms
64 bytes from 192.168.1.169: seq=3D11 ttl=3D64 time=3D58.386 ms
64 bytes from 192.168.1.169: seq=3D12 ttl=3D64 time=3D81.823 ms
64 bytes from 192.168.1.169: seq=3D13 ttl=3D64 time=3D107.806 ms
64 bytes from 192.168.1.169: seq=3D14 ttl=3D64 time=3D170.339 ms
64 bytes from 192.168.1.169: seq=3D15 ttl=3D64 time=3D52.075 ms
64 bytes from 192.168.1.169: seq=3D16 ttl=3D64 time=3D7.189 ms

> Usually Power Save Mode causes latency, have you tried disabling that?

Indeed after disabling power_save with command below
# iw dev wlp2s0 set power_save off
# iw dev wlp2s0 get power_save
Power save: off

then new ping are much better:
3) From station to access point power_save off:
ping 192.168.1.1
PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=3D1 ttl=3D64 time=3D4.25 ms
64 bytes from 192.168.1.1: icmp_seq=3D2 ttl=3D64 time=3D4.08 ms
64 bytes from 192.168.1.1: icmp_seq=3D3 ttl=3D64 time=3D4.65 ms
64 bytes from 192.168.1.1: icmp_seq=3D4 ttl=3D64 time=3D5.37 ms
64 bytes from 192.168.1.1: icmp_seq=3D5 ttl=3D64 time=3D9.99 ms
64 bytes from 192.168.1.1: icmp_seq=3D6 ttl=3D64 time=3D4.43 ms
64 bytes from 192.168.1.1: icmp_seq=3D7 ttl=3D64 time=3D3.33 ms
64 bytes from 192.168.1.1: icmp_seq=3D8 ttl=3D64 time=3D4.79 ms
64 bytes from 192.168.1.1: icmp_seq=3D9 ttl=3D64 time=3D37.9 ms
64 bytes from 192.168.1.1: icmp_seq=3D10 ttl=3D64 time=3D14.1 ms
64 bytes from 192.168.1.1: icmp_seq=3D11 ttl=3D64 time=3D3.83 ms

4) from access point to station power_save off:
ping 192.168.1.169
PING 192.168.1.169 (192.168.1.169): 56 data bytes
64 bytes from 192.168.1.169: seq=3D0 ttl=3D64 time=3D16.917 ms
64 bytes from 192.168.1.169: seq=3D1 ttl=3D64 time=3D5.478 ms
64 bytes from 192.168.1.169: seq=3D2 ttl=3D64 time=3D3.910 ms
64 bytes from 192.168.1.169: seq=3D3 ttl=3D64 time=3D3.938 ms
64 bytes from 192.168.1.169: seq=3D4 ttl=3D64 time=3D8.326 ms
64 bytes from 192.168.1.169: seq=3D5 ttl=3D64 time=3D3.745 ms
64 bytes from 192.168.1.169: seq=3D6 ttl=3D64 time=3D3.909 ms
64 bytes from 192.168.1.169: seq=3D7 ttl=3D64 time=3D8.720 ms
64 bytes from 192.168.1.169: seq=3D8 ttl=3D64 time=3D11.626 ms
64 bytes from 192.168.1.169: seq=3D9 ttl=3D64 time=3D6.859 ms
64 bytes from 192.168.1.169: seq=3D10 ttl=3D64 time=3D4.573 ms
64 bytes from 192.168.1.169: seq=3D11 ttl=3D64 time=3D3.864 ms
64 bytes from 192.168.1.169: seq=3D12 ttl=3D64 time=3D3.757 ms

Which made me look at Tp link access point settings and remember there
is a 'TWT' option described as : "Target Wake Time allows 802.11ax
routers and clients to negotiate their periods to transmit and receive
data packets. Clients only wake up at TWT sessions and remain in sleep
mode for the rest of the time, which significantly extend their
battery life."

Disabling it seems to have a big impact on ping latency even with
power_save is on, in the end disabling TWT and power_save give very
nice ping both ways:

PING 192.168.1.1 (192.168.1.1) 56(84) bytes of data.
64 bytes from 192.168.1.1: icmp_seq=3D1 ttl=3D64 time=3D2.88 ms
64 bytes from 192.168.1.1: icmp_seq=3D2 ttl=3D64 time=3D3.42 ms
64 bytes from 192.168.1.1: icmp_seq=3D3 ttl=3D64 time=3D3.46 ms
64 bytes from 192.168.1.1: icmp_seq=3D4 ttl=3D64 time=3D2.99 ms
64 bytes from 192.168.1.1: icmp_seq=3D5 ttl=3D64 time=3D3.59 ms
PING 192.168.1.169 (192.168.1.169): 56 data bytes
64 bytes from 192.168.1.169: seq=3D99 ttl=3D64 time=3D4.957 ms
64 bytes from 192.168.1.169: seq=3D100 ttl=3D64 time=3D3.602 ms
64 bytes from 192.168.1.169: seq=3D101 ttl=3D64 time=3D2.924 ms
64 bytes from 192.168.1.169: seq=3D102 ttl=3D64 time=3D3.093 ms
64 bytes from 192.168.1.169: seq=3D103 ttl=3D64 time=3D3.767 ms

Thanks a million for having me to look in this direction ! Any thoughs
on power_saving settings for ath12k and best way to make those value
kept after boot if any in firmware or config of the driver or module
parameters ? Indeed that would be great to have TWT activated for
phone and tablet battery saving but ath12k on desktop to ignore it.


> > 2. MLO support:
> > - When connected via MLO, performance mirrors 6GHz-only connection
> > - Doesn't appear to utilize all three bands
> >
> > Questions:
> > 1. Are there any recent patches addressing the latency issue for
> > kernel 6.11rc7?
>
> At least I can't think of any fix right now.

Thanks for lettings me know, any though about the firmware binary are
there beta firmware somewhere that would make sense to test or is the
linux-firmware git main branch the more recent one ?

> > 2. Is MLO fully supported by Linux/Qualcomm for this hardware? I'm
> > willing to test any proposed solutions or gather additional data if
> > needed.
>
> MLO is not yet supported. Once there is something to test we will
> announce it in this ath12k list.

Perfect I'll be reading the mailing list, if you need tester able to
compile a kernel and module don't hesitate. or need tester with wifi7
access point (I only own TP-Link BE800 but is it in beta firmware mode
with terminal access so I can also do some test the device)

Have a great day!
Benoit
> --
> https://patchwork.kernel.org/project/linux-wireless/list/
>
> https://wireless.wiki.kernel.org/en/developers/documentation/submittingpa=
tches

