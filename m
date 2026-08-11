Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66364C5AD7B
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 02:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p8qMkQur3Y8Ns6FT0sD489XqC4EZZ5ibiYUQjNEcYws=; b=sRNgcOQgeAUnGAPgFi6CGMnIhN
	VYbxjp8IX45MubMFAtrbwJkVPkL2tZd/UIDRBXYpX8bEBEEXOopCoOeP7ekK13/L7bKvA+qCa67/k
	bTzUPUyIj/iPjUa1hGIMnaaWj+8nAu+Amu6SGqnzJrWp8PSj/Za35PGYDc18b1iSX0UldblBDyxzS
	3MjG7VPDbwFansnQoqXV2i1MZCNLd3ioxW9I6JS/1dZjEL8ZDef2MRv2xr6NOTOSL+2/Du6XgPuMU
	YvlCPi/YNjYlt5z4kXqQkZL9MF0LS39pn2ch0rRYWer7Nq3/PlsLJ8H1Vwoz7umcfgcu85asJRDbo
	4uGQjnkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbsL-0000000D8jY-1gsq;
	Tue, 11 Aug 2026 02:05:57 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbsJ-0000000D8ie-13lM
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 02:05:56 +0000
X-UUID: 2dc95dc2952911f1aa26b74ffac11d73-20260811
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:42b7a489-1240-48a9-87e1-e7153d45e6ea,IP:0,U
	RL:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:
	release,TS:0
X-CID-META: VersionHash:e7bac3a,CLOUDID:91971f77f26c422c5bb862d4c2fe6f0c,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:80|81|82|83|102|850|865|898,TC:nil,Conte
	nt:0|15|50,EDM:-3,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL
	:0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 2dc95dc2952911f1aa26b74ffac11d73-20260811
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 923249976; Tue, 11 Aug 2026 10:05:51 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: baochen.qiang@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	rameshkumar.sundaram@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
Date: Tue, 11 Aug 2026 10:05:49 +0800
Message-Id: <20260811020549.391881-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <bd5db1a2-90f3-4cc9-8cd8-c18499c56a2b@oss.qualcomm.com>
References: <bd5db1a2-90f3-4cc9-8cd8-c18499c56a2b@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_190555_595915_C6B2FCF3 
X-CRM114-Status: UNSURE (   6.16  )
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

On Mon, Aug 10, 2026 at 03:07:25PM +0530, Baochen Qiang wrote:
> So this is actually a dangling pointer
> issue, not a reachable double-free — nothing frees the failing radio's pointers a second
> time. Please reword the message to something like "error paths leave dangling pointers + a
> copy-paste typo; harden by consistently nulling after kfree()."

Thanks. You are right, I misread the cleanup loop.

Will reword the commit message in v2. Code change stays the same.

Thanks,
Linkai

