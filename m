Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50D7AC54E68
	for <ath12k@archiver.kernel.org>; Thu, 21 Mar 2024 11:39:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fhHpAolhIBE80s2jVhF0wqFNcNsn4CA4yN7iLT7v01o=; b=idYgIG0njKIuY6w++swMexLcd7
	S2bmVYN114yXPNSuNOGnmxvUdhq+Ahg/bJCBm+DTCkUWyhdkGhFBrCYcus7BW9rOB4/iq0jiUbvfX
	1i3bsVxZlWYignb9Jp6saQ6Kp6bIB5rd+7sDxSVMlbr5QJmQswvzxH6O1+cC6zAOt8qKIodWsCxGW
	WiCmJTrFfGbN3AjCpWAyCLeSwtUHBjh3cdrvOqfBqxEcPzic2PR04Vjz1Ngm+/lJkiZQW9EAukpnR
	7D83VJcW9Y24byjDERBfnT9+a1vWNxGWCvJ3fZo29hSU2Lk8/apt6FuQ+skujGcCcSIkD4hYjljDH
	1NZFXbvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGlA-00000002qLD-3NlQ
	for ath12k@archiver.kernel.org;
	Thu, 21 Mar 2024 11:39:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rnGl7-00000002qKB-2WGK
	for ath12k@lists.infradead.org;
	Thu, 21 Mar 2024 11:38:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 13F3BCE1291;
	Thu, 21 Mar 2024 11:38:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C264C433C7;
	Thu, 21 Mar 2024 11:38:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1711021134;
	bh=aRyTFXe+p0aY8rJ9JaIV4kItqy1DDFHTHabtKqnrZHE=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=Lh23NK4tBKLy09EOg/2wLQWElS0kcszOVBb50d8DieLwkyy+iH/lqkllpJtY+uXJA
	 hLXsPfQSEToaSleOXpMbD1wyvovRLX0/u5bztrxAPPwyuyemG8oCG21x7dwlvuEpTf
	 FBJNuIhuIMtTpE28fbnyYLtFrZqLfNx7cWP79Uo/+tD7GzH53rt1BWDlhfclkikoJZ
	 IWQkU4wsdSlKz3lTTsIzb4CydUmFVpJP6+5oZn4seUczxujauAKg0x8lsWmJ27Ea9l
	 AMo9ci7ZF0wssCBE29+CEQymvASGDFGxgwmlvuHbfDHOLk0GD0tgQ48bCNxzbgOFz0
	 he/iR5dc46QaQ==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v2 1/3] wifi: ath12k: Refactor Rxdma buffer replinish
 argument
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240320010615.91331-2-quic_periyasa@quicinc.com>
References: <20240320010615.91331-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171102113130.4024062.15409932330092211067.kvalo@kernel.org>
Date: Thu, 21 Mar 2024 11:38:53 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240321_043858_008959_2F41DFF4 
X-CRM114-Status: UNSURE (   9.46  )
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

> Currently, the Rxdma buffer replenish procedure implicitly retrieves the
> number of free entries when the caller passes req_entries as zero. This is
> helpful to replenishing the Rxdma ring when the caller is unaware of the
> number of entries to replenish. After the Rxdma ring is initialized, we
> can pass req_entries as zero to replenish all the free entry in the Rxdma
> ring. This change helps to align the argument req_entries to the used list
> entries for better code readability.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

9d7bce18e725 wifi: ath12k: Refactor Rxdma buffer replinish argument
597b4dd63afa wifi: ath12k: Optimize the lock contention of used list in Rx data path
f42bfbe7a507 wifi: ath12k: Refactor error handler of Rxdma replenish

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240320010615.91331-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


