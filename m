Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37582C433FE
	for <ath12k@archiver.kernel.org>; Wed,  9 Nov 2022 09:12:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:MIME-Version:Message-ID:In-Reply-To:
	Date:References:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=tzHtuyr/cVRC7MVP2bUKZdRdYnHT4RZE0HU+/aFVqRU=; b=T7GFjxzxcO3SpB
	w5hIQRZVbQIfkBMIwn5FUTruATR1vj6XEVGmWOFJ4P+vI9Y3UrA/e/1RWPXRDrO8jTTqs4jBYAUYS
	An4fnyAe4EwgMZ54y8H/dr2lVTueE5+tHxiF3pMmEVPFhPahwMg4zoW0H7zBMxugtMCQMhHRbE8w5
	UTlWifmrkqG5aWbBKHcayk8MxzQ1UFKb9azTCQ+RsLEKDV//PfLC6Wtn8PJtl9LUnjyufS7LRRD2T
	4e/EsKP5cc0IUuhIx9MRffA5h2kyPlBTkKI+lU3/CGU72tGFC55J/xHyb7WnYjcrzgRZp93ln7jqU
	h5Vukfl8oStityfAbSNg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh8W-00CBcN-Lk
	for ath12k@archiver.kernel.org; Wed, 09 Nov 2022 09:12:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.94.2 #2 (Red Hat Linux))
	id 1osh8S-00CBbA-TZ
	for ath12k@lists.infradead.org; Wed, 09 Nov 2022 09:12:43 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id 1A7F861927;
	Wed,  9 Nov 2022 09:12:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B3A42C433D6;
	Wed,  9 Nov 2022 09:12:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1667985156;
	bh=8NzWCPjkAoa+RpKYFyCspWjzDZCZhOrqsXKUEyReREI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=jxENUgkLMCrH+diHRalJM9zwlo1NtzJfbaJ/1jMOUs8/JJy2XGqkeYs4sW2BUePT9
	 xfaHrMuhz+re/ox/2oFEtwhB6WpgrQjVdRDfMspviA54mZnZLaWNJszq2i8CNGK6jd
	 BmXeTUzRAElHl0sGlnkJvhI5usiqj+EPk+XI5+m0cQZ98gRHJ898w3dCdh4EBN6kA/
	 b4ejIVJRbggvR8bAcxB1Ex/gJ7sHc0/o+XkDyMBS6c6jQa7HXvU0wtkALHRAu0LBzV
	 GCN3763QQ0N5vyvrnWOUH3kfvft/eALwSYId8wIGkH4ECZCqdIpj/t/KbuFo7r87VG
	 dYCiWx4IeKkmg==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>
Subject: Re: [PATCH 07/50] wifi: ath12k: add dbring.c
References: <20220812161003.27279-1-kvalo@kernel.org>
	<20220812161003.27279-8-kvalo@kernel.org>
	<d9403714-d7ef-3a7c-0448-e5b2b0a60c34@quicinc.com>
	<87v8odjv1f.fsf@kernel.org>
Date: Wed, 09 Nov 2022 11:12:32 +0200
In-Reply-To: <87v8odjv1f.fsf@kernel.org> (Kalle Valo's message of "Fri, 21 Oct
	2022 14:06:04 +0300")
Message-ID: <875yfocwzj.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/26.1 (gnu/linux)
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20221109_011241_030904_EAEE0A33 
X-CRM114-Status: UNSURE (   8.98  )
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

Kalle Valo <kvalo@kernel.org> writes:

>>> +int ath12k_dbring_buf_setup(struct ath12k *ar,
>>> +			    struct ath12k_dbring *ring,
>>> +			    struct ath12k_dbring_cap *db_cap)
>>> +{
>>> +	struct ath12k_base *ab = ar->ab;
>>> +	struct hal_srng *srng;
>>> +	int ret;
>>> +
>>> +	srng = &ab->hal.srng_list[ring->refill_srng.ring_id];
>>> +	ring->bufs_max = ring->refill_srng.size /
>>> +		ath12k_hal_srng_get_entrysize(ab, HAL_RXDMA_DIR_BUF);
>>> +
>>> +	ring->buf_sz = db_cap->min_buf_sz;
>>> +	ring->buf_align = db_cap->min_buf_align;
>>> +	ring->pdev_id = db_cap->pdev_id;
>>> +	ring->hp_addr = ath12k_hal_srng_get_hp_addr(ar->ab, srng);
>>> +	ring->tp_addr = ath12k_hal_srng_get_tp_addr(ar->ab, srng);
>>
>> s/ar->ab/ab/ in both of the above since you already have ab = ar->ab
>
> This is still not fixed.

This is now fixed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
