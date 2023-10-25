Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FF72C25B6B
	for <ath12k@archiver.kernel.org>; Wed, 25 Oct 2023 10:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jsWozurNaikPqpgpP2qH1b0GuGozP0kT98l0sX6U8z4=; b=340ciEZUUPLhC1
	h58X73juUApmPWGLunE5i7sE89RLsIa/zzTzwovBUJiZGpFLloYGp6rX8LjyT1jivL+auiyjGzILX
	fk8XNqP1Y8dyUpywyQ+gwlqgbVQTQIuO+UYoueQlvm7MPfTV8apX6EhdYO4uTOrTMT/riRCPgVB+U
	Vlf2onlShVUaF0OXFspbhhMoJtQbDvrqeIGNaWgBlu3pbYQ7PhtZUA2ZpfqTWaaSWpFl5uul8VAZE
	Pz51K2qRmz9SA/r/WNHj8VNss6502L953hyiPKCTdtgZLBytpLXaOYPKL+TZxqtrH2xATbQb7QutX
	3jzHAwICDO2RSZ7MjtRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbEB-00C4Jb-04
	for ath12k@archiver.kernel.org;
	Wed, 25 Oct 2023 10:35:07 +0000
Received: from ams.source.kernel.org ([145.40.68.75])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qvbE8-00C4Ha-0Q
	for ath12k@lists.infradead.org;
	Wed, 25 Oct 2023 10:35:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id B17F1B82C42;
	Wed, 25 Oct 2023 10:35:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 44581C433C8;
	Wed, 25 Oct 2023 10:35:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1698230102;
	bh=58+Mou08nY22qSI2kcR2X7ao1pMoXvcAK23BpqCVe88=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=I/jJU600/ucSi3pl2JckyZP+QNnU8dUO4msq+9w2vatOjNPDIsEJWD933yb9yGyYj
	 IPdm5HNN5cL6GTuN+1KRN24kah4UKuWRcK+IRbWJZJw10o7kHIAsco6nNiscrO0VVY
	 /yNTFNH5Vd82k+klWbVmoOvXXHfgsik7SEOv6dj80tlFITQc+5leWRdK/mqrGlFo6p
	 clKq2eMG+YzKsz6+ZnsewS8LtRT0Eg1QMIgRr7aAJxVJD1UYDK17NtsVWkhYNB9onP
	 oUoSTeAtrw5ZpzuqZCuUWUkjwGcFMoXWEcfG4UYJRq67OA9yWk+m8BJxE5Mhuk+Ei6
	 faVRMQwnyx2wQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Introduce and use ath12k_sta_to_arsta()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231019-upstream-ath12k_sta_to_arsta-v1-1-06f06f693338@quicinc.com>
References: <20231019-upstream-ath12k_sta_to_arsta-v1-1-06f06f693338@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169823009956.891844.2307289880340272431.kvalo@kernel.org>
Date: Wed, 25 Oct 2023 10:35:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231025_033504_329946_B120B12D 
X-CRM114-Status: UNSURE (   9.10  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently, the logic to return an ath12k_sta pointer, given a
> ieee80211_sta pointer, uses typecasting throughout the driver. In
> general, conversion functions are preferable to typecasting since
> using a conversion function allows the compiler to validate the types
> of both the input and output parameters.
> 
> ath12k already defines a conversion function ath12k_vif_to_arvif() for
> a similar conversion. So introduce ath12k_sta_to_arsta() for this use
> case, and convert all of the existing typecasting to use this
> function.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

9ef118152ee0 wifi: ath12k: Introduce and use ath12k_sta_to_arsta()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231019-upstream-ath12k_sta_to_arsta-v1-1-06f06f693338@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
