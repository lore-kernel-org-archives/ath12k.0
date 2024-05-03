Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7DE1C4345F
	for <ath12k@archiver.kernel.org>; Fri,  3 May 2024 13:19:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2WtJXxFEezZiabHQdDeijXJuLWOPVFfAehzDfWak2AA=; b=jkI5qNqZenM48XBAk0UEbw7LMm
	pSg4KG8luvKKEp8bp27L2/a3A25Ag5X6e4n9dyvqIugAG1+/sNnxEKxpAsFYNvNFN49pJov6606B6
	GBXCZGuqQFW4LdDSaF1qPanJGFXATb5F6DlJu9VpEa/wQuNbpJmkIdKrFsSXlDyi708OaJNLSlrol
	X4qeaUL2OZ211EYcFypPkfFhldWpRA3doqcPu164vB0FCT+X+1RT7FNjn89y7MDqs1QyhQC/6f97i
	SFHIsCEO/WQhv14BYEhE7nqfyVfMusGvvn5tTPovLrJURUiiIowqPfXOytZQmOuKmr58rejuDQvhE
	n2XFjtLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2spF-0000000GdMR-2USy
	for ath12k@archiver.kernel.org;
	Fri, 03 May 2024 13:19:45 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s2spC-0000000GdLP-2ttb
	for ath12k@lists.infradead.org;
	Fri, 03 May 2024 13:19:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9A99061D9A;
	Fri,  3 May 2024 13:19:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E692C4AF19;
	Fri,  3 May 2024 13:19:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1714742381;
	bh=YhI2nPikgIM3EPthNilfCEFgXjvZSSdYMEiCxwsQKvk=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=qnfHihyBy4lxD7Q1eNffh8MLFTHuNk60SQTrspEnwwtabiEQOBQDEobE6cGnQGbL6
	 m99Otqji446zH0emByRVGcoUsDVvFV5mv+y0W62enfKLaxkwc9jzlWVVVriTDUDgy/
	 b0Mo1SN6bj8BmYzwyxMD3g1V9vPN95E1XQr/cT02ojWhAX8fik8HSOlBg9T5OujNHv
	 25NTF0eGEqiT1+nTd+JV71UI8tY7IBkvT9HcuCUGnLi/rKhzk/mqPpQcYITd+5+dWA
	 KlUOdEiwPs9pjHNczqpAqKgta/VoBbiKXSOtTaYQvyWQvl6vg2auwdST9Vmz0rsdu0
	 C4VV9DA799Jnw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/4] wifi: ath12k: Replace "chip" with "device" in hal
 Rx
 return buffer manager
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240430165811.1377182-2-quic_periyasa@quicinc.com>
References: <20240430165811.1377182-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171474237820.1512332.17734100406949237606.kvalo@kernel.org>
Date: Fri,  3 May 2024 13:19:40 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240503_061942_819318_E53BEEC0 
X-CRM114-Status: UNSURE (   5.29  )
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

> Prefer the term "device" over "chip". Therefore, modify the relevant terms
> in hal Rx return buffer manager to use "device" instead.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

5f6c3a418b40 wifi: ath12k: Replace "chip" with "device" in hal Rx return buffer manager
acc6afb31c3f wifi: ath12k: Refactor idle ring descriptor setup
b2d54ca73a5a wifi: ath12k: Introduce device index
53bf4a14f8c5 wifi: ath12k: add multi device support for WBM idle ring buffer setup

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240430165811.1377182-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


