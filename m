Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5AFCBC47258
	for <ath12k@archiver.kernel.org>; Wed, 17 Jan 2024 08:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L7QdZytG8HX8yZnE4xXZ1QjJeD90kxvZiLDIyaYpVfI=; b=FfkCyAwolPhGe92Y59Q43ZU1eM
	e03beHHLdx3GhwZ2K6K6YQ04FhXeCL9N8CYGOuKaRszpd99YorsgqsRxPG6F28Bw17lhgL2VNFeQf
	e2jn2a1lhQK5DKCySdd7i4U966lUGgUvkLIGbnOO6C1SPPTB/PQuMsWJhjW8SKYhG9RCKgMU0YKNS
	3mNkHlPTFDpnNfISs5zgdeeSlUE0A39CVtJAqG7LmX2oGhM2i8w4QMz7ldvcnz0YW6EkiOji1grb4
	1NIKiohLChPeLSrlWis07ovCgcQm3ESi9xdEdahYTmpjyocD44AX/S1hwa43DG/tFmzewiOWKwjOp
	FreqaU9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1ky-00EzRm-1p
	for ath12k@archiver.kernel.org;
	Wed, 17 Jan 2024 08:58:44 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQ1kt-00EzN8-2Q
	for ath12k@lists.infradead.org;
	Wed, 17 Jan 2024 08:58:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 19E3661531;
	Wed, 17 Jan 2024 08:58:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0AFCC43609;
	Wed, 17 Jan 2024 08:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705481918;
	bh=GQYAeT3FGcdKFmr/md39DR9fddQy/57aTXTBeURZwKs=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=VNKPv2AP+BvueTWQVDEueA+mIn7bhx2tJERrxnhhu8inxCPJ6IEHt6m/kEWMaeIWU
	 it/PhiAnbI3TWz3SpvbODA+GvLuNa8/sckGgc4muzQR04gCfrBxlsOfBlfWFjfHNpK
	 6vmZNDefS9TtsXQy/oQAM6hcX+bZLcGMH4jmtjPAacH7+7mIYMrrWLtpqvwx776Abc
	 j9Xs159JKWC46r3XVqeFFNnOlGhVmKx0wtgLKhQQA9SgAly5Dqw6Dxo07LY8UgFDbm
	 7LxsO3bjwdwytBva7B9gE85yTkNZbWLGlr67y3qWfeoO11EKwvNPdCaB28Oe0uNJh2
	 W2PMFdsSD8vEQ==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: add support for collecting firmware log
References: <20240115023726.2866-1-quic_bqiang@quicinc.com>
Date: Wed, 17 Jan 2024 10:58:36 +0200
In-Reply-To: <20240115023726.2866-1-quic_bqiang@quicinc.com> (Baochen Qiang's
	message of "Mon, 15 Jan 2024 10:37:26 +0800")
Message-ID: <87ttnc5oar.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_005839_857738_2DF4A75C 
X-CRM114-Status: GOOD (  14.22  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

> Currently there is no way to collect firmware log because firmware
> does not send it to host. Also host does not handle WMI_DIAG_EVENTID
> which is used by firmware to upload firmware log.
>
> So add support for it by firstly enabling firmware log upload via a
> QMI message, and secondly processing WMI DIAG event to expose it to
> userspace via trace event.
>
> This change applies to both WCN7850 and QCN9274.
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Baochen Qiang <quic_bqiang@quicinc.com>

I did some cosmetic changes like reverse xmas tree, debug messages etc. 

> +static int ath12k_qmi_wlanfw_wlan_ini_send(struct ath12k_base *ab, bool enable)

As enable was always true I removed it. We can add it back later if it's
needed.

> +struct qmi_wlanfw_wlan_ini_req_msg_v01 {
> +	/* Must be set to true if enablefwlog is being passed */
> +	u8 enablefwlog_valid;
> +	u8 enablefwlog;

'enablefwlog' is really awkward and it's used in several places, why not
'enable_fwlog' which is far more readable? I could change that in the
pending branch.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

