Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D176C44501
	for <ath12k@archiver.kernel.org>; Tue, 14 Jul 2026 16:02:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wUNNWibDn/BZBN0Yj4RGfEkbU3xIBSd6uXOb2mPy2/g=; b=4ruVjNUkiYd/swQoHBY9srmgdC
	SWSM6aOme2yXpzPbykSLuVY+ADXpOpjsxgI+lrEp8HvKfzB7SK40CRR2JQL204HWA20Wq4vAupBfe
	N73Lrjc38uW+1u/YbmgRZ9cicPMUFuwjewUFsxcAnut0Y7ZcZPYpYTz1fWBpviYSPNS5yes6nvN9y
	YilCLCdKCSVhlOTVKJkuA+XSX1tdc4RX4qxRuMk2G91UQpFqVlFBM0ObE8bop2ndO8/n2B70CUpB7
	Fkol8RsLdtqNE0Zr4e/5sZwXr8jFttqeZR5S3Qi97Rwsm61sj6j/CSWZ4Gl1jPckzNH7nhJ+S13IH
	elD+WDsA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfaA-0000000CcAF-0PDU;
	Tue, 14 Jul 2026 16:02:06 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjfa6-0000000Cc9I-23bR
	for ath12k@lists.infradead.org;
	Tue, 14 Jul 2026 16:02:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1784044921;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wUNNWibDn/BZBN0Yj4RGfEkbU3xIBSd6uXOb2mPy2/g=;
	b=HWgMoS78F910EB1Uz7YShdndk8VXRokdCpDV2D/f3omMNNgA9uMLpVqzJKs0XX2C3W6vMM
	0soa4SFUy2G/jCejpvhVGM0aeEznZuFFBiixbIQv5zuRWzgNljQhZYDqkMQvgWdUB92YWV
	T8Xd1ShgqL759JX+VdpxKgoAGX8EYkM=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-582-diT3p4VAOaiuz_tn0sAkyw-1; Tue,
 14 Jul 2026 12:01:58 -0400
X-MC-Unique: diT3p4VAOaiuz_tn0sAkyw-1
X-Mimecast-MFC-AGG-ID: diT3p4VAOaiuz_tn0sAkyw_1784044917
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 763801956070;
	Tue, 14 Jul 2026 16:01:56 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.50])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98E2918005B3;
	Tue, 14 Jul 2026 16:01:53 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 2/2] wifi: ath12k: implement custom wake_tx_queue with flow control
Date: Tue, 14 Jul 2026 18:01:51 +0200
Message-ID: <20260714160151.664019-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKZABhFkS9MVqbeRFHLUXoNaJC-qocmcPVmZ8ov2j+DMzw@mail.gmail.com>
References: <CABkEBKZABhFkS9MVqbeRFHLUXoNaJC-qocmcPVmZ8ov2j+DMzw@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: 5TnwKHCoGPwjHdPgmC9U6ajwFEKlJuCQadzkGNEca1I_1784044917
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260714_090202_619763_63676120 
X-CRM114-Status: UNSURE (   9.89  )
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

Hi Tamizh,

Thank you for the review.

> This assignment is wrong and all traffic is incorrectly steered to
> radio[0] as ah->radio is a flexible array, not a pointer

You are right, I will fix it in v2.

> tx_ring/tcl_ring selection should be corrected.

Yes, as also pointed out by Zhi-Jun You in the ath11k review, the ring
selection in wake_tx_queue needs to match dp_tx in a general way.
I will address this for both ath11k and ath12k in v2.

> Do we need this spin_lock_bh?

Yes. Without wake_tx_lock, there is a TOCTOU race between checking ring
space and dequeuing:

CPU A: num_free = 1   (sees 1 free slot)
CPU B: num_free = 1   (sees same slot)
CPU A: dequeue -> dp_tx (succeeds, fills last slot)
CPU B: dequeue -> dp_tx (fails -> -ENOMEM, frame dropped)

The tcl_ring->lock inside dp_tx only protects the descriptor write, not the
check-before-dequeue sequence.

> Do we need this check and spin_lock here? already ath12k_wifi7_dp_tx()
> has this lock and fetches the next entry. Can we check those return
> value here and break the loop?

We need to check before dequeuing. Once ieee80211_tx_dequeue removes the skb
from mac80211, a dp_tx failure means a dropped frame. Checking num_free first
avoids dequeuing when the ring is full, which is the whole point of the flow
control.
In addition, tcl_ring->lock is required by ath12k_hal_srng_src_num_free
itself, which asserts the lock is held.
The brief lock also ensures an accurate count synchronized with dp_tx on other
CPUs.

Best regards,
Jose Ignacio


