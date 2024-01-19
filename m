Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C17DC4725D
	for <ath12k@archiver.kernel.org>; Fri, 19 Jan 2024 17:40:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hm8a7eq9vH1uPEFq3aN6qjDo95ETdb7UycAZEq1X35U=; b=RWdbWx/TOtCBi/YdtrcDd4sB0E
	9v6XPqg1fnS2peyoUudZUReD2P9K8qxAC4AwZhY3t6w3cYwu9CTQVqtp2vdfXBTc3yhL0NTuA1305
	GwWIoV49QyQ6BkyiBy3mcyFzaTwnfSqQt+UzDzjJwTtLFjIrws5BMS/4PhdhKnKMScY1Hdn8GgdhJ
	quUvdx/l5BGdqja5MH3D+tNvZDl5RVIni28GlsaS++zIMcWDY6TiH8X6C+0AAvYASLOuR9iw0WE9B
	nvCFDm0fGU6jSChU9CeJBWrX4/IfZL7LyxekywL65VZL7/iWU+xuFKLgSI+yPPhs7aPpBAffpemsg
	80YvBgcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsqb-006IAU-2S
	for ath12k@archiver.kernel.org;
	Fri, 19 Jan 2024 17:40:05 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQsqZ-006I9u-0x
	for ath12k@lists.infradead.org;
	Fri, 19 Jan 2024 17:40:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id 2CCD9B80B94;
	Fri, 19 Jan 2024 17:40:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 94B30C433F1;
	Fri, 19 Jan 2024 17:39:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705686000;
	bh=2xX0/kF2sbCgX90V3nzom+K/VUjh+kDxdRC4ZgR2DFw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mYAPb+HoJrOTSEEcTaQEgNi0KfzH8nPrl411BoU38NqUU5o0Dne8c14HYRuMk35WW
	 iR3/GbpfOuXFvvB/YxPBR0d5hBpkBhL/pFZok5ZjOke3v9vzkQbXJMOQN7k7vyF2O8
	 JurR0iatKzptCR/jTMkSZIf64LDg46KcHlvgIrhUmkJ47t7u0HM8nLngjVgx6Tycin
	 f36eoNWeZrv7nALx/G+WHlQzIxr5GaB3yWveeTgQuWbUUFtdCnTdGsMpxaTzwSN2Ph
	 rAK55Dy0+jTkCH4CBhrkaqMtilCox3eKV+sYcSMC9LtmzgAhWbIshArlbi9k+xkHVw
	 s775jrifz2ACA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v4 1/2] wifi: ath12k: Refactor the mac80211 hw access from
 link/radio
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240118010320.3918136-2-quic_periyasa@quicinc.com>
References: <20240118010320.3918136-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170568599770.3232677.5051262409967677613.kvalo@kernel.org>
Date: Fri, 19 Jan 2024 17:39:59 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_094003_488456_502C6903 
X-CRM114-Status: UNSURE (   5.71  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently, mac80211 hardware accesses link/radio structure directly in
> multiple locations. Introduce helper function to avoid this direct
> access, as this change will facilitate refactoring for Multi-link
> operation support.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

b856f023b40f wifi: ath12k: Refactor the mac80211 hw access from link/radio
6db6e70a17f6 wifi: ath12k: Introduce the container for mac80211 hw

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240118010320.3918136-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


