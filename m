Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2965CC4167B
	for <ath12k@archiver.kernel.org>; Wed, 29 Nov 2023 11:27:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9aab8t4MJgjlcZAVQyQJmRP2wyJq7Pv16Dqhi1xYfKg=; b=kjo4n5XMGZwxatpogWKkz669fc
	W/88Uembxhg9yZTqyY4HCc1REZQz5GFlsttluw3sGBZI1x1o+TOzxawnEnrQX/3DzzZefvkg7VjXu
	/pHNdDbKGO6ywc4WFcs0+KKVOzXLf4GpEBHvTGx/WwevqeW9T+9xlBW91Wy3VUbzcPpEnT4FyU0DJ
	mEbuLLwpni7Okh65b0zKgO2gq6fz35FcF3W4ImheiDrwVR3AFweN/4YY6e9UKf0lLJiXCHdDJcu4J
	DjOAcoLm+BcSg3vjojRI/25GUv5wN6+D73u40MyBX7lYUtC2UADRNFgeibS3osrYo40dPzhtqhJOH
	G432Ayww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IjL-0086Ny-2l
	for ath12k@archiver.kernel.org;
	Wed, 29 Nov 2023 11:27:47 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1r8IjI-0086Ki-2B
	for ath12k@lists.infradead.org;
	Wed, 29 Nov 2023 11:27:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 0356E61ADB;
	Wed, 29 Nov 2023 11:27:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB5C2C433C8;
	Wed, 29 Nov 2023 11:27:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701257263;
	bh=CxhC3KPL6edIsxMs1xLty9ggRm5+698r8F21EfLaHqI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=gnBUPItKb/2k/CgXYbsieuHvMzORRgH59C+x1bm62PZH9YPK2me8Yot24fyJSjObe
	 LccgTClXfmJvhZ28GXRycfGMKRgmf4iNuz4z4KZnTk2WwARPgzfL269OtyK85Ul9+K
	 SGKZLUf3NT4sP1X93nRHa1yM1BqGao26p76AcWg9uJ/WvQZPSI4DHKyh4b3IbijP0B
	 hwQMwZE7HV+rZAx3r060qm6vaxgnkXD52kbFGiBIvniNV7LQ5jIQ89XylsqfikSu3D
	 WQPubVSL6FnHvyRG4Qm0gQGUzHx5EQds77QxVk0107A6Eu1JuJRw7ajubMoRzloKPa
	 S8A958q3y9Sgw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] wifi: ath12k: avoid explicit mac id argument in
 Rxdma
 replenish
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231111043934.20485-2-quic_periyasa@quicinc.com>
References: <20231111043934.20485-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170125726059.1070846.12579198842403519575.kvalo@kernel.org>
Date: Wed, 29 Nov 2023 11:27:42 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231129_032744_813415_FD787F4C 
X-CRM114-Status: UNSURE (   5.64  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> wrote:

> Currently all Rxdma replenish callers pass zero for the mac id
> argument, so make it as zero implicitly. To optimize the rx
> data path per packet, avoid the explicit unnecessary argument
> in Rxdma replenish function.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00125-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

d281a574f133 wifi: ath12k: avoid explicit mac id argument in Rxdma replenish
d457f9fe863d wifi: ath12k: avoid explicit RBM id argument in Rxdma replenish
4d922ce983cb wifi: ath12k: avoid explicit HW conversion argument in Rxdma replenish
9f1eebf0454d wifi: ath12k: refactor DP Rxdma ring structure

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231111043934.20485-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


