Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1090C4345F
	for <ath12k@archiver.kernel.org>; Mon, 22 Apr 2024 12:06:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ygc40s/zkvTqNRi1ZwybmSdQay1JOH4ABIMjWdhf0Xg=; b=V7XtIsEaE7JTqKhIIRbv33qd+c
	SndnSKuYuqgINgZfL1lNlZva3lW7pF1EuAABjzOiaT9OjLeBnC6e6hVmHJtIH/sChF+Dz5w9ghZjE
	h3REBu8H6Ro6HopvWx38b3Kp/Qveq8GZuwehcmdZsUS1oIz+o8rHNYuRhvK89Lw8u/bZ3kLa3DYAQ
	rGEaIhjFQKkdt+i2dcxM7bPLwIXB9jCNA9PLuTLvr2oe6WOP8pKikzBp7L7XsvkD9pW0hyl0/8xYl
	D5idULEFk9kFb3j2BuK+jSkE20Fb1c2HDHX07GFN4ihpNoj+PrXzNVb+RqcvpAcYmPaSRsve9DiE/
	D/D4y1Ug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysRl-0000000DS5y-13NP
	for ath12k@archiver.kernel.org;
	Mon, 22 Apr 2024 12:06:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rysRf-0000000DS5G-3Ol6
	for ath12k@lists.infradead.org;
	Mon, 22 Apr 2024 12:06:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1993F60CF6;
	Mon, 22 Apr 2024 12:06:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9CB9CC113CC;
	Mon, 22 Apr 2024 12:06:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1713787610;
	bh=vALtas8Ie8tYQHKOrKFZueYSxtZc7LSpUj9elN4mV3w=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=B8Bp1lz/aEWjgCh30IyuZb4Kcs0ZB9B3tDnLqbjmVbQUfpZtNHhJgHiC51zIKfLn6
	 1OE20tj08IRFZdVLjL6t69HOkFqkJpW9HRUo8QT8Er1PhwDSekRsFRs+x4yUWDyg6c
	 yFf4MaeeYsfgt4G0zT0StGPqa2kehOBFu63ttUR0S1rV7gREvuV9afrTl7Gvj9w2Il
	 hw6EC4/23uE8Q25QaPetQThGm7rWhP/+QnuHJPWSjhkBkec2YB++u4dBHBIja/6dQi
	 BHZgebDQYm7okUgjcqps8ceJM1foznnVylw6DMaSIgn1tdBZdbZxaqVth0g6QKjBvr
	 5axzNtLqFTo8Q==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/4] wifi: ath12k: avoid redundant code in Rx cookie
 conversion init
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240411102226.4045323-2-quic_periyasa@quicinc.com>
References: <20240411102226.4045323-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171378760774.1358009.4155348032452693062.kvalo@kernel.org>
Date: Mon, 22 Apr 2024 12:06:49 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240422_050651_938514_00B850B1 
X-CRM114-Status: UNSURE (   6.97  )
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

> Currently, in the Rx data path cookie conversion initialization procedure,
> the primary page table index (ppt_idx) is computed within the secondary
> page table iteration. However this is invariant, and hence the ppt_idx
> should be calculated outside of the iteration to avoid repeated execution
> of the statement.
> 
> Found in code review.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00188-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

4 patches applied to ath-next branch of ath.git, thanks.

3ea19127d154 wifi: ath12k: avoid redundant code in Rx cookie conversion init
b3e9e82b31c0 wifi: ath12k: Refactor the hardware cookie conversion init
682ca418d40a wifi: ath12k: displace the Tx and Rx descriptor in cookie conversion table
d4e3fc4f45c6 wifi: ath12k: Refactor data path cmem init

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240411102226.4045323-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


