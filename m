Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C91E9E732E5
	for <ath12k@archiver.kernel.org>; Thu, 28 Sep 2023 16:16:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=ERGhRcTSRt3TKoeYj5l1DJ9PNZrD9FuW7KvjG1zu2yA=; b=VUMK0Km5FQy7VZ
	ozn4fYAmSUm5n9A9610albaKoOTFjRM+mQzNvk76IBulQoSLSPMBREme7zRIxeVOB4AsAma1UFZFG
	6fFFG3095FmZNukIVK6SUzu8TOnqcmVclXzTuTWYa93skMQJkceiYtbY0UeFb3bZ+j89eMWztosEW
	kHByE7fws34GtP7H/tJx9jvsY0Sg8z8M3BL25KkIqt5dkN/ceNi0hGGRck/ElODWr3cVEgBRos60C
	38WOnPSEMVcFgQyTged0w0OtB56Ty/d0DGIuHRHt5b6C2rchDR+EfIQRyVWTxEqrS0qNPB5lFrfnj
	frRhccS1DVQsnZEx8Ttw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qltgJ-005seE-1i
	for ath12k@archiver.kernel.org;
	Thu, 28 Sep 2023 16:16:03 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsgc-005Hce-3D
	for ath12k@bombadil.infradead.org;
	Thu, 28 Sep 2023 15:12:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:Content-Type:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=wzRd0spwHOJcdgKQ4yS1695/dxmcGkFu6kORTLZ5/bc=; b=NKktBx3mpi73hGB1fUv0Yx2ucV
	Q8VkT6GKhuTsmjM2rybvAcKtzNQQLEchG+5RZFHvT27/wqrM5LMORCMmdds4pQ7RQ/fsa0lUWqCz7
	+f6F8DLxBFBBYDHZbvT7bxPGbMbJN4u7ZchysMZxFymVsZHJaqWTVHASIx7QcmYjoIohSqI/0f0g7
	HlPNgiSv8Uz2yhLiY0sG9A9QjEj2yP1rLnkVrPL224KXRjHZ0HfMeL1SV0KFQX3zx82VCqUPUf2Yq
	8s5jvqrHNyEchnzTSFISNl/OSU6J9XqeORohYI6Nn0kfEURHTzVkm6hNY6KYLNaev8jHOBaC5L/Ap
	6w8xnAbA==;
Received: from ams.source.kernel.org ([145.40.68.75])
	by desiato.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qlsgW-0056eb-3B
	for ath12k@lists.infradead.org;
	Thu, 28 Sep 2023 15:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id D52F4B81CDA;
	Thu, 28 Sep 2023 15:12:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44486C433C7;
	Thu, 28 Sep 2023 15:12:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695913927;
	bh=CZuE83sl18ITQX4RMFfwg27QZ2DFezUk3bkCbIdbRtU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Vz2FruwDfiWe1kY3EO7OnYK5TFKTYl0gtHtuwVJx4FXsVP9YkbxanIAmEmlbV0n11
	 jhGqNgLFNCEDIy0CGFGn8A6LylxDNx8Mh3UlNMIctkdL8SvfEC6xRAc7K7XKwwVcdx
	 XYQKiGbz9GjeRnxkBjS5am93jBXhTpH97aZzV1buBTcBQpGyLY0jyLjhSqHRBBnJSp
	 vJbTFWm1r+v8vXRAc/bqE3zBDTDxEAZK58kjTWwamDPYpb/Gy/Jo+lCKLOFWizNYqP
	 LaFemXWphob1FVbg+v6BEjLr7a1kYoMBc0GGeDUQ+AssavyLErH28NgcMz6HR0wcQU
	 qiWrhbs2gWU+w==
MIME-Version: 1.0
Subject: Re: [PATCH v2] wifi: ath12k: Set default beacon mode to burst mode
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230905213943.12275-1-quic_sidhanta@quicinc.com>
References: <20230905213943.12275-1-quic_sidhanta@quicinc.com>
To: Sidhanta Sahu <quic_sidhanta@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Sidhanta Sahu <quic_sidhanta@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169591392416.3019228.2935423910724687574.kvalo@kernel.org>
Date: Thu, 28 Sep 2023 15:12:06 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230928_161214_577167_B24CC379 
X-CRM114-Status: UNSURE (   5.48  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Sidhanta Sahu <quic_sidhanta@quicinc.com> wrote:

> Currently, firmware does not like when beacon mode is set as staggered
> mode for more than one beaconing vifs. Beacon mode for multiple
> beaconing (transmitted) vifs are expected to be in burst mode. So set
> beacon mode to burst mode by default.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Sidhanta Sahu <quic_sidhanta@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c4cb46dfb291 wifi: ath12k: Set default beacon mode to burst mode

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230905213943.12275-1-quic_sidhanta@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
