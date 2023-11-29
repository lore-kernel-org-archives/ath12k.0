Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 79659C4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 17:40:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=hLHIAj6BqqWEwNdagatxMdHk6oG06scF374Qx79TypU=; b=tcTL1DmiIKyOqvoVJooLm6dwhU
	YqyzY/3JuIg+fvfuOEy03T5YTtJnMXLKHSyly6r3V7U0zAL6TfLlr3J6Q3APoOHzc/Hx5QAAcFmpI
	obxnmS87fOjr4hIVqsdIgh72NX/PI987X/J6pB0HQ23v3oYN5AeYJy5e5uYAuoa30I2Q1u6l7GCOh
	TxqGwJxuZCg5TNngE5OkikrOIi5TRL1GAHZW7PMCUUT9IOoHiIVByQuwTX0pfaHSKzCBGgiUbK+lI
	Y85Gl/9PagpGR5wzAFW85QLzPLco90aHs9QuVXQc2ZZ5q7abverIUhEF1hBrgfW2x3K9FqcC5Q1PS
	hTkXJbwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OXc-0091VA-3C
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 17:40:04 +0000
Received: from dispatch1-us1.ppe-hosted.com ([67.231.154.183])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8OXZ-0091TQ-2n
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 17:40:03 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail2.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 3F2592C0085
	for <ath12k@lists.infradead.org>; Wed, 29 Nov 2023 17:39:58 +0000 (UTC)
Received: from [192.168.100.159] (50-251-239-81-static.hfc.comcastbusiness.net [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id A302613C2B0
	for <ath12k@lists.infradead.org>; Wed, 29 Nov 2023 09:39:57 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com A302613C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1701279597;
	bh=TyLxTeQAtw4ZjsSi4ehtO7QaC+CpCDWsBH+7LNUsNek=;
	h=Date:To:From:Subject:From;
	b=MS3A3DCV341OyGdJCd/Uvz5qqh335qrdqsOoCHSTZcuASodAd34SbDgilzt7emj/g
	 chVyTlu+xPbgYi18gC4mVxN1EovfXElTOkoq/0yBc9KNQgO957ctdUhCrsW7vc9wNu
	 QVvzJi30VGVMHWDh0s8x1+i1uDpWmcBNOCQxOYfw=
Message-ID: <864419c3-71e1-49e8-40e1-88bfafba26f4@candelatech.com>
Date: Wed, 29 Nov 2023 09:39:57 -0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: ath12k@lists.infradead.org
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
Subject: Firmware for qcn9274?
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1701279598-HlNO-9QKbU6l
X-MDID-O: us5;at1;1701279598;HlNO-9QKbU6l;<greearb@candelatech.com>;5bad664179c033c86d3002bbc8bae2aa
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_094001_966072_6B055F4A 
X-CRM114-Status: UNSURE (   5.67  )
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

Where are the ath12k firmware binaries located?  I don't see any ath12k tree
in linux-firmware, for instance.

]# dmesg|grep ath12
[   55.381104] ath12k_pci 0000:0e:00.0: BAR 0: assigned [mem 0xdf000000-0xdf1fffff 64bit]
[   55.415662] ath12k_pci 0000:0e:00.0: Hardware name: qcn9274 hw2.0
[   55.592167] mhi mhi0: Direct firmware load for ath12k/QCN9274/hw2.0/amss.bin failed with error -2

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


