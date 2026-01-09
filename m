Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CF90BD26D6A
	for <ath12k@archiver.kernel.org>; Fri,  9 Jan 2026 15:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:To:From:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=X0k6VCC5c3GcEAZEqMJGN+kuqnV80LAGqz8rAuDKgOs=; b=y5HAvcpHl6y3RZ14RslFmayf2v
	ZvY9s1wUYR8F8M+59BDZuY3vRjp1ZxkevGPbpXWsoXcRl10uHjPpJ8wKjKT/y7p8ezP9thEkY4f42
	dBMv9rlCZpDOLys8yEL2KVH4naQtXlsXM4BR+X32higxG2dQxvw5V2KnURY4+pOv4KwSj8CZWX7oR
	8lTpZf/EDdnveD5teE39EA8Lp60ci6iQ3TJOzllzGe+e9/Prjd8f6JCnPpF/8Y0Y2jq15R1ZP83Cf
	uK3AX+uVsVai4vzTgZ9V0np58EdLryvPwa78mzR9JuY/TlOVPVL9/6wgugLZBKdodjf3VbOBVvhen
	aRw/0bLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEfA-00000002WP1-1NGb;
	Fri, 09 Jan 2026 15:44:32 +0000
Received: from host02.bvsystems.com ([67.225.163.68])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1veEf7-00000002WNK-2ZjJ
	for ath12k@lists.infradead.org;
	Fri, 09 Jan 2026 15:44:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=bvsystems.com; s=default; h=Content-Transfer-Encoding:Content-Type:
	MIME-Version:Message-ID:Date:Subject:To:From:Sender:Reply-To:Cc:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=X0k6VCC5c3GcEAZEqMJGN+kuqnV80LAGqz8rAuDKgOs=; b=ONm1E9YUwPjNLUk0NCFUXPZ5eq
	RFzrcWUFdXyLD3WiHtSBwwYUsrmbnoMTnfyh0hDjZi+M1HrtYVlX8tSosTnSwBqc+o2zop8pFFuQ0
	BBu9rLo5LJhcSBSNHdt34JH4u71QlaXaZCN7zkLuCr7bq+/LABOBv5XnVtqNlng+bOU9erYpYCxfZ
	dx2PA0OYIcqZ7lCcDB3o6EIvyE53/U5ftDth+9T6BlJFrAiPCkdOPN6kpPR1+7PSPXvyDQJ+M+zwO
	k24d5n3GAiYiWERqmsiKKk+6LrfdCwFwz9EbifWFVknN2BntB+mVY6AeSmLU7U/ZVP5HNNFFmeOgY
	o6eZN/KA==;
Received: from ool-18bbd266.static.optonline.net ([24.187.210.102]:64646 helo=MTUMAPC)
	by host02.bvsystems.com with esmtpsa  (TLS1.2) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.99.1)
	(envelope-from <michael@bvsystems.com>)
	id 1veEeJ-00000006Dqy-022y
	for ath12k@lists.infradead.org;
	Fri, 09 Jan 2026 10:43:37 -0500
From: <michael@bvsystems.com>
To: <ath12k@lists.infradead.org>
Subject: [question] ath12k: support for tx in monitor mode?
Date: Fri, 9 Jan 2026 10:43:33 -0500
Message-ID: <012001dc817e$b8999e90$29ccdbb0$@bvsystems.com>
MIME-Version: 1.0
Content-Type: text/plain;
	charset="us-ascii"
Content-Transfer-Encoding: 7bit
X-Mailer: Microsoft Outlook 16.0
Thread-Index: AdyBfTxd+qjCIPS1RSKQQ2wm516LXw==
Content-Language: en-us
X-AntiAbuse: This header was added to track abuse, please include it with any abuse report
X-AntiAbuse: Primary Hostname - host02.bvsystems.com
X-AntiAbuse: Original Domain - lists.infradead.org
X-AntiAbuse: Originator/Caller UID/GID - [47 12] / [47 12]
X-AntiAbuse: Sender Address Domain - bvsystems.com
X-Get-Message-Sender-Via: host02.bvsystems.com: authenticated_id: michael@bvsystems.com
X-Authenticated-Sender: host02.bvsystems.com: michael@bvsystems.com
X-Source: 
X-Source-Args: 
X-Source-Dir: 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260109_074430_189066_14037343 
X-CRM114-Status: UNSURE (   4.58  )
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

Hello,

I have a use-case involving transmitting in monitor mode, currently using
the
old AR9280 chipset. I'm trying to modernize, and I'd like to support
802.11be.
I looked through drivers/net/wireless/ath/ in 6.18.y, and it seems that this
capability (referred to as 'full' monitor support in ath11k I think?) is not
supported in ath12k (based on the if statement at the top of
ath12k_mac_op_tx
which checks for WMI_VDEV_TYPE_MONITOR and bails out), please correct me if
I'm
wrong. I also tested with WCN7850/hw2.0 and was unable to transmit. My
question
is, is this a hardware limitation of the WCN7850, or is it just something
that
ath12k doesn't support? If so, are there any plans to support this?

Thank you in advance for any info you can offer,
Sincerely, Michael E. Tuma


