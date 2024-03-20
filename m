Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9827BC54E67
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 10:07:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EKLIAqUheFogCrXCx8BKFnK48rw5wEIY3ogivohqtlw=; b=jkkAK/qXBSqsJ/U+hcRonijICQ
	wPnv6LQqyecGzS/3lh2Eg8xRlSMfD3ruUzD9bgC9hzFDiGPg67bZGsryqOwPj/mpBfHgYuclEdT41
	X3a3UfZmr1Ofe75UW3TMcjW4DO7WkVNwdkZLs7ojyJUunC/CMIsTK73j3GuuDBI3FkrgRDEK/qw33
	4lgvm8okPlJ1tAfgcP21dzA8h2avlQSpNy04Uh/6WQ6UpxLfnt5xgPNO21PtX5cSSMG6L60eS+kZX
	/wpK9Ve/fbi8/ODW8tBkrvfzVdAtntYK/G0FiRv1XWekiIh63Ysp/XlqPIzyyqrlB4XamhDIG7GYU
	0DDmyj8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsql-0000000Ge9R-1GfU
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 10:07:11 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmsqi-0000000Ge6y-4Bx9
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 10:07:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 468E4CE09CF;
	Wed, 20 Mar 2024 10:07:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD2F4C433F1;
	Wed, 20 Mar 2024 10:07:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710929226;
	bh=VE+Bn/r+0jrIyjgwGAHCLncsj+C7cRWTvnPM0hKnwfk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fuot2mC3mvly6w87G88zx7YZVWyjr5xzPcvSiVdPDVmxmzOHM+H2ccpXRzxmoNHCb
	 OeTtRLyKtrI4H+NCQkpb+vWjT9yD7KQ96D+mFfM2tSwn3VWAVyaMOq/WSTDyyBvCCa
	 gsVRa3rx+/7z1KO6IBU9Bp8NsuFclEONahIB9/QKqZfR3XSqqbMxfQkQkvpdIsGz/i
	 3tRTInZ1pL1gPOB/v+C4QvNolKX1JYPqvIiBtfIDy4uAYYXEpefBcztP2VGUpp0eEA
	 NpZgyHC7JqBOr5m4MoIHaBX5srixbuyQRWiYyTtaUjIhbOxygYjfM0+IjFEJkNKfiY
	 bEMR7aWOn7kgw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2] wifi: ath12k: fix desc address calculation in wbm tx
 completion
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
References: <20240311180708.9334-1-quic_tmariyap@quicinc.com>
To: quic_tmariyap@quicinc.com
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171092922417.3054175.16453288096112928412.kvalo@kernel.org>
Date: Wed, 20 Mar 2024 10:07:05 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_030709_268883_DCA922FE 
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

quic_tmariyap@quicinc.com wrote:

> In tx completion, status desc is obtained from offsetting the address
> from wbm ring. Having HTT_TX_WBM_COMP_STATUS_OFFSET(8) and reserved 8
> bytes in status desc offsets the address twice and read the values
> from the incorrect address. Hence, remove the
> HTT_TX_WBM_COMP_STATUS_OFFSET from wbm completion address calculation.
> 
> Also this patch is applicable for WCN7850.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Thiraviyam Mariyappan <quic_tmariyap@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

a49732b1f1f8 wifi: ath12k: fix desc address calculation in wbm tx completion

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240311180708.9334-1-quic_tmariyap@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


