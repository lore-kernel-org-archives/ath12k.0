Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5FF4C04E69
	for <ath12k@archiver.kernel.org>; Wed,  2 Aug 2023 17:01:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:
	Content-Transfer-Encoding:Content-Type:List-Subscribe:List-Help:List-Post:
	List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:References:
	In-Reply-To:From:Subject:MIME-Version:Reply-To:Content-ID:Content-Description
	:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=G5r24/uldRrTj3DQuMdJkgCs5wU5Zt+Qg7CUK1Rx8jw=; b=Ap9o7ci2ojiSfD
	FiKo/KcxG5esoA92D2C8B63AX4LimDH4hoGhZ9SaV9MC4MH7BsJUuI2O4DpbaaKV3UImTLEEHLbOt
	SeDvhKIRzNVoN7ZmzrW5Nojum9IRkr7IPJvgsqp0GHd276c4N1hIjlF8hl9Nzwwk1AUWo4nQtHUmk
	M/S3nNyC+Xy9GEfvjoGilcHv9OLXq+kZFqB5J904DHgGhhKAyK0jvltOQ+NBSWEvHXwvd+5uzrxv3
	QDll/9j4UdodijPgN0mgtGCp1MrRkMW9EdF64JUY84ie/SX33zujxmM1ejDITmhqQgicpdKN9aLHS
	tHXc9R0vYvuTLCa1Nsng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFDm-005RC2-1T
	for ath12k@archiver.kernel.org;
	Wed, 02 Aug 2023 17:01:14 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1qRFDj-005RB3-1P
	for ath12k@lists.infradead.org;
	Wed, 02 Aug 2023 17:01:12 +0000
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits))
	(No client certificate requested)
	by dfw.source.kernel.org (Postfix) with ESMTPS id BFC73619D7;
	Wed,  2 Aug 2023 17:01:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3DF67C433C9;
	Wed,  2 Aug 2023 17:01:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1690995670;
	bh=9poAHubW0lfhHnO2RdeD/r6F4kxYduzOpSWyHYRXlJg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dZ5Xm6EQ1O7O9lZUByBx0Y/DBhzK70k966kY8o08Sf5xE+62plO20mZrHj6cqbU6G
	 OybJAm42jRhfM0CNVPxMjknpCQsehLPQAMj1ENuh7yoFD5J6nX27WaBa3mtzStw8iU
	 HYqak/nWlDOUfULuwA/yGW2e6akt7qxMrA6Fuvsvg1uKiYuq/JTN6GS76aXqRBhYFi
	 CpwW9Wk9xA+Xo8Q4mw7KYbnsxOH/+E9RspF9J6Anx8MzolDeq1cbHcAQZVTKe7zzOj
	 1yP2y/jj+4/A0fZfk0a6KV2J7m3BOoY/oxsA4hwdgaZeClwJKQlux2M0YcJH8qPCfa
	 a9vMHAKCbP/bw==
MIME-Version: 1.0
Subject: Re: [PATCH] wifi: ath12k: change to use dynamic memory for channel
 list
 of scan
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20230717033431.21983-1-quic_wgong@quicinc.com>
References: <20230717033431.21983-1-quic_wgong@quicinc.com>
To: Wen Gong <quic_wgong@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 <quic_wgong@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <169099566749.463701.15800758617469545708.kvalo@kernel.org>
Date: Wed,  2 Aug 2023 17:01:09 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20230802_100111_513739_4423B551 
X-CRM114-Status: UNSURE (   8.46  )
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
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: 7bit
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

Wen Gong <quic_wgong@quicinc.com> wrote:

> Currently there are about 60 channels for 6 GHz, then the size of
> chan_list in struct scan_req_params which is 40 is not enough to
> fill all the channel list of 6 GHz.
> 
> Use dynamic memory to save the channel list of scan.
> 
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
> 
> Signed-off-by: Wen Gong <quic_wgong@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

3742928a52d6 wifi: ath12k: change to use dynamic memory for channel list of scan

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20230717033431.21983-1-quic_wgong@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


-- 
ath12k mailing list
ath12k@lists.infradead.org
https://lists.infradead.org/mailman/listinfo/ath12k
