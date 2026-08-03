Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 730DEC55184
	for <ath12k@archiver.kernel.org>; Mon,  3 Aug 2026 15:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dtTfyADUv6UVcav8BCvcrctzmdH4H1AlrLdkyFgcalw=; b=3URcLJfKLH1ovntTBmCbedWOrp
	dwkWhgw4vU6fLQDQ9yxXBGVdTN3yhvduhXIjM3tJhBGcSStneDmpKal6FUO0xRDJZFoX51TYnZieE
	aXrxF7wleG86h8hUmZebWCFVXtW7sR/VFyFZ1WsF/NYeBHOhravHbICiL8OOYp/pvJpT2LpKCAJxw
	lVpwooe69eE/vkYc4B6NcUjjRB6BY7j1LvAoBYheuWlerZS5j8RUdmVpFG6iILuWtfJE4UBUoz1r9
	huj3l49i72dqrm/Df5q5IVk2FdP7K1cZ0oM4aidvilLWg5EA98k4pTePN2lYM6oDX9lL42Sxvr44k
	/qH0spOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquUf-0000000HW1Z-0hAv;
	Mon, 03 Aug 2026 15:22:21 +0000
Received: from us-smtp-delivery-124.mimecast.com ([170.10.133.124])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wquUd-0000000HW0k-1bWT
	for ath12k@lists.infradead.org;
	Mon, 03 Aug 2026 15:22:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1785770538;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dtTfyADUv6UVcav8BCvcrctzmdH4H1AlrLdkyFgcalw=;
	b=hQE1/uYb8XJ2LPauAXdjxSXKu3pu5jtKnQyA3XI6zHxPmmOxYovAdfw44++3yhpbq15xhT
	q0qY1tlswZ4f4/3WF6M771ynK750BnhwRj3heS50yoOGImsVdLVZP+kIcPuN1uAnQnWhA/
	L1lmox6pY4ELRVbxEL62UxNhjqQePvY=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-126-JTqxdCNuPxWns_0NOkXstg-1; Mon,
 03 Aug 2026 11:22:14 -0400
X-MC-Unique: JTqxdCNuPxWns_0NOkXstg-1
X-Mimecast-MFC-AGG-ID: JTqxdCNuPxWns_0NOkXstg_1785770533
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 8701C195604B;
	Mon,  3 Aug 2026 15:22:13 +0000 (UTC)
Received: from fedora.redhat.com (unknown [10.44.48.107])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 3ED1E300019F;
	Mon,  3 Aug 2026 15:22:10 +0000 (UTC)
From: Jose Ignacio Tornos Martinez <jtornosm@redhat.com>
To: baochen.qiang@oss.qualcomm.com
Cc: ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	jjohnson@kernel.org,
	jtornosm@redhat.com,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org
Subject: Re: [PATCH 5/5] wifi: ath12k: skip connection_loss_work for MLO beacon miss
Date: Mon,  3 Aug 2026 17:22:08 +0200
Message-ID: <20260803152209.29471-1-jtornosm@redhat.com>
In-Reply-To: <1f80cdf0-2ca8-4b28-9192-b42bd61abff1@oss.qualcomm.com>
References: <1f80cdf0-2ca8-4b28-9192-b42bd61abff1@oss.qualcomm.com>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
X-Mimecast-MFC-PROC-ID: 86rAn1V-n_zN2tZ1taxsUWGB622eJXjGXrebEaUdGzU_1785770533
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_082219_507802_FF063EC1 
X-CRM114-Status: UNSURE (   4.37  )
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

You are right, with the MLO skip here, patch 4's MLO cancellation branch
is never reachable.
I will analyze it better and maybe merge both patches in v2.

Thanks

Best regards
José Ignacio


