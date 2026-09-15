Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95DB4C88E75
	for <ath12k@archiver.kernel.org>; Tue, 15 Sep 2026 07:11:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/k+y3LoBfQZyu4Fn8UExwUdQIbMcggqcKxO9y+XqHO0=; b=iGy1g0OgtRnb9H6JANQjck1cgB
	GKp2sU+pgZhuMLmMo2hZXzFTUmt1oZPi47NaxUO8NV8IsoeoJNO07HYtoRQkgZAP/OhuZKTU9f3S0
	IUxH0FQ+Sim7JVd4XOLbAIRmySCEdmlbzt1n3w8CqxMHdrT1YVCt7X4awaKbgMN3KSDanITq3yuWg
	AT5YzWLGGDhKXE/D93xz30z2G1UC656WR6cSlTwrLDsHKR1wsngQoJLDyDD2bhFKvkEEwnwbyzbf2
	WoYT4euUamPnCVisoRetO3SelMPwG26KKD0eUFRI4KxFdxE1CwAvrtitJ6qfAR4pExU19WXNnNKD2
	sTHp+B3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NKU-00000005QXp-1Cb0;
	Tue, 15 Sep 2026 07:11:46 +0000
Received: from relay3-d.mail.gandi.net ([217.70.183.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6NKQ-00000005QX2-1JKd;
	Tue, 15 Sep 2026 07:11:44 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id 3C2A71F47F;
	Tue, 15 Sep 2026 07:11:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=marmottus.net;
	s=gm1; t=1789456296; h=from:from:reply-to:reply-to:subject:subject:date:date:
	 message-id:message-id:to:to:cc:cc:mime-version:mime-version:
	 content-type:content-type:in-reply-to:in-reply-to:  references:references;
	bh=/k+y3LoBfQZyu4Fn8UExwUdQIbMcggqcKxO9y+XqHO0=;
	b=Ice7pvFcBVgU+jIYOKrOoCHCoGn8cZe1IovgDa3pZN6T0Tg2l4ujy8yUg3wJp3bDNH97Ms
	orM8nKgxTmqnnmHTYTECrvTp78lX2KbS4pjy4zmUdniUkCf/D9VWuW6WFhoGoQYlGr47pT
	VCTcH94RwppT5Puvepm8gtOD8T4YfCQ5Fkn5BQuniv+NLGtancWXAOILM08rYJDK4icBqy
	/Z1ZeGt+OmRiDD1WS3Xx6lzOfbJtEplccp48s88bTu5V6t3hcx72jl+jTdb43HQXBBlJ2G
	q7rE2ENfs0pUXI8q9tevsgqtpTDRCJtxL8v0lo50RClXcgKvdAtAwnqvUBiRjA==
Date: Tue, 15 Sep 2026 09:11:31 +0200
From: Arthur Crepin Leblond <arthur@marmottus.net>
To: Juha-Matti Tilli <juha-matti.tilli@iki.fi>
Cc: Manivannan Sadhasivam <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
	Jeff Hugo <jeff.hugo@oss.qualcomm.com>,
	Jeff Johnson <jjohnson@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Eric Dumazet <edumazet@google.com>,
	Kuniyuki Iwashima <kuniyu@google.com>,
	Paolo Abeni <pabeni@redhat.com>,
	Willem de Bruijn <willemb@google.com>,
	"David S. Miller" <davem@davemloft.net>,
	Jakub Kicinski <kuba@kernel.org>, Simon Horman <horms@kernel.org>,
	Mihai Moldovan <ionic@ionic.de>, Denis Kenzior <denkenz@gmail.com>,
	Marcel Holtmann <marcel@holtmann.org>,
	Andy Gross <agross@kernel.org>, linux-kernel@vger.kernel.org,
	mhi@lists.linux.dev, linux-wireless@vger.kernel.org,
	ath11k@lists.infradead.org, ath12k@lists.infradead.org,
	netdev@vger.kernel.org
Subject: Re: [PATCH v7 12/15] net: qrtr: mhi: Report endpoint id in sysfs
Message-ID: <20260915071131.GA30612@marmottus.net>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915054207.2513877-13-juha-matti.tilli@iki.fi>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii; format=flowed
Content-Disposition: inline
In-Reply-To: <20260915054207.2513877-13-juha-matti.tilli@iki.fi>
X-GND-Sasl: arthur@marmottus.net
X-GND-Score: -100
X-GND-Cause: dmFkZTGFzgp8DpaceHJXsLAY9igazZeLQ/Fb6nk/Zr+ipgXP7EdxuXSxa9lVDbKYEYekx2BahP04hh/UrfivTn9rNoAad/Ihbj1N8SKUiFDGm4QJMUcWFIP1SD5NWpovXOlLm3nzzJ+obYoPfs1i9jCQCcL/YPO7L6JxSZ4RjmvNJIDylGwDBDMWyfMqT6ULwSpNIY5g4ZxkdNQC4ndb70firUg16CnCPEFui1j9O1Rxt4fvlhU9XsUsW9gIIEqgGlikLVBc/V6kTPao3l+ipIJ+Abn+I5aGYA33UnXdhq2uBu9KiYninSq5SUbgvE97pS0cJaovjY7CKRYzbvX1MZDbi9NHfC3qQxjGZHlKJRaFi20WDHCYpFFYSzwQEtAkZEkF2NLmpv3OOpj3vEa4hJLgCC1g249wkPnivMuZXKCBaoLzUGUsZ9jRwAtdyaE+Gi9Wo5j2Iog+76+ejo4Q7A+TKckc5iTxz9VEuKMrVPV6Sf8xBjuq/Dwz4dVAU8gpx8RhKxxmyYVYI4yC4XYJnmFNqhjm4P2FTG50un8qTWskfdnAeX/VFhYiDPp6chbdqGiqQ7qsvggyEg0aIviPpu3J7pTId1vNiRB9fv8jrWg7fjqMLhub0jBHpSDha0ZtUIlUjQbGJ0oVKHxrnfD3sCR8Ae6jxh3B6AVgUXj5DJXESVePvg
X-GND-State: clean
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_001142_533281_720CCCA0 
X-CRM114-Status: UNSURE (   5.83  )
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
Reply-To: arthur@marmottus.net
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
Errors-To: ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org

On Tue, Sep 15, 2026 at 08:42:04AM +0300, Juha-Matti Tilli wrote:
>+static ssize_t endpoint_show(struct device *dev,
>+			     struct device_attribute *attr, char *buf)
>+{
>+	struct qrtr_mhi_dev *qdev = dev_get_drvdata(dev);
>+
>+	return sprintf(buf, "%u\n", qdev->ep.id);
>+}
>+
>+static DEVICE_ATTR_RO(endpoint);

I think you could use sysfs_emit instead of sprintf.

https://docs.kernel.org/filesystems/sysfs.html#reading-writing-attribute-data

Arthur

