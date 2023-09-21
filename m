Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A2A8E706E4
	for <ath12k@archiver.kernel.org>; Thu, 21 Sep 2023 08:02:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8Au7KjvWThO7F2REpXZT0BrcE05rjXx7KzRvsch6sRk=; b=mdEaniWO8/1PYk
	uih2LEe5YoCCxps7D6YfptJ6/bJL1ZsSmxYBSIQRE3B5Ges6YzBN9wSQ8dWLnWMZLbzN+2otlOIBn
	7+IwXwoTQOob/Fli1HB9iTGSvn1LEPKjHd9Jb3V1d7Y5ALV1kHYhoh61InUI7hS0n+ck26pk0dMGD
	0TBj92q+2KKVMAVuIDVtrC5rsYCv8umIqrgqapY1oTpGyL69NDnYv/tiGoh7BSv/nSKhiSpkT57z9
	VZew5Hv6R8/zvt9321oY+z8Oqj/6vvPje6XegFctGXzr40qEw8KkS2BEcKGkglcyR7FieWqccf38O
	TcuHNiRhpyZhx3SH7WxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEdf-005RCz-2Y
	for ath12k@archiver.kernel.org;
	Thu, 21 Sep 2023 08:02:19 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qjEdc-005RCE-27
	for ath12k@lists.infradead.org;
	Thu, 21 Sep 2023 08:02:18 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id C865261E7C;
	Thu, 21 Sep 2023 08:02:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6A873C116A8;
	Thu, 21 Sep 2023 08:02:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1695283335;
	bh=A2wDMxQ/CgRduFurU/x5XEPPz5f7IpyK+/xPd1NPnFc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=r+BLK+3dG66LnrsnSmxtrxbszEVM4dLwRjhjhKeCDWX9JLeX4NFVcgtySnK47744q
	 yuVT+mVv9ibi9BfXbeuiOeu1EGabqueReEIdUBs9EdYScxKmUnMS5OkQFZlsw4PxDe
	 a78RE+8RqqSbNXyFExTIIYyrmzQ3il0C5zFsN8Bma+to/ZsGHX2eGbyoBduwwnKu1W
	 PUrZYfqQyLm/iEVB0WNNWQGLU+LBWJzUJTJDuxrTbRcA0hyuodR3w9UM2P7p0lDK4H
	 xVAiXXiGZ3Es9c+BIjud5wBI1hhsA1ILTktGLfBc89SFj8HZtdE0Yyo+AY/3KzWIiN
	 9GKQ2Zzyf02qA==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: fix possible out-of-bound write in
 ath12k_wmi_ext_hal_reg_caps()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230830020716.5420-1-quic_bqiang@quicinc.com>
References: <20230830020716.5420-1-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169528333260.1539628.5137606082787828430.kvalo@kernel.org>
Date: Thu, 21 Sep 2023 08:02:14 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230921_010216_739720_0332D85B 
X-CRM114-Status: UNSURE (   8.01  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> reg_cap.phy_id is extracted from WMI event and could be an unexpected value
> in case some errors happen. As a result out-of-bound write may occur to
> soc->hal_reg_cap. Fix it by validating reg_cap.phy_id before using it.
> 
> This is found during code review.
> 
> Compile tested only.
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

b302dce3d9ed wifi: ath12k: fix possible out-of-bound write in ath12k_wmi_ext_hal_reg_caps()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230830020716.5420-1-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
