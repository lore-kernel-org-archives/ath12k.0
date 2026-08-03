Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5198C55179
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 15:02:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dWiiJckTVDVzLcARnbHfx74nS0LLRWR4IWZsUe6MJL0=; b=veevNHAt4rfKDbSJaUgEnM34N6
	jdiFmYpByEJrO+YBbsjFWBP7lhoPE2Cp4ILXGp48tRllRke+lmukBpBBUd6KdMYn6/kHA/reLtF4j
	pt1jJfQcQdjH0IZzx28/p/ovfaleTbzdPkfrzbznz2iJodNM/2g2Ddnsss36kH+QkwVXmMXQHdAZ7
	NVpbg8Kj4ZTfNgNWG1EE64iZIUxzo1cbLZzg5HATF4gdC+39euWgvuCpJUfrq3BwMuuXGJByLddJD
	S5CMLKqT67p+KlGEPGWBbhWr0TG1PSKhuDmB9q0zCMRxk3BmeQFd+3v+l9DQz+jKa4mvUklPQQb4i
	021/LKYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquBo-0000000HSi4-05bF;
	Mon, 03 Aug 2026 15:02:52 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquBl-0000000HSgp-34ae
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 15:02:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785769368;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dWiiJckTVDVzLcARnbHfx74nS0LLRWR4IWZsUe6MJL0=;
	b=OT1jczKXtFWy0cgztoqoqAFjLj1BRSw0TYSDl6blCbRPhhugvxt5IpdB3EXK0ckg8/TcSH
	cKthtvuKJIvUdB9ij7DOS4HB0o9HyYhNHqdWNMsBMIIl0fk/LRw6Q8Th+6hKLVVD/ZfZcL
	3EmUpH1zEtSew+pX0TOmQz4LWiRD2GA=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-687-V0rD9lFtMCWaoOeB8dNFuA-1; Mon,
 03 Aug 2026 11:02:43 -0400
X-MC-Unique: V0rD9lFtMCWaoOeB8dNFuA-1
X-Mimecast-MFC-AGG-ID: V0rD9lFtMCWaoOeB8dNFuA_1785769362
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id EE38D1954B14;
	Mon,  3 Aug 2026 15:02:41 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 98CE31800480;
	Mon,  3 Aug 2026 15:02:39 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 1/5] wifi: ath12k: fix MLO station firmware crash recovery
Date: Mon,  3 Aug 2026 17:02:37 +0200
Message-ID: <20260803150238.28362-1-jtornosm@redhat.com>
In-Reply-To: <0ed1f684-1b3b-411b-87fa-929dc0f8f7e9@oss.qualcomm.com>
References: <0ed1f684-1b3b-411b-87fa-929dc0f8f7e9@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: Ygy8aKzQfBvY3lkjte-JsCFRgw61ex5L32Mx-EPYoFM_1785769362
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_080249_839975_960AEBD8 
X-CRM114-Status: UNSURE (   5.42  )
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

Ok, thanks for the catches. For v2, CRASH_FLUSH will be moved to
the callers to avoid a layering violation in the HAL layer and I
will use the correct radio's ab instead of radio[0].

Thanks

Best regards
José Ignacio


