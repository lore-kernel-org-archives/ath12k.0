Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BFD9C87FD3
	for <ath12k@archiver.kernel.org>; Fri,  8 Aug 2025 12:22:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=T8XsdUDpExEz1FxCipst479bMSeLq7VvFWtp5SdXkkM=; b=mqpI++n9leoNouxx2GaWkeMODj
	+p3U9C7tD7/I9vghd8LCN49/+Yl/J8KN4AsagHpM+0R2J6dGUVkGen20Fhm1zIxFFYEEyOw9PKCCD
	xYAOT+as1F3gNdewTogP63rvq32mwtKW+xEW4aMkARnTzkI4FfZyjEmcvAde9RQZFjcpO9sORPE/B
	qzZqp54yoSGQGPcfr+4n1RM6szqtBtdo0/ktJK1NzKvcG27KUIunMAZlG+Hz/QssUBSlCz9CLP3XS
	xXDrLqrvRJ/OoLiF/pyIdU3jryaCnL8ShzF7hmmdggi8qDFIEm/s/uqOCnyX3PCZ67jIEUMCkbGa4
	Nsb6ETxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukM6m-00000002n8E-3BSu;
	Fri, 08 Aug 2025 12:22:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukLXt-00000002iGN-3WLd;
	Fri, 08 Aug 2025 11:46:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2772A43AE7;
	Fri,  8 Aug 2025 11:46:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 098E3C4CEF6;
	Fri,  8 Aug 2025 11:46:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754653561;
	bh=YwgJ4W0yz/3U7CZDEb+pmN3xlnIzTMSoc9qyKFnxOfQ=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=I8NYN2fmgNFMtr67TFvKJS81k2mk4lRbgU/aLVNCBloZ2ky0dgUaPt59EWfC6HdGY
	 myj+Ny8SRdQfBSuW9xdKj3MHfkI+zOIT/rbEWpUNuj0Y7PwuRIj36Azdu9oXi8wvEt
	 5UxHWDlt1PcTiWrVuA8Vlva7f0c+6JtujG8hGEfqB9XvzClEgqhzS0RH/10PdwOZ1l
	 wsKWRh4lygemJzHFP+jP2/7+eILqVqe/I5wlwLQZzx/mNPu2OiZWxy1bo/ELAVWW3m
	 pJP/DhM9fsPVUIHTyToHxm5xGI4vCkWHgQ4YYee0NaWE+YkQwLnCnMrgqzJMEBVD5i
	 9/8PJa2xRkxgw==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-71b6703ba32so19953457b3.3;
        Fri, 08 Aug 2025 04:46:00 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCV65DvcHrEXBedP/J3HwBHs6LNh1qsg4HW7wnE4w1GncWqruashfHHqkHXEjqGc42ZXE+GnJn4=@lists.infradead.org, AJvYcCVjWMn2IRvjr2Zpgjv3izCo5qB3zsrsyYxgZzx/UMFs8qSr2BlsrI0D3rXqZV0vLbYeh2O9bx29@lists.infradead.org, AJvYcCXYbpr0v0hFb3ujuRnMor7Ya08sXs+pYCTCgLRckwtwhwSA9pOExqSsNf3EaOAC/nNyIbAo4y2p@lists.infradead.org
X-Gm-Message-State: AOJu0YxUt9SvsAJfXqtJiH5fXmqNbjXx1pYOCbktSr3324qVJaSSGlq7
	iLnCH6vyqYKZdGZsuX+9F7VVJu7MJUnyjzvd8R7bVo3HFSt98U4mjcWuGDl6y2OSFPPKlABzb+O
	PtyX8fJ4YGBmz/BIRejTZjfB2QoNl7oo=
X-Google-Smtp-Source: AGHT+IFFl8Yogl/jKz3XpUVYcblZSE0Vjd1MxzRMkjBSnZJloREpmQubm0b1JY7EOyr/OXIxMNRYZLiJ0sdD+ACvgdI=
X-Received: by 2002:a05:690c:4989:b0:71b:6c7b:c802 with SMTP id
 00721157ae682-71bf0cddb9fmr32662157b3.6.1754653560280; Fri, 08 Aug 2025
 04:46:00 -0700 (PDT)
MIME-Version: 1.0
References: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
In-Reply-To: <6e3e8199-814d-4969-a951-d6b60f60257d@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 8 Aug 2025 07:45:49 -0400
X-Gmail-Original-Message-ID: <CA+5PVA7RqfOjP612_Miy-JTp-56oi24utAV7pBtpjvejqw0aqw@mail.gmail.com>
X-Gm-Features: Ac12FXxkFAZR0HWfVSFeG8aD6tgL6AjCIDf1XZqFSufHmaZxsq5D_8VEwNwvaAU
Message-ID: <CA+5PVA7RqfOjP612_Miy-JTp-56oi24utAV7pBtpjvejqw0aqw@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath11k and ath12k firmware ath-20250807
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250808_044601_923339_FB5DC114 
X-CRM114-Status: GOOD (  12.48  )
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

On Thu, Aug 7, 2025 at 5:43=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit d30c7b425f6d9c9e9f54bcafa99b375342b3a7=
74:
>
>   Merge branch 'robot/pr-22-1754588181' into 'main' (2025-08-07 17:52:32 =
+0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250807

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/640

josh

>
> for you to fetch changes up to 35abebaa15c1ff1a141b7c24d79220ef70f48548:
>
>   ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V1.0_=
V2.0_SILICONZ-1.115823.3 (2025-08-07 14:32:02 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (6):
>       ath11k: QCA2066 hw2.1: update board-2.bin
>       ath11k: QCA2066 hw2.1: update to WLAN.HSP.1.1-03926.13-QCAHSPSWPL_V=
2_SILICONZ_CE-2.52297.9
>       ath11k: QCA6698AQ hw2.1: update to WLAN.HSP.1.1-04650-QCAHSPSWPL_V1=
_V2_SILICONZ_IOE-2
>       ath11k: WCN6855 hw2.0: update board-2.bin
>       ath12k: QCN9274 hw2.0: update to WLAN.WBE.1.5-01651-QCAHKSWPL_SILIC=
ONZ-1
>       ath12k: WCN7850 hw2.0: update to WLAN.HMT.1.1.c5-00302-QCAHMTSWPL_V=
1.0_V2.0_SILICONZ-1.115823.3
>
>  WHENCE                              |   8 ++++----
>  ath11k/QCA2066/hw2.1/amss.bin       | Bin 5349376 -> 5349376 bytes
>  ath11k/QCA2066/hw2.1/board-2.bin    | Bin 685144 -> 745408 bytes
>  ath11k/QCA6698AQ/hw2.1/amss.bin     | Bin 5140480 -> 5005312 bytes
>  ath11k/WCN6855/hw2.0/board-2.bin    | Bin 6429240 -> 7056532 bytes
>  ath12k/QCN9274/hw2.0/firmware-2.bin | Bin 15392824 -> 15183928 bytes
>  ath12k/WCN7850/hw2.0/amss.bin       | Bin 6078528 -> 6082624 bytes
>  7 files changed, 4 insertions(+), 4 deletions(-)

