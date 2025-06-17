Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC41DC71136
	for <ath12k@archiver.kernel.org>; Tue, 17 Jun 2025 18:13:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3u4qLKfb397aX1P24I5aGQfLrhnWGivekUrKmYfnFEI=; b=0Te+DMCrS4/hYxUjXGYqro2IhB
	hvAiXq1E2244/+pAQLsp2Tjevs+apPwwt3puSO6+i6zGql5DpSUWxJIfm9UDilwJRhIk50iTFtp/p
	l63UMzk2fwFecPOWycc1/3V+FsBgdwND6NN+o8sed9y+P+O+qr5gXQhzsYGKW/O3XruVNR4xTTCLm
	PLroi+qijcdi7QNQhg8epByZmiYmpyww+cLvLoo6TFVh5oRGCp4w996oTYkywcp3JuHElDP2jpiz+
	flSWSw2Uj1f4J9TYvY37Xi9F2K7kJLAB9AcM+yXS/DsOPY2+HEqzngNJk9XLphhzgGC6RXDNmNIA6
	Nu8/soxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRaoH-000000087if-1yJl;
	Tue, 17 Jun 2025 18:13:25 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRaoE-000000087i5-1yWc
	for ath12k@lists.infradead.org;
	Tue, 17 Jun 2025 18:13:23 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id A58C410008D
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 18:13:19 +0000 (UTC)
Received: from [192.168.100.159] (unknown [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id B640B13C2B0
	for <ath12k@lists.infradead.org>; Tue, 17 Jun 2025 11:13:18 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com B640B13C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1750183998;
	bh=a+3ebFaGV8MKJwgrGdDENjf/U2827zKk5/GeBIPfL7Q=;
	h=Date:To:From:Subject:From;
	b=PkubJB6o1AW30+byo1zQbtq7Uvw3oDyaiZXo0+GTuM6xKZZKN7bsg8W1fWjxMzzOd
	 rGB0JkkLxp28vzE/kI6o+s2id4OQ7QS/6g2OfKo1707wHE1e3DEk6Jk+9B4OPwL2I/
	 PAF6eS+Ja5XYrV0u7PxgoVQDnAbGaRsWhd2ZFtEs=
Message-ID: <27b1829e-f033-d2dd-26b2-a47c2bfd9594@candelatech.com>
Date: Tue, 17 Jun 2025 11:13:17 -0700
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
Subject: MLMR support in ath12k
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1750184000-7UaLoYV7fB4j
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1750184000;7UaLoYV7fB4j;<greearb@candelatech.com>;5bad664179c033c86d3002bbc8bae2aa
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250617_111322_550115_0ACFE369 
X-CRM114-Status: UNSURE (   6.40  )
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

Are there any known-working ath12k pcie radios (from Compex, for instance?)
that support station MLMR in upstream kernel? (Having to add some findable out-of-tree
patches is fine, we can deal with that).

Thanks,
Ben
-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


