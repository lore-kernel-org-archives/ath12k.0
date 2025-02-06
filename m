Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78969C02196
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 12:36:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jxeEKhbt6RBIKuIfnRrTQBNtbImRQqNXKP5zZutgTnk=; b=siwRqH+N8Fr1dcQBKFmQqHmI1F
	6jhwJGt36bc0B6OusMyOKJuVoFGU4929CVdb4mNkuwgsyLVK7bXKDKjiIaeo1KqTf5Wvu06W0VzA4
	QPisi9/ynE1L9RVT0RkvoNTnKI7NROhwc88th+1NR8Tkb5cy4LeUpGp3RrL9BUcMX2aR0CSLPZhMP
	T5RD1xwsb/+0BtttDA/aAcjh+C8WhOCD0dK5CecRetNZ2qjyUGyj4Th8sD0tdF++djbmE1hQdf8NX
	ifb6DmUSDorW8wLipgNreio4OHwPLnRaaAXCc8WmaFKAFfZwOEZf/B64vOR5qo3sCPxMK0IFz47/x
	Pca+xAww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tg17e-00000006IMZ-0wtu
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 12:36:46 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tg17b-00000006ILg-0SCs;
	Thu, 06 Feb 2025 12:36:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96526A44212;
	Thu,  6 Feb 2025 12:34:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44936C4CEE6;
	Thu,  6 Feb 2025 12:36:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738845401;
	bh=gZypxpWMVdeu/KHG2lytgMJCpY5x3szqPbKkUNQKt6w=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=quxvCURu7Nr9va1h9rTphwETV1cXucIk2AMm6VANAH3xtCUPJzMjOf06LEfeFT9M6
	 9FFZ+Kb6UBiK7aezN5qrOJq97HjFBEzA3+65LlK4qqHT9nDBTKKLXkUygNu1Huoi7R
	 tODDhSRFeZpI+c0+G7a8EbdNaZ6K4i7WBC9gNStLoSuoqDzs71v53sUukzb1hB1kV+
	 L5OI9aLRvNa2j4Ms/1tdleVgjhy384RnARfj17uU+QSsLCZ/p0L0J/8pUa0kNDMfES
	 RavtAT3MExeXP4oS4IZaXfF+xSMVDg3IzS2ZNaOEJpttkenSp36rfng/HdrNeYmhta
	 XSLMbQAehzIHQ==
Received: by mail-yb1-f175.google.com with SMTP id 3f1490d57ef6-e3983426f80so664600276.1;
        Thu, 06 Feb 2025 04:36:41 -0800 (PST)
X-Forwarded-Encrypted: i=1; AJvYcCUUnBPz57kiYh2geGQHFcm3dkYF8XAINElDDk+M9DjcyL/ArukE55rwq3ULjd3hA/S3bnnTI8Y=@lists.infradead.org, AJvYcCX177csiXS0kgOorUH5eGzbiTffRL3WH5Kcla2Fq2M++lZP0lgNliGVP5z1OBrBwmdkLluXeJnJ@lists.infradead.org, AJvYcCXQCn6oGThHoAmAuSv+CArSMihEnsI2AAKBRQTmY68nu6Y+wnqNPDpG0lOtK3KobBX4fW6QqRRx@lists.infradead.org
X-Gm-Message-State: AOJu0Yz1dZm2seDli9CPA9Y+oMNZyjlw8pqCKyZoUj7g8iTubsdxjNlT
	dueIzIzt0MU1EvOsqqXBkblDFK2/UEE/zJ0ZNvDqgal4NzYSqdqiR22OwtvBpvgJI23B0aq6Kei
	ZC5EU4wqb5aYgt8A32oqa38jGJVw=
X-Google-Smtp-Source: AGHT+IHdNcp8QXu8zXn3jgkuuXU33OOv9AfM6HtJI9lJz8nhGrzBKKLWVF9Ifu2qSFe/HCPAAF8yDA3PNZkmeSIKCuU=
X-Received: by 2002:a05:6902:845:b0:e5b:411a:a80f with SMTP id
 3f1490d57ef6-e5b411aa9b6mr515894276.42.1738845400378; Thu, 06 Feb 2025
 04:36:40 -0800 (PST)
MIME-Version: 1.0
References: <9be8cab2-02d0-40d2-b69f-7cb3095249a9@oss.qualcomm.com>
In-Reply-To: <9be8cab2-02d0-40d2-b69f-7cb3095249a9@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 6 Feb 2025 07:36:29 -0500
X-Gmail-Original-Message-ID: <CA+5PVA4e7TB-qXAcdyN8CVboesOJcKSH-10KpTxbG3KaH77yuw@mail.gmail.com>
X-Gm-Features: AWEUYZlZknHcwXucuuJ-kRjaC-qqH6H1cPUMkMTC4lRfMcL7gLTXNJU5ZOTFw10
Message-ID: <CA+5PVA4e7TB-qXAcdyN8CVboesOJcKSH-10KpTxbG3KaH77yuw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250205
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_043643_277099_8F08A1A9 
X-CRM114-Status: GOOD (  17.65  )
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

