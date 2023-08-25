Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CA071C3DA6F
	for <ath12k@archiver.kernel.org>; Fri, 25 Aug 2023 07:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=jD+flluuH1uhghcSEX50i7SZym0PyHAw5NmWswwyXKk=; b=g74bXRM7U/hGqM
	eibEdUAApPqate6EoVurTKFtu8ZureVd/RCfaV2HSaMFRvme3wiKrXEXxpADJrh+KuVumuJSV/404
	vHt7gDGX3lOCinecU+ZZ1k9UgGdiVGmKthy/SLSPcL2IejcFPN2xsRSnvCqs5cxboUPmFi5POcYO4
	ZR5PC5FxNTAtF288fZ5OgrOyCpaIjJoi5pJ3wVO3Q1spdYftY8HlM1EDUmFljM183XC1meB8TZQ9S
	DkRdCag1Ss/wKemYHOZRe0xlWRVmFZViMe/nNCIIKggNWyVG4pS94P63EqUUIdU5tkmF4dEsouY/t
	uhaH9mriZ0GSVNDeokRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qZROR-004YNi-1Q
	for ath12k@archiver.kernel.org;
	Fri, 25 Aug 2023 07:38:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qZRON-004YNL-2G
	for ath12k@lists.infradead.org;
	Fri, 25 Aug 2023 07:38:05 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 3B97A610E7;
	Fri, 25 Aug 2023 07:38:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 87A1BC433C7;
	Fri, 25 Aug 2023 07:38:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692949081;
	bh=rIJIPqcFDi8P6Ugm4UnTsYJPEN9MCdsOm9JaqnZrxw4=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Rrgcp9Ffq85CLtYlK2qoHc/Z+itQSZ3kGOv3FLfqskuv95eFbyvFr3K3aypkzKflo
	 ZCbWQes3DzyUPh08BzMVFGoenbspABUa7bfIXvJwzLJXML0rcSHsU9ik1rn8izvTZo
	 o4yGTzvNzkWZQsbR6ApD6XAj1HyHIFYekHj3BvhB0BP/Tp96208oBC2Nv59OyJn4m8
	 +vQWTLKv/6YzOJrsn661S0d9C4K5j8CEAIbI5hJle5ZFEsCsBIdEgVR1hiMt7MLDDA
	 aEIfGOF8GKjXCLDp19rtNmQjjwML9Z2CWSQib85v5iBRunBAVj/BkUcHRfA4a1qFWq
	 KvRxrVjZaNqZg==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Remove unused declarations
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230816130550.50896-1-yuehaibing@huawei.com>
References: <20230816130550.50896-1-yuehaibing@huawei.com>
To: Yue Haibing <yuehaibing@huawei.com>
Cc: <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <yuehaibing@huawei.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169294907848.1674223.5754694111228394396.kvalo@kernel.org>
Date: Fri, 25 Aug 2023 07:38:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230825_003803_798214_DE8EF657 
X-CRM114-Status: UNSURE (   5.91  )
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

Yue Haibing <yuehaibing@huawei.com> wrote:

> Commit d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> declared but never implemented these, remove it.
> 
> Signed-off-by: Yue Haibing <yuehaibing@huawei.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

0e5b1b46925b wifi: ath12k: Remove unused declarations

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230816130550.50896-1-yuehaibing@huawei.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
