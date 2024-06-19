Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A78BC27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 14:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AJKUB8I9L9m7ex/aqDvzJ6R7aP5/wPzHnMb2upwBzX4=; b=qupeaF7QPNqZKeRjGvrOp8IKUG
	LtdJq0YUsL/k6UDWdS6VmhpRc/vlpVrMcfSXBGFd0y/NqyW3pdEeOLXgC/ZsJpZkAzvDx3KivoPjR
	JuOjMl5sBVhYMyf03zPM57xfZu7AA0gNGmnuBDIF9wvLXN5gOLIvXnUNcOF0V4VYyuZIyAM54Tqja
	YsdHaXcDOvYWfPzQFX4mBcf0wnlRUisZztt4bRROGQYkG7FP2cumipAasJWohtOUDPMjj5OODTpCE
	2WRXsbcmmDjp0aH+pUxSQEBVCovUYz10veqe99VN1vY5XnjK0CdIgUPWNydH2GNsTdfx+CT4y/fG9
	UwAEbVyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvs3-00000001PTq-16va
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 14:01:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJvs0-00000001PTE-1O9l
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 14:01:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 21C0B61C06;
	Wed, 19 Jun 2024 14:01:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D39EAC2BBFC;
	Wed, 19 Jun 2024 14:01:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718805662;
	bh=+tvp7aMwbkJu7Nc2OzppMWm0NdIEXv05XzZ3EDCQcts=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=BXLv4D5o8w8bC8Qs6aKJror4di5Njyz0mYzzz7zDHVR8Xqjy+2LjJs7h59RS93dZq
	 PC758feYzGcmz244s8sxo6v1igpcx385NMGETgcBLDQPrgxrYMka2wPq14JpCGsfNm
	 spu+jG5HXl7DRzTte1s/ZvGL9Syk9SY8ComYVNA8BGOTzifc3FuP7EzeOq1NEI2icW
	 KVm43Mqi2dtJ5uFE0JADH/owjc93jp4PABQppRrkrOetuxCMpJgnxoEAmN9cpyqwJ1
	 477dIaV+mACOcUUQqnUj9xbsnPiXxJOUz0b1Yqwk+AUP0BpMQwPSsbEakwTX+Fik9V
	 hSX2b9wAg3jrQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: fix NULL pointer access in
 ath12k_mac_op_get_survey()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240611031017.297927-2-quic_aarasahu@quicinc.com>
References: <20240611031017.297927-2-quic_aarasahu@quicinc.com>
To: Aaradhana Sahu <quic_aarasahu@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Aaradhana Sahu
	<quic_aarasahu@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880566024.581414.8009521836659162267.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 14:01:01 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_070105_123302_19C8E0AA 
X-CRM114-Status: UNSURE (   8.61  )
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

Aaradhana Sahu <quic_aarasahu@quicinc.com> wrote:

> Smatch throws below error
> 
> drivers/net/wireless/ath/ath12k/mac.c:8318 ath12k_mac_op_get_survey() error: we previously assumed 'sband' could be null
> 
> Currently, we access sband inside the null check of the sband
> in ath12k_mac_op_get_survey().
> 
> Fix this issue by removing the entire if block, because decrement
> idx is unnecessary since there are no more band to test.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 70e3be54bbdd ("wifi: ath12k: fix survey dump collection in 6 GHz")
> Signed-off-by: Aaradhana Sahu <quic_aarasahu@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

59ca26c9a6e8 wifi: ath12k: fix NULL pointer access in ath12k_mac_op_get_survey()
19b77e7c656a wifi: ath12k: fix uninitialize symbol error on ath12k_peer_assoc_h_he()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240611031017.297927-2-quic_aarasahu@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


