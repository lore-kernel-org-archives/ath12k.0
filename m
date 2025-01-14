Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D39DC02185
	for <ath12k@archiver.kernel.org>; Tue, 14 Jan 2025 19:47:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A+xXiIrzpJzonsy03fzNhC2VpOd1snu8reza579+MrY=; b=xpoxp5pjheOLANgP7X15MNXddy
	3Cj0kQSzsZmOKf5VUt49l/+C9K7JjoOy2GzApMLpMpaaCQWk/LYY68H7tgsCbcsQLeXedcUa3zmVz
	48C75/22AgEQZTAiaMVAiJX2aqNYh4+eKO8w/hpiwdsq9EgVFTiI3WEOePjuZraIZKTYQnSrvopc/
	OgcB6kaiEuiZqbY/Swn5YfY4DsSkKssgBgA0hAPLU6JnjyA2WZjQRZIhrINa0w9Dv7dylUKm7v/Rc
	rS8NWzmVicETrh35rds3dOX9hqcGRSIARK0VzjVM/2v/0Po1EMQs8NBj058ZL7xgCkmbovcjr6byi
	Tw5mttog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXmsq-00000009Zgg-0HcI
	for ath12k@archiver.kernel.org;
	Tue, 14 Jan 2025 19:47:28 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXlhR-00000009Qok-2hlQ
	for ath12k@lists.infradead.org;
	Tue, 14 Jan 2025 18:31:38 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 41FB05C57AF;
	Tue, 14 Jan 2025 18:30:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5BD5C4CEDD;
	Tue, 14 Jan 2025 18:31:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736879496;
	bh=M61rmG5pLoh4YRzdgGK9gOuB+F0dOBxNCUQ7D6Mkduc=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=MRKZx+pygsPKgaUABQiqkHkUNdPLpjrfLT397gMzFDpVwptEzGDYQFSEjMcOSw/d9
	 PqR+7G3v6olRpL3w5Ri/DcBtmE5kijdAbNrPlUu0irskcj465I3etNGCrYgiWOA2yD
	 VsLmir/Y8vX4mUuRTJhmrS+PKqB62CioW2+t/4SjIVTJ+ihduKgHdh70nIU2tlZGcV
	 O5A308YjIDS4OdYWNyH2MJRRHHhbjjPChOKoIENo3RNBxlH6r+PylXasmiG+wC/GDk
	 bLfGOFCfIJuHDYCsQWPtoR0yeFoJZ9DzldseK4r/ClXok4ZUnk0NLv6dchKpgBcFzQ
	 8hOU78sWihMAw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Dan
 Carpenter <dan.carpenter@linaro.org>
Subject: Re: [PATCH v4 3/4] wifi: ath12k: Remove ath12k_get_num_hw() helper
 function
References: <20250112071630.4059410-1-quic_periyasa@quicinc.com>
	<20250112071630.4059410-4-quic_periyasa@quicinc.com>
Date: Tue, 14 Jan 2025 20:31:33 +0200
In-Reply-To: <20250112071630.4059410-4-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Sun, 12 Jan 2025 12:46:29 +0530")
Message-ID: <87cygpp7qy.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_103137_727115_3E5A857C 
X-CRM114-Status: UNSURE (   9.98  )
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

> Currently, the ath12k_get_num_hw() helper function takes the device handle
> as an argument. Here, the number of hardware is retrieved from the group
> handle. Demanding the device handle from the caller is unnecessary since
> in some cases the group handle is already available. Additionally, there
> is no longer a need for multiple indirections to get the number of
> hardware. Therefore, remove this helper function and directly use
> ag->num_hw. This change also fixes the below Smatch static checker
> warning.
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

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

