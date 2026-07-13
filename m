Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23AB9C43458
	for <ath12k@archiver.kernel.org>; Mon, 13 Jul 2026 15:02:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=; b=RnAJHiUwQ4yZ7moARGCklsMx3H
	EavQ/pVz8MG4XI67dDTYPkEc9FFEP7db1rjQkQ50NyZovWEySNfS6ihgOy+lzlblGHOPDmKbzpVKV
	O3MXBFCw+a3futwGkbfpRJMhQgZwKyviaiIXgq7PrO+ZeDk+Fu9zDsUVMydHzdrrk+Uqxyq25zePy
	JxEC59JZntyAtCRVthq7cpt0DJ3+jyCNsxJmnWlpHI/vHoXplATITIkX9nufamRUO8hm2krXLdXLX
	DtDlMIgEE2+kH2wzF5Mb3DZJyPsBP85th0Njiz0QPApb0SypAvvMar+vBoOOdOCLg3WPSndZzrdD8
	M9FRnr3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIAb-00000009iG3-3jQf;
	Mon, 13 Jul 2026 15:02:09 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjIAY-00000009iED-1z4h
	for ath12k@lists.infradead.org;
	Mon, 13 Jul 2026 15:02:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783954923;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=88RxX+JkWNZbQ2cIlHOd3evCkQ6J14mP3ECcOysTa0w=;
	b=he4sD82ljT/nP65FhFxPKdLfsqZhnVMWq4Ed6u7kyzgMX+CcQsan5fFIzvxDC7qoyFB6G5
	WJwq3vaY5FJtCkkiGLPs9QwF/l3ONCsJVc8ZnTfYzY53TZq6mEofG9TaTGvjGLSyPrT2vi
	lOqo5YTMmK8myYFOOPqmlx1YTm2yGHc=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-495-foHAshqCPpOhpbdRenkVsQ-1; Mon,
 13 Jul 2026 11:02:00 -0400
X-MC-Unique: foHAshqCPpOhpbdRenkVsQ-1
X-Mimecast-MFC-AGG-ID: foHAshqCPpOhpbdRenkVsQ_1783954918
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id A66ED18009FC;
	Mon, 13 Jul 2026 15:01:58 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.81])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 763911956086;
	Mon, 13 Jul 2026 15:01:55 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: hujy652@gmail.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/2] wifi: ath11k: implement custom wake_tx_queue with flow control
Date: Mon, 13 Jul 2026 17:01:49 +0200
Message-ID: <20260713150151.2343583-1-jtornosm@redhat.com>
In-Reply-To: <20260711153336.542-1-hujy652@gmail.com>
References: <20260711153336.542-1-hujy652@gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
X-Mimecast-MFC-PROC-ID: W9tPuqEkdTEf4b5RHrlGsuZ1ThLqEzj-s-9ejayE__o_1783954918
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_080206_586497_F51E95A0 
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
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Hi Zhi-Jun,

Thank you for the review.

> In wake_tx_queue:
> ring_id = txq->ac % ar->ab->hw_params.hal_params->num_tx_rings;
>
>In ath11k_dp_tx which is called by ath11k_mac_op_tx:
>ring_selector = ab->hw_params.hw_ops->get_ring_selector(skb);
> ti.ring_id = ring_selector % num_tx_rings;
>
> Are you sure ring_id will be the same?
You're right — txq->ac % num_tx_rings doesn't match
get_ring_selector(skb) % num_tx_rings on all platforms.
In v1 the ring identification was only correct for platforms where the ring
selector happens to coincide with the AC, but not for platforms.

I will send a v2 trying to solve this globally for all the platforms.

> Also mgmt frames use a different path.
Correct — management frames go through WMI, not the TCL data rings, so they
are not affected. The flow control applies to data frames, which are the
ones causing the problem since they use different TCL rings depending on the
platform's ring selector.

Best regards,
Jose Ignacio


