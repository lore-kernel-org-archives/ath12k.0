Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ADD0C10F16
	for <ath12k@archiver.kernel.org>; Tue, 30 Apr 2024 06:42:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U9F3+BJlpYl1A42gqI5Kuc5ruHoD4P6TQ4R/HRTB8d0=; b=KmdJr84ku9F8FuwtxRavclzzSq
	bDExSoMFrz6FfemfqjRNiNfk4S1qGgaH7xlC9rzOpkmBT/+1sL8Z5F8oQ6czmwMMFmEVZb+uXVYJ3
	8THySqzbqDqziGKBRLImnlfp/+/4vW4SLwCeChzwHYJIGkN1sWQAsyQfMJasXP10TJzAcNDik3L2N
	gkWe13tVgeBJSA7T9Yps0znW2hA0foes4u1flXZtXcfGXIdS1/ZnVpT9U1/LUJt8N/UAuIkdtl1Zt
	biRSMrXrNABnp5a63jJFCz+tHNzWrmpHM+efHI5HrUu5Wrb+v+eOIwFFs5FEdw/JQBsJ+oTzifes8
	Xr7EHx1w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hCZ-00000005JSL-3NhK
	for ath12k@archiver.kernel.org;
	Tue, 30 Apr 2024 06:42:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s1hCW-00000005JQq-46RP
	for ath12k@lists.infradead.org;
	Tue, 30 Apr 2024 06:42:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 20F7561447;
	Tue, 30 Apr 2024 06:42:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D221FC2BBFC;
	Tue, 30 Apr 2024 06:42:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714459371;
	bh=fdQHboO+wwZXDX18KuhgKPneJcVoTv3BPscY3vNMF9M=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=P9evOk1wfx3V5Yyau4PBE3WTeaJ6877CHJVLIU6aT0VxPQHMNI+hHRV2rQ4y5vTjJ
	 ZsmA6WKpMt2ToYqnjE+DMUL0Aij11nuTCr23vRnVJTlgSokXQmZVPELHK8IaTvk954
	 Y9j8Zi8R1YlJXvhTkS0dmlDVTXsbtOpEIWwbIJrJdMorfZSf4gpa5ve4F3sFV9IgF3
	 HLOCTWIlR/egsRRv/njCEQEYqsF7xKXGe96gXE7tOiXr0S/Zai3l8Jvk4qw7LLZPP2
	 9Z9W/fqGOEHNuhdXRvrOi/Oeh20eKDUgCMrQg0Kjialr5h/71eJTHNGBDYgkFfRq22
	 CUtfCYwBelm2g==
From: Kalle Valo <kvalo@kernel.org>
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>,  Muna Sinada <quic_msinada@quicinc.com>
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
	<20240424201959.935-8-quic_pradeepc@quicinc.com>
	<72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
	<87y190fulv.fsf@kernel.org>
	<198e317f-a849-4fe2-8080-3d1834d07481@quicinc.com>
	<87sez4fk1o.fsf@kernel.org>
	<51073e2c-2138-4957-a78c-2708c7742451@quicinc.com>
Date: Tue, 30 Apr 2024 09:42:47 +0300
In-Reply-To: <51073e2c-2138-4957-a78c-2708c7742451@quicinc.com> (Pradeep Kumar
	Chitrapu's message of "Mon, 29 Apr 2024 18:41:37 -0700")
Message-ID: <87ttjjpd08.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240429_234253_080159_CB1B1137 
X-CRM114-Status: GOOD (  10.60  )
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

Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com> writes:

>>> I did run ath12k-check but I don't see these errors. Trying to see if
>>> this is due to version differences. will update further once I have
>>> more information on this.
>>>
>>> This is version I ran:
>>> qca-swiss-army-knife/tools/scripts/ath12k/ath12k-check --version
>>> ath12k-check (md5sum cb8a85242f2ec7343f6f94af9fa5ebb2)
>>>
>>> python:         3.6.9 (default, Mar 10 2023, 16:46:00)
>>> [GCC 8.4.0]
>>> host gcc:       gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
>>> config cc:      gcc (Ubuntu 7.5.0-3ubuntu1~18.04) 7.5.0
>>> sparse:         v0.6.4
>>> checkpatch.pl:  Version: 0.32 (md5sum 12ea394e9bf27280f30a684ff937cc57)
>>> gtags:          gtags (GNU GLOBAL) 6.6.2
>> Your sparse is too old, you need to get the latest from git:
>> https://docs.kernel.org/dev-tools/sparse.html#getting-sparse
>
> Thanks Kalle and Jeff for sharing the tool versions required..
> I am able to see the errors reported now..
> will fix and respin the series..
>
> ath12k-check (md5sum cb8a85242f2ec7343f6f94af9fa5ebb2)
>
> python:         3.6.9 (default, Mar 10 2023, 16:46:00)
> [GCC 8.4.0]
> host gcc:       gcc (GCC) 13.2.0
> config cc:      gcc (GCC) 13.2.0
> sparse:         v0.6.4-66-g0196afe16a50
> checkpatch.pl:  Version: 0.32 (md5sum 12ea394e9bf27280f30a684ff937cc57)
> gtags:          gtags (GNU GLOBAL) 6.6.2

I added a section about tools to the wiki:

https://wireless.wiki.kernel.org/en/users/drivers/ath10k/codingstyle#tools

Feedback very welcome, it's important that our documentation is
understandable for new developers.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

