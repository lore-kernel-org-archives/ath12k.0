Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19B93C27C53
	for <ath12k@archiver.kernel.org>; Wed, 19 Jun 2024 14:19:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SY3m3QKjnm06XZRrKHmm29HjiIclT6GGcFwH7+bcqB0=; b=AxXIDrTK3DfUFNWdOe1gXocSkQ
	M6yptS0BNA3vSTFh27kj14ei1xDqsAQHU5qR77+a1WSTjkC9BFrIW7iuz+VjawNptYJepzdiFL13Y
	KIpUK+gN3QPIRyzkZ+vJj+7BvNJHlASb235Zebp71+TFI2+yfhzoh81QTMlNgautkhYfF2eWvT27g
	So5l5k4v73+p0/UNI3l7kp4zZEJ9WmXvEqVMdoubcakfpoqJi6JuMICzHaQ4O4cJ63a99NXJqDPFU
	sT13veCryUTPCpn9BxFdPBzAYLvAh3o5poEfD4hOZetiS1MU9sYOlH2hZKjVWvg2SattF0GYh61bX
	7fPU8sGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJwA0-00000001UBj-3TTc
	for ath12k@archiver.kernel.org;
	Wed, 19 Jun 2024 14:19:40 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJw9y-00000001UAV-0ddp
	for ath12k@lists.infradead.org;
	Wed, 19 Jun 2024 14:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 009C961C06;
	Wed, 19 Jun 2024 14:19:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB792C2BBFC;
	Wed, 19 Jun 2024 14:19:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718806776;
	bh=HWVfMfjWZ/vMTwY3ZpK0EH21tQByP3aCi/L4ISOnflI=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fB9VMtBI7ESgpkK1Rfq/FeTG3mgX7i+NfziIYLayB3UzjsBzBDYh7hZa2TiDayzAf
	 GBDyNIQVhd5GE2erG/a6VHjaxZg5CEVjgE84/kVvZg4LN2CScXRaRUv9OBjR+hH1df
	 qkXbAFkqZAHw0rr/ZLQe8tgfrOtzSAm9/4SVkajhKPlc/Xc8f+tDzQg8/Rh0SX8yVE
	 D4Cj1xQ9E7/czxsYrxwPg52LGncapFUd3tF2b/bcg2PyYtSLpQzKZSOGjmxENRToA5
	 07S0pSx6gahSQipWXSGrwwoNCMBvLPaM06rU42H6H61KQgJF4ZyRAX8kVqeaUDBzxY
	 HvbaM/JcOC91A==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: fix mbssid max interface advertisement
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240613153813.3509837-1-quic_periyasa@quicinc.com>
References: <20240613153813.3509837-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171880677412.605247.6164895888072038617.kvalo@kernel.org>
Date: Wed, 19 Jun 2024 14:19:35 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240619_071938_326314_7ECED222 
X-CRM114-Status: UNSURE (   6.35  )
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

> The Current method for advertising the maximum MBSSID interface count
> assumes single radio per wiphy (multi wiphy model). However, this
> assumption is incorrect for multi radio per wiphy (single wiphy model).
> Therefore, populate the parameter for each radio present in the MAC
> abstraction layer (ah). This approach ensure scalability for both single
> wiphy and multi wiphy models.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: 519a545cfee7 ("wifi: ath12k: advertise driver capabilities for MBSSID and EMA")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

253ec89c9013 wifi: ath12k: fix mbssid max interface advertisement

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240613153813.3509837-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


