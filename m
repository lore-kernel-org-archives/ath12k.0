Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65D7AE77180
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 07:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fe1h05+54aQqYQs5y8WReyJleohtwzQ9AV811DXV17M=; b=nJPX/sBKyY88V2J2S/qf8S83cR
	8k830Z9uYpxh2fibIzlCjJMamtdCUaKzQGeYmQknryIbma58E2WfklRSQZ1BLJrGJIqlt02AFBwsL
	XNwk8o0Pv2LO5TEB96nrGS30wXyYFRqiVNpWduW5dTFL0sReu5cN1y9gVY1Kza7C73vsb5nwXsuot
	49sk5+0O1tFuJOgQT4/449u5IXzvwn2J5wPGyIWO04x4tf5HF+cpvgkkocwXqih8TNl9hqYB+QIvU
	XiKzTUcADQ+G7PLmd5nuQwRXDtppY/3MxgJCk7+4moE55X03sLx4BLq4r8aS6gFZvWSn9HqdFE/fd
	PJaY6p/g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdxS-0000000HCVS-0l9z
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 07:50:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdxP-0000000HCUg-0vHm
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 07:50:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 490EA5C63D0;
	Thu, 12 Dec 2024 07:49:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 19335C4CED1;
	Thu, 12 Dec 2024 07:49:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989798;
	bh=oK4GaQ1I1rVikWsU34y8VDLGduzZeeugS+Q8BX5oGIc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=KMPU8K/lrCCJImylDX3qwLHipCqV0bklFnA20+U2BJHUif20tKo90guHebZjZWVoG
	 o0FoCmaddvzPbeGF2vpWv+Vp/oEnsYWlZVRKFCbahoCISedJav9SPCPwPGqFMUQBnY
	 aybpurCS+RR8tiDYGSSBG7q1TO0Jo7VWVHpqDAfJXvXTnE+ARflnoNqZTFVX9C6X1k
	 9jkDSTY+2ZgBojl4UPvk3p25pGq36Tvq+bBnmU16R1MsOz3uvdZceZuDKhasbTtsGZ
	 NGHM1ek+5dv1z9fqc1C6AJAlEkrSLc/TDtXVAwXyX10diDh/X5wi5L1L10/FZ4UJqO
	 K9nJs84/IUZLg==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dan
 Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH 3/4] wifi: ath12k: Refactor ath12k_get_num_hw() helper
 function argument
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
	<20241212004906.3087425-4-quic_periyasa@quicinc.com>
Date: Thu, 12 Dec 2024 09:49:55 +0200
In-Reply-To: <20241212004906.3087425-4-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 12 Dec 2024 06:19:05 +0530")
Message-ID: <87zfl1pcgs.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_234959_298699_FBC0D87F 
X-CRM114-Status: GOOD (  10.60  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, the ath12k_get_num_hw() helper function takes the device handle
> as an argument. Here, the number of hardware is retrieved from the group
> handle. Demanding the device handle from the caller is unnecessary since
> in some cases the group handle is already available. Therefore, change this
> helper function argument from the device handle to the group handle. This
> also fixes the below Smatch static checker warning.
>
> Smatch warning:
> ath12k_mac_destroy() error: we previously assumed 'ab' could be null
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Reported-by: Dan Carpenter <dan.carpenter@linaro.org>
> Closes: https://lore.kernel.org/ath12k/3e705de0-67d1-4437-97ff-4828d83ae2af@stanley.mountain/
> Closes: https://scan7.scan.coverity.com/#/project-view/52682/11354?selectedIssue=1602340
> Fixes: a343d97f27f5 ("wifi: ath12k: move struct ath12k_hw from per device to group")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

I don't get how this is any better but of course I might be missing
something. To me this looks like shuffling code around to shut up a
smatch warning.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

