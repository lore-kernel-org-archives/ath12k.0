Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F4BBC27C79
	for <ath12k@archiver.kernel.org>; Mon, 17 Jun 2024 11:10:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KfO8+O/ZuKTYhgt1MyFjfmvGob15yZl8x0H+2/K2Rqo=; b=XTIsOi2lhrf29lwjCFNzBwPci1
	sKL//ridEZQ1UneZXFg9jjSoxcG9ZlFz8deT+JalKLtHknbv7h8efm17GXQRJSSdBZRW9xTupRLpT
	ftMY1F2dT+ye4bTp2r0lKjxoOud3/NoZ2bZIt2PHy9HJuZZfCTaoapnB59H6Xthlv27B54DlyFJnu
	vn/jUpQUxSJ9JlZTlWVQ3E9Hi18jzouhUdXVLsKARyNex9DNLfcAKTsgp0EjwJGt8eRNWtZdTe+/w
	b1p8P4ipCdPWBy9Q6hdQI3mMPAORFL7fr6vFdi6AeyED+KVYLjj8DYGctjpn323wMGKpFr8oLrk47
	oVzwKKBQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAFP-0000000AQ80-1PjV
	for ath12k@archiver.kernel.org;
	Mon, 17 Jun 2024 11:10:03 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJAFL-0000000AQ77-2Yhm;
	Mon, 17 Jun 2024 11:10:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 1514ACE10E7;
	Mon, 17 Jun 2024 11:09:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DA1F7C2BD10;
	Mon, 17 Jun 2024 11:09:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718622596;
	bh=0jlLTUdOHjWXlIemi6q/5eFkjO9PpJlfhxc4JTOGzho=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=OhrnY53ukmxxgRmX831WZcuAYGNQ+cK/LObFXIuh21G7CzW+wCqIoIOzr6GWbb/Kf
	 M8BZM6VOHlvdKmNvTuMJXvYIwnygd79LW0njFXFLbhsew6Jp6XElLgPf5PQ/i8fEzm
	 OYZEICH3w0ujOTDAUwceudneu53wvBZgYSWXmgothV7Iu7ETMZCyOqgtHrnUyrmRwZ
	 ECRC32gUo+cWnuZ3lCdA5+eDjZ7FXEADSm8meen/mU4hHhe0plPcaQMvQ/kSKu5WqZ
	 k1QSPCQE6JhqXQbsSG0MWsRIB9zs3BEUIzAJMuZAnbHHlu2mzbavvHOtfy5EkkfD4F
	 XMN7aG3FBiNMg==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH v9 1/2] dt-bindings: net: wireless: qcom,ath11k: describe
 the
 ath11k on QCA6390
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20240605122106.23818-2-brgl@bgdev.pl>
References: <20240605122106.23818-2-brgl@bgdev.pl>
To: Bartosz Golaszewski <brgl@bgdev.pl>
Cc: "David S . Miller" <davem@davemloft.net>,
 Eric Dumazet <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>,
 Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>, linux-wireless@vger.kernel.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 ath11k@lists.infradead.org, linux-kernel@vger.kernel.org,
 ath12k@lists.infradead.org,
 Bartosz Golaszewski <bartosz.golaszewski@linaro.org>,
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <171862259099.4124983.18069958656274980613.kvalo@kernel.org>
Date: Mon, 17 Jun 2024 11:09:52 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240617_041000_135804_736CB9EB 
X-CRM114-Status: UNSURE (   6.17  )
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

Bartosz Golaszewski <brgl@bgdev.pl> wrote:

> Add a PCI compatible for the ATH11K module on QCA6390 and describe the
> power inputs from the PMU that it consumes.
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Signed-off-by: Bartosz Golaszewski <bartosz.golaszewski@linaro.org>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

2 patches applied to ath-next branch of ath.git, thanks.

71839a929d9e dt-bindings: net: wireless: qcom,ath11k: describe the ath11k on QCA6390
aa17d384971b dt-bindings: net: wireless: describe the ath12k PCI module

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20240605122106.23818-2-brgl@bgdev.pl/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


