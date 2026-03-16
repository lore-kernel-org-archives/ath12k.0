Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16645F30298
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 02:02:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9XgkDsPLcXe6dlGvc0eT9ZTnwP0jpCtNNWKafz5dnAM=; b=geh/KASQeHhb0lJPCPbhVlR2O9
	S7KQKQN0PJLb92tLd0PVD6PmEkl2PIRhlpjfx2Ih55Qra9IQwu77GZSf0PauPyCBan2GrGIrQ8kF8
	BaEUZTrfpQI2gJDRHEzPeE1WD8N2LTihuLmuiPCYXYJyipDZVNjR9PX4Ug3c6cnmYPiuBNS/1PzLX
	UrxMLHASi7WxaLGsSb2fZj6WbtW3tFA6ElngiKja1V8qP0ciXzeKtMBVFsEK0/gSIZbd21APV8gr6
	g8kGjl6QQU7qNLKZff9T5K6WDOC8LErTG/AZSlySFtmpxJE3ldztbupd1TQOpj222WzlipLVf3/U8
	rHa5rcxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xI6-000000039vZ-39BY;
	Mon, 16 Mar 2026 02:02:46 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xI4-000000039tf-08pz;
	Mon, 16 Mar 2026 02:02:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 1F70B600CB;
	Mon, 16 Mar 2026 02:02:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2B57BC19425;
	Mon, 16 Mar 2026 02:02:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773626562;
	bh=BuOo5vxj1gLbW3Ia7bVSuXN20wkAZTTCpKCe+LqWza0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=enSqJOGEpCVeo23yF51TwkmQQ1+nVNEIQWHEEohawdzs3ilK8JaMnaRaq/Qs1PMgF
	 uXcc2B9rR0z9Ks54GvcG1gLFj/p3Zp7A28TZKLScBdaD25yum8C1eUDCzRnNMAADu/
	 14T1y2Utn3b5V2rvs/yv4/WuJXE12k/wbkoozUEJKeGKiC1IsM3LnQ1e5mQAAbTLIc
	 aQf7zY78YR6j24QOQFqskpZBSbeGwEuf2J6Uw9cKQENna/aAYO6IT1mJb9QA+Xjwev
	 ywJXEyks4yfjWW9//wAtWZK0sxfSiRFYsRXdKeBkUnd2LuADBkL6R67wPOc1NloTQL
	 L3TzwMePPXcSw==
From: Bjorn Andersson <andersson@kernel.org>
To: konradybcio@kernel.org,
	Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org,
	Alex Elder <elder@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Mathieu Poirier <mathieu.poirier@linaro.org>,
	Srinivas Kandagatla <srini@kernel.org>,
	Jaroslav Kysela <perex@perex.cz>,
	Takashi Iwai <tiwai@suse.com>,
	Kees Cook <kees@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arnd Bergmann <arnd@arndb.de>,
	Mark Brown <broonie@kernel.org>,
	Wesley Cheng <quic_wcheng@quicinc.com>,
	netdev@vger.kernel.org,
	linux-wireless@vger.kernel.org,
	ath10k@lists.infradead.org,
	ath11k@lists.infradead.org,
	ath12k@lists.infradead.org,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-sound@vger.kernel.org
Subject: Re: (subset) [PATCH v1 0/8] Group QMI service IDs into the QMI header
Date: Sun, 15 Mar 2026 21:02:27 -0500
Message-ID: <177362655085.7429.167557193442435410.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
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


On Tue, 10 Mar 2026 00:03:29 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> It makes more sense to unify their names and move the definitions in
> the QMI header file providing a consistent way to represent the
> supported protocols. Consequently the different drivers will use them
> instead of their own definition of the service id.
> 
> [...]

Applied, thanks!

[6/8] soc: qcom: pdr: Use the unified QMI service ID instead of defining it locally
      commit: 24f80cbe0b8f4c6b27d03c7a7ad707d76c1c4885
[8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
      commit: 8baf6b3b7695849581a91bdaf66af2be68ef32ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

