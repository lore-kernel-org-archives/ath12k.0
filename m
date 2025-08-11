Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 966FCCA0EC4
	for <ath12k@archiver.kernel.org>; Tue, 12 Aug 2025 01:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G5aMlYwFGMh0KrcMUN16GaA474jogpJB+eSTUbFSTXg=; b=TEBB4xmJ611tWU8YdT+oC4eYnH
	htcBFZst1BPGWcoHixprN7xDwdX/+GabZBhPB6gRqBKWAvxn2mr5DUM+JQ1I22l0tm02BV/SNrl+9
	8w/k9lhFxn0oq5+TYU1nnzGu2f4ChgW45HPbGueSfqbMRQNumG9wHsxvQdC8TbMLwE7vnRkdbScwR
	QI3uS1y00hGUuOv896CfUZlUQH1LwbNFEZd7H65x0d+HVt1mAXchvW+OU9OwJukz9Lzgyv9L2Ijm8
	AFqKiE4Bjpb9J0eC/p3eZq7WY8/k3NOf3ohzGhnL4Nzmd6CpaGJ0Pnpig7Fa4Nyx1ASTAxJ+GPhbU
	7Es4bTjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uldqo-00000009WFJ-1Sb9;
	Tue, 12 Aug 2025 01:30:54 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXSd-00000008oNq-37FW
	for ath12k@bombadil.infradead.org;
	Mon, 11 Aug 2025 18:41:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=G5aMlYwFGMh0KrcMUN16GaA474jogpJB+eSTUbFSTXg=; b=WqP3lziHUp89bBYsuCqrYDw4Pi
	4dyUyAIoHPFhYzw/NTkWgpewfgAyZMrpy4R3kghpRZ5oUUbl1m9JUg3IvWW3NzrnoG5a5nMHpGjHW
	z9s1J/iCNW/y5igmYxFTPP8Z7cXr6x2XqOVV0bSOxu+KKusaA7preYkAJhtx/1PAoVMmNYhdKo/jo
	BTjY9MIhlz42FM8LKMUhwwbKVo0odXHij6mDHhjbqRx2KMYy6tmVy+fzkuYWpiRz3DT9J6dZEYL46
	ipZVjtJ8dVbJHmTHvw8A5uGAD6Df0xup3bpDXps5a+ulkM0+yU5okHQl7+NV7WGomAlIm/mYbbiUp
	EGElfn0Q==;
Received: from nyc.source.kernel.org ([147.75.193.91])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ulXSa-0000000FTaA-37OD
	for ath12k@lists.infradead.org;
	Mon, 11 Aug 2025 18:41:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id CF7ACA5765E;
	Mon, 11 Aug 2025 18:41:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7C270C4CEF5;
	Mon, 11 Aug 2025 18:41:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754937685;
	bh=EOfgba50+6CeVpleSRv0Q0EMWfqPtmAaWwa0kISde2A=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Y5myT04UfdY3QhEahpjI/jHBtn5TUMkfoDIpwAjD3Xo84YxlpgG0/faw5XzNJMD3M
	 oWvo2pWrcU/lzXWFgJmEjxjoizDmKBkYSd/ZPm7Qh6hWn8j/S80sCkH3KWlw1grrz9
	 WLgZZksjUgUcApM9NZgWjGPuPvMCHk3Y5uIB+AqNqGd3HZFkmCmh7p3qc9nyHdKAeT
	 0i88rOc39yEjibU/Soct7g6m8+pLz7RAQ/HB3qQdl96tXPAbK1o0Rq85Z7cuzYqViW
	 hV3Z5OLziqJL2ojO54GRbREcwxzeUGzjygg055bAdOld6Pp/1DcMFZnO5bhERiuAwY
	 IHBoSQOVspinw==
From: Bjorn Andersson <andersson@kernel.org>
To: Vikash Garodia <quic_vgarodia@quicinc.com>,
	Dikshita Agarwal <quic_dikshita@quicinc.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
Cc: Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
	linux-media@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath12k@lists.infradead.org,
	linux-remoteproc@vger.kernel.org,
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Subject: Re: [Patch v3 1/3] soc: qcom: mdt_loader: Remove unused parameter
Date: Mon, 11 Aug 2025 13:41:04 -0500
Message-ID: <175493766087.138281.3100955082494803844.b4-ty@kernel.org>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
References: <20250807074311.2381713-1-mukesh.ojha@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250811_194128_948739_7BBB88EF 
X-CRM114-Status: UNSURE (   5.93  )
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


On Thu, 07 Aug 2025 13:13:09 +0530, Mukesh Ojha wrote:
> commit f4e526ff7e38e ("soc: qcom: mdt_loader: Extract PAS
>  operations") move pas specific code from __qcom_mdt_load()
> to a separate function qcom_mdt_pas_init() after which the
> pas_init variable became unused in __qcom_mdt_load().
> 
> Remove pas_init argument from __qcom_mdt_load().
> 
> [...]

Applied, thanks!

[1/3] soc: qcom: mdt_loader: Remove unused parameter
      commit: 3bf7097bfdd4cf43874d7d41689957bc0d581d47
[2/3] soc: qcom: mdt_loader: Remove pas id parameter
      commit: 0daf35da397b083ea0ea5407196bb6bd210530ec
[3/3] soc: qcom: mdt_loader: Remove unused parameter
      commit: 3bf7097bfdd4cf43874d7d41689957bc0d581d47

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

