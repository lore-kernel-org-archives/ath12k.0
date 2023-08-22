Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2580AEE49AA
	for <ath12k@archiver.kernel.org>; Tue, 22 Aug 2023 16:14:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:In-Reply-To:From:References:Cc:To:
	Subject:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=Dq0rfReIdgJ1GNhfVGO/lswCFpVM8WIyoScwvNSltVo=; b=EQZb2cy0yUNHUk
	jnai/gCFbfxH7crMPmN+QIA0GlDEznz6ItIilwXvekSwoWOzgeSKqv7AC59aCjBTcvF4VwCffcnzI
	Ri5O+AW1fPCWw7T4IfvU4FkdQIWr4p0a0j4YknFp7SWbB/2bOppKoFKydQu7QUEId73Mluf9FZuZ3
	Uwimbw6joW+0K1dAxPEDD2RLamZfAmfXS/Z5bdHTMbtGq85+8PXORrkXzdyneK0W3QUVMqVXP9KDc
	7lYnw0s7xoUnuJKYXoLFpX8c7J9FYXDwKPKw163vkFTkTSw1vpOjZH+XZnBWNsOuJq/wpV4k2BdRT
	TVJ284mB6fZCYjgp1Ptg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU1j-00GRQJ-2O
	for ath12k@archiver.kernel.org;
	Tue, 22 Aug 2023 16:14:43 +0000
Received: from [2601:1c2:980:9ec0::2764]
	by bombadil.infradead.org with esmtpsa (Exim 4.96 #2 (Red Hat Linux))
	id 1qYU1f-00GRNI-1N;
	Tue, 22 Aug 2023 16:14:39 +0000
Message-ID: <8d8c94d0-8c15-e1c4-cbe4-a1362af4d5f7@infradead.org>
Date: Tue, 22 Aug 2023 09:14:38 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH 1/3] wifi: ath10k: Fix a few spelling errors
Content-Language: en-US
To: Jeff Johnson <quic_jjohnson@quicinc.com>, Kalle Valo <kvalo@kernel.org>
Cc: ath10k@lists.infradead.org, linux-wireless@vger.kernel.org,
 linux-kernel@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org
References: <20230822-ath_spelling-v1-0-8e2698759564@quicinc.com>
 <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
From: Randy Dunlap <rdunlap@infradead.org>
In-Reply-To: <20230822-ath_spelling-v1-1-8e2698759564@quicinc.com>
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



On 8/22/23 07:50, Jeff Johnson wrote:
> Fix a few issues flagged by 'codespell'.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath10k/htt.h  | 4 ++--
>  drivers/net/wireless/ath/ath10k/pci.c  | 2 +-
>  drivers/net/wireless/ath/ath10k/sdio.c | 2 +-
>  drivers/net/wireless/ath/ath10k/wmi.h  | 8 ++++----
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 


Acked-by: Randy Dunlap <rdunlap@infradead.org>
Thanks.

-- 
~Randy

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
