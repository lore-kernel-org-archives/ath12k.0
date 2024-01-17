Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F1E9CC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 08:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QShAyPHu5QNnuTpzOU6i9KkDPRoUWHO2TZLZDer1GKI=; b=orWLkszRO6kgNbEGYaiyIQgVk5
	H6HRtObatud+ueWKOV4ZALBd/eBr0RSYu4y1n4ayCtMJZeqaQu+1FiYknW6rkNKCOQFZvvVdX4dmo
	Cjuw7re4+BVQzjHiAWRr9BRfFRjxbUg6ACv5b8kvYR0Cho1eissuJ+3VBioO318Wml9LW2tyiVCjd
	zh6dL3kEyDltsnOWVTIoKumOsI/JC1dWcqecO5QKrC8wyz9ohlNmIsMFz1VvZDAigf5suuq77rqWr
	O5TuNXQ/2P+mdBc60onTd5Obc1SePuHDArnPj5/EuRjfaGjanOEk8msoxyhcPlVMESMXvs53FF8YR
	guhuKAjg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1Q9-00EuHW-20
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 08:37:13 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1Q4-00EuFi-1H
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 08:37:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CDAAAB810C3;
	Wed, 17 Jan 2024 08:37:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C5A9C433C7;
	Wed, 17 Jan 2024 08:37:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705480626;
	bh=MKbTbRKPfN38VHeTcWKyXE+ujHLjEE8z4beHkJvR7Ac=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dRGZW1waSpej3L+HTY7TGR56vLV8+drTEW6ZiAnrCYzjWddGpBAzUx54ekrUncvoq
	 tYH4DEEeWFb4Boj7BnDLATCj77QXnOzE8chVlGku4mqtn37W/jxunI0/XoAeOvLdGp
	 DEGPDdlwFrHh4oPWoSWSn/1ZnWod/1xbQmwsuYNnUv6hFZ4I0vsxwd7uvQe/N/SWCI
	 7iw9qwkoUVQUoYhn1NW2UzPhSboHfFbwXjkRO0WmBWCGUIhFhvb/F7+JOwspSiNYiy
	 3MqzIvYq8v9xZYjz1j+CGBJAl/OwgyS/9lgnO9QhGxwNwl+RuDw8SqtHMxuEDLeoSz
	 lNPXPZQJbhVcg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: Refactor QMI MLO host capability helper
 function
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240113001659.1022465-2-quic_periyasa@quicinc.com>
References: <20240113001659.1022465-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170548062319.2185974.9158849020666419595.kvalo@kernel.org>
Date: Wed, 17 Jan 2024 08:37:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_003708_604528_E8DE5F71 
X-CRM114-Status: UNSURE (   5.62  )
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

> Currently, QMI MLO host capability parameters are specific to the WCN7850
> platform. To make use of this helper function across all the platforms,
> move the platform specific MLO capability parameter to the HW param
> configuration.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

76fece36f17a wifi: ath12k: refactor QMI MLO host capability helper function
53a65445c144 wifi: ath12k: add QMI PHY capability learn support

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240113001659.1022465-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


