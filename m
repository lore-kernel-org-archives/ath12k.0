Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC869C6FD1F
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 15:48:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=mN7B7tulGKIlLIf2AmXe78JxWZMnRaeGSCPR8PTQ0pQ=; b=wgypA9uVnCAAtd3it64ttja7mG
	nvnS5x4HGx2PjE/g7izNcvjznMB0XuGcTu31T9NFgfDhx2h9lOkx9yRYW3ya2JdVu2AbWny/NRh6u
	igWy750OAgs/+MhESMiyF+QxVNPPeWESpL8LwSmhEJvDYn+oIUgEldWYjJtDhp76FHfbi9aqaEG7V
	b47c/ZdHxKYrYmSWstkSVmrpl82OlOhQFsQp+IgAS2g9hdmIlRyDuC4eO66ffwhF3qvP9cuTFDyVB
	xj42+QBAiEUDs2NVI7R4V9gxlxD89ugcZ06UduuZbLY0gI91w9u0qT006vbkRbXN8MkGfaH4uQgJh
	xdx3F4sw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyAp-000000009kE-1Yqc
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 15:48:15 +0000
Received: from mail-lf1-x12d.google.com ([2a00:1450:4864:20::12d])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmyAl-000000009iv-1dag
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 15:48:12 +0000
Received: by mail-lf1-x12d.google.com with SMTP id 2adb3069b0e04-512e4f4e463so4893e87.1
        for <ath12k@lists.infradead.org>; Wed, 20 Mar 2024 08:48:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1710949688; x=1711554488; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=mN7B7tulGKIlLIf2AmXe78JxWZMnRaeGSCPR8PTQ0pQ=;
        b=cPdppN7Y5f/vzDkauLvQlhPGORTiRypoBOnREfeo+AM3RHF5OuudIOAV6tT1q2eRBe
         KIrjs9Y7wU8Zit+rUYiBW7ayaBL5CVgFfJ3CwiNiipt/psKo45x48GBoHLiZ4FGUB8Vk
         VbK/kElPEkNU2UuiFzle6faP3RuAKUCrMfO3qd3/G6F1pwNJ/ZbMr2uhlU82hSlT0CjD
         lyBUFPmRQG/ag5oM+fbGJNA4KMudP/AVme5E6obUYC3BVeC3y1ztvbpqM+wvz0nXpJ1g
         4D4cYA3ItGrMwCmWvlpfw4o+7pg1tIUCwdFHbxkj73WR0cRkCkl9A1OvvrB+Xu3VZhTz
         1gJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710949688; x=1711554488;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=mN7B7tulGKIlLIf2AmXe78JxWZMnRaeGSCPR8PTQ0pQ=;
        b=N5qcjxa6yp0GOi1xxqTjrUXbmNx7NOpi0k2qlCxgeR87WmN7c2SEdj5hrJ0LhtC98U
         13WaesAoURP47WlRaPcT/G9uLZp44IV2HW6QCIlaKS2Y+jeu620riVaAg00vK1FjcMtp
         TA1YHsmBamXWuy1hjqPf7fst+q4lkq5kloW2CLkSa/Ql6d16iH2vLkfgatEfjrg8UvFk
         M9JxNmPfKuJZnWE+pFR1z4OFD372siug6pKpniw3M8P/Rd3eTwNLqyp1xWt0nFssUO4U
         K0hN71uUCjiK4KX2L4prVvvv70pNUeJC4sYr8GXT4OGTrp7LkKBuSFdDGcDUdpOC44o6
         gugg==
X-Gm-Message-State: AOJu0YxGZM+EALaUwLf6gV5sif0z/TLEoOq9aW1h/FTMSS8diCGuXL92
	iCqfjD5kau/52L0tfDR/y60tefEi7GS6FzojxJbqakWergSjXVw0W0Elyfr87Z8iE/qXJXPX8Lj
	Ud414rAVwh0utZ6b5Ju1hmMgMv47gwZW0cICn2w==
X-Google-Smtp-Source: AGHT+IF6VfoBcRkBfYq8A9gNPZJ1ejpnZ2luq+OpvJpxTmCDCYkoJCNTYu9WWjOKfZVljVrTUJfwRI/rOUQ47LNfXIU=
X-Received: by 2002:a05:6512:310c:b0:513:c195:1c56 with SMTP id
 n12-20020a056512310c00b00513c1951c56mr13245118lfb.16.1710949687860; Wed, 20
 Mar 2024 08:48:07 -0700 (PDT)
