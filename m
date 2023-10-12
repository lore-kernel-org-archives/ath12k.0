Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E033CDB46E
	for <ath12k@archiver.kernel.org>; Thu, 12 Oct 2023 16:06:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+vdz1T4JAcxuP4wIq+J7B21S9Q72P+BFI4cTgR5t2i8=; b=XIon81sm/J6Wo7
	m/wDsN5psUHjRTeCRZjxj1RtiMh6QrdL//j04ftutvM/swR/ucb5TTBcSJaFqMQD4+36Q3gBCUg3g
	tYz1PnJ3hT8bV/GN4VbfU87/sSuGObIpohNvLuONh5VtF6PYEfoMDzYm1qCMNOMfO89Eu0tADn7hj
	3NSNlyv7juMzoq0rTtGfqn0FF8GzYmCR3oMi9jULuJdki6WRPdoJSJmOzb1AT4zd0nMHyFZL1zVnv
	k0ZV5Dg6WK7PbfjXIxoguncybm03sn9bxk9lRshV/yhhg41HaFYNdoD8yd9Azwr8lhYwsMIyelNs4
	SxBhBrKoXkRfJ2qjtL+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyCK-001MHK-0r
	for ath12k@archiver.kernel.org;
	Thu, 12 Oct 2023 16:06:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qqyCF-001MGi-35
	for ath12k@lists.infradead.org;
	Thu, 12 Oct 2023 16:06:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6F1D761E6B;
	Thu, 12 Oct 2023 16:05:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 11669C433C9;
	Thu, 12 Oct 2023 16:05:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1697126759;
	bh=0TlcdU2OQsnqZNwSF/TbmRxff0z5OtOe3PDAchLyUY4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bBIgfYGLCrKFDDZeCFrPxO3rDG2w/1HHKNdYeWv0d5c1Wtr8B41YTW5jKLK+jXaGS
	 dDYALoQe2a5f9pGkLGA3OHQ5EU9sva2gXLx4QIOd18Vun8dfxs9bkwlgUtGlLQadcL
	 iECsoPWAmhefL00EK+n88EebxOHLEafK3nDnsgLGSyIoD6lqpVxGX9kC7OdqhXIYbG
	 DzEzsje5C3S/C6HcuFCg28RXi3R4HEyn3ycxkOg85kfKSqC8OGfdz88oEegtaCRoK/
	 p4UGhgZo+h5VSgtdFUJDOICjcN6zY2KZn/zevrfvvpK0cM0XV9c91JSg9SQOyQ7KxO
	 lKhB4gp7u55vg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: add parsing of phy bitmap for reg rules
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231004092818.25130-1-quic_adisi@quicinc.com>
References: <20231004092818.25130-1-quic_adisi@quicinc.com>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aditya Kumar Singh <quic_adisi@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169712675583.3501995.11017953895035699214.kvalo@kernel.org>
Date: Thu, 12 Oct 2023 16:05:57 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231012_090600_039771_0EF20195 
X-CRM114-Status: UNSURE (   8.83  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> wrote:

> Certain regulatory domains could put restrictions on phy mode operation.
> For example, in a few countries HE/EHT Operation is not allowed. For such
> countries, firmware indicates this via phy bitmap in each reg rule.
> 
> Currently, there is no logic to parse this info and then pass it on to the
> cfg80211/regulatory.
> 
> Add parsing of this phy bitmap from the regulatory channel change event and
> then accordingly map it to cfg80211/regulatory flags and pass it on to it.
> 
> While at it, correct typo in debug print: s/dsf/dfs.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

29ea0d409103 wifi: ath12k: add parsing of phy bitmap for reg rules

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231004092818.25130-1-quic_adisi@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
