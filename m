Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8E0FCC47DAF
	for <ath12k@archiver.kernel.org>; Fri, 19 Jan 2024 11:37:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:From:To:Date:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=674YX3HbIgK5RQLd+6rljfEjT8b53igO4c/gmNk99Zw=; b=VBiFQg9hqMK0JExvXnnWhqi4DY
	VAF57wzdS1NVlnZVG8/2h97okH0EOyJXnXv0IFG6jbPzebcTxJdNgGjnPfdQPt7KmhW36FVAGFXmG
	Rv0JJYS0p5+HlVKxuANtmB96EFJHnlIHa7W0aEivR/HwnzCbhi5upZyjtNCzFjh4XHmqjGP2zRuIM
	J1vtWCJzBp/G6JDWMKQYbVN+h4k9d6VAfzpfWuA6UR6FYMXYgMYLcVcHjy7CWFsNJXL+yej5xy/7D
	Pq5rXL7xme1fT0ULty7F4lqyE7EdTcM3UyGvdUfkKFBhbcCtNwLuRQhCFBP3ZiPH+T4kRUTIAO1eZ
	VSOiQOqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnBG-005FVJ-0X
	for ath12k@archiver.kernel.org;
	Fri, 19 Jan 2024 11:37:02 +0000
Received: from mail-40135.protonmail.ch ([185.70.40.135])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQnBD-005FTH-1R
	for ath12k@lists.infradead.org;
	Fri, 19 Jan 2024 11:37:00 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=protonmail.com;
	s=protonmail3; t=1705664215; x=1705923415;
	bh=674YX3HbIgK5RQLd+6rljfEjT8b53igO4c/gmNk99Zw=;
	h=Date:To:From:Subject:Message-ID:Feedback-ID:From:To:Cc:Date:
	 Subject:Reply-To:Feedback-ID:Message-ID:BIMI-Selector;
	b=MWSBgW0AHDz2xNeXZ96tg2JZJvlDicQT7l77KrjwmM+npDR+gnTbNfeh6Z+Yugekk
	 xHi+i8KDsr/RW+2zdxn2vFndihQmS6yHPKUWXcOW2H/ljKg15Y3GnUhBhnB9PlzgGu
	 QZCK32EBOgrbFCsneEtDRLwCmB2uDr+Me5401gpxcZ8DczC3ns5kHsaZRiQPRdrpIn
	 mFeelWEqtWCDphpCDsLe4gXFAleqohfz7sue+1+thf/Esyg1QGPCJ4ImW54ecAzdkA
	 aQxT7F47WqYIDLomWOxS+aLlCI3HS1ETqERmG0PNvoDKDLwgN59ZCwZPR6JXVMSrTr
	 AptIzo73LwYoQ==
Date: Fri, 19 Jan 2024 11:36:48 +0000
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
From: GreyXor <greyxor@protonmail.com>
Subject: Difference between WCN7850 and WCN7851 ?
Message-ID: <r_LAIMwF1YgGlpJWWQBKCsCqurisqY5ZzmPQ0QesUAXwqziwlbTWt8NLn0DA2fJAL9ukIX2T8kHs0pOABysXUcMDOh5RdRgBu4mAg6xCeuM=@protonmail.com>
Feedback-ID: 1917010:user:proton
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240119_033659_638803_A61F92E3 
X-CRM114-Status: UNSURE (   3.33  )
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

Hi, I'm interested in acquiring a WiFi 7 card for my laptop, and I came acr=
oss the Qualcomm QCNCM865, which is Qualcomm's WiFi 7 card. Upon checking W=
i-Cat, I noticed that it features a WCN7851 chipset. However, when examinin=
g the ath12k/linux source, I couldn't find any mention of the WCN7851; only=
 the WCN7850 was referenced. What implications does this have? Can I still =
obtain a WCN7851, or would it be advisable to opt for a card with a WCN7850=
 chipset, given its greater number of updates and references in the kernel?=
 Thank you for your assistance.