MIME-Version: 1.0
From: "Owen Mesh." <owen.mesh@gmail.com>
Date: Wed, 20 Mar 2024 18:47:56 +0300
Message-ID: <CAHohoUjGROZ=E-D_qJp3S6dLUwA-PfAWBCU7pAkPVBJqkG=QQg@mail.gmail.com>
Subject: ath12k: driver does not show tx bitrate
To: Kalle Valo <kvalo@kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_084811_454680_37A7E906 
X-CRM114-Status: UNSURE (   3.81  )
X-CRM114-Notice: Please train this message.
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

Dear Sirs,

I found a small bug in ath12k driver with wcn7850 adapter.
ath12k driver does not show tx bitrate.

Platform:
11th Gen Intel(R) Core(TM) i9-11900K @ 3.50GHz

System: Linux 6.8.1-060801-generic #202403151937 SMP PREEMPT_DYNAMIC
Fri Mar 15 19:52:22 UTC 2024 x86_64 x86_64 x86_64 GNU/Linux
(Ubuntu 23.10)

wcn7850 adapter output:
iw dev wlp6s0 link
Connected to d4:da:21:a8:06:7e (on wlp6s0)
    SSID: NETGEAR65
    freq: 5805.0
    RX: 146600 bytes (611 packets)
    TX: 8977 bytes (73 packets)
    signal: 0 dBm
    rx bitrate: 6.0 MBit/s
    bss flags: short-slot-time
    dtim period: 1
    beacon int: 100

iw dev wlp6s0 station dump
Station d4:da:21:a8:06:7e (on wlp6s0)
    inactive time:    445 ms
    rx bytes:    175927
    rx packets:    716
    tx bytes:    9573
    tx packets:    79
    tx retries:    0
    tx failed:    0
    beacon loss:    0
    beacon rx:    238
    rx drop misc:    34
    signal:      0 dBm
    beacon signal avg:    -25 dBm
    tx duration:    0 us
    rx bitrate:    6.0 MBit/s
    rx duration:    0 us
    authorized:    yes
    authenticated:    yes
    associated:    yes
    preamble:    long
    WMM/WME:    yes
    MFP:        no
    TDLS peer:    no
    DTIM period:    1
    beacon interval:100
    short slot time:yes
    connected time:    253 seconds
    associated at [boottime]:    309.866s
    associated at:    1710947541025 ms
    current time:    1710947793618 ms



Intel be200 adapter output on the same system:
iw dev wlp5s0f0 link
Connected to d4:da:21:a8:06:7e (on wlp5s0f0)
    SSID: NETGEAR65
    freq: 5805.0
    RX: 97845 bytes (282 packets)
    TX: 10930 bytes (91 packets)
    signal: -27 dBm
    rx bitrate: 6.0 MBit/s
    tx bitrate: 117.0 MBit/s 40MHz HE-MCS 3 HE-NSS 2 HE-GI 2 HE-DCM 0
    bss flags: short-slot-time
    dtim period: 1
    beacon int: 100

iw dev wlp5s0f0 station dump
Station d4:da:21:a8:06:7e (on wlp5s0f0)
    inactive time:    55 ms
    rx bytes:    1721336
    rx packets:    5459
    tx bytes:    7824741
    tx packets:    18298
    tx retries:    413
    tx failed:    0
    beacon loss:    0
    beacon rx:    0
    rx drop misc:    254
    signal:      -38 [-38, -39] dBm
    signal avg:    -36 dBm
    tx bitrate:    573.5 MBit/s 40MHz HE-MCS 11 HE-NSS 2 HE-GI 0 HE-DCM 0
    tx duration:    0 us
    rx bitrate:    573.5 MBit/s 40MHz HE-MCS 11 HE-NSS 2 HE-GI 0 HE-DCM 0
    rx duration:    0 us
    authorized:    yes
    authenticated:    yes
    associated:    yes
    preamble:    long
    WMM/WME:    yes
    MFP:        no
    TDLS peer:    no
    DTIM period:    1
    beacon interval:100
    short slot time:yes
    connected time:    2040 seconds
    associated at [boottime]:    306.733s
    associated at:    1710947537891 ms
    current time:    1710949577462 ms

Regards

