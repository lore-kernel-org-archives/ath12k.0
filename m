Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A21CAC47077
	for <ath12k@archiver.kernel.org>; Thu, 18 Jan 2024 05:52:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xRcW2XsHz+L2wWqsf7DdZiodv5/NjABnm1ERrGGAPQY=; b=b3OiC1ckeM7IHXDpmAzfiDVbyv
	xDqMy5mRZ4shjHjvxyRHY1PlD4G9HG5+Cy9KSTvWta0CHentajbR0gJf5THlM2cC85wbc0yOpS+Ih
	H0lF2CXs54rvlsEU99uKD0xPpFPZJmGgFK5Vi5QnIps+xGqvbNDhQs48GZycO9UTMVeYrbcZ4N2YP
	PMj4PUe7UGxqbRjDH3Zib3lx0rN+xIOVG5bEL/YMLfIS+ddWgA0yRzGA9DL9KSf68FtDKICtCjfoB
	1dWCqRlndjjNXIwrusK4Epp1dCGsAgj1kNy0Bl9YrkXQXZscFYWazezNCBC0V3sTfJEMjT9KG+Lbw
	DZP3bRFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLKA-001kOw-0r
	for ath12k@archiver.kernel.org;
	Thu, 18 Jan 2024 05:52:22 +0000
Received: from ams.source.kernel.org ([2604:1380:4601:e00::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLK6-001kMm-0g
	for ath12k@lists.infradead.org;
	Thu, 18 Jan 2024 05:52:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by ams.source.kernel.org (Postfix) with ESMTP id CD9F7B816BF;
	Thu, 18 Jan 2024 05:52:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 682E1C433F1;
	Thu, 18 Jan 2024 05:52:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705557136;
	bh=sJTweTXpSZqoIma9Gmm1lJh1URP6mCEDtKMc3NepUeI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FYY10fv7D12UHkoNRPR4XS7VxGYNQjc+STeUFudhUWfqN2GykGsxH3YBOgdU7YfVc
	 6SqxqSTiMFGVKJ3neuRcHFo08dq+k1O99dkS//gm7pHQtPkF1jfhZSEGNnCTE53iYV
	 9OEuLv5Tj9WdFzkksS2Npy8RA4vdRZdgrdqG4pEIRXPuYGblzAohDkF6PI6sg6QLVv
	 zNEwOAJ/sEun2/f4fchk6pJ4MJTV3MDjV1ZFPjdcP07YJeiF/xGBQcSwwy9hEq4FIk
	 5ux0yLyOWvbpJMD3uRPp6atphs1mw4cSMQhcmbTu4FK20fCYRVo8fciNNfFbcHLq8O
	 IxosORpzaYQMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] wifi: ath12k: fix wrong definitions of
 hal_reo_update_rx_queue
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231129020414.56425-2-quic_bqiang@quicinc.com>
References: <20231129020414.56425-2-quic_bqiang@quicinc.com>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170555713346.2637903.17844854625584075804.kvalo@kernel.org>
Date: Thu, 18 Jan 2024 05:52:15 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_215218_391310_BD8742CF 
X-CRM114-Status: UNSURE (   5.72  )
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

Baochen Qiang <quic_bqiang@quicinc.com> wrote:

> Some fields of hal_reo_update_rx_queue structure are wrongly
> defined, so fix it.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

60b937658321 wifi: ath12k: fix wrong definitions of hal_reo_update_rx_queue
b0970f50839e wifi: ath12k: add support for BA1024
955df16f2a4c wifi: ath12k: change MAC buffer ring size to 2048

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231129020414.56425-2-quic_bqiang@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


