Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 35B4CC5CFC1
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 11:14:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZevwHzhpm82rY3Q7CIME/Xq4cR9/ImEJ3tGIPz//zTk=; b=VWX1mgGOP/4mG17O3Oo3gfs6Ua
	hfM/DdffgGg1a1fS47l65wwKKy5CrmLXtmS1cq5srcVjthhWBdxDXwKuQSDeR6EjSurBzP7wKrL6b
	gq19lFDpWpK1dCrI94pOJAlArST/gu0+oKYc7dhG5SpPyuxXYXPRXKBHD0lCaxV3YT9pCVILnnO/y
	lgyp9unI2fd0GL+V5Q9j56itX4ipiEX0orZzj8kKBvVmGVVBchKHJfavdwAk1uqKww48k82bmehwo
	Lnt5KyhL+fpFWimykMcmF5uTwvavjFUKsyC2OE1J0Na+goers5V2JE8oFvHbDjjx5+lQ1LKBj45W6
	TEbU5ZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkR0-0000000DuT9-3Nae;
	Tue, 11 Aug 2026 11:14:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtkQx-0000000DuSD-3jBF
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 11:14:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1786446855;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=ZevwHzhpm82rY3Q7CIME/Xq4cR9/ImEJ3tGIPz//zTk=;
	b=GIR2c/jNjIi945TARBohkj2xHa6jIx1McWQXoCoXwKNBUU+t0EIIs+1UvaE7/NJ/FPIQhY
	VB9mI2xnEtkH3EO8rtgSU22PtUh86vEf84M4bNNwtjfGl1MXHkut5+hLISBXMzt78xjmsm
	FZI8qheAXRnS2TdvFFd5k+K2XkBsHoo=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-331-2ONlxj_uPsi5N9kJgCxqag-1; Tue,
 11 Aug 2026 07:14:11 -0400
X-MC-Unique: 2ONlxj_uPsi5N9kJgCxqag-1
X-Mimecast-MFC-AGG-ID: 2ONlxj_uPsi5N9kJgCxqag_1786446850
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30E1D1800644;
	Tue, 11 Aug 2026 11:14:10 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.32.68])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 44FB1195DF91;
	Tue, 11 Aug 2026 11:14:07 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: jeff.johnson@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v5 4/4] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Tue, 11 Aug 2026 13:14:05 +0200
Message-ID: <20260811111405.397112-1-jtornosm@redhat.com>
In-Reply-To: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
References: <0b72231d-59f8-49bf-82a0-76d2c7862729@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: VK78bFbWn-J4zVexRbo-cHF6nLMllGjubxQmYMpy8VQ_1786446850
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260811_041415_997353_0BC8041A 
X-CRM114-Status: GOOD (  14.55  )
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

Thanks for the review, Jeff.

> Tested-on missing

Ok, I will add it in v6

> NAK, must be EXPORT_SYMBOL()
> The ath12k code was contributed under the license:
> // SPDX-License-Identifier: BSD-3-Clause-Clear

I did it in an automatic way, I will fix it in v6

>> +	rcu_read_lock();
> 
> does this lock really need to be held for the entire function including the tx
> loop?
> 
>> +
>> +	arvif = rcu_dereference(ahvif->link[link_id]);
>> +	if (!arvif || !arvif->ar) {
>> +		rcu_read_unlock();
>> +		return;
>> +	}
>> +
>> +	ar = arvif->ar;
>> +	dp = ar->ab->dp;
>
> or is it sufficient to cache these values and then rcu_read_unlock() here?
> my LLM reviewer seems to think that would be sufficient
>
> note the spinlock in the while loop will cause the RCU read lock to be held
> when invoking mac_op_tx(), satisfying the RCU lock requirement there.

Keeping rcu_read_lock() for the entire function is intentional. 
ath12k_wifi7_mac_op_tx() calls rcu_dereference() internally (on ahvif->link[]
and ahsta->link[]), and with CONFIG_DEBUG_LOCK_ALLOC, rcu_dereference() checks
lock_is_held(&rcu_lock_map) via rcu_read_lock_held(). 
Only an explicit rcu_read_lock() sets rcu_lock_map and spin_lock_bh() does not,
so releasing early would trigger lockdep warnings.

> using guard(spinlock_bh)(&tx_ring->wake_tx_lock) would eliminate the need for
> all the spin_unlock_bh(&tx_ring->wake_tx_lock) calls

Better, I will use it in v6

>> +
>> +		spin_lock(&tcl_ring->lock);
>
> seems this should be spin_lock_bh() to align with all other callers in the driver.

The outer spin_lock_bh(&tx_ring->wake_tx_lock); already disables BH, so
spin_lock() for the inner tcl_ring->lock is correct and sufficient. Using
spin_lock_bh() would redundantly disable BH again.

Best regards
Jose Ignacio


