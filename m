Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 848A8C5AC7A
	for <ath12k@archiver.kernel.org>; Fri,  7 Aug 2026 02:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sMjo+vMZ3HtHucfyWe9JW8Ip/ZGVz+rgSm+BHT0zqf4=; b=l9WGDoIkznXVHhyYer1OSskA/k
	EuNfez6tJ98zH0p2DQY6X8rXC3UOM4Rj3sMecXWHH1hEtwyNgYxAr3gDoL1lF8q8sO7gsHwbur5F9
	H1BiBpPemLQQVvHiNchJlIfcKlg6xsIcGZo5r5VvIhBJ2Uiz8OsEoNyPxY3VKIA0IwmKFytH/ef4f
	NBStjk/vHVjRNXgRUQSbHyd728Ug+vVwKqFLCz94nHTW9ywceXu4dZyaV5TnbRnkTE/It9p8vxHE9
	GvfS0g2Ei5Uy9QsXR/UCPem+BKcE++ff9UDlmiZAgi5AHCL77WTfu5LrP/iQ3fnD92EDGcHx6qgsT
	tjnUOlCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAlL-000000070mn-43aX;
	Fri, 07 Aug 2026 02:56:47 +0000
Received: from mailgw.kylinos.cn ([124.126.103.232])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAlG-000000070ln-438M
	for ath12k@lists.infradead.org;
	Fri, 07 Aug 2026 02:56:46 +0000
X-UUID: 97dedbf4920b11f1aa26b74ffac11d73-20260807
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.3.12,REQID:75a0e0ad-b6bd-44ee-8edb-59f1de35a4e6,IP:0,U
	RL:0,TC:0,Content:-5,EDM:25,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTIO
	N:release,TS:20
X-CID-META: VersionHash:e7bac3a,CLOUDID:dc1a74f3a12583116f8656b6593050f9,BulkI
	D:nil,BulkQuantity:0,Recheck:0,SF:81|82|83|102|850|865|898,TC:nil,Content:
	0|15|50,EDM:5,IP:nil,URL:99|1,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:
	0,OSI:0,OSA:0,AV:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 2,SSN|SDN
X-CID-BAS: 2,SSN|SDN,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR,TF_CID_SPAM_ULS
X-CID-RHF: D41D8CD98F00B204E9800998ECF8427E
X-UUID: 97dedbf4920b11f1aa26b74ffac11d73-20260807
X-User: gonglinkai@kylinos.cn
Received: from localhost.localdomain [(10.44.16.150)] by mailgw.kylinos.cn
	(envelope-from <gonglinkai@kylinos.cn>)
	(Generic MTA with TLSv1.3 TLS_AES_256_GCM_SHA384 256/256)
	with ESMTP id 481017638; Fri, 07 Aug 2026 10:56:31 +0800
From: Linkai Gong <gonglinkai@kylinos.cn>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>,
	Rameshkumar Sundaram <rameshkumar.sundaram@oss.qualcomm.com>,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: fix channel list double-free on error paths
Date: Fri,  7 Aug 2026 10:56:28 +0800
Message-Id: <20260807025628.1893831-1-gonglinkai@kylinos.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <6a9196e8-2e2f-43f8-9665-6ebb82b95951@oss.qualcomm.com>
References: <6a9196e8-2e2f-43f8-9665-6ebb82b95951@oss.qualcomm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_195643_701156_E68156A7 
X-CRM114-Status: UNSURE (   7.15  )
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

On Thu, Aug 06, 2026 at 18:47:38 -0700, Jeff Johnson wrote:
> https://wireless.docs.kernel.org/en/latest/en/users/drivers/ath12k/submittingpatches.html#tested-on-tag
> Tested-on: tag missing. How was this tested?

Thanks for the review.

This issue was found by code review of the error paths in
ath12k_mac_setup_channels_rates(). I do not have QCN9274/WCN7850
hardware, so I could not provide a Tested-on tag or reproduce the
ENOMEM double-free on a device.

The bug is: after kfree() of sbands[].channels on failure, the
pointer is left non-NULL (or the wrong band is cleared), and
ath12k_mac_cleanup_unregister() frees it again.

I understand Tested-on is required for ath12k. I will follow up
with a v2 including Tested-on once I can test on QCN9274/WCN7850
hardware. Meanwhile, any Tested-by from someone with the hardware
would be appreciated.

Thanks,
Linkai

