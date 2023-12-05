Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BBF75C4167B
	for <ath12k@archiver.kernel.org>; Tue,  5 Dec 2023 15:11:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a7m+r6FjDSUN3nO9IRr9psn29FT7ghBvJ/0lS6zAtmQ=; b=R1KV3mT5I+uR9KWL8K32kMhi7G
	+fpGEJ0O4EuUAbNKm8koAVVbSNj6ER+i1JwKbBI6lgemEuUVlcarS9Ygv/Zk8B3YJ4bMSuSWbzBsJ
	J2a2QofopV9P4LNEQyIHFqV/MgmJCsZfnRrIBohIQ7yZ2xtbLn0PwzEyO6NCa+SV9ZTMTfEMelyMO
	UeYjIm90AWqjKyhhJT+K5rWGdS9I+GMDZY4dl7hKZB7v4uEGoSj70rh3jZtXixE1EDI5EyYhzGvnD
	lrSVNDDoyGt+xeCLSz0Z4qQC7Mq7IylhWVfPcybBtoLbhvyBwv6xyN2TqRVbYjLgXhM/rGLGKmryN
	z6r4kR1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rAX4f-007gi6-0g
	for ath12k@archiver.kernel.org;
	Tue, 05 Dec 2023 15:11:01 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rAX4d-007ghK-0M
	for ath12k@lists.infradead.org;
	Tue, 05 Dec 2023 15:11:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id F13B3CE1869;
	Tue,  5 Dec 2023 15:10:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 43BB1C433C8;
	Tue,  5 Dec 2023 15:10:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1701789056;
	bh=UD1uFP5QSngCrjzcxllTOb3luCX1xPpvYA27sT27aEg=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=JBgvafm4xgGBbIS3PqP7Vw/PO+b3oLeNq+l2yYXnSXkbvrp969GW8TPXFlqadqahC
	 ZC4zXN/KMRLyMlIcBD0M70822AgzcEV3VG42qVMXSzAS5mmPtOPBHu/qUtUObmMqmU
	 0bqc2vUbKx9eyLLbLhsHoB9jUVkXwrm+Ec6XeFyFpwVgY5v2poMv4Y/PrW35TR5AAX
	 jekwj5Ct7IG93OzXj4tKSMzpaiLzRK1a6lnXj0kgz+tStkTWZ+attq/pcf42uGuDBy
	 ws4Hg/sXm6njg+PMYDTbD2R5k1jMVwHiCCKizPetRW0jkBu9k3bcb4UaJnwycMnoFh
	 zyJL8PvWdPcDw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: avoid repeated wiphy access from hw
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231201013735.2292313-1-quic_periyasa@quicinc.com>
References: <20231201013735.2292313-1-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170178905353.2418939.13490196335421003398.kvalo@kernel.org>
Date: Tue,  5 Dec 2023 15:10:55 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231205_071059_327932_F3041E43 
X-CRM114-Status: UNSURE (   4.22  )
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

> Currently repeated access of wiphy data from mac80211 hw structure is
> happen inside the mac80211 registration helper functions. So optimize
> these helper functions by storing wiphy data locally and accessing it
> directly.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

c8a5f34ad811 wifi: ath12k: avoid repeated wiphy access from hw

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231201013735.2292313-1-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


