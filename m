Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 804DAC54798
	for <ath12k@archiver.kernel.org>; Tue,  5 Mar 2024 18:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wlDKxbR41RHpafnkeoIXHYJzElj6gfNZseg/jVQU1qM=; b=uGDC5zWOEM3byGfq3JkJKE731C
	neS1dMc0HpXyiRFjits4IiebmwEQjVecfNaP6DE4r6C3mJEHabXlmMPPaYnOWC3pW2rJV3eJ6wY4B
	sBMP7Po1+ejBx7BCUpiM9VFNI4+Bu1sX82do/90aRBERncDN9dVDqPF7S+Zl/1u3+Dp6gcsmIbd0T
	xLAUh9Qo4XPR/eht2BjNltOPkHnynsSVlXKVfuHxnGJwPypvEmMKCyYX1tiXZvVLymZOKYOFhFZB8
	dlfjD/GsrRdvEp6Io50+/MFp7TPw+KOsUGtG4rboNzWAFg4iud4QxKDaeOe5L+667I0sWcu0SMaeW
	0pWjaR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZzL-0000000EwPK-0PgB
	for ath12k@archiver.kernel.org;
	Tue, 05 Mar 2024 18:58:07 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rhZzF-0000000EwMa-3hK8;
	Tue, 05 Mar 2024 18:58:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CE2EBCE1DF9;
	Tue,  5 Mar 2024 18:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C184AC433C7;
	Tue,  5 Mar 2024 18:57:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709665079;
	bh=h+7wf7RO/SXTi2xMW6pf3osdjV68Mp9fLkZgtd5hih4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=LKU15OYndlqoUpe+hKbrfJ+mvdmFeEfKbMIH2ClOwkKJuKlBXYCS7evt4I4h4iluW
	 x9V8B2ML55oWp3wsx1J85622naSoN2ulNMWAuCZojtCtPOSXHed17mjJrqnsUcozuo
	 12u/OOjR+nVThUMzmVOaVpbHtZNwpUoNF8wzJbDsKmmN/ZQRoxaQ4VSFULd3SS/TtY
	 eVs8sVrGwQ/fkXTmUb2sVMAC8FYgPTskbQc4Dr8UEaCkoS1U7DYFx85oaOfFzkFElJ
	 uwQcsv3YwPWGDuPD9KGAAE++OIBikYYBWSwQjGrAqkN3oZ2bpbl0ak+clYN8rNFX9i
	 1J5HV0NAwB8tg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: pull-request: ath-next-20240305
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <87y1awh8kj.fsf@kernel.org>
References: <87y1awh8kj.fsf@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 quic_jjohnson@quicinc.com
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170966507585.424347.4426290600622256900.kvalo@kernel.org>
Date: Tue,  5 Mar 2024 18:57:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240305_105802_307696_33A8A3A1 
X-CRM114-Status: GOOD (  12.17  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Hi,
> 
> Please pull, more information in the tag below.
> 
> Kalle
> 
> 
> The following changes since commit a4634aa71fee11f5e3e13bf7d80ee1480a64ce70:
> 
>   bonding: rate-limit bonding driver inspect messages (2024-02-22 19:13:18 -0800)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next-20240305
> 
> for you to fetch changes up to 776c9c93bb0511d04e6222546499e5ea20ad51b0:
> 
>   wifi: ath12k: fix license in p2p.c and p2p.h (2024-02-28 16:09:29 +0200)
> 
> ----------------------------------------------------------------
> ath.git patches for v6.9
> 
> Only some minor cleanup in ath11k and ath12k. Adding Jeff as the
> maintainer for ath10k, ath11k and ath12k DT bindings.
> 
> ----------------------------------------------------------------
> Baochen Qiang (5):
>       wifi: ath11k: rearrange IRQ enable/disable in reset path
>       wifi: ath11k: remove MHI LOOPBACK channels
>       wifi: ath11k: do not dump SRNG statistics during resume
>       wifi: ath11k: fix warning on DMA ring capabilities event
>       wifi: ath11k: decrease MHI channel buffer length to 8KB
> 
> Jeff Johnson (2):
>       dt-bindings: net: wireless: qcom: Update maintainers
>       wifi: ath11k: constify MHI channel and controller configs
> 
> Kalle Valo (2):
>       wifi: ath11k: thermal: don't try to register multiple times
>       wifi: ath12k: fix license in p2p.c and p2p.h
> 
> Kang Yang (1):
>       wifi: ath12k: add rcu lock for ath12k_wmi_p2p_noa_event()
> 
>  .../bindings/net/wireless/qcom,ath10k.yaml         |  1 +
>  .../bindings/net/wireless/qcom,ath11k-pci.yaml     |  1 +
>  .../bindings/net/wireless/qcom,ath11k.yaml         |  1 +
>  drivers/net/wireless/ath/ath11k/core.c             |  8 ++-
>  drivers/net/wireless/ath/ath11k/mhi.c              | 68 ++--------------------
>  drivers/net/wireless/ath/ath11k/qmi.c              |  5 +-
>  drivers/net/wireless/ath/ath11k/thermal.c          |  5 +-
>  drivers/net/wireless/ath/ath11k/wmi.c              |  3 +-
>  drivers/net/wireless/ath/ath12k/p2p.c              |  2 +-
>  drivers/net/wireless/ath/ath12k/p2p.h              |  2 +-
>  drivers/net/wireless/ath/ath12k/wmi.c              |  5 +-
>  11 files changed, 29 insertions(+), 72 deletions(-)

Pulled, thanks.

f654e228ed6b Merge tag 'ath-next-20240305' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/87y1awh8kj.fsf@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


