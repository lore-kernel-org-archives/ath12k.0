Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB782C0218A
	for <ath12k@archiver.kernel.org>; Thu, 30 Jan 2025 08:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P12sZyJ5EmpA3RK06jC5BUNQfWqwh+MQcVATZEPsYvU=; b=l/2UyvLDXKpxOoPzpeG/Yjaaqx
	64RxPdMTzaAi0WAgcGFwpcjgVdiphUVVsVVCA5pAnB4qFd5L1gJLejXOKTlA9B2cF0k2oSjjV26Or
	dI6d0dLM72ZEqi+U7as+ML24r14G60i+ha2X2S7URQhERJI//VS6te9qiuv/hJ5pP4EyWWmp4iD8+
	LNNqhdnzeu/utRnu5NioR++zHMZqpMTvcMlC11wuE+OIWBJ+q/IucwYFgN8YI9yj/bvWy9Q+lwkJy
	fwv0liXJYN/UgIRY3cGvKFYYfmTgF0tRqT+ya1KEVT87I9nk4X+HaO6QNzIca3gNNk4JpYgxWTErD
	29Wqe3Wg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ3v-00000008QYE-2zua
	for ath12k@archiver.kernel.org;
	Thu, 30 Jan 2025 08:38:11 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tdQ3t-00000008QXw-3aHP
	for ath12k@lists.infradead.org;
	Thu, 30 Jan 2025 08:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 310DA5C5E8E;
	Thu, 30 Jan 2025 08:37:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1B54BC4CED3;
	Thu, 30 Jan 2025 08:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738226288;
	bh=a8pARe+EC3ECTuBLU5pJVHvAEBheRpHsCl5XeHxWQLc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=POacsNCtX6lRKzk9JBfKHFucT9mBexH91JfLW87+bUMnmJp0k7y96kgbTGQ8e2S0i
	 /7SQjK4y4i2NREvCVI9rYtSRWFDAXP5Z+9vzsQlxaXs0ZkNGklbOItDQMNeP7RMliF
	 bzKXSeC9Rhuo5aeB0EZdYgfm1f1ovBViGuV7Vydx/orrmU+u5o01ziRaShkMkMQywr
	 Y6acdaqKTbpnugvrGVD2GNWZZeH5ACYWAfExVAFOWL7y9hJVFhLn+xI1DJjSoPh+UJ
	 YD+aBmHHYGySy82uqR6Torvweo8lUi3I6m3QEvoEsDBEogUhPDzlwlVy1Xcw36vIkm
	 lyXS5ZCo3ZblA==
Date: Thu, 30 Jan 2025 09:38:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	Saravanakumar Duraisamy <quic_saradura@quicinc.com>
Subject: Re: [RFC PATCH 3/5] wifi: ath12k: add ath12k_hw_regs for IPQ5424
Message-ID: <20250130-groovy-competent-mastiff-19cc9e@krzk-bin>
References: <20250130051838.1924079-1-quic_rajkbhag@quicinc.com>
 <20250130051838.1924079-4-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250130051838.1924079-4-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_003809_937575_DC5088AB 
X-CRM114-Status: UNSURE (   9.02  )
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

On Thu, Jan 30, 2025 at 10:48:36AM +0530, Raj Kumar Bhagat wrote:
> From: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> 
> Add register addresses (ath12k_hw_regs) for new ath12k AHB based
> WiFi device IPQ5424.
> 
> Tested-on: IPQ5424 hw1.0 AHB WLAN.WBE.1.5-01053-QCAHKSWPL_SILICONZ-1
> Tested-on: IPQ5332 hw1.0 AHB WLAN.WBE.1.3.1-00130-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Saravanakumar Duraisamy <quic_saradura@quicinc.com>
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/hal.h |  3 +
>  drivers/net/wireless/ath/ath12k/hw.c  | 87 ++++++++++++++++++++++++++-
>  2 files changed, 89 insertions(+), 1 deletion(-)
> 

That's not a separate patch. Regs do not make any sense on their own,
so this commit makes no sense on its own.

Best regards,
Krzysztof


