Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6640BC47077
	for <ath12k@archiver.kernel.org>; Thu, 11 Jan 2024 11:13:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0TVjw6cvQ2NvOflfBcZbvE+i7xBhhjd1AASqV8UdrqU=; b=bgM632HiAh7Maq+FtV/ekJ2A1h
	WnfskjMcPgf4SyMgUZVssJVUGkzyeelv9WE/1v28J6RewWEf7JfHIPoqUnPFOn2aU4bmmOTfSCU+W
	N5k+2OmQdY6QyY8mTCdx5hdTjiwLss4rEVDBPoOHYycjV+jCg5l10d80sMlWEWjHAcFgM+ovzyLO0
	WXRo4kxp5qMg8TJUgXI0sr/KO3ZsIYaJQWyVL+AljxBl/wvP5ybm8x78DuzXS3YxrX0NbPvlYr/Mx
	w4Q4rgxztbLYD/CpGIXIQo+k9dS731cH/53GAWzv511S0ym8ghXxEF3MZjam44pC3XO4zss6u662i
	qTId1ukw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rNszk-00HCPU-3B
	for ath12k@archiver.kernel.org;
	Thu, 11 Jan 2024 11:13:09 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rNszg-00HCNJ-33
	for ath12k@lists.infradead.org;
	Thu, 11 Jan 2024 11:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 998B8CE1FAC;
	Thu, 11 Jan 2024 11:13:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF248C433F1;
	Thu, 11 Jan 2024 11:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1704971580;
	bh=sVv7j68dcdbBAftknGw/qL2roISAV1FGQQP7EEfzQHI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=GQSfgGDwku3tLvXFbKAQRUyRlpv1bIgp8C2oXJbtTMlqvVqvsnQrGjEG2A5aVQaxe
	 Mt/8/Vx3EabQa1YZGyUpSRFQ4YB3lTsLfJGeprQTe76kgXFQRGeKgB/U2qyMXd/g1v
	 WD7RkSTESsnY525HC//GVeqiiuq6RCPdE7e5SapJqs+TIV5s+aD+yUH08RvKgISNjd
	 AYfx9zztaiUSeQdymzS8Cz3sVCGq9QnKmB/BMGWODctrFKc5oYW+LXGAJt1/i/wfMu
	 +a4vb7rV8HFVjNP2rCnCvUxaIl337gbtEqn/lrVeloMmaDAkGAtNXWqnEkCsyPc45b
	 thDVjPvPBb0Pw==
From: Kalle Valo <kvalo@kernel.org>
To: Lingbo Kong <quic_lingbok@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] wifi: ath12k: report tx bitrate for iw dev xxx
 station dump
References: <20231225080723.9518-1-quic_lingbok@quicinc.com>
Date: Thu, 11 Jan 2024 13:12:57 +0200
In-Reply-To: <20231225080723.9518-1-quic_lingbok@quicinc.com> (Lingbo Kong's
	message of "Mon, 25 Dec 2023 03:07:23 -0500")
Message-ID: <877ckgazt2.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240111_031305_164687_4A7CDF51 
X-CRM114-Status: GOOD (  11.39  )
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

Lingbo Kong <quic_lingbok@quicinc.com> writes:

> The tx bitrate of "iw dev xxx station dump" always show an invalid value
> "tx bitrate: 6.0MBit/s".
>
> To address this issue, parse the tx complete report from firmware and
> indicate the tx rate to mac80211.
>
> After that, "iw dev xxx station dump" show the correct tx bitrate such as:
> tx bitrate: 104.0 MBit/s MCS 13
> tx bitrate: 144.4 MBit/s MCS 15 short GI
> tx bitrate: 626.9 MBit/s 80MHz HE-MCS 6 HE-NSS 2 HE-GI 0 HE-DCM 0
> tx bitrate: 1921.5 MBit/s 160MHz HE-MCS 9 HE-NSS 2 HE-GI 0 HE-DCM 0
>
> Tested-on: WCN7850 hw2.0 PCI
> WLAN.HMT.1.0-03427-QCAHMTSWPL_V1.0_V2.0_SILICONZ-1.15378.4
>
> Signed-off-by: Lingbo Kong <quic_lingbok@quicinc.com>

[...]

> +static void ath12k_dp_tx_update(struct ath12k *ar, struct hal_tx_status *ts)
> +{
> +	if (!ar->ab->hw_params->single_pdev_only)
> +		return;

I'm not really a fan of using single_pdev_only to check for other
features. Basically what this check implies is if we are using a mobile
chipset or not, right?

I can't test QCN9274 right now but why do we need this check? I would
hope that the firmware interface is designed so that this check is not
needed.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

