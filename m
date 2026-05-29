Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DFF8CD6E4A
	for <ath12k@archiver.kernel.org>; Fri, 29 May 2026 13:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Date:Message-Id:Subject:References:In-Reply-To:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=66jwmabnss1wzjbJ/pG7HLmk7a00oOo/dxDfODb4vpU=; b=X+CGiOAeQ+n0wRzO/Bdc7TqqnZ
	vMXBHprHTfwwjqOA/ywp97NXPt/iKYZ0LRhc4Gct9ujtJC+XhPghS1Q4uqvcDH0GS5zFFj5Sfqizn
	12AvvkX9A9uc/igW2ZCsYckulkOp6L8y+ARMd3tUK38+rnH8O+FcaBvAeRqIxwDxUnla3HvhqqRpX
	GsjwF/++zzNb93gZZmoQJzGvOwBfb0P7cvb6PJMWGsgpKtrJsh5EkDqWDz/XqI3fx0kcQOX5KEjp0
	8scGiTU+VUlfIWnGunGgH3U1Ytv3wQDVItgQ/BNhrMUoWIwH27mjQoN9ubk64fR7baRU/UTu/kcv0
	JVeqTd7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwrT-00000007PxR-0GvZ;
	Fri, 29 May 2026 13:02:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSwrQ-00000007Pwb-1lg9;
	Fri, 29 May 2026 13:02:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C45344006B;
	Fri, 29 May 2026 13:02:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 757FE1F00893;
	Fri, 29 May 2026 13:02:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780059767;
	bh=66jwmabnss1wzjbJ/pG7HLmk7a00oOo/dxDfODb4vpU=;
	h=From:To:Cc:In-Reply-To:References:Subject:Date;
	b=E3HhoUKR/eThbMY+4+yrcHlS/pZyyLblbZn4d5+FNHlnJnEnizR352OFGeJTuCB/1
	 fPEhuVfPJmr4NEfbWTKB0lHtHEPAjdcvACXXpCx8RwZZRfBH9Xpv2JHt6LoD9t2vyQ
	 Io2fAnOB/CXyhFowtOqWtinEWkqw5c0UX/yWQw18xPOEGp/Gd0FCB9W66tKyyJWy/1
	 sK0LuTYiEzwtdlVVDZH5dlH/pOkreTi1ZRDeUqQsJRzzEO8ivUCJK5DZjcWDYOJaym
	 KFKrbDa46wfJC+p6Ioenp6HPCLM48/ac5dlXEfTJJyrJN1gstWyZUyrvcTU02aRhNh
	 he+jdftUvhVKg==
From: Srinivas Kandagatla <srini@kernel.org>
To: konradybcio@kernel.org, andersson@kernel.org, 
 Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, 
 Andrew Lunn <andrew+netdev@lunn.ch>, 
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>, 
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, 
 Jeff Johnson <jjohnson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
 Kees Cook <kees@kernel.org>, 
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
 Arnd Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, 
 Wesley Cheng <quic_wcheng@quicinc.com>, netdev@vger.kernel.org, 
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org, 
 ath11k@lists.infradead.org, ath12k@lists.infradead.org, 
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 linux-sound@vger.kernel.org
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
Subject: Re: (subset) [PATCH v2 0/4] Use the QMI service IDs from the QMI
 header
Message-Id: <178005976216.10291.3509337895172854457.b4-ty@kernel.org>
Date: Fri, 29 May 2026 14:02:42 +0100
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260529_060248_481083_29BE8F61 
X-CRM114-Status: GOOD (  10.73  )
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


On Mon, 16 Mar 2026 18:14:10 +0100, Daniel Lezcano wrote:
> The different subsystems implementing the QMI service protocol are
> using their own definition of the service id. It is not a problem but
> it results on having those duplicated with different names but the
> same value and without consistency in their name.
> 
> The QMI service IDs are defined in the qmi.h header file. Use those
> instead of defining the IDs in the protocol implementation file. It
> will result in unifying and providing a consistent way to represent
> the supported protocols.
> 
> [...]

Applied, thanks!

[3/4] slimbus: qcom-ngd-ctrl: Use the unified QMI service ID instead of defining it locally
      commit: 05f3f5984121e1956867b309c76a750c1d4c9682

Best regards,
-- 
Srinivas Kandagatla <srini@kernel.org>


