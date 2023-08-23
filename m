Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BB90EE49B0
	for <ath12k@archiver.kernel.org>; Wed, 23 Aug 2023 14:18:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=XwyNyZY06MJ2GLAnHtke8bgKsBQInfmOqm9KHgzX6jg=; b=UGLTRV/gMJdN4j
	VlF5BRgtm9IvufCRo3XvI1AzvErolQWUqyeE3pLWF7DATi6APsmHHxc88zzdIywKdkZuwu8ytGfPe
	aDO5XlrR0IBQ68GQhy4Zlfk5crGSH3Fo8oW/X6vCCQXADBx3Exst/fmACQNXckdcPlhzEui7363hS
	iJdCNS7mZRSe2/c+7PbrwxwQ22o/8nXShSfZTzIh19nqH+mSK//Lu32uJbvhKFS23wWypdVZ7YqjB
	u/Ray4FlpfwRbJSHMg66nCO26AGGopF7J5qJYtqu7cK+6FADxLsr5MnrYxhRcAemGe23k8O7bR8nq
	ap88jlT61uwFjyQ5kkaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYogQ-000pPw-2I
	for ath12k@archiver.kernel.org;
	Wed, 23 Aug 2023 14:18:06 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qYogN-000pPR-0p
	for ath12k@lists.infradead.org;
	Wed, 23 Aug 2023 14:18:04 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id B927266322;
	Wed, 23 Aug 2023 14:18:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0C22CC433C7;
	Wed, 23 Aug 2023 14:18:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1692800282;
	bh=GMdH5vkLU5RgLDl3GYq0LoKq9cbkTrF9yoz4tusx7m0=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=C9mN4hJ1z2zQIpWY5e8AYfKGxW5FAdoWlPG3nLWdVprvBHJ+yLIzvANk8qeXBGaqW
	 WtNjOgPkmkjFgDsrbnA2Zfk7AEb9uW6uCup+e7mPGbP+kqY5/t9yYJUa5mytvQ6jG6
	 UenRPxQl/odyS544yGUuoUROTqYnqA0rZ9GbO3d18PvaN/jViTXGxJAJh/uwScD3jX
	 tz9kY+5X1Yzjz2BWsIxS5rM1A9bcH7iH13SmG7jXpfl24ih2XbTY+8TsUfrRB+UG4+
	 xfH+JSQMrJ+T8+GEuXBoK2vgUfMuii8TUwwgYonfti19+iCfxNacy5ZdQO99Shr/X+
	 5kztToDGRZIkQ==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: Fix memory leak in rx_desc and tx_desc
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230718053510.30894-1-quic_rajson@quicinc.com>
References: <20230718053510.30894-1-quic_rajson@quicinc.com>
To: Rajat Soni <quic_rajson@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Rajat Soni <quic_rajson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169280027919.1336947.4721639851626095486.kvalo@kernel.org>
Date: Wed, 23 Aug 2023 14:18:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230823_071803_342209_BB015037 
X-CRM114-Status: GOOD (  10.08  )
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

Rajat Soni <quic_rajson@quicinc.com> wrote:

> Currently when ath12k_dp_cc_desc_init() is called we allocate
> memory to rx_descs and tx_descs. In ath12k_dp_cc_cleanup(), during
> descriptor cleanup rx_descs and tx_descs memory is not freed.
> 
> This is cause of memory leak. These allocated memory should be
> freed in ath12k_dp_cc_cleanup.
> 
> In ath12k_dp_cc_desc_init(), we can save base address of rx_descs
> and tx_descs. In ath12k_dp_cc_cleanup(), we can free rx_descs and
> tx_descs memory using their base address.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Rajat Soni <quic_rajson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

afb522b36e76 wifi: ath12k: Fix memory leak in rx_desc and tx_desc

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230718053510.30894-1-quic_rajson@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
