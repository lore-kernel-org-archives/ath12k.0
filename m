Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7065AC25B78
	for <ath12k@archiver.kernel.org>; Tue, 28 May 2024 17:43:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YOODzT9sFmaX92ExaxzbpalERQbxKs2oUDM24siVvZE=; b=GRv2bU4dtHsgH/JTeaI5DlcGyM
	mZG3fYqumLIUspp2XPMT1rZpYcN+xQoasfCKsP/Ts+RfRKJhtokEWBS3ZOJjlLTB76lGOwX71EswH
	OqbA5WLv9hCJcmF1m9xXXMuetyqOWCY+NYRrGvi9B+4/5p1uOE1jKyV5p61Rx9doCpy1Z+WQMw1iB
	43Mc8eA02knOC17IqO60/jRHM2H0htNvfPDsw6XiMy7yUHykXF3kNpbrgp+JVvbpToKHM7vLhl7ga
	+gEW1eUHDVvnDvRp2EQX82yDLu39g2fZKqJUuDEzsfKD3ikKF4Iz5E2vL/pl6GJdGtwqSeT++/gi0
	RaxVJDQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0qt-00000001aRd-0gqU
	for ath12k@archiver.kernel.org;
	Tue, 28 May 2024 17:43:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sC0qp-00000001aPm-22Ll
	for ath12k@lists.infradead.org;
	Tue, 28 May 2024 17:43:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id BB8DBCE0F1F;
	Tue, 28 May 2024 17:43:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9B4ABC3277B;
	Tue, 28 May 2024 17:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1716918185;
	bh=1t/2nyJD90QWoKEkfj3SOxB3g/QFZrSpyN4KN1vGGnU=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=mk6A3wreOpylOAIEsWPFXtLqkosBIeqOxTRhd4mq6Q7L6w2M2RcPgzjuvzo1utXtm
	 InUqj2KTBoCyeh/hZe7rAijOd1Wm3u1WEQ8cP3kxpa3Zk0bg2vPxNdrg8ZZy+X2dA5
	 s5YmLOxA530fO0r6FhKFwUbWUHimZrnr/w5XZECMC33JHLmThPk1OFa9gkWA0SVeFj
	 20J+oLFISxG0lVSdVFcwYiE4r7wQ+zeKdEkGiKOCHNedxGHdJt5Oo4TfY0+RE1O4iz
	 gC+kQam6pStHbYMDe1eRwq9/Eng8rvrMFQtDgNTf3EZ+UVWUBxu9tdkLNNHCG/xvlM
	 BHuoG4/rkLbQg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Fix devmem address prefix when logging
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240523-ox-v1-1-112ae7350059@quicinc.com>
References: <20240523-ox-v1-1-112ae7350059@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171691818162.1700985.17832746813476815446.kvalo@kernel.org>
Date: Tue, 28 May 2024 17:43:03 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240528_104307_737725_CDF47294 
X-CRM114-Status: UNSURE (   5.84  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Currently when ath12k QMI logging is enabled, messages such as the
> following can be logged:
> 
> ath12k_pci 0000:03:00.0: devmem [0] start ox113000 size 20480
> 
> Replace ox% with 0x% to get a proper hex address prefix:
> 
> ath12k_pci 0000:03:00.0: devmem [0] start 0x113000 size 20480
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

af69d862a8ba wifi: ath12k: Fix devmem address prefix when logging

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240523-ox-v1-1-112ae7350059@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


