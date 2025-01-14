Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E9065E77188
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xIWgzlgI+RlFA0AkXdO2TdEQmjL/zEZsDPUh2Rk8kJk=; b=aulzbS7NAGuc0J1W8UlKC0oPy4
	G2ZN8zLYUUzcH/WeiIiA4UW6wOGKax0WTOU6S8rm6rIoRPrKJ+Lapqr/i34/cynSJ33fj0wPyQpfV
	gNOHFwZcFETXQU7dhhTkdFKQd+5XJFmLXW+mMXK0n8WoIwhE7cbpjEgKhcrfiQoxeA8l0nYy93Fvn
	B0HlsJ07m34xp+6PLrKqPnw/1r+RtSu5GnSa9KglAkb3kuLt29SLgbnSS+ZqMybObrgtS21Vp7dnT
	c1eGCzgriu9N9f+D4E0xGZW609yDy0c2M4Gm2kPSawOxWVoRYSD59mMhqobk4o33yn9NuBOVnoaQY
	Mbdc4RjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmsp-00000009ZgP-33Qq
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:47:27 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlgU-00000009Qj1-2U34
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:30:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 25E0A5C5996;
	Tue, 14 Jan 2025 18:29:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 80C1EC4CEE0;
	Tue, 14 Jan 2025 18:30:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879437;
	bh=EgYhpCyyzF4Lv9/yW8DEJmFz9JnIuytaSfp4aQrOjPo=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=auyHeoC+hoDCkhVuBjdXXDkIHZetk+D4qYPuiZdEkfAeGU7QhgeIr+F4CtCG7QvQ4
	 Bj7Zom9IW/C27foyig2Ot7H9dHEV48ewnht4aC89IZe/8ATOykIpMiVLZWiwYVteLt
	 Gog9ALNmso76jDGFyeWyEZ0mRg3Jd7LsOJnj4Ml5qyuiYXaCKpDVAfHAcooJKFjDnq
	 aMvON+8LzuTzM/rH0KpADMDPJsBy0p/01ariN/JFAjQRiVZ8qbVVaglBQUBfKJBG0Y
	 ufOiPjeVtXfHmjetqJWKHpOy39CBPclZ00C0lA7o7whvzjOWV0W5CzNfAkqpTDA6l8
	 DCDonL7QK684A==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Jeff
 Johnson <jeff.johnson@oss.qualcomm.com>
Subject: Re: [PATCH v4 2/4] wifi: ath12k: Refactor the ath12k_hw get helper
 function argument
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
	<20250112071630.4059410-3-quic_periyasa@quicinc.com>
Date: Tue, 14 Jan 2025 20:30:34 +0200
In-Reply-To: <20250112071630.4059410-3-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Sun, 12 Jan 2025 12:46:28 +0530")
Message-ID: <87h661p7sl.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_103038_669450_5B02EA30 
X-CRM114-Status: UNSURE (   7.63  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw get helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle
> to the group handle.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <jeff.johnson@oss.qualcomm.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

