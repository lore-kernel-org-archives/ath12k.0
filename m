Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F9AC4345F
	for <ath12k@archiver.kernel.org>; Wed, 24 Apr 2024 04:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AYFCuVHahzmY2c5xbWoPMDHAPe/fA9uMQU35726/0Ak=; b=C5NuMf0fZUpc8Zfio5FaMHOSnM
	Rh6ear34+qfIyjkhhcCnjRbxNbaRPudezjzl1uon9+G0+z91sGEWdenNm2t7+wSwF6QWmftlUGFMb
	QblCbTvBO2HmexcXFqKT6X/nLJcTRmc6sQw4wno1bi3HjnKOd2ETSLjWWSl/okalAV2aqE0uXCSmZ
	YXGiebcX8kuonB4cSyNAfgFOovuHti8tXa821Gbu9smGuwYyDdwEEryH5v9aAL9/P/MKyooMHXPnH
	s9sUoqAZ/ct7j3aEt2Z6zQ30PFfNMR8SvTju9D7rQx3ycT+Mer3AIsJPT+rYacuApFbDDPbtWIJw8
	bGLBElHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzUPh-00000002YXH-3Io4
	for ath12k@archiver.kernel.org;
	Wed, 24 Apr 2024 04:39:21 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rzUPe-00000002YVa-09Hc
	for ath12k@lists.infradead.org;
	Wed, 24 Apr 2024 04:39:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id E0952CE138D;
	Wed, 24 Apr 2024 04:39:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0DF0AC113CE;
	Wed, 24 Apr 2024 04:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713933555;
	bh=3pgvSwtH0NW0tIEHpJ4id1LBP+PB/0JJc7zJuFsEEX0=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Df5hrn0gIckq/xj+8dzLaC9fZXQ8bi8QXm+6KOXZL7DcYGn1HwdqystMEz0ceVdx/
	 LAim7BPedUoENeZKjXoYNeqgE+Mx+b4/G2Q3r/6wzBD7mNeje63jw+u8KW0Bm8tj/R
	 h0gvL6dhTbFXbtUaIyFsJiq92mvZe7eGF5NrT2fxxR3DcHcE16ZpJsMt4VDspuFbDz
	 TULZiRoAw4hh3Wx/wMYgw5tWnS+G6ZtPVbNrIyKDiKihsB5dHQOQUGAbYxggce16J0
	 OCcRStcrciLxIQ7MBO8iAYIQIr5o/pEPpUnXSaCmQHphg9/77Um1P5aQ2cWmTc5SeT
	 KTGQuHYIGKyXw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Harshitha Prem <quic_hprem@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 0/8] wifi: ath12k: Introduce device group abstraction
References: <20240420083750.1545670-1-quic_hprem@quicinc.com>
	<878r14v2o4.fsf@kernel.org>
	<57002bbf-2c85-4fa7-b249-4bd3f2ba1bcf@quicinc.com>
Date: Wed, 24 Apr 2024 07:39:11 +0300
In-Reply-To: <57002bbf-2c85-4fa7-b249-4bd3f2ba1bcf@quicinc.com> (Jeff
	Johnson's message of "Tue, 23 Apr 2024 14:24:12 -0700")
Message-ID: <8734rbidcg.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240423_213918_281324_922B2E27 
X-CRM114-Status: GOOD (  12.20  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

>>> Depends-on:
>>>         [PATCH 0/3] wifi: ath12k: Refactor the hardware recovery
>>> procedures
>> 
>> Are you referring to this patchset:
>> 
>> https://patchwork.kernel.org/project/linux-wireless/list/?series=821155&state=*&order=date
>> 
>> That was sent three months ago and at least I couldn't find a newer
>> version. So I'll just drop this patchset for now without even looking at
>> it.
>> 
>
> Yes, I'm stumped as well. the patch specifies:
>>base-commit: c416602943dd36fbd13af7496430723935c867a3
>>prerequisite-patch-id: a4d62344b11368fb7e549c03b6a31f7ba4c9e2bb
>>prerequisite-patch-id: b4a1e18a85d8c1e337fa133c2bd2956c33b11046
>>prerequisite-patch-id: b16edd310baa35e2500267e338f60c9a2e6594e1
>
> but lore is unable to find those prerequisite patch-ids, which leads me to
> believe that they were rebased internally but never posted.
>
> I tried to apply the January series on top of the base-commit:
> c416602943dd36fbd13af7496430723935c867a3 but it doesn't apply cleanly.
>
> So I think we need to have a rebased and updated "Refactor the hardware
> recovery procedures" first.

Yeah, it's waste of everyone's time to submit patches like this which
don't even apply at all due to missing dependencies. Please don't do
that.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

