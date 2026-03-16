Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90E27F30298
	for <ath12k@archiver.kernel.org>; Mon, 16 Mar 2026 02:10:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DuFrXCZqgPWukd7LzkIC2z4Le/HCBNqrm0Se3tYBP1Y=; b=UtF9yZOlYMEytpqe6NwFn4xJ5Z
	ZqU4yN2f/YSv/rO8BuefrSl/Ck4T1bOuLnwHWLmeg7I/ZVW5FmuKm5E78tAX7SSGEOXsu80d/MfMM
	hsHJgst0eIkdSR8OYJYy41mHVpQsufi9n5mStmEaKZbuuUPCQzevgMAsmFdV4/KQ5Z1tI4Rrt1f3/
	FER6RTkeSWhw+G3wwMP9z/rZazo7+97anbTM7k+YySPWjqRGvpsLGgKdiddwfWAS0znSddm/fyINK
	AvcEfqzMNPhgBt2GGvousSMADaeqnAqlslXFROMFYMaOpTLdc+wwzTR/1LDRmphoDxmq5Q8QPno8G
	YuTBraYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPH-00000003Afd-1Lqt;
	Mon, 16 Mar 2026 02:10:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1xPC-00000003AdB-2Q1Q;
	Mon, 16 Mar 2026 02:10:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B0DDE60130;
	Mon, 16 Mar 2026 02:10:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C6089C4CEF7;
	Mon, 16 Mar 2026 02:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773627005;
	bh=sed/qnCEK8BKTSNt5bMJKA6V1uhx22zbtT7ew3JC6Vk=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=Nm9Ayc9KSDjebwklqOxZgSSSoD+i8M1cEKIevFRnrIM0Oaa6w3KO3Riyqpu9+IkkS
	 d/QKBANX9pcyP5gFgibm81V/EyFdc+j9YkODkax3tiq1oYbxMg8V+Du7XSlDs1i3YM
	 ZVmJYvbvXNiGfIFj+jzobM/jugz2hV20ABPzUhLyiVnVwmN2Z31FwbHmXoVw92sZ2C
	 xI78x4p+uhHULePySM8KOe7xnlW6Zmu5u4S+kUG6BTD40HZIwL8WHAKq2Yh5T+hbBt
	 8Ehqmea1WT6vbUni0rRKc7bwTIAHGvGoGCkQCmIY8whdDp2hFOUR0i7nTh3JFwzWzZ
	 uDSStEtaSMq9g==
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
Subject: Re: (subset) [PATCH v1 4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
Date: Sun, 15 Mar 2026 21:09:58 -0500
Message-ID: <177362699063.8490.5627616886098038132.b4-ty@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
References: <20260309230346.3584252-1-daniel.lezcano@oss.qualcomm.com> <20260309230346.3584252-5-daniel.lezcano@oss.qualcomm.com>
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


On Tue, 10 Mar 2026 00:03:33 +0100, Daniel Lezcano wrote:
> Instead of defining a local macro with a custom name for the QMI
> service identifier, use the one provided in qmi.h and remove the
> locally defined macro.
> 
> 

Applied, thanks!

[4/8] remoteproc: qcom: Use the unified QMI service ID instead of defining it locally
      commit: 95b6c029e56e4d75e2957ce7ac795da29415865b

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>

