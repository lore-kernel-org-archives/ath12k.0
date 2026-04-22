Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7165F9EDE8
	for <ath12k@archiver.kernel.org>; Wed, 22 Apr 2026 14:34:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KLjy2yZM4H3YF9dswfB2QVM+gufHNFIHAHeycy5n+F0=; b=q4ZQt4FhWrKdlPh3vUODj/1w5l
	YKBx1M3t9T/KWGY7Nmw00kazY6JbAGo92NKKFD6PYeH4O918IP4cwePq9vOuDnxtZST9D8reVRexl
	ODcXgEdEdDSs5lI8BcC+JnCdYC+Hwfpx/xBoHb8ZJJH7SfE3i5OdArqNaR5bUg5XRc5iJqjRTuaBC
	lwEm3WjTulTTFs3fmTrkqrBzNDwQc7GO2GTeCsa4vu/mL7rIKD/AINbr17zKC8AoT2i+2VnUJR1zO
	wYYmvTM4xnw/i7fX26BTaWeJreH02yp3/UTRLpUyQkMEpOhX+JtsaTH1MWIgvRO6ovNAiFeX6VJkN
	mBG13Y/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYel-0000000ANBs-2s2w;
	Wed, 22 Apr 2026 14:34:23 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFYej-0000000ANBW-0r78
	for ath12k@lists.infradead.org;
	Wed, 22 Apr 2026 14:34:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6D5E943FC6;
	Wed, 22 Apr 2026 14:34:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DF9F0C19425;
	Wed, 22 Apr 2026 14:34:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1776868459;
	bh=UmaIxeoeK2QX+j2dmuQ0WkRWY2DaTK2Yjfzl9MUl+sM=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jWy9XAG8DAsuKdS/HNps9d/J1Ee9nrR9VqxbYj9W74X+UI9UzU+Ug3iewOUvUoUBe
	 aCjO0LqhSzyb7qvYllgXH9aF2JPmA2qX3x9n3EL14R4fj/JIZtIvFLCoL+LZPW8+dd
	 a9zmnHXQY9esri6M9O+4Omlz+N0+FTCsZDMGDNEnGe60NkVWJKffknxCJ14l72i+5J
	 N5nqi/PXEcV2w7FHQeRC36cZhj3XxLjHutX9/9vcJkB03lcX6Hu9Quml1vYxaPkiwc
	 UU6RG1lIqjR7j28LvCmin6T/eOCvtiHOJHFoYOF5UAyEzYIb1tHyg50uARmtd7LNzC
	 1iYmtw7AQdn7Q==
Message-ID: <0bb445e0-658f-47e1-a455-7fc4513c8fb0@kernel.org>
Date: Wed, 22 Apr 2026 07:34:18 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current] wifi: ath12k: prepare REO update element only
 for primary link
To: Thorsten Leemhuis <linux@leemhuis.info>,
 Baochen Qiang <baochen.qiang@oss.qualcomm.com>,
 Jeff Johnson <jjohnson@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath12k@lists.infradead.org,
 linux-kernel@vger.kernel.org,
 Linux kernel regressions list <regressions@lists.linux.dev>
References: <20260210-ath12k-rxtid-double-free-v1-1-8b523fb2886d@oss.qualcomm.com>
 <ed0ecf21-54b4-41e0-92a9-3c7a0e140882@leemhuis.info>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <ed0ecf21-54b4-41e0-92a9-3c7a0e140882@leemhuis.info>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_073421_267960_298C74D0 
X-CRM114-Status: UNSURE (   6.56  )
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

On 4/22/2026 2:30 AM, Thorsten Leemhuis wrote:
> Lo! Top-posting on purpose to make this easy to process.
> 
> Jeff, what happened to below patch? It was supposed to fix the
> regression linked below, but unless I'm missing something (which might
> very well be the case!) it seems it never got any further than this thread.
> 
> Ciao, Thorsten
> 
> P.S:: Adding a stable tag might be good to ensure this fix is backported.

No, I dropped the ball on this. Let me pick it up for next week's -rc2

/jeff


