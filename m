Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9099EC4345F
	for <ath12k@archiver.kernel.org>; Tue, 23 Apr 2024 04:11:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zm9UIpcuDCmIuQyH075B6XWpU7oOH9Yf2upg8NW0Y9Q=; b=4X95x74le+SyfZ54Bc/iDpSF5e
	UKhi8lMJ14Y8nDqY4YARTQebIQduj/UJRY4JDLC3HlpMKFdPPwPSs9g+Zxup4FAkCxb/045T4Idas
	QWD08Ej92kw/H0yK5ykovJGx+iF1+gt+BMLdda0+tEUbUowDxf/edmNGp8eKUsExssvymbgC8oyO1
	WrGv4O6N+v+7iFTc3FUyR6k7mJoBeA6w8/R3jVtANyGsAg5fu6RpVUPqnKjiiMwrnfUrlAQphk7aQ
	Qqbd1MOW+9MQpYLdUKnWsCk13MhLNxOULOgBDtxSpaGLB9yZm8SaMc25IQe+Zb7Gh8JoezOCic2q5
	LfdR8soQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7Ui-0000000Fv9Q-16yt
	for ath12k@archiver.kernel.org;
	Tue, 23 Apr 2024 04:11:00 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rz7Ue-0000000Fv7x-3sjP
	for ath12k@lists.infradead.org;
	Tue, 23 Apr 2024 04:10:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 10091611E3;
	Tue, 23 Apr 2024 04:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1522C116B1;
	Tue, 23 Apr 2024 04:10:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713845455;
	bh=SZFaChg/IXoup75dLEdwA+ULyJfaOfCsXHtisihaQa8=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=pnlNN/yHZjQeEO5tiMfx9XqAzPg4jyDP4wblfGjSo5Gy4/87v9c1/0P2QKR4Eoz2W
	 sc1N0ImJlubPYr+MWYaHbRIfoIgzC6uVLzmdJ2WAc2W/z7JUzeQGdcAGMTGhOr91tc
	 srBr0QkI520YMZl4WDA+Egto0vkCtgJYosAJHk6Hbpk1l4AY7/0vy8WPCcMWgMOGlb
	 ry9KhjAQtQf2RBIu7Dfb/oTfid1qAJU900KomPeo+q59vmVw1v9Ke+coIRIeWRmbn5
	 3TfiQ+UWWJaOzRcaIpnqWPG4PiG68F+qQWpjo0YYzjb0+N7NostvwtQMYCc9lIT2p3
	 KUTBqEtm40PXQ==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Baochen Qiang <quic_bqiang@quicinc.com>,  <ath12k@lists.infradead.org>,
  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix kernel crash during resume
References: <20240419034034.2842-1-quic_bqiang@quicinc.com>
	<87cyqmhtoi.fsf@kernel.org> <87frvivufg.fsf@kernel.org>
	<87h6ftv8w6.fsf@kernel.org>
	<5f63982a-eba9-4c5d-8ac0-52970316f940@quicinc.com>
	<88a1ab50-3dea-406e-adcb-b02786ce7f30@quicinc.com>
	<e409e282-3f6d-42e2-ac6d-7602e3ef1b87@quicinc.com>
Date: Tue, 23 Apr 2024 07:10:52 +0300
In-Reply-To: <e409e282-3f6d-42e2-ac6d-7602e3ef1b87@quicinc.com> (Jeff
	Johnson's message of "Mon, 22 Apr 2024 18:34:16 -0700")
Message-ID: <87cyqgvhv7.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_211057_051399_18B7EED7 
X-CRM114-Status: GOOD (  11.72  )
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

> On 4/22/2024 11:41 AM, Jeff Johnson wrote:
>> On 4/22/2024 8:41 AM, Jeff Johnson wrote:
>>> On 4/22/2024 6:12 AM, Kalle Valo wrote:
>>>> To avoid breaking git bisect I now reshuffled the pending branch so that
>>>> 'wifi: ath12k: fix kernel crash during resume' is before the suspend
>>>> patchset and my plan is to commit the patches in same order. Does this
>>>> make sense for everyone?
>>>>
>>>> I had a simple conflict in ath12k_core_reset() in these commits:
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=052a6a7c74ae4f20a31a632184f4439edcb0f40c
>>>>
>>>> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=6bc740619993535cb64c4dcebb83c66acd506763
>>>>
>>>> Please check my changes.
>>>>
>>> These look OK to me.
>>> I'll test the pending branch on my laptop
>> 
>> pending branch crashes on my laptop
>> let me bisect
>
> ok, that was user error.
>
> I had updated my workspace on my VM but not on my actual laptop, and the old
> pending branch on my laptop contained the follow patch which I've already
> flagged as bad (and is not present in the current pending branch):
>
> wifi: ath12k: Fix Tx Completion Ring(WBM2SW) Setup Failure
>
> I updated my laptop to:
> 5085843538af (origin/pending, pending) wifi: ath12k: report station mode
> signal strength
>
> And everything in that pending branch works fine, including hotspot.

Thanks for testing. Unless no objections from Baochen I'll then apply
this fix and the suspend patches.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

