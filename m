Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32046C88E77
	for <ath12k@archiver.kernel.org>; Wed, 16 Sep 2026 05:54:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qDqC/HPIfNfvuSsx83zdPTK1F3wWfSW0i1ycVhcmCBM=; b=G+lNDcVTvWjqWojN+taYITqUtl
	QWKIKvqFXtzmDKaalztkZLdZDOBoFK5U7E4R0EAb45zl63ILpPbOxkEYEJSj/AnTx3rGwu6lKF+si
	lYa7fvA94AY/R5iVPMJI8PoESV1UHeLlNKl2o4EHU3gR4aP3epc9CLN3qZvR+ZMIK69asI5QuwIlG
	igkynwP1tDuX0NvuWOQWs49JYW/e5b+55gkZ0v3Mkrfc7ND6WWvMev97FTWPXDxaUj89ERBYndEvg
	iTU2imhli++ZjXv/LTQWBboA3mO2eBrw7wdQJ7Rcx2OjKKzgnlrcUiATEJ3uHpt3qfxWZ6ZwjyjNu
	L5FBLsPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ibV-00000008QG9-3rYp;
	Wed, 16 Sep 2026 05:54:45 +0000
Received: from lahtoruutu.iki.fi ([2a0b:5c81:1c1::37])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ibS-00000008QF9-2KCx;
	Wed, 16 Sep 2026 05:54:44 +0000
