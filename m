Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B989CA101C
	for <ath12k@archiver.kernel.org>; Thu,  4 Sep 2025 18:32:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NiQglHQ3com+EYzLGMfKup+Iewr823N/x/zjXuINPPc=; b=bfyM/iJnTlVjm0oNmcHXXmpjXM
	XPzNZegzfuQnyA4gWhGUkxLScDtWxiA8db7wgfGm1gAzvpv/NSvjJpBiViwz86ZHNcbW9VkLxJCUX
	6nJ03BCcHLNoDQjl7a6XiTJ5zf8LefHBgeTqpieKGwkWOJeh431WfopmFmhtMhIMufhTIBTAm6kHe
	nQ5b6tw2+i4ZxKsRV5LAzAZb2g/v9em6jQJKg62JQ3/4qv5f9m1GwGlvMPAuLOuUUQTmdtd8wPile
	MaFxBv4xj2ymvqvR0xC/kPRXLhLouI/R0/L/REJZ0viTCifjtF+wR9N2GK6EO2DE7R19P0Xcm27lY
	qxpiJWAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuEkb-0000000Das2-40wX;
	Thu, 04 Sep 2025 18:32:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uuANO-0000000C0ZL-09K7
	for ath12k@lists.infradead.org;
	Thu, 04 Sep 2025 13:51:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B195A43CF1
	for <ath12k@lists.infradead.org>; Thu,  4 Sep 2025 13:51:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8F476C4CEF0
	for <ath12k@lists.infradead.org>; Thu,  4 Sep 2025 13:51:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756993905;
	bh=9x2SkHcOreXiuQqlC6/KRQjV/21MzDezCnoULkIP14o=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=RTyzLZAlShPyFMtsi0UexVZQwVzGjbu6FaAINotKEdeRmWh3OUFnQOJ2r8ILqVxYL
	 KqwzGuTb0xSpqKziR9HhqqWOwzVeN9cWTLiB5J+5ihAnOUkYp7U0UkkwgJjUiwwQQx
	 fsySuk2OjkXaE+J7lJMEKK/xyKyMGhqnL7zlg/4VwpJ8wN7rJvmikoUA+AMCrcLO5P
	 +rtvjU4PSnZWNEUwikOzxLkhzDDPh1losU3yi3R/oM3DSAljJdRUtLSmTeb5EkUYjw
	 TM72JJZf2VP5aY+bzAXls3EgizEsV/WAk8ouMQ1YiGcJAAodWPblsfeb3QvL9Hcwyn
	 PU+dhRPh6p6mQ==
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-72485e14efbso11086817b3.3
        for <ath12k@lists.infradead.org>; Thu, 04 Sep 2025 06:51:45 -0700 (PDT)
X-Forwarded-Encrypted: i=1; AJvYcCW4z69xE0nXBGG1/FiHcbistqKQdRhX4SHrVgzLiYm8v9DA/kKYgwCvsc8Gyjr3D68IsIbfOiI=@lists.infradead.org
X-Gm-Message-State: AOJu0YzcUK5WyAL6BEEJvW77cKAXT3I35893hdczdOvmuKPDxkHh/OUT
	lRK1LO5/QmWeJiacq1C/X9DRRC6Z9+7B7M4Qe+ANouaX3a7Hgu3ECMr55YDMegGoPcN11LVWyBC
	fcZ8d5XYTn07QcEwjAOg/2W9SeGW+giI=
X-Google-Smtp-Source: AGHT+IHUQteiIw9Ozw+TIjzw0U8r2r786UvTNixegNiMm4NrZnyJI1jgfIFJjmUDUB2mMdHQd0hJ8pzqmoWzU/u07ug=
X-Received: by 2002:a05:690c:d85:b0:71f:b944:1039 with SMTP id
 00721157ae682-7227658c8bdmr198576107b3.54.1756993904817; Thu, 04 Sep 2025
 06:51:44 -0700 (PDT)
MIME-Version: 1.0
References: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
In-Reply-To: <3d942fb1-e7dc-41cd-885e-a610bfcf856e@oss.qualcomm.com>
From: Josh Boyer <jwboyer@kernel.org>
Date: Thu, 4 Sep 2025 09:51:33 -0400
X-Gmail-Original-Message-ID: <CA+5PVA63eRdcFa+hNP7vScr+T-zCWDYRHe7PXQGqkyomV8=E-A@mail.gmail.com>
X-Gm-Features: Ac12FXzzi0Y-AYZKxADg5uVFx-x0HQZZynRywWYWLCPmNzu0XgUtI3XbES9OZGk
Message-ID: <CA+5PVA63eRdcFa+hNP7vScr+T-zCWDYRHe7PXQGqkyomV8=E-A@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath12k firmware ath-20250903
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath12k@lists.infradead.org, jjohnson@kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250904_065146_091615_EDBE442D 
X-CRM114-Status: GOOD (  13.67  )
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

On Wed, Sep 3, 2025 at 4:29=E2=80=AFPM Jeff Johnson
<jeff.johnson@oss.qualcomm.com> wrote:
>
> The following changes since commit 7d59b255fba6e1c3a4b7814c028cb9f8e83e14=
e8:
>
>   Merge branch 'mt7925' into 'main' (2025-09-03 15:36:06 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git at=
h-20250903

Merged and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/678

josh

>
> for you to fetch changes up to 1c44d84a08bf0dfec147db6637aff593d7195b0c:
>
>   ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTSWPL_=
V1.0_V2.0_SILICONZ-1 (2025-09-03 13:23:20 -0700)
>
> ----------------------------------------------------------------
> Jeff Johnson (1):
>       ath12k: WCN7850 hw2.0@ncm865: add to WLAN.IOE_HMT.1.1-00018-QCAHMTS=
WPL_V1.0_V2.0_SILICONZ-1
>
>  WHENCE                                 |    4 +
>  ath12k/WCN7850/hw2.0/ncm865/Notice.txt | 3386 ++++++++++++++++++++++++++=
++++++
>  ath12k/WCN7850/hw2.0/ncm865/amss.bin   |  Bin 0 -> 6111296 bytes
>  ath12k/WCN7850/hw2.0/ncm865/m3.bin     |  Bin 0 -> 299660 bytes
>  4 files changed, 3390 insertions(+)
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/Notice.txt
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/amss.bin
>  create mode 100644 ath12k/WCN7850/hw2.0/ncm865/m3.bin

