Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F4121C3DA79
	for <ath12k@archiver.kernel.org>; Mon, 15 Jan 2024 15:28:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hxQafBl803n17yDrkYXgu5LkUk16w8ZDPBQMGGRMGP8=; b=03JCXvG09Z7SRyZS09nGwna/Mr
	DfFlvYveEvv8AzVaRX8LmA/aaJi+KyBZE6MbNiyMrbB3+W3Pok5h4O+6XaVM3LJ6x/Q2VHLocOzg8
	FSA/C7ckm/pMQobyjVEHRod3zadgGzVz57yEv0oNF8dUiGZkr4bLc9p4fgR9NC0WdGzU8I3lURH7F
	4EDGxzvbyTW9QHhAGujiicGEXI2KEr0jcGf69ole7qubS1bd05+6oNIfHbAP10s3aj1lrJexWF2MU
	I8GkzWU63bEL2c/UwcXG2x+uJcudFhotEKKiW1k95TcYSudhNCWmb0Ll16Qtt1UcrF6krLjnFrYmp
	nXm7k+JQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOsg-009P3N-2A
	for ath12k@archiver.kernel.org;
	Mon, 15 Jan 2024 15:28:06 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rPOse-009P2v-0I
	for ath12k@lists.infradead.org;
	Mon, 15 Jan 2024 15:28:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id C3AF6CE16FB;
	Mon, 15 Jan 2024 15:28:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D9D5C433C7;
	Mon, 15 Jan 2024 15:27:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705332478;
	bh=83Kwxp4mOs4b7IHvqtRZuMJdTUukpnkqxu557swleIs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=TnjFJtSUyGh2PJLnoF+yvF/yRixUtkfXtalmww1XZOrq24RFQ0TKmrFVFtf+QmqKe
	 AcMj1lm5+MYLEy79m60g0+0tMtYtYKR2d0wwapRR6Sqpsk1r3axcq1rC6b33/7OSzV
	 uX9j5Q/7zghzDcG5Z4aH9qe5HGKnvB3FrnkpDO0HJckByTngm9mFXaPgPg71CfqDG8
	 Up/Y+zERPYlPOPUv1AJaJ0uWB25Sr6JS+L8Bt8sCnSEOqUwgGzCdyITXgSVRH7h1Ec
	 CiwKoSI3i76TvX0qWl8sDNXQst+zEhwX69gRZL12/mLTatIAPeulImvYlxJXA1+Moh
	 YLFPIaFUbrqEA==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 4/4] wifi: ath12k: Refactor MAC un/register helper function
References: <20231206034920.1037449-1-quic_periyasa@quicinc.com>
	<20231206034920.1037449-5-quic_periyasa@quicinc.com>
	<87bk9uej0b.fsf@kernel.org>
	<269ea05b-d665-eceb-d7a1-d0ac20d341a7@quicinc.com>
Date: Mon, 15 Jan 2024 17:27:55 +0200
In-Reply-To: <269ea05b-d665-eceb-d7a1-d0ac20d341a7@quicinc.com> (Karthikeyan
	Periyasamy's message of "Tue, 9 Jan 2024 19:11:38 +0530")
Message-ID: <87v87u7h1g.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240115_072804_329738_A2D43C62 
X-CRM114-Status: GOOD (  12.24  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

>> Is there a reason why you moved these two functions from mac.c to
>> core.c? This is mac level code anyway, right?
>
> This is not fully mac level code, some parts of SoC/chip level code
> bindup in the mac level. So i segregated the SoC level code like ab
> related param initialization handling from the mac level procedure.
>
> Now, mac/radio should take care only radio level handling procedure.
>
> In future for MLO, SoC level can be extend easily.

But is there a concrete reason to have the functions in core.c? In your
following patches I couldn't see why to move these functions to core.c,
everything seems to be suitable for mac.c.

I experimented this in the pending branch and moved the functions to
mac.c (tag ath-pending-202401151424):

https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=bee89ac2b5755754849deaf7054828e982cc6658

I also fixed your other patchsets to match that and to me it makes more
sense to have everything in mac.c. I prefer to make core.c as simple as possible.

As you can see I also made changes to the patch titles to make them more
understandable:

wifi: ath12k: refactor ath12k_mac_register() and ath12k_mac_unregister()

Thoughts?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

