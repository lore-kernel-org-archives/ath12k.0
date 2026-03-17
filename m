Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D46A2FB5E8B
	for <ath12k@archiver.kernel.org>; Tue, 17 Mar 2026 00:22:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EVtBK/g5VQELAXjopV7aXjZgUuOCBAWlo1q9i63uFI=; b=20SChEKSFA+S15oOg1ZjKXXvH9
	ggXKTXsVRhYS3HECtK48m4z2MdX1j5GxefTSDjDU3AqEsa0xP+eVayzKnw9UL5JE8EeFuKr4zT9xP
	NNg/yQiaW8ViZv8FTtT7FRe5CnMcp6sIwVeNNygN67WpgP/b+GQiN4K8Md+ZwG+xX2Qk+ILvad4Zg
	3fUAhY25e2+NjmgW1SB6AduAiM7WfO7HIyrXlmB05KEKVpowEhsj1Gnp8LIiPxlbzks0HaaD/oQeb
	wPgsIL1bdyXkG54Thy2FTFRYOEXGtOGNVu783/VsNEebL/ZtvTM8ria1hW681biLNLDbSnQKQpLh4
	stIOFNlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ID4-0000000581g-2MXF;
	Tue, 17 Mar 2026 00:22:58 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2ID1-0000000580u-19CN;
	Tue, 17 Mar 2026 00:22:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 733A443F78;
	Tue, 17 Mar 2026 00:22:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 306E3C19421;
	Tue, 17 Mar 2026 00:22:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773706973;
	bh=CMU0rXMHkg7Kxz8EUxJAiLNslnr9+tAGsBMf/5Uzwgg=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=NEwjg4u7enwkX5/tJVpV1sCJowHXevufzg/wpiqivQYHvlPfWhwV9MAP9VJ1o5oy9
	 TZ2/BCnT8T/6UmejZz7sqvm5pguvIPTdIRgudemMoHRs/cgh/edkt76ZpwucNxSRgR
	 X1wKb6i9gFMYrwf1RYPKD4jJyNPfgJzkjVg5pzVEf8kKmywet4kVGOtNTMHtTb9jpm
	 jpwaL87DlLkvWOBnIv1w2O1iVkIcTLi6Cs+Y9VxMJZicevHuU1Ibo2U6+uEKBIubcb
	 O2Puc6suuyZXZ87nmcHaNUJ7gspDgHzlAuw3LI8uOLT7STQWxFZOrhTAbrQJQEY+oy
	 gxT9go35MvrhA==
Date: Mon, 16 Mar 2026 17:22:51 -0700
From: Jakub Kicinski <kuba@kernel.org>
To: Daniel Lezcano <daniel.lezcano@oss.qualcomm.com>
Cc: konradybcio@kernel.org, andersson@kernel.org,
 linux-kernel@vger.kernel.org, Alex Elder <elder@kernel.org>, Andrew Lunn
 <andrew+netdev@lunn.ch>, "David S. Miller" <davem@davemloft.net>, Eric
 Dumazet <edumazet@google.com>, Paolo Abeni <pabeni@redhat.com>, Jeff
 Johnson <jjohnson@kernel.org>, Mathieu Poirier
 <mathieu.poirier@linaro.org>, Srinivas Kandagatla <srini@kernel.org>,
 Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, Kees Cook
 <kees@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, Arnd
 Bergmann <arnd@arndb.de>, Mark Brown <broonie@kernel.org>, Wesley Cheng
 <quic_wcheng@quicinc.com>, netdev@vger.kernel.org,
 linux-wireless@vger.kernel.org, ath10k@lists.infradead.org,
 ath11k@lists.infradead.org, ath12k@lists.infradead.org,
 linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
 linux-sound@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Use the QMI service IDs from the QMI header
Message-ID: <20260316172251.2d57d0aa@kernel.org>
In-Reply-To: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
References: <20260316171419.2619620-1-daniel.lezcano@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_172255_363799_924A31A1 
X-CRM114-Status: UNSURE (   9.75  )
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

On Mon, 16 Mar 2026 18:14:10 +0100 Daniel Lezcano wrote:
> This series is based on the immutable branch [1] containing the QMI
> service id definitions along with some drivers using them.
> 
> How a patch can be merged ?

Wait for the dependency to appear in respective trees after the merge
window then repost the patches individually. I'm starting to get
annoyed with all this cross-tree QMI/MHI noise.

