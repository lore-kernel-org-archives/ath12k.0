Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09BCFC54E4A
	for <ath12k@archiver.kernel.org>; Fri,  8 Mar 2024 15:04:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mPSj4Bv04Y8h0kY3s+SB3X4mJGHMA5X7NA+HYrjuVDI=; b=4QuF1MkNIkbF1sQJz+PdZ0+8nS
	J8w6OiVim6tZHPKB+9on+qEVbD/7pgg6kuMDbspWEYPT1IlZWlPTSFa6eSSOmi6JB58dv12SkM5u6
	8Kwhgrc4o5tFgknIfwuXAPrXXP3XEOaRK68zCMWfgHKRIw9ER/bFPZYdsQW0fcPsfoseQXbjARavh
	YVRLl8RmILuUT7+kZ6rQv6CDRax3PkqJ2plS3c6/1BTePzn/FljJ00JxqdmvOdO9hXi5Jy7E6oSmb
	4+MDSdGpQCIHTKZV7xf4vwJTrFwp0bF/wazDhJqjOQqCLIkJIubZNXZ8g90zAE6hHaMmUwuRMVA5T
	uUn1405g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribmJ-00000009k7t-2xrw
	for ath12k@archiver.kernel.org;
	Fri, 08 Mar 2024 15:04:55 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1ribmG-00000009k6S-1mZw
	for ath12k@lists.infradead.org;
	Fri, 08 Mar 2024 15:04:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 97690CE1E6B;
	Fri,  8 Mar 2024 15:04:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B5256C433F1;
	Fri,  8 Mar 2024 15:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1709910289;
	bh=u/gEmAT3XX/DsAa4AUjUG98Bpzl+laVZfO8peR0n210=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=bfO4RrXqhIgk5Y3Zz22vssvmYfEFr40dBNHw61CgBrEnrrVMuEKusLu0LEfPuHjBt
	 chjC30xmTvOb2AANaYLkVdsJrUq7KvE91mRVizNJNX0FQiK2JeIiofoMJpP20qgHNh
	 d2cO7mI6RQZg49d4QrAdWvMRzU9zbx2ey0ZrsODMf4Uz6+toX806RYyLEVYQYuRpsi
	 Zm7f+cnA8jRvXNqCLBOQM/0/sv/zgsozoIvesBMB4M7XrINoTjN4Oi6oSTxAA6KUo4
	 skc5g3BPx2/F6Oo7wZnt6i8T9YwrkRmyVg+oxyZs0aG+2UcPc3GCI6erX8HOQMlsiJ
	 0yF2K+OlunjOg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: remove obsolete struct wmi_start_scan_arg
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240226-ath12k-obsolete-wmi_start_scan_arg-v1-1-07b0b563cb27@quicinc.com>
References: <20240226-ath12k-obsolete-wmi_start_scan_arg-v1-1-07b0b563cb27@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170991028648.1311983.8441436934552157832.kvalo@kernel.org>
Date: Fri,  8 Mar 2024 15:04:48 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240308_070452_757041_E6223917 
X-CRM114-Status: UNSURE (   5.14  )
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

> ath12k inherited struct wmi_start_scan_arg from ath11k. However, in
> ath12k, this struct is unused -- struct ath12k_wmi_scan_req_arg is
> used for this functionality. So remove the unused struct.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

4cd6eb606f02 wifi: ath12k: remove obsolete struct wmi_start_scan_arg

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240226-ath12k-obsolete-wmi_start_scan_arg-v1-1-07b0b563cb27@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


