Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44C98C48285
	for <ath12k@archiver.kernel.org>; Wed, 31 Jan 2024 18:01:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pubWSR7f78JyMiMdC4yHIr6eeM45/RopGk4N1OxP0Ts=; b=46cVtSGKZ8LKoiBcJSErKuttdS
	FDMnplLvafHiw5IAIyejhHmOH95CopG9MAgQyb06XpVD+osJOOeyDUZWe/ezsA+Lh2JFl014vfOsb
	QgNW7PpApD9nUxs+dR2GUp49AmEVwBoDkzS1A1fuRQ933RvI0BeOtW35qPC4RCt9HNAVOvZJiXTJb
	3F8cWbGx+bN0UqwBlC24/k5m8M9x4j4I6Fq/INzIRTwy+LfKmUo1fu+OflFA4J6XjlF46NsdoAmdp
	7a8eIHy8hSqMoa2usX6dD2JzcT8G88zSHrxk/Scsg55bO5pWTPDfC6x6lmhmFEHXab7+odlPHefuc
	pDDv1krw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVEu6-00000004yCa-47CH
	for ath12k@archiver.kernel.org;
	Wed, 31 Jan 2024 18:01:42 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rVDk4-00000004cET-1iz0;
	Wed, 31 Jan 2024 16:47:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id C899261890;
	Wed, 31 Jan 2024 16:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204E2C433C7;
	Wed, 31 Jan 2024 16:47:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1706719634;
	bh=n4J5e0trCTDGle1PSUsR+5t6O+Jx8VRlH+ldwH3yaDo=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=cs6MHL7ED2+/8SyaqbLJzKm8xhfoeCSuCVDoaKMKF/15AEkQUODTr9o0+NTn0GHTB
	 NB3o64hPMTy2Dz63AHHf49B4txBPbgp71IDyzEx0YjJOkrZGHX/1bq0l1SQPjO/hSh
	 57InP/lh6CiTKdeDdf5i/R1Ol8G5wJOwW0CbtgCVYc6R9psyfvWiNwosIflcpihVsh
	 Ip7T43Vn6chbPalDmgQS5LPr/K/V/EAAGBniHXvcYZIys126dBKcqrqPj/oUVGFOap
	 HxsC/tCe7UQD4h5W7I6NbNOlZON2ETSSLDwbWydTfQNdjotsXGzbU9hlKDdqcwEtYY
	 9+LFpLJ4e6hVg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: pull-request: ath-next-20240130
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <87bk93vtxf.fsf@kernel.org>
References: <87bk93vtxf.fsf@kernel.org>
To: Kalle Valo <kvalo@kernel.org>
Cc: linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 quic_jjohnson@quicinc.com
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170671963103.2518225.1246004749714311904.kvalo@kernel.org>
Date: Wed, 31 Jan 2024 16:47:12 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240131_084716_515970_289DFBB6 
X-CRM114-Status: UNSURE (   6.93  )
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

Kalle Valo <kvalo@kernel.org> wrote:

> Hi,
> 
> Our ath-next pull request for wireless-next.
> 
> Kalle
> 
> The following changes since commit c5a3f56fcdb0a48a20772e4c9b8adc6c7256a461:
> 
>   Merge tag 'ath-next-20231215' of git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath (2023-12-17 13:20:18 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git tags/ath-next-20240130
> 
> for you to fetch changes up to 9d5f28c1366f48efae7b1df0f622285519e74dce:
> 
>   wifi: ath11k: fix connection failure due to unexpected peer delete (2024-01-25 18:44:02 +0200)

Pulled manually as there was a simple conflict in ath11k/core.h.

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/87bk93vtxf.fsf@kernel.org/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


