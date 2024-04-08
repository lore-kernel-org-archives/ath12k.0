Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 83AB4C67861
	for <ath12k@archiver.kernel.org>; Mon,  8 Apr 2024 14:38:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ApKlmlE7EXJbbuHae7ufLv/lYDEhnb0zp2xen501lnM=; b=RsXiWRClXqVv3KrjnZiwUMyjHd
	e5tceLExOoOXjsLmBx0Zm8qaHDYY2wdlLU0DfDJVhU53OKz5N0nTjpxzUZiIMCA4zwpRz7ZddrBYq
	aeejlq6tue8WbDl4KNYGSazIRche/vh+4tMucXWV71WY8pNWBdqGnRpFNODYcsfdrz5nkmhn1jg+Z
	HZfgodKvTYrw1chbLRHuvIHgFi4o/kNzNikr4jeGMgfYzfRmDvnBRnGxFCzA03olImmzOFpSI4akX
	p3ItFYwsJrEvlxbmPs7EZUEIOtTX324BZMYvGxzNaD7hev/Dqtpnfvo2CO5Q+yEXFOoSApTPTmmt5
	3R7uLLpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtq8W-0000000Fu6g-0x0r
	for ath12k@archiver.kernel.org;
	Mon, 08 Apr 2024 14:38:16 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rtq8S-0000000Fu54-1tFf
	for ath12k@lists.infradead.org;
	Mon, 08 Apr 2024 14:38:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7C962CE12B3;
	Mon,  8 Apr 2024 14:38:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 083D5C433F1;
	Mon,  8 Apr 2024 14:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1712587088;
	bh=ITSzNKQT5krekzRgoNfiQ3WVQsFXI3XCbtqQSxDHcnc=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=FS8XbHEHXcp6akdLPyGpgOlaiN8UgnK/u49XdVxdSOcvLLCxQfCEXrL540TPcZu8j
	 i7AanNiEy5rKxcSofnxHHUrzatZGQNC4zGEoQ+CxjFS8R0S47eqxoIQJO8swGXaFUf
	 dockr2BYHQM9FSU5/bfQofEDvMl/u+uN1HgV8DOg0NEC+rqeechZsGMd98JrpY5gSV
	 N5+eGYI6Ye9/zkTCUCxdlhGdyK5V9U0dGqUAhCdRJGMG9rSljoRAnbd+nzbvnfTEHT
	 vXn4kwIzoOTzxAx+7NyS+fOLYunmcw/jJovqfK0YAisqPD/3m5azI/RdncDb/vffdP
	 u81WvjR7VWAxQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/2] [RESEND] wifi: ath12k: extend the link capable
 flag
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240403042056.1504209-2-quic_periyasa@quicinc.com>
References: <20240403042056.1504209-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171258708599.2816782.535129209108823999.kvalo@kernel.org>
Date: Mon,  8 Apr 2024 14:38:07 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240408_073812_707113_5C0FA6AB 
X-CRM114-Status: UNSURE (   7.02  )
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

> Link capability categorized as Single Link Operation (SLO) and Multi Link
> Operation (MLO).
> 
>  - Intra-device SLO/MLO refers to links present within a device
>  - Inter-device SLO/MLO refers to links present across multiple devices
> 
> Currently, driver uses a boolean variable to represent intra-device SLO/MLO
> capability. To accommodate inter-device SLO/MLO capabilities within the
> same variable, modify the existing variable name and type. Define a new
> enumeration for the link capabilities to accommodate both intra-device
> and inter-device scenarios. Populate the enum based on the supported
> capabilities.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

58e8ecda692e wifi: ath12k: extend the link capable flag
b34389c3978c wifi: ath12k: fix link capable flags

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240403042056.1504209-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


