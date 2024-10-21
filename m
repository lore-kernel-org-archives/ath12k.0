Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 73995D0E6D3
	for <ath12k@archiver.kernel.org>; Mon, 21 Oct 2024 08:58:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5+SSFi85BMrPelCUAjGBrznySWO9wg87h0ynKZHFxDI=; b=KocK2DnvrlH2fSyvqD6pktw+98
	cG/nmPM/BmEhqRyagM/Uk79ymfTGXzOtdEtKjLoJawSZBxBwh/mszw7FRoWFiwFWqjUbe0SuA5DHV
	aOX04ixAw8sGnKsnlkzda6ohFxCIxtl52pOP0VBztiXK5s14ndxfYLx0qIosrRVn87UzVvL7V6qeT
	f+z4Qp4oNcCm7ScbE/rfYFENYFgG2+x3sRgFcpFi9grY43frAVsanUl7ao98v7yQkp4WwcyXBLmjW
	C0j8N+FcB9shreCbFn2MgCFLdGreky/f8ZPPpwWsWGs+UcNNyYcoQFhw/ZydzSfksetaZs8uTCfL2
	TbiI9Tzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oEp-00000006dmc-0fPd
	for ath12k@archiver.kernel.org;
	Mon, 21 Oct 2024 08:58:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t2oEm-00000006dmA-3l0M
	for ath12k@lists.infradead.org;
	Mon, 21 Oct 2024 08:58:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B5965C5B87;
	Mon, 21 Oct 2024 08:57:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57906C4CEC3;
	Mon, 21 Oct 2024 08:58:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729501083;
	bh=mf2/OOYJ8LwJZUCqardXjuJg508jYSPac/BVpOaGjUk=;
	h=From:To:List-Id:Cc:Subject:References:Date:In-Reply-To:From;
	b=mXx5okYeMcmRy5c+sdO7dq6Bt0uUlQwuC5jxZMJbr4NhsMt8vuLqBBznd1zSO539g
	 C9zRbAKCGVKNcE30BkvOMKe2kmHTIWo2YnexuXybYH8MDXadjl2IT84yVPBDUF7+ML
	 mvdyGw3TyspG/W/BNN9IwyBiXuSVPCPlUvr1aJSN6xrURW+neJSESTvWh/wP/s4EUt
	 Wzew2aN8UsbZVGEZcwtF0thyL2tm5VLs7pbT/Uiz1r/VtNT9eENbUg1c3ofB/ilMtj
	 pVuDCRg65vbaff32ELs2lcw1a1x+FVFRLTUBy1V82gt3EO6BWMfcneTglCtKXSBG2G
	 x7DO0fU+Z8oxA==
From: Kalle Valo <kvalo@kernel.org>
To: Mario Limonciello <mario.limonciello@amd.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>,  linux-firmware@kernel.org,
  ath12k@lists.infradead.org,  Jeff Johnson <jjohnson@kernel.org>
Subject: Re: [PULL linux-firmware] ath12k firmware 20241009
References: <015383e1-f37e-4a1d-b2de-f3261f5ea1f4@quicinc.com>
	<d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com>
Date: Mon, 21 Oct 2024 11:58:00 +0300
In-Reply-To: <d496a87e-73a1-45e7-8ebb-b907d58dd4f2@amd.com> (Mario
	Limonciello's message of "Thu, 10 Oct 2024 14:52:49 -0500")
Message-ID: <87bjzdq1d3.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241021_015805_001614_68867DCB 
X-CRM114-Status: GOOD (  13.02  )
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

Mario Limonciello <mario.limonciello@amd.com> writes:

> On 10/10/2024 13:49, Jeff Johnson wrote:
>> Hi,
>> Here's a pull request for ath12k. We have a new ath12k hardware
>> QCN9274 hw2.0 and an updated board file for WCN7850 hw2.0 which
>> addresses the issue described at:
>> https://lore.kernel.org/all/44ae68d2-24b6-49d2-a4f9-ae9cbf6f9950@heusel.eu/
>> The following changes since commit
>> 919f79f9fb5536c1928a15ac82a2e53183b213cf:
>>    Merge branch 'amd-staging' into 'main' (2024-10-04 21:12:04
>> +0000)
>> are available in the Git repository at:
>>    git://git.kernel.org/pub/scm/linux/kernel/git/ath/linux-firmware.git
>> ath-20241009
>> for you to fetch changes up to
>> 42d754dc98e77e43bcb86def5ea60e009cc49be2:
>>    ath12k: WCN7850 hw2.0: update board-2.bin (2024-10-09 14:24:59
>> -0700)
>> 
>
> Hi,
>
> This is pulled after a rebase to main.  FYI we had a revert in place
> upstream for that board-2.bin because of the regressions.
>
> You can double check the result looks good.

Could you cc the ath12k list if you make changes to ath12k files,
please? That way we would have avoided the conflict in the first place.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

