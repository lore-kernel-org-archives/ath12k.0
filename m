Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8119CC54FD2
	for <ath12k@archiver.kernel.org>; Thu, 30 Jul 2026 06:14:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VxR8UAJtcjYgK0Ks1J1kqZQ3imslT1g86zOzrovDsfo=; b=CIU130/JrCGwBL5bNxmEtNgcv6
	Vzc0EwOHqtNJbsvNKFQl0J8m0ZUK1oxsF7YenIt7ovuXv1adQJATDqb8a/RqdfMiDmltvxiOfDsGZ
	Y72mZW8EcGXbbFog9BuRirhLc7xQn+EipDdCUVwr3B7IxtlZ7b//fWpuYLDv1nSZDJ9lPvRAa4hrs
	7bO/M+/2IcEVebMF4W6/rMYM9pvyNqy1oaVO9GVcSO01wajSlgWj3z+ibtzjZdlXsJMieS5GkGuKC
	xOqHOsOJ+5kj5kVjQ9PQjylVP8gPvWdjJx0y1dnPq5pSQzbIgPaxbTFwj9OmmuSBahuO3j2D1WHnR
	Wu0FpHxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK20-00000009afv-0rsf;
	Thu, 30 Jul 2026 06:14:12 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpK1x-00000009afE-0H6e
	for ath12k@lists.infradead.org;
	Thu, 30 Jul 2026 06:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785392047;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=VxR8UAJtcjYgK0Ks1J1kqZQ3imslT1g86zOzrovDsfo=;
	b=idbInVLOHh7GylIVVMWkdNPiCvEpxVw+ZN0nqupFOEkQt5Zaij2Q+FYmKIfm/s9fsAwWwv
	mZK6A0Mnxyxjh53SHBuOW8ojTjBbqmkbhXwqnp3JVDCcvjODBOhfC62m44+j8gfzpkmfBU
	gUE1wn/zXRib8pVQBl1FzNkYyDW8akw=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-220-9olPWGfROyS3-zhNItRBAg-1; Thu,
 30 Jul 2026 02:14:02 -0400
X-MC-Unique: 9olPWGfROyS3-zhNItRBAg-1
X-Mimecast-MFC-AGG-ID: 9olPWGfROyS3-zhNItRBAg_1785392041
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 30A8B19560B4;
	Thu, 30 Jul 2026 06:14:01 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.33])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 0C54F180049F;
	Thu, 30 Jul 2026 06:13:56 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: tamizh.raja@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH v4 1/4] wifi: ath11k: use queue mapping for WCN6750 ring selection
Date: Thu, 30 Jul 2026 08:13:53 +0200
Message-ID: <20260730061355.212639-1-jtornosm@redhat.com>
In-Reply-To: <CABkEBKZ7+Z=DL5scE7LnFQz==c3JKoUfFgfDYRf5HoLS_=fr=g@mail.gmail.com>
References: <CABkEBKZ7+Z=DL5scE7LnFQz==c3JKoUfFgfDYRf5HoLS_=fr=g@mail.gmail.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
X-Mimecast-MFC-PROC-ID: pfxevDXDp8q1AKoueBhSUS4n-l1yzaSb0SqwdssbyMo_1785392041
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260729_231409_171702_C29F84D1 
X-CRM114-Status: UNSURE (   9.04  )
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

Hello Tamizh,

> Sure thanks for the information. Do we have throughput values with
> this change?

I don't have WCN6750 hardware, but since WCN7850 (ath12k) already
uses skb_get_queue_mapping() for ring selection, I tested on
WCN7850 comparing queue mapping vs hash based ring selection with
the following change:

  static u8 ath12k_wifi7_hw_get_ring_selector_wcn7850(struct sk_buff *skb)
  {
  -       return skb_get_queue_mapping(skb);
  +       return skb_get_hash(skb);
  }

The hash based test was done on top of the v3 tx flow control
series, which is needed to get stable throughput results.

Results (100s iperf3 TCP TX, open radio environment with VMs):

  skb_get_queue_mapping: 764 Mbits/sec (8.89 GB, 19 retries)
  skb_get_hash:          744 Mbits/sec (8.67 GB, 25 retries)

Throughput is comparable with no measurable regression from using
queue mapping based ring selection.

Note that VM-based testing may not reach peak hardware throughput,
but I think it is sufficient to compare the two ring selection
methods under identical conditions.

Thanks

Best regards
José Ignacio