Received: from fauth-c1-smtp.messagingengine.com (fauth-c1-smtp.messagingengine.com [204.75.18.200])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: jmtilli)
	by lahtoruutu.iki.fi (Postfix) with ESMTPSA id 4hl7PW3tGjz49Q5S;
	Wed, 16 Sep 2026 08:54:23 +0300 (EEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi; s=lahtoruutu;
	t=1789538065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDqC/HPIfNfvuSsx83zdPTK1F3wWfSW0i1ycVhcmCBM=;
	b=etZUSvqFedUWuQoIKehKlMEDzQAg2aA9rKos3oZ5YJ+vf8DXQaFF9O2p1nysuUE45SYmph
	YxK3hFEQSPk620OYKQDNQQ9hSWGytv87Vc9JWLeKbgaRLQh6NO8LgfVx0lbcrfBe1wMx39
	KiMjnPnRlB4YYskpwKFZTZA2DE2tu5W7o6ET3+mZB0XVX1J1NpvB+ZJFUYD/SzKxDNpgfF
	vMtbgvQMy2M6DphDvhgxMcwSTvp3vf0tVezkAjodzUoCvISaOuNegOll/urLHckBmY8Ig3
	xMU0n9anNz2ZGNisYiUsVUQejm3aiZhDt5iNznajuvfTkfSDcR9gK6gfADmznw==
ARC-Seal: i=1; a=rsa-sha256; d=iki.fi; s=lahtoruutu; cv=none; t=1789538065;
	b=Fkrz0PjEWWkiaXYVEllk9Zumo2f2grkmL0OsjlHawaH5cKb9jHS7bb+ILoRGDF2Ejle+3s
	Be6pqawK3YgJMAQk21uYWhtEYhicKOJb5pqfVJ5LCrKwAW1t9MYA5GPpMn5MQ0AsKOL7+i
	6yqXQHSyaxvhklaLzsllIrwnumpKNH41u90xfLeqz53UMtFNPLn5UYXb0gVHIK2iRnGKA4
	qGv424ZxxTbGKVgPJtSYDQpeTws7lBptsoNfjw+q7R48ILW66psRUA3oJXqLHnKlP622rp
	Jd/F70GNN4eDl05zDdbpBnsJXHd7M+cq99y0K6QprkqIWSnePUsKa8n9BsmK2g==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=iki.fi;
	s=lahtoruutu; t=1789538065;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=qDqC/HPIfNfvuSsx83zdPTK1F3wWfSW0i1ycVhcmCBM=;
	b=ggQoE1hJjO1bIWz3b7plcizJC571s5KJ+w0aYjoYuzLCx9eDUwuWF3xPpA/GfBpUePmkQm
	21zrZ+ZcNhviOaW7u2UmZOyP696szakP4bzMlAdsxK3PyulSnolBrUTb4N87g9koAFScYv
	pANLUrx/8ttlnsCuy+F9s0fpMb0I94PBICOTeO+mArxKHjrbxkez8VMiuGJmEPjC8hJZUg
	bnUh8TMw1HfFKYrTvhNgcHK+r+aESpMmx+Nw36YBrYdVo0THPHy6aTtweTE+aNBicBfNkQ
	rWXc8DdEglRKr5WV8jkeR0AVuG6mxImKfC6fLVQsrdFqOkJZUdIq78CuYC1CGw==
ARC-Authentication-Results: i=1;
	ORIGINATING;
	auth=pass smtp.auth=jmtilli smtp.mailfrom=juha-matti.tilli@iki.fi
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id AFA631980052;
	Wed, 16 Sep 2026 01:54:22 -0400 (EDT)
Received: from ams-imap-13 ([10.64.2.33])
  by ams-compute-02.internal (MEProxy); Wed, 16 Sep 2026 01:54:22 -0400
X-ME-Sender: <xms:Ci-qaiVMZFrwdhS6C9HxvFDOVM1z7iEPVeRkndxuakxpeiJivwQj1w>
    <xme:Ci-qapZ9yLxHQ17k9xfIEjOdRk2zoiWaI8XbFeuvGxn-cbBVeTpn4vCMBqUji-znW
    CGYEhlYZEPz9L65fL_Tk6fEwJf4d6a5PfEfxn-SmuPClQOLCOUR3tM>
X-ME-Proxy-Cause: dmFkZTFURl2j0nXvDHDFYLB7Kc+qfRb/Fq1qdvpzuJNk/3e2E1JHui3UrZE2VVvNddZf0L
    AV+TGoBl78YpaIVHnJMdDQ8JVuQRdwMk0ewqpfwEVJpON9+YKqDH46FGTGp61wWV9FUYo2
    tq0G1TVu87vq6gu7WcV8CB4hgF664wxci3tFrqEpBBUMG5WXorW2TBjPn7BbZdxr5xUG7C
    VGJpJKBuATFkQ8KsQSW66ZneIGPc/PPlCM2g0XToXhlSEKvDrRVQwodzgxylrwEY/y6igV
    wbxdvsH7P2/gjvN+sa4VkEKZDNsdDMBhkXnq753Mw4f5Rc6MJgLMLRy2Q4G6r6pHj1rYgr
    eE9tSoRaQUX4PdPnsQfVu2TZWA6r8y5LQNgn7lo/oYeoyrYYDjeovh1ZwXulgY2sEQ9iR9
    2CBFaoEUlG0IsaOZ3POI6GNbqFs60exacJTRvCu/Of1zSQ27QEZ5xREUGufsA5j1RTslOG
    jtSCiNQszBaNYBL+qTI8/H+mRwmnnS5hGUoucWdw5iMfBBB4FuMuE1W2SV4sN6uT8B/Vv3
    kBWFvsNBo9ghedWk4NVGo8cysHntLdXoKXDMjZlRm9+OVPVHu3E969U0QHq5idi1R3KVkQ
    9bu4yut1tEIRC+LNrpKcNznJPjANnuAJffWPPk2l267rGz7fr/TMOzTt/npw
X-ME-Proxy: <xmx:Di-qaqeYe2x73OWTcAcE491AYG93_x69Z7OpMpdf-ocooh8qhKHosA>
    <xmx:Di-qavoaA8fBPZN0i8hK9fCidfw_4DX4GKTupUahuJNF1-4xrxWs5Q>
    <xmx:Di-qaqM--IBv2Nx_o4CEo_nVHw6-hmJ2Pu6QKGCbivBSEgU7Y1vpvQ>
    <xmx:Di-qalFM32JGM2h9BDCVcFQWRXgl7eD23GD8pUW8fMzuS8S8i20dMQ>
    <xmx:Di-qatGQmngdPE7_ClIkJL7y96JNuN8MQuDKDH2EZ96u8SXRu4gedR_O>
Feedback-ID: i02414972:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id CA2CFF80089; Wed, 16 Sep 2026 01:54:18 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
X-ThreadId: A0bevnK5BUW7
Date: Wed, 16 Sep 2026 08:53:26 +0300
From: "Juha-Matti Tilli" <juha-matti.tilli@iki.fi>
To: "Jakub Kicinski" <kuba@kernel.org>
Cc: "Manivannan Sadhasivam" <mani@kernel.org>, linux-arm-msm@vger.kernel.org,
 "Jeff Hugo" <jeff.hugo@oss.qualcomm.com>,
 "Jeff Johnson" <jjohnson@kernel.org>,
 "Bjorn Andersson" <andersson@kernel.org>,
 "Konrad Dybcio" <konradybcio@kernel.org>,
 "Eric Dumazet" <edumazet@google.com>,
 "Kuniyuki Iwashima" <kuniyu@google.com>, "Paolo Abeni" <pabeni@redhat.com>,
 "Willem de Bruijn" <willemb@google.com>,
 "David S . Miller" <davem@davemloft.net>, "Simon Horman" <horms@kernel.org>,
 "Mihai Moldovan" <ionic@ionic.de>, "Denis Kenzior" <denkenz@gmail.com>,
 "Marcel Holtmann" <marcel@holtmann.org>, "Andy Gross" <agross@kernel.org>,
 linux-kernel@vger.kernel.org, mhi@lists.linux.dev,
 linux-wireless@vger.kernel.org, ath11k@lists.infradead.org,
 ath12k@lists.infradead.org, netdev@vger.kernel.org
Message-Id: <da6003cf-515b-4d97-8059-3f4553d0251d@app.fastmail.com>
In-Reply-To: <20260915154705.67cfb94f@kernel.org>
References: <20260915054207.2513877-1-juha-matti.tilli@iki.fi>
 <20260915154705.67cfb94f@kernel.org>
Subject: Re: [PATCH v7 00/15] QRTR Multi-endpoint support
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260915_225443_035415_D213CA8A 
X-CRM114-Status: UNSURE (   6.56  )
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

On Wed, Sep 16, 2026, at 01:47, Jakub Kicinski wrote:
> On Tue, 15 Sep 2026 08:41:52 +0300 Juha-Matti Tilli wrote:
> > Subject: [PATCH v7 00/15] QRTR Multi-endpoint support
> 
> qrtr usually goes via core networking tree.
> Please make sure you base your patches on net-next/main

https://github.com/jmtilli/linux/tree/netnextmain_multi_qrtr_v8_multi_ath11k_ath12k_v5

That will be the next version. I'll wait for a while to see if other
review comments pop up for v7, then I'll post v8. At least the
current v8+v5 QRTR works just fine on my multi-card setup.

BR, Juha-Matti

