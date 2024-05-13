Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4045DC25B78
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 14:13:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rWUaDCoz6txJVAgzUWjazEzcnxdlgf+y8FA1qmgDM/Q=; b=PmW49ERJvv/epsIdSzp2WJGkt1
	ZyAwsgHpR5LFjTqCWZuOd4hyEO8erTyyNtGve9Lo10XnwLiD+MwT3JJgi7nVxEFNMI3KHz6f2j07b
	oWHxt5mp5fbndfyRLXWiM/lAM3JKDh51c3WTLJlljxrA+2Yl7hDqtGdbCM3+hOZYTnrLxyGzOay64
	I5itZUgP+abBVNZ5fH7u3pt83YZVjxAuYYFzaE+vFOdjqtODbT6CohPk8GXH29pdwOwaAK3z4Vj+0
	m7ozoQFNkmGZPgcSJJPLh0WvouPpPZPgbw24mK8xxZ54a7bGJwHRcPUKa8lu4zg0u2w8shULddpKa
	w0imFTHw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WQV-0000000D8hm-2xr5
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 14:13:15 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6WQS-0000000D8eV-0hsB;
	Mon, 13 May 2024 14:13:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id CF844CE0EBF;
	Mon, 13 May 2024 14:13:04 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59F4C32782;
	Mon, 13 May 2024 14:12:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1715609554;
	bh=cfVkEuuf1nm+2kNAircxmCV5OVM0lYdc8fwZJMocSJw=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=fD/teDXbT0HGcM7y9LjRgxQ5GQ2qDLPuOfKqqrGThMjiDPVKzLgiP3X0wbLDSQdxs
	 9oM1dd8FDmvO7fVpOHIzYtXVBkusb2DSkBiSWxBSXvVznbHXkYCgGJtFUJxCGq54tq
	 ctEX3zIqiUKQuSyLdqnOWq+c5mD88YODZ2x/EG4YDXMLCFgtvfKA100coopPNjo8Rm
	 EdMufQe5hHDNZvBUBX22S1RxJcuF3knWWLOFxVM6fuhiv18AozQG03reW+O4da8Yjm
	 6RGecGnBmPu3hmeiZLViIhfdgjZ9c3gsQkle9RGjPU5bS4nTaio5VvFwpPxyuFdiCA
	 hUO8r4FSMdJ8g==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH 1/2] wifi: ath12k: initialize 'ret' in
 ath12k_qmi_load_file_target_mem()
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com>
References: <20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
 <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>,
 <ath11k@lists.infradead.org>, Jeff Johnson
	<quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171560955084.1690511.16227061715514007364.kvalo@kernel.org>
Date: Mon, 13 May 2024 14:12:32 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_071312_396153_96E9C6D3 
X-CRM114-Status: UNSURE (   8.07  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> smatch flagged the following issue:
> 
> drivers/net/wireless/ath/ath12k/qmi.c:2619 ath12k_qmi_load_file_target_mem() error: uninitialized symbol 'ret'.
> 
> The reality is that 'ret' is initialized in every path through
> ath12k_qmi_load_file_target_mem() except one, the case where the input
> 'len' is 0, and hence the "while (remaining)" loop is never entered.
> But to make sure this case is also handled, add an initializer to the
> declaration of 'ret'.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

bb0b0a6b96e6 wifi: ath12k: initialize 'ret' in ath12k_qmi_load_file_target_mem()
199f149e97dc wifi: ath11k: initialize 'ret' in ath11k_qmi_load_file_target_mem()

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240504-qmi_load_file_target_mem-v1-1-069fc44c45eb@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


