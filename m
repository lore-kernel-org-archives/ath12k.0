Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85454C48294
	for <ath12k@archiver.kernel.org>; Fri,  2 Feb 2024 12:27:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+wEYjkvJMs1eppm+bz9HSOWUX5SMfUFbnTHurlGQ6t4=; b=Mtivf8tyh61rAo5WY3w82iB0v5
	em3c6F09LfgbOKzIJM1JBSX5jr+sOpRPViw49iXzq+Jwq5ALf8oqo8RyiaA8liE54t2Hw7xeBYa4W
	NpG4NbCJRVMtjRueviRu2kpwlZkSPAIz29nT2pdspD/J6uv1fCrFwfnhSpw3lQcFSFpRRZBktOj8J
	/Dkdod6TEsVPeh83PTbtUCf4YodGvaqrkUalGQ+iFNjcqSGC2GGQQ5rVlE6Ib/u5CGOjCZaejBMSt
	aVQQ4Fa4B3KvXt3arTNIGv46bMuc4psSxQ5yVo71JHLg4VkSGhnfi/Lo3X7Of1Fjy2BgTT6HeR02z
	YSL4ZsaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsdb-0000000BTKs-0CdW
	for ath12k@archiver.kernel.org;
	Fri, 02 Feb 2024 12:27:19 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVsdW-0000000BTHp-3p6M;
	Fri, 02 Feb 2024 12:27:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 0A7C6CE2B5A;
	Fri,  2 Feb 2024 12:27:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1DCC43390;
	Fri,  2 Feb 2024 12:27:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706876832;
	bh=touhaxaAdJle9IpRdiLb/BuCH/K63CXh37IPTsucA44=;
	h=References:In-Reply-To:From:Date:Subject:To:List-Id:Cc:From;
	b=FOfy3xkQuJLCa/8utMZ7Z+/l8979Nkn++NJ8oYq/+kY1EWZ/CBdeenmUp0HKzkaZx
	 +djF5TSbKE7ziPUibatTcIBDVNlVTJQdtvcbZz9GQTUlOmJ3dcIpEqe06Ra9U+Tsoo
	 pt/zAxVlBggVauirYFlNcvbec/VhGUus0WGAOOpm8ngJNhZf/2gMfFiUn3viA+9JWr
	 qEsa7moFgc5mT9c5EawszTnUgcqddr0APcKIYMR0IiLmdLWNpmG7ec5RIECuRMqTK3
	 N/5Q79CusYDU21aDq0c+Jb6napV8/QmdrNcqn2Okkzho0kD2GGK8OiCyhUnf6+2JXt
	 pTsQDW03IasLA==
Received: by mail-yb1-f178.google.com with SMTP id 3f1490d57ef6-dc6da01f092so1623497276.0;
        Fri, 02 Feb 2024 04:27:12 -0800 (PST)
X-Gm-Message-State: AOJu0YzuF54L0YES12fy7JIFIKWlN0aRRyuAewixsFxujVENh0w+W8L+
	4/aYa31t8odRye8mMSE9r4qvGcvllspfsCrSl5AAXSuY+7Y7kNQXq/6A04k4v+FzUvqtuyTV6gQ
	MVkMuzQisAeED2rNXdKDnj9rgJM8=
X-Google-Smtp-Source: AGHT+IGsOfXqhV/8fwaOfdUYofJMLh85JNkTrPVoVUFGs6T8y8xVasqQtpavtGo+pw0jUlR15wn96uhuUFl7ur7Nni4=
X-Received: by 2002:a05:6902:102e:b0:db5:6e6b:9b40 with SMTP id
 x14-20020a056902102e00b00db56e6b9b40mr2291792ybt.31.1706876831150; Fri, 02
 Feb 2024 04:27:11 -0800 (PST)
MIME-Version: 1.0
References: <8734uewvi9.fsf@kernel.org>
In-Reply-To: <8734uewvi9.fsf@kernel.org>
From: Josh Boyer <jwboyer@kernel.org>
Date: Fri, 2 Feb 2024 07:27:00 -0500
X-Gmail-Original-Message-ID: <CA+5PVA6hsTbSWRzyxv6a9yhKZUKA-zCKm2y+N0A+TEE3dMXt-Q@mail.gmail.com>
Message-ID: <CA+5PVA6hsTbSWRzyxv6a9yhKZUKA-zCKm2y+N0A+TEE3dMXt-Q@mail.gmail.com>
Subject: Re: [PULL linux-firmware] ath10k, ath11k and ath12k firmware 20240130
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-firmware@kernel.org, linux-wireless@vger.kernel.org, 
	ath10k@lists.infradead.org, ath11k@lists.infradead.org, 
	ath12k@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240202_042715_246289_191E1C0D 
X-CRM114-Status: GOOD (  17.45  )
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

On Tue, Jan 30, 2024 at 1:01=E2=80=AFPM Kalle Valo <kvalo@kernel.org> wrote=
:
>
> Hi,
>
> We have one important update for ath11k WCN6855 which fixes a suspend
> regression reported by several people.
>
> Please let me know if there are any problems.
>
> Kalle
>
> The following changes since commit 1a9518c73c4b54854c9cd8f416fd3b8f8e3456=
e7:
>
>   Merge branch 'mlimonci/amd-2024-01-30.2' into 'main' (2024-01-30 15:55:=
30 +0000)
>
> are available in the Git repository at:
>
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/linux-firmware.git =
ath10k-20240130

Pulled and pushed out.

https://gitlab.com/kernel-firmware/linux-firmware/-/merge_requests/137

josh

>
> for you to fetch changes up to 5217b76bed90ae86d5f3fe9a5f4e2301868cdd02:
>
>   ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V2_SI=
LICONZ_LITE-3.6510.37 (2024-01-30 19:58:18 +0200)
>
> ----------------------------------------------------------------
> Kalle Valo (1):
>       ath11k: WCN6855 hw2.0: update to WLAN.HSP.1.1-03125-QCAHSPSWPL_V1_V=
2_SILICONZ_LITE-3.6510.37
>
>  WHENCE                        |   2 +-
>  ath11k/WCN6855/hw2.0/amss.bin | Bin 4988928 -> 4988928 bytes
>  2 files changed, 1 insertion(+), 1 deletion(-)

