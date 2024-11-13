Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 629DCD41C33
	for <ath12k@archiver.kernel.org>; Wed, 13 Nov 2024 11:04:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pM2U/VzzbwOtD36NJztwOsNt1Z+stZp0f/bD3drf/iw=; b=Emjjyf4Nb2sV+wk3Se4k9V7XSl
	5t8glFYlXO8BL/2CyFtfnEi8aO9RrTWEGEZL/TnxqE9OIX0vChKMe9GdQ23kdTqnPboJGjPiFPdiD
	iBjMZNuQG1QfoL2RR240RDRfJwUUbsDPbhzJq/aYfIzifV9W5ra1IWS2+rz7ckc1SdW0FseKPO6Dx
	b0ikTaj4+kJPHhRZ1cFhEMcbltFjSotYto+jkjWTv5DNT31fcff3n3QQIMxzPT+yC91xOGXO/PTrT
	H++NNNJSyVdOoTkH4EmU+o5FEqo3p1yUp35ES7w8mr2LsSD3k0fspvy2AoV7SYaqNshnrj9ghZsJo
	NIky6Iqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBB8-00000006XG1-0VqG
	for ath12k@archiver.kernel.org;
	Wed, 13 Nov 2024 11:04:54 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tBBB5-00000006XFc-3sIk
	for ath12k@lists.infradead.org;
	Wed, 13 Nov 2024 11:04:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 157CF5C5934;
	Wed, 13 Nov 2024 11:04:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 59E6EC4CED0;
	Wed, 13 Nov 2024 11:04:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731495891;
	bh=Vvvg1AH++KyA2a6QcTmIeH3TKjzNmmaOAkeEyTGoVlY=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=uvV8V1Ad4WeCgMWv9Z2cYd+NbErRsdQA8DdUpp7fm0UfvIpaOLsIaHNYXlxkd3PTd
	 RvgVyn0SLc/v7Cwlq9ZtnGu7YFK0rIroXBbBMQCicbGZtbhp8CCYIk+lQtPUXe43jz
	 x69J/NmrHdZAfX/VsbZ6d+luAWg/odKky9w5z/he0D6JGhVLeZRPN7o0eA7r8GWVS8
	 8Cw9KqCFjNPaAUtEOXFFVtT3dgY9WE4bSEDT6dIw+WTmC/R8lVJ9duktk9M5jtEd3X
	 w4ryKBu4Qs1DLM3adZYMhUXL68fjFnmvLS9cNM9dVPTDI+pG26iAotJDJe6qE3bXnm
	 0aauHfkjdYHsg==
From: Kalle Valo <kvalo@kernel.org>
To: Roopni Devanathan <quic_rdevanat@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v5 0/4] wifi: ath12k: Support Pager, Counter, SoC,
 Transmit Rate Stats
References: <20241113072707.3377341-1-quic_rdevanat@quicinc.com>
Date: Wed, 13 Nov 2024 13:04:48 +0200
In-Reply-To: <20241113072707.3377341-1-quic_rdevanat@quicinc.com> (Roopni
	Devanathan's message of "Wed, 13 Nov 2024 12:57:03 +0530")
Message-ID: <87cyiz2y3z.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241113_030452_052391_2BF85CEB 
X-CRM114-Status: UNSURE (   8.52  )
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

Roopni Devanathan <quic_rdevanat@quicinc.com> writes:

> Add support to request HTT stats type 36, 37, 38 and 40 from firmware.
> These stat types give downlink pager stats, counter and TPC stats, SoC
> common stats and Transmit PER rate stats, respectively.
>
> v5:
>  - Addressed Kalle's comments pertaining to variable declaration order.
> v4:
>  - Addressed Jeff's comments pertaining to data type conversions.
> v3:
>  - Added macros to fix compilation issues.
> v2:
>  - Removed dependencies. No change in code.
>
> Dinesh Karthikeyan (4):
>   wifi: ath12k: Support Downlink Pager Stats
>   wifi: ath12k: Support phy counter and TPC stats
>   wifi: ath12k: Support SoC Common Stats
>   wifi: ath12k: Support Transmit PER Rate Stats
>
>  .../wireless/ath/ath12k/debugfs_htt_stats.c   | 629 +++++++++++++++++-
>  .../wireless/ath/ath12k/debugfs_htt_stats.h   | 204 +++++-
>  2 files changed, 830 insertions(+), 3 deletions(-)
>
>
> base-commit: fc6f018eda7f9054e427f731db1e8b200f22873c

Acked-by: Kalle Valo <kvalo@kernel.org>

Jeff, does b4 pick up Acked-by from the cover letter or should I ack
individual patches?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

