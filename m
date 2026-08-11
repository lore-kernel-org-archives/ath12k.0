Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36030C5AD7B
	for <ath12k@archiver.kernel.org>; Tue, 11 Aug 2026 02:06:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aFm8Aj9OZytwFyAPsBqRjPMF5tcPLmJJrU05ezkPDR0=; b=pnHXlawtVx3DS6XjaPfJ+pEAfm
	h7U31HHlbYeDM5KDsozqZv8IIDxqXZsphSQo0OxGIJ6kkUP7vXFWqV1RBkf9uhlCIMZZ/Pt50ZhL9
	IQazAjDJuwOKeaQ/3h1JaNOcb7UzW4ZzRW/EwFqqhtF2a8lqiEKz2o+Sf5WqCHvfwfsCGjH7pXhil
	kD+52gKWeOoycYQqAfG49AGzOK93fbkcWdNKftqGTDeDkT9eZQ0nHV9pk5gF9YrVoJcCqXRCqWXW5
	xtfu1byytAI5rGElW0TdAplU9eY2gnRHZGtfP85gDTzIxXvXbxhhYHsu03sv2QVRCFtXElBpH5BlL
	AElAUJ/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbsn-0000000D8pV-2Agc;
	Tue, 11 Aug 2026 02:06:25 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wtbsk-0000000D8nZ-1OJF
	for ath12k@lists.infradead.org;
	Tue, 11 Aug 2026 02:06:24 +0000
X-UUID: 3ac63d92952911f1aa26b74ffac11d73-20260811
X-CID-CACHE: Type:Local,Time:202608111005+08,HitQuantity:1
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:cc768920-1958-4739-954b-4253221ddfc3,IP:0,U
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
X-UUID: 3ac63d92952911f1aa26b74ffac11d73-20260811
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 1098198722; Tue, 11 Aug 2026 10:06:13 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: rameshkumar.sundaram@oss.qualcomm.com
Cc: jjohnson@kernel.org,
	baochen.qiang@oss.qualcomm.com,
	vasanthakumar.thiagarajan@oss.qualcomm.com,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
Date: Tue, 11 Aug 2026 10:06:10 +0800
Message-Id: <20260811020610.399158-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <59d20ace-66cc-4a0c-a09a-e669becd2657@oss.qualcomm.com>
References: <59d20ace-66cc-4a0c-a09a-e669becd2657@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260810_190622_666800_4C618F38 
X-CRM114-Status: UNSURE (   6.45  )
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

On Mon, Aug 10, 2026 at 03:44:54PM +0530, Rameshkumar Sundaram wrote:
> So this probably should either be split into two fixes, or the commit
> message/Fixes tag should be adjusted.
>
> But unless there is another reachable path where these stale pointers
> are later freed or dereferenced, do we really need a Fixes tag here?

Thanks. Agree on both points , the first two hunks predate
acc152f9be20 , and with Baochen's clarification there is no reachable
second free, so a Fixes tag does not make sense.

v2 will drop Fixes and keep this as one small hardening patch.

Thanks,
Linkai

