Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E16B8103E181
	for <ath12k@archiver.kernel.org>; Wed, 18 Mar 2026 13:50:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vs0w/1vS5FqS0TDAew6QltjCpGe2mYDWnwPqdKnv0+8=; b=LZqKeobd9Wyvd8Vl3KszptTTHr
	tm7o0TdDDE2z9lG1kj/55lcfu2vOTS780PIuZ7VD32g1g6UVFWgsglEKUFEZ85UF3RqR5YmqxURMZ
	IChc7EEpBiA7CDmLWipQThGNxEO51zx9K30cgSuiMFkli5YQJwU4gFc3ZrxQoSxc5qzhQTznjQBjK
	xprTzn6O6V1wHUZ9PtNeoWOH2VBUR5wd2MyxTctlSni6+elgxJFqRxzfUmYJCizN7F9NQlMiVTWML
	K1L61myCHEMfZWKpSbl91Tty8gOdplAE2MAT347ZvaObdFhd9f6+bverB3nGfve+Pl6bFpDR8p/Sw
	rOfAZg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rIP-00000008Wfr-2f64;
	Wed, 18 Mar 2026 13:50:49 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2rIL-00000008Wee-30Zs;
	Wed, 18 Mar 2026 13:50:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 926B744181;
	Wed, 18 Mar 2026 13:50:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2A75C19424;
	Wed, 18 Mar 2026 13:50:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773841844;
	bh=KWzc1RhRpcc1zceizbJVzn7r1CLlyMQaw4Z3lAe0GWE=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=PKktueFsubrLlQg02btkIb9U7h1du9eA2v15Uolv1AX53djENBo/UlLVylBPHHEKb
	 b+ZMc+8uSSRCaZd+Ajl6F2h1IwAXoh+BHJhKzUu/zRjv9Q2wnyuWOLAVnR5zg0HiA/
	 8ZrGnd/pAAF8YhkBUMegwZfBI1oGEOHxrgmhJidSrHb+L98vLt2/GJgid5gBmpz0U1
	 LpNboWefW/vDgmTKmcDZnGWSOgZqGrPv2C2yVVw6jVpxFt1zw0qdiaxdCXiPTVcr8I
	 5l5mmBd2RlG71q46pxzhaH/WA2lmQ/WkCbpZBkxsWsU3KENmzpqZhSbXIv7UgFrMLC
	 CEbCDGKeLAnxQ==
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
Date: Wed, 18 Mar 2026 08:50:06 -0500
Message-ID: <177384182865.14526.18396654374290648632.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_065045_776726_B9682846 
X-CRM114-Status: GOOD (  11.98  )
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

[8/8] samples: qmi: Use the unified QMI service ID instead of defining it locally
      commit: 8baf6b3b7695849581a91bdaf66af2be68ef32ed

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

