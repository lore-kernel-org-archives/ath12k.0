Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0052CCD8CB9
	for <ath12k@archiver.kernel.org>; Wed, 10 Jun 2026 10:01:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:content-type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G0u3YOlBGasTqI/efMg4dbBFjH2Jdl45+ZYBRiUMwLY=; b=P4JcwW8m3KJ+tJSlJ9yTcB16cW
	6lGBKKi1U5kksW2aUzaK0Psuf5Q7dvyQufiMhnAbULKsemahuexpEv22FIPfGL4M373gvN1mGK2Mx
	wCMsxYzG+xGru/savKEZKj6Y7DV1jzr4LY505me4ekFx0JrZMbGMQgdoC7ujBISPkSsu10E/tj26a
	dBS/lIqafNlqpKKrOfiqHqkZSyBjorFUx7E9qC0iMdv4igt6JID3xHDGfcntw7MdYAxOzhCkzWRk/
	ye736tLhmhuj2PJUj47gkUCT2X0zeV4X/npdOiR+cU8CCqjQNqSsaqYzeydAKqoLKx0nb8WYqeI9m
	cytVlXzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFkM-00000007KmE-31zk;
	Wed, 10 Jun 2026 10:01:18 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXFkK-00000007KkF-0kDh
	for ath12k@lists.infradead.org;
	Wed, 10 Jun 2026 10:01:17 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1781085673;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=G0u3YOlBGasTqI/efMg4dbBFjH2Jdl45+ZYBRiUMwLY=;
	b=NW413LBOVuhCSUbQQYtqEAu4+yMzK1PDwOjLdxEgFyb3CwMZpu/4ZgU7W8s0UULlyyukWi
	o3tw7mrfBC/CXRASyEyV9Gcj+ZoSrS6IwJAsUnb/3BppNYQjfTFhGJrXpTqptuO1UPemnr
	IYw4H1tJQ7OD54tsajNVOWg7qyPA/9U=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-308-kRo-Y_WdOd6I7y7utJw08Q-1; Wed,
 10 Jun 2026 06:01:09 -0400
X-MC-Unique: kRo-Y_WdOd6I7y7utJw08Q-1
X-Mimecast-MFC-AGG-ID: kRo-Y_WdOd6I7y7utJw08Q_1781085667
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 505BB1845575;
	Wed, 10 Jun 2026 10:01:07 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.27])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id E818C1800599;
	Wed, 10 Jun 2026 10:01:01 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: alex@shazbot.org
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	bhelgaas@google.com,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-pci@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	mani@kernel.org,
	mhi@lists.linux.dev
Subject: Re: [PATCH v8 2/3] PCI: Add device-specific reset for Qualcomm devices
Date: Wed, 10 Jun 2026 12:00:59 +0200
Message-ID: <20260610100059.19235-1-jtornosm@redhat.com>
In-Reply-To: <20260609115352.32acb6fe@shazbot.org>
References: <20260609115352.32acb6fe@shazbot.org>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
X-Mimecast-MFC-PROC-ID: 12MCSnQGdIbBISaRgrvtH2kCaF8Lg6JK-Iw_xjVCJT0_1781085667
X-Mimecast-Originator: redhat.com
Content-Transfer-Encoding: 8bit
content-type: text/plain; charset="US-ASCII"; x-default=true
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260610_030116_293473_EA99879F 
X-CRM114-Status: UNSURE (   7.75  )
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

Hi Alex,

> My only complaint is that this is positioned a bit generically...
Ok, I'll make the comment of the function more specific for these Qualcomm
devices.
  
> Has each of these devices been tested on a platform where D3cold is
> actually achieved through this method?
No, I don't have access to platforms with _PR3 support. All testing was on
M.2 adapters (D3hot fallback only). Since D3hot works reliably and D3cold
is a stronger reset mechanism, the approach should work - but I cannot
confirm the D3cold path through testing.

I'll send v9 with the updated comment.

Thanks,
Jose Ignacio


