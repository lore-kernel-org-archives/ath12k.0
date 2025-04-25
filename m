Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 57D5CC369C2
	for <ath12k@archiver.kernel.org>; Fri, 25 Apr 2025 13:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4lk2DNQ1X1AZSjaInM8+EVWShn+PsZb+h2wf6Z9CxfU=; b=OTmCmC7a6SHlmIF07hIqCPKm2P
	9VJRyxjOXZkzMguAwBfeZWGliBKX17tWldbBZ2EY1x4b3EOwdqD+SjpofDn9bnY0stRdCZQKuHQzs
	Nz76iVJcPJhKT3bAIXMyRNk0ELNk/eUCXQKbserKiNHgxWOu2J2iWJvAKZepofhYsdDXNipNMa6Zu
	c0tdqWZlxL04GCqHzH5w4r301jup6b8fXYXlt2EHJJs9g0CiyPz2fzR79JvxlMejP3qsd9IM6Jmtd
	BOStAOQfadFmAfu0dpIjg2xtt8vRtu2I9C5uFLVm2M+tvVo1jw/5ScB+HT/PovXfPj4u5b8F1w+JA
	QvVB7fUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J7V-0000000HHYJ-0HIB;
	Fri, 25 Apr 2025 13:29:33 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IHV-0000000H8p7-2JK4;
	Fri, 25 Apr 2025 12:35:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id BFFC45C5F39;
	Fri, 25 Apr 2025 12:33:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 875DCC4CEE8;
	Fri, 25 Apr 2025 12:35:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1745584548;
	bh=NBbf9gNE6rO2PKHGflXky6hJbsXpf3UmgCARwrP7qoM=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=eVCQ2y/XOwPqYzsX8T1RtjqS959rQ/0CmG8oGelz/MVfkfPCnDhF99VHQZf8ZHCvH
	 uKP1lo6kgDz2AV/j8b2dgcC9UyRA3AfN8CT/yPfnpdU7ZgCLwy4gOZSAPM9hd4ehmr
	 VjoXsD9YZowYehiPapJHqGnrCR7/5KbwVPdSRJ3Euwjo3zSEgQqpXv003GX+1pQro2
	 +0nuE5Ph8rQGsWWRE08ddkiShYNbnViBxUlUnEMbn6gBlRfllMQPfej+Uwco/CPSX0
	 zBRJerf//fxCVuJa+wM1M3cYqgUVi0OzV7omcs9tlzuQT6qtg17JkBM9qmN4oby2Jx
	 NXI2TZah6L+7A==
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-7053f85f059so21206917b3.2;
        Fri, 25 Apr 2025 05:35:48 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCUu6nuAVKXwWSBNah8KamoayuTiQ33qonzqkQHL2QLA7AgUzJfJetc3UKMC+mSQydElRpu9KWg=@lists.infradead.org, AJvYcCXmEv3cx1X5xNeXwdSfMsCMoqPTKAJqzIm28J5waS8hmW0s9ZW4U/MTHRsRhY6sNNTA10+kYp8h@lists.infradead.org
X-Gm-Message-State: AOJu0YwFUPMG3TWarg4dtmqdVn1/qvTt95L2A8HeVUs7jOSXx+ggC+au
	Jq6fKrypK3OA7S4ZTxbm6+FhT2rYPpWi2HO+wqF4Q0cYL1Z1MzDXboIe8tOAlRZ5q5pLxw4Ykmg
	b/zc8vOMEWs7ZE2iV02tQHhoOuV4=
X-Google-Smtp-Source: AGHT+IGDt9aoxGrxaGdyTTeDSrfXroJCvAtD1fdjtKXhnHKlHwfs/SCMm5fDkS5hkf5DjxqYAC/oNkBXKbPa4IJM9tY=
X-Received: by 2002:a05:690c:6d05:b0:702:d54:5794 with SMTP id
 00721157ae682-708541e9ffcmr27742027b3.31.1745584547796; Fri, 25 Apr 2025
 05:35:47 -0700 (PDT)
MIME-Version: 1.0
References: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
In-Reply-To: <96b43d18-72e1-44a8-bf06-6a22fd012b07@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 25 Apr 2025 08:35:36 -0400
X-Gmail-Original-Message-ID: <CA+5PVA71-_a9nG-vULohgzbSfyFyWOB9RE1x4D4vdUbw4HAegg@mail.gmail.com>
X-Gm-Features: ATxdqUG-Y0F2Gdu0J4NLMD6PZcYoVIbFgR97YO-susRSEJJ3-yKT3qLEMaTQGWY
Message-ID: <CA+5PVA71-_a9nG-vULohgzbSfyFyWOB9RE1x4D4vdUbw4HAegg@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware 20250424
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath11k@lists.infradead.org, ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053549_676735_91D114D1 
X-CRM114-Status: GOOD (  17.10  )
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

On Thu, Apr 24, 2025 at 4:38=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> Hi,
> Here's a new pull request for ath11k and ath12k.
>
> For ath11k, update the firmware for IPQ5018 and update the board file
> for WCN6855. For ath12k, update the firmware for WCN7850 and update
> the board file for QCN9274.
>
> Please let me know if there are any problems.
>
> /jeff
>
> The following changes since commit 490c0af1d6b9ffca0523edcfad27ba483b9d6d=
a3:
>
>   Merge branch 'robot/pr-0-1745490027' into 'main' (2025-04-24 13:46:05 +=
0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250424

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/528

josh

>
> for you to fetch changes up to ce13d29c3933f77674cf45855668485c48d3eba0:
>
>   ath11k: WCN6855 hw2.0: update board-2.bin (2025-04-24 13:04:20 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (4):
>       ath12k: QCN9274 hw2.0: update board-2.bin
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00284-QCAHMTSWPL_V=
1.0_V2.0_SILICONZ-3
>       ath11k: IPQ5018 hw1.0: update to WLAN.HK.2.6.0.1-01300-QCAHKSWPL_SI=
LICONZ-1
>       ath11k: WCN6855 hw2.0: update board-2.bin
>
>  WHENCE                           |    4 +-
>  ath11k/IPQ5018/hw1.0/Notice.txt  | 3918 +++-----------------------------=
------
>  ath11k/IPQ5018/hw1.0/q6_fw.b00   |  Bin 532 -> 532 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b01   |  Bin 520 -> 520 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b04   |  Bin 86788 -> 86788 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b08   |  Bin 4096 -> 4096 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b09   |  Bin 2334720 -> 2334720 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b10   |  Bin 269220 -> 269252 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b11   |  Bin 99456 -> 99456 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.b13   |  Bin 7072 -> 7080 bytes
>  ath11k/IPQ5018/hw1.0/q6_fw.mdt   |  Bin 1052 -> 1052 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin |  Bin 6429240 -> 6429240 bytes
>  ath12k/QCN9274/hw2.0/board-2.bin |  Bin 1308544 -> 2626240 bytes
>  ath12k/WCN7850/hw2.0/amss.bin    |  Bin 6000704 -> 6082624 bytes
>  ath12k/WCN7850/hw2.0/m3.bin      |  Bin 299660 -> 299660 bytes
>  15 files changed, 315 insertions(+), 3607 deletions(-)