On Wed, Feb 5, 2025 at 2:42=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here's a new pull request for ath11k and ath12k.
> This includes new ath11k support for QCA6698AQ, updated ath11k board supp=
ort
> for the Qualcomm Robotics RB3 gen2 platform [1], and some board and firmw=
are
> upgrades for other ath11k and ath12k hardware.
>
> Please let me know if there are any problems.
>
> /jeff
>
> [1] https://msgid.link/CAA8EJpq=3DQRbWe6KTxcmHkHp20rgEgLZeGYV7+Hy2Qkfo_My=
V1g@mail.gmail.com
>
> The following changes since commit 7ac1fc5f254d8d97a1aa96360c23f0659addb0=
47:
>
>   Merge branch 'make-deb-fix-no-such-file-error' into 'main' (2025-02-04 =
12:31:31 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250205

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/437

josh

>
> for you to fetch changes up to 99720d02248f775f952a97455ea3b3a687196a50:
>
>   ath12k: WCN7850 hw2.0: update board-2.bin (2025-02-05 11:26:43 -0800)
>
> ----------------------------------------------------------------
> Jeff Johnson (12):
>       ath11k: IPQ6018 hw1.0: update to WLAN.HK.2.7.0.1-02409-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: IPQ8074 hw2.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V=
2_SILICONZ_CE-2.52297.6
>       ath11k: QCA6390 hw2.0: update board-2.bin
>       ath11k: QCA6698AQ hw2.1: add board-2.bin
>       ath11k: QCA6698AQ hw2.1: add to WLAN.HSP.1.1-04479-QCAHSPSWPL_V1_V2=
_SILICONZ_IOE-1
>       ath11k: QCN9074 hw1.0: update to WLAN.HK.2.9.0.1-02146-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: WCN6750 hw1.0: update board-2.bin
>       ath12k: QCN9274 hw2.0: update board-2.bin
>       ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.4.1-00199-QCAHKSWPL_SIL=
ICONZ-1
>       ath12k: WCN7850 hw2.0: update board-2.bin
>
>  WHENCE                              |   15 +-
>  ath11k/IPQ6018/hw1.0/Notice.txt     |  419 ++--
>  ath11k/IPQ6018/hw1.0/m3_fw.b01      |  Bin 6712 -> 6712 bytes
>  ath11k/IPQ6018/hw1.0/m3_fw.mdt      |  Bin 6860 -> 6860 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b01      |  Bin 7000 -> 7000 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b03      |  Bin 2602320 -> 2606416 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b04      |  Bin 386016 -> 386528 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b05      |  Bin 202532 -> 202532 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b07      |  Bin 9912 -> 9912 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.b08      |  Bin 464564 -> 467388 bytes
>  ath11k/IPQ6018/hw1.0/q6_fw.mdt      |  Bin 7340 -> 7340 bytes
>  ath11k/IPQ8074/hw2.0/Notice.txt     |  419 ++--
>  ath11k/IPQ8074/hw2.0/m3_fw.b01      |  Bin 136 -> 136 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.b02      |  Bin 327680 -> 327680 bytes
>  ath11k/IPQ8074/hw2.0/m3_fw.mdt      |  Bin 284 -> 284 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b00      |  Bin 340 -> 340 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b01      |  Bin 328 -> 328 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b02      |  Bin 4696 -> 4696 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b03      |  Bin 2978704 -> 3215248 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b04      |  Bin 982944 -> 1000480 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b05      |  Bin 248260 -> 254596 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b07      |  Bin 10112 -> 9960 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.b08      |  Bin 504104 -> 596768 bytes
>  ath11k/IPQ8074/hw2.0/q6_fw.mdt      |  Bin 668 -> 668 bytes
>  ath11k/QCA2066/hw2.1/amss.bin       |  Bin 5349376 -> 5349376 bytes
>  ath11k/QCA2066/hw2.1/board-2.bin    |  Bin 685144 -> 685144 bytes
>  ath11k/QCA6390/hw2.0/board-2.bin    |  Bin 115984 -> 173980 bytes
>  ath11k/QCA6698AQ/hw2.1/Notice.txt   | 3658 +++++++++++++++++++++++++++++=
++++++
>  ath11k/QCA6698AQ/hw2.1/amss.bin     |  Bin 0 -> 5132288 bytes
>  ath11k/QCA6698AQ/hw2.1/board-2.bin  |  Bin 0 -> 866120 bytes
>  ath11k/QCA6698AQ/hw2.1/m3.bin       |  Bin 0 -> 266684 bytes
>  ath11k/QCN9074/hw1.0/Notice.txt     |  419 ++--
>  ath11k/QCN9074/hw1.0/amss.bin       |  Bin 3963336 -> 4227408 bytes
>  ath11k/QCN9074/hw1.0/m3.bin         |  Bin 340108 -> 340108 bytes
>  ath11k/WCN6750/hw1.0/board-2.bin    |  Bin 843548 -> 927980 bytes
>  ath12k/QCN9274/hw2.0/board-2.bin    |  Bin 292160 -> 1308544 bytes
>  ath12k/QCN9274/hw2.0/firmware-2.bin |  Bin 15224888 -> 15392824 bytes
>  ath12k/WCN7850/hw2.0/board-2.bin    |  Bin 1897968 -> 1986952 bytes
>  40 files changed, 4136 insertions(+), 794 deletions(-)
>  create mode 100644 ath11k/QCA6698AQ/hw2.1/Notice.txt
>  create mode 100644 ath11k/QCA6698AQ/hw2.1/amss.bin
>  create mode 100644 ath11k/QCA6698AQ/hw2.1/board-2.bin
>  create mode 100644 ath11k/QCA6698AQ/hw2.1/m3.bin

