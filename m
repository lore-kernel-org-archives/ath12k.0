Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0BBAC3DA7F
	for <ath12k@archiver.kernel.org>; Thu, 15 Aug 2024 13:56:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VKY6eAID+r0Zg0ifrOX8aS/wr6iWUF6+sdzwifPFEkU=; b=AbevofYvTSesAzg7s9mQlLQzVb
	CD87FfaynGuIqYOBQ2puvA2kFW6Vkf7PHhtdAnHcI0JmQNyWjop4AxlHUhDq5YneLPfpbG0AwYcTn
	D5gMdQlSflbfp1XvREyt+ELFf8rM4lGLIXyyfKuesOfhqLSq8odWLXI9uRC1x/6MnNAHruMKhHZtV
	5HlWb/ZjeLa2DRz77opj12VDIXyMqef0cHT1B4xu9XVA0NJIH0wHP/EezAzlfFg5QbajxdIWtP4pI
	IilJ9rLKBYItg58WTY2QPYGyBIdYPgGjgQzOlZXfeF/3Kq8x8XSibQQhPBI28egqPIxh2Ri2OWWrb
	mcSrasaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaxP-0000000A790-1Vwp
	for ath12k@archiver.kernel.org;
	Thu, 15 Aug 2024 13:56:03 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1seaxK-0000000A77Y-3bjX;
	Thu, 15 Aug 2024 13:56:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 32631CE1C7E;
	Thu, 15 Aug 2024 13:55:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4B853C4AF0A;
	Thu, 15 Aug 2024 13:55:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1723730156;
	bh=MsSF0ZMUFFKBilcSHXDg3Wgfc1Du5Oe51UnolXkzzvQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=P0cEgGkTVxCOyhlzQ3El8NHry3MfF+l32ATuun3K5VT+yqZ+3BDZj1AtK3PQnHV7D
	 4mE4GyGi7QUIGdVBG2CdxIteJQMiRUI9oGT+11M/cif9/FBFnOHinWGuhg04aAUhqZ
	 VzyFJZmCVD+xcyCMe6GyUwX4QwJSWGO9D+Uzn69Mta+YZH4nqX/PU9OuSloH79Lrps
	 dDlgYCSpAl5RWpS9EaKzI2q9+Bs1gviQBfh3snO2/E1lEKv3wSDVtvKcFgWvUqdScD
	 xD1MAmyzQ/63N7LGd1CMa3YB4iGqXZEXFghbpTfgat5rzIKLjY9v/4bGXXspyDJQw/
	 vniTpSjkR9wsg==
Received: by mail-yw1-f175.google.com with SMTP id 00721157ae682-64b417e1511so9573047b3.3;
        Thu, 15 Aug 2024 06:55:56 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCXPYM854auGJ2X72hjpoA5sj0gggG3X5j5ouzDKOXxCJef8m48YhH6ik/epkvDSf2/hNOcQiYI/Hxf6aNBCszPuefxwGhcsl9kVecQ936h1VnF1AfyF0INFEK0KZnK6+nyC27ZbyLEs9E6xuM6sM1+lSUdgHmKDWiEb4d1Y2sZNt5Hv
X-Gm-Message-State: AOJu0YwWnDfuFpT1ZKeEYHYQeuNplO7IQYJnmbvUZViUjQgSlj0YEjvG
	Mw+dHFvRAGlZsPKCN5dcTVaJkG+0ODWFCI6oC6f5egTRCndxNmfVr37NWjCkbgzyaXcmcd+tvZk
	KJuS1V64L/EnUL23c20neCYjfhWo=
X-Google-Smtp-Source: AGHT+IE9g8Et9/7N9qT7VqtHIV42bP2F1ImRodlvjO4IZyU8D4JRPGtVEFXM1hFoSuCz+Mw4pNGd3uYxCaaPPr6u6k0=
X-Received: by 2002:a05:690c:fcb:b0:62f:37c9:77bc with SMTP id
 00721157ae682-6ac8fe09107mr83314787b3.0.1723730155534; Thu, 15 Aug 2024
 06:55:55 -0700 (PDT)
MIME-Version: 1.0
References: <87cymc1iga.fsf@kernel.org>
In-Reply-To: <87cymc1iga.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 15 Aug 2024 09:55:44 -0400
X-Gmail-Original-Message-ID: <CA+5PVA5M1vcSH2z41zQwBuv8pj89GG-wGkHApMOe=UiDmhHAkw@mail.gmail.com>
Message-ID: <CA+5PVA5M1vcSH2z41zQwBuv8pj89GG-wGkHApMOe=UiDmhHAkw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20240813
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Jeff Johnson <quic_jjohnson@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240815_065559_273800_7A602205 
X-CRM114-Status: GOOD (  17.49  )
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

On Tue, Aug 13, 2024 at 12:44=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrot=
e:
>
> Hi,
>
> Here's a pull request for ath11k and ath12k. We have new ath11k hardware
> QCA2066 hw2.1 and usual smaller updates.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 594600762910b4bbe8a88d0dc6495521366c88=
0c:
>
>   Merge branch 'vpu' into 'main' (2024-08-09 13:02:09 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20240813

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/275

josh

>
> for you to fetch changes up to 82318c966fd1af87044299d34611751c76f70927:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2024-08-13 19:36:13 +0300)
>
> ----------------------------------------------------------------
> Kalle Valo (6):
>       ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01291-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: QCA2066 hw2.1: add board-2.bin
>       ath11k: QCA2066 hw2.1: add to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V2_S=
ILICONZ_CE-2.52297.3
>       ath11k: WCN6855 hw2.0: update board-2.bin
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V=
2_SILICONZ_LITE-3.6510.41
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  WHENCE                           |    9 +-
>  ath11k/IPQ5018/hw1.0/m3_fw.b01   |  Bin 136 -> 136 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.b02   |  Bin 262144 -> 262144 bytes
>  ath11k/IPQ5018/hw1.0/m3_fw.mdt   |  Bin 284 -> 284 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b02   |  Bin 7552 -> 7552 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2330624 -> 2334720 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269028 -> 269220 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99436 -> 99456 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7024 -> 7072 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>  ath11k/QCA2066/hw2.1/Notice.txt  | 3658 ++++++++++++++++++++++++++++++++=
++++++
>  ath11k/QCA2066/hw2.1/amss.bin    |  Bin 0 -> 5349376 bytes
>  ath11k/QCA2066/hw2.1/board-2.bin |  Bin 0 -> 685144 bytes
>  ath11k/QCA2066/hw2.1/m3.bin      |  Bin 0 -> 266684 bytes
>  ath11k/WCN6855/hw2.0/amss.bin    |  Bin 4988928 -> 4988928 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6308684 -> 6429240 bytes
>  ath11k/WCN6855/hw2.0/m3.bin      |  Bin 266684 -> 266684 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin |  Bin 382856 -> 1897968 bytes
>  22 files changed, 3665 insertions(+), 2 deletions(-)
>  create mode 100644 ath11k/QCA2066/hw2.1/Notice.txt
>  create mode 100644 ath11k/QCA2066/hw2.1/amss.bin
>  create mode 100644 ath11k/QCA2066/hw2.1/board-2.bin
>  create mode 100644 ath11k/QCA2066/hw2.1/m3.bin

