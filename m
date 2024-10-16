Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534ACD206A0
	for <ath12k@archiver.kernel.org>; Wed, 16 Oct 2024 07:01:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTfhJkpppr5J9r326n/2fNQ+X9QHl21x1MyGewIgX9M=; b=ER5Yq5U4+cS0M+R717bV2NveIc
	GcRA/soTMu9fMCMdSoeIjlZkbypZZtZ7dXcICvIyiA0F3UtHvu1H4QYt9hx5VaTenYkscimcMjx0N
	1pm+hz7HSfQuDGGMNTaQBN6qy84N9gcmr+GDZdmalw64gdqSh9vwsYrJ8pOgr9aVe4h2YJEooY3jd
	QPIzboQgS7PRw3nkjFHWhnykzCakSxTAEM0bUgBPx1ua5cq8T9kFav79IZo0okm+cU0Ppc22mK/FB
	zJK9nLLyFexNUnt71RTyZIb3JWRuK8+Wu3nQr7e4LwgS9p2OHMrzVAD0zMI7kSKiNAgv/mBU5WcVL
	+ZR9+yQQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t0y23-0000000Als7-3Izc
	for ath12k@archiver.kernel.org;
	Wed, 16 Oct 2024 07:01:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t0xzJ-0000000Akww-2wY5
	for ath12k@lists.infradead.org;
	Wed, 16 Oct 2024 06:58:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id DE01CA42567;
	Wed, 16 Oct 2024 06:58:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5C93C4CEC5;
	Wed, 16 Oct 2024 06:58:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729061908;
	bh=WfFXzP8/c3J6x7qT5BMt6TQD7XOC91zd+5me5pZif4U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AUjsCVTXoxv908D/ByuH8Dh7gzXSKGadgwOvAqCmNK35myX33J45uDHXIPm7mDJQ1
	 hKEdofn2ShES8lnHcGoGVGq4mxfQSckwZ85dKYkkz8C5ca3o1hSraRZk69bLELzopE
	 RI2QpZKhTlk2NzZ7JrHeCr86AI701yCnAEP6hrpR92O0VWqL94ivu9D5b5/SBa74wo
	 XdvG9vh2ig618pjARQs3qewdQtxdAwIV+KGS1eF9AvXMHHRKK0Fb8GnUvLXyHj6JI0
	 X1syHiQZIXJdjJwkj0hY3vBy/UudnN2/+Wr9n+IxFyQSg2kYpBtKP1xLABEv0fYpYg
	 BvZkOPS+mdlDA==
Date: Wed, 16 Oct 2024 08:58:25 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org, 
	Kalle Valo <kvalo@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jeff Johnson <jjohnson@kernel.org>, Bjorn Andersson <andersson@kernel.org>, 
	Konrad Dybcio <konradybcio@kernel.org>, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-msm@vger.kernel.org
Subject: Re: [PATCH v2 02/22] arm64: dts: qcom: add wifi node for IPQ5332
 based RDP441
Message-ID: <ftvwsizfupm7veg662adnzc6jpulk5shga3xmvbtom3saclnf6@bmatmqw5lp72>
References: <20241015182637.955753-1-quic_rajkbhag@quicinc.com>
 <20241015182637.955753-3-quic_rajkbhag@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241015182637.955753-3-quic_rajkbhag@quicinc.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241015_235829_823676_88515F26 
X-CRM114-Status: UNSURE (   7.39  )
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

On Tue, Oct 15, 2024 at 11:56:17PM +0530, Raj Kumar Bhagat wrote:
> RDP441 is based on IPQ5332. It has inbuilt AHB bus based IPQ5332 WiFi
> device.
> 
> Describe and add WiFi node for RDP441. Also, reserve the memory
> required by IPQ5332 firmware.
> 
> Signed-off-by: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>

Don't send one DTS patch in 22 patchset targetting different subsystem.
Imagine, how wireless maintainers are supposed to apply their bits? 21
commands instead of one command?

Best regards,
Krzysztof


