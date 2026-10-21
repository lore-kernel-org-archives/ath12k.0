Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 87C87606A319
	for <ath12k@archiver.kernel.org>; Wed, 21 Oct 2026 17:54:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=r28rSxPS;
	dkim=pass (1024-bit key, unprotected) header.d=candelatech.com header.i=@candelatech.com header.a=rsa-sha256 header.s=default header.b=dcNpvKfH
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:From:To:MIME-Version:Date:Message-ID:Reply-To:Cc:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=9ueUr6ez9lHvMzuTNsTDG6RkkP4IygJtKEKM1NdTwXI=; b=r28rSxPSap7vxBKII+B/LXv3qI
	TC/rsNPv6mdczlwHa7eAOarBzoc7pWLYmgAruQTYu5SBQaER2SX6+vD/VrCi36umFoT94zwmIq9sQ
	un4KlIWQcV7lNJ1q+JRZSrTszuJ4K5SK2OdRBgcL9gf1rqY2WWrjs7PxdgmV5HRE6YUCxyljtXLd1
	jSKkUDlWlFH5yDX9Yy2rtElV9vIMgrS89MDLIDfo9HQNUOWkzAR9UJ+0ffUqNP/W4IoEr0mD+hzvR
	2P6ApVmX1u3GBuoG0UMlUYXjneoJVwsH8iNv2vmMQ3Es06WxaaQWUZwX91gAUyhwaCoVjhUvEIJH4
	qHx/UWJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaWH-0000000CbKP-22hQ;
	Wed, 21 Oct 2026 17:54:33 +0000
Received: from dispatch1-us1.ppe-hosted.com ([148.163.129.48])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJaWE-0000000CbK3-2LzF
	for ath12k@lists.infradead.org;
	Wed, 21 Oct 2026 17:54:31 +0000
X-Virus-Scanned: Proofpoint Essentials engine
Received: from mail3.candelatech.com (mail.candelatech.com [208.74.158.173])
	by mx1-us1.ppe-hosted.com (PPE Hosted ESMTP Server) with ESMTP id 78FCE34008A
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 17:54:27 +0000 (UTC)
Received: from [192.168.100.159] (firewall.candelatech.com [50.251.239.81])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by mail3.candelatech.com (Postfix) with ESMTPSA id 16CD913C2B0
	for <ath12k@lists.infradead.org>; Wed, 21 Oct 2026 10:54:27 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mail3.candelatech.com 16CD913C2B0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=candelatech.com;
	s=default; t=1792605267;
	bh=+qGqmE2hfFaigOaTQO2WCNEiwzDK4Y5UmF4f0tj0Sb0=;
	h=Date:To:From:Subject:From;
	b=dcNpvKfH9Izj/1WZD4jaHbIVlJndkkod0oCTD9hh5A5z3yqhs4O/nFQV7UL1ugzkn
	 FjTbarhbxSHBEj9DmwTiJ8ttC/yoV9dQlXHVbhTl/mgAhw5OVnIGoO9b/f2IX8eSK7
	 2nv89Es5PbFsxjafmnnTeB6ddyiKvgTty6D7JKiE=
Message-ID: <c59e5c8a-7689-0c10-d64a-0aef882069fe@candelatech.com>
Date: Wed, 21 Oct 2026 10:54:26 -0700
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.1
To: ath12k@lists.infradead.org
Content-Language: en-US
From: Ben Greear <greearb@candelatech.com>
Subject: ath12k Bug report mailing list?
Organization: Candela Technologies
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-MDID: 1792605268-AcnWHRqTHte7
X-PPE-STACK: {"stack":"us5"}
X-MDID-O: us5;ut7;1792605268;AcnWHRqTHte7;<greearb@candelatech.com>;5bad664179c033c86d3002bbc8bae2aa
X-PPE-TRUSTED: V=1;DIR=OUT;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_105430_623597_ACE3AE01 
X-CRM114-Status: UNSURE (   6.36  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.1 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hello,

For bug reports related to ath12k wifi-7, is this the preferred mailing list,
or should it go to linux-wireless, or somewhere else?

Thanks,
Ben

-- 
Ben Greear <greearb@candelatech.com>
Candela Technologies Inc  http://www.candelatech.com


