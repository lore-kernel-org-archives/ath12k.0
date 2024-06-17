Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02454C27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 14:46:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6SKLTSGEDDeHtFISfcO28NPqaPyCClKr7la4AsUfU18=; b=U4oSuEao6sG8BJJUCu67Rbo2Fn
	QgU3tctacnasZS5TspWW6ducBGX/T9pHjS1gxUXgqxCC8dry78nJ4jjD5yjLGpk0kiIhhcl7QxKXF
	SG1v5keoQ8xt564W0FQwSziuWV3anzp8o8ssxzppN80OxL12QsfU6Emfpyql/x1RzkQsWpTkuP1Ee
	6ar1GQzhDBofSmbKoX4ZoSZDvDpFfovd7eRatbscsXuCpRanyKSnEjvIKUNAXsXTHvRzwqYxvfd+8
	o+knvssNR9qcO2XTOVp5vt7Gc0JsIkQYw/GuRrOzbRqFIddJM4oS4HLBXbFbTtHLabDxfuMCPd6+F
	lqVPGcmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDd4-0000000BGCl-2oed
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 14:46:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJDcz-0000000BGAh-2e6F
	for ath12k@lists.infradead.org;
	Mon, 17 Jun 2024 14:46:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0EE46611AB;
	Mon, 17 Jun 2024 14:46:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C5C5BC2BD10;
	Mon, 17 Jun 2024 14:46:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718635596;
	bh=IbcA056kCP+fyaAgZ6tZpqCHgjbNEZC0YjTh3ybgQfY=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=vDGq1++soky9PDf2/SO78qSbjmKXO0M44N5kyUUs9YJKGswrYtpXV1KSWo7EZcHM3
	 bJHrk3VPXF+KpQoybqAK5oZFSz0K7CYRYhC4QCQ9obsBLBH6WaJ76XcFED0aky1jul
	 QWK5wHFjbvW1wOTyiFXMNJIkXzN8gufvU0mR3MwtfDyp6ctptB4XHEDZXY9OarEf8P
	 RaWRHAwMkDX8i9/4nwYGkxSrk6voWBR7LOwlnAVInO65vNdmNd4kRnJToGmatR5teT
	 VB7+z9FmGtpfy65D5ezjjc62Zurks+Vr7igph/YgEPa35+4aFwKVIbKNIzj6MAWHWA
	 a9hpksVxHj89A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Remove unused ath12k_base from ath12k_hw
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240529060939.4156281-1-quic_hprem@quicinc.com>
References: <20240529060939.4156281-1-quic_hprem@quicinc.com>
To: Harshitha Prem <quic_hprem@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org,
 Harshitha Prem <quic_hprem@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171863559405.53335.7477660274917067643.kvalo@kernel.org>
Date: Mon, 17 Jun 2024 14:46:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_074637_884783_8FC67CA7 
X-CRM114-Status: UNSURE (   5.51  )
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

Harshitha Prem <quic_hprem@quicinc.com> wrote:

> Currently, device (ab) reference in hardware abstraction (ah)
> is not used anywhere. Also, with multiple device group abstraction,
> hardware abstraction would be coupled with device group abstraction
> rather than single device.
> 
> Hence, remove the ab reference from hardware abstraction.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Harshitha Prem <quic_hprem@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4f15b06e5782 wifi: ath12k: Remove unused ath12k_base from ath12k_hw

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240529060939.4156281-1-quic_hprem@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


