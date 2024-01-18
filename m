Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 952B4C47077
	for <ath12k@archiver.kernel.org>; Thu, 18 Jan 2024 05:51:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bI7S13dLvScpYt097p/seBLpK4gBnSOGtbWLjxE67LQ=; b=FWumrJS1aF9d1tneAb//T1BP30
	s8wvedwRmevJ8eyt8esk7tpdlBBYUetz2YLWL26vZP5hF02wijnplAb/Z6x03Tor4gi+bN7jkhUW0
	9hmiL3O2OPztMV3UAjphcyW0mBbV3i6MVy3z22gAn8fVMcdo+KK8sZ3X8MhowCm3fvQr91/vpmHcR
	2xfDy9PXJ+4cQSxSDj7xQkxJly1pqWH1ZD2MTmiJKJ7a7Alg8n7aPEoFCNDkDnerQntG2cTQkKVGS
	Abe9vnAcaqh+EK+kflC0tDYi2E8MObJ16R1fsk4gGYpGD6/vvi3PlCGNjGhJ6OpklYIdUEMay5OoY
	naJlvBuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLJ9-001kCU-30
	for ath12k@archiver.kernel.org;
	Thu, 18 Jan 2024 05:51:20 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rQLJ3-001k8w-2z;
	Thu, 18 Jan 2024 05:51:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 50705610A2;
	Thu, 18 Jan 2024 05:50:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 666E5C43390;
	Thu, 18 Jan 2024 05:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1705557043;
	bh=mjwx3WCbvWDQ4H30ScARB1J9Rfuf6sNrNVOFpJlAQhQ=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=nhhEF4x4zmL5ReCojrNUX5hWGpWwUU0HqnTuPFZyZj7MviVQXy7xCcG1J/8AbqRP+
	 xonO7OKntqGOTBzHMLnbuh3KviUqWKe+yraapI4ZTKUZkJ3O/JZcMOsaa2H4wuQ5n0
	 /hLkzD5LaL3x3TCfQNvdx1dGsRPGsaDB6Bd80z/DXGdhgknvOhCPTyzQsTRvntqhdQ
	 fJSMzEU7TYJGGuT2buGBFf9iI2jAghRiViXnixPB6wjCfAM9VyyDnrNLtDBtM6981s
	 bMG82ifMQmJxYu4QitR4yaF/qC4ZSkesxcdv7JN7XH9s8Z5soTFivTHN1tE9Tt+9KG
	 P1xIXqltBeKZA==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v3 1/3] wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240117080431.2907471-2-quic_periyasa@quicinc.com>
References: <20240117080431.2907471-2-quic_periyasa@quicinc.com>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>, <ath11k@lists.infradead.org>,
 <ath10k@lists.infradead.org>, <linux-wireless@vger.kernel.org>,
 Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>, Jeff Johnson <quic_jjohnson@quicinc.com>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170555703932.2637903.971806943065664355.kvalo@kernel.org>
Date: Thu, 18 Jan 2024 05:50:41 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240117_215114_018577_458DB7F6 
X-CRM114-Status: UNSURE (   5.65  )
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

> ENOTSUPP is not a standard error code, don't use it. Replace with
> EOPNOTSUPP instead.
> 
> No functional changes, compile tested only.
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

3 patches applied to ath-next branch of ath.git, thanks.

49b88e5f3fa1 wifi: ath12k: replace ENOTSUPP with EOPNOTSUPP
3422402bacd0 wifi: ath11k: replace ENOTSUPP with EOPNOTSUPP
bc2ef64931c2 wifi: ath10k: replace ENOTSUPP with EOPNOTSUPP

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240117080431.2907471-2-quic_periyasa@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


