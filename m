Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62E82CA5FE6
	for <ath12k@archiver.kernel.org>; Sun,  4 Oct 2026 16:51:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=; b=DdwKuEVwyYBiIh7F9EqIbaVZO0
	qLGjuS8r85Woz4zFUJrXkjC0JMveGj/WBbK2uFhWJupFfOrG5a/7Bu4foQ7mlJoBJ6pxZI0Ab0XIw
	7mp9+63JAPGyW0GiOGjfLmF5vvLKeaFgLfd39IrFMSA67ODaa94IxYQOZFW/H8jU95IQRKzexmHyv
	53zr9nBS4a4xw6OmkMOFH1/RiNv6duyIh5ejRxokh6QrW6Ekbs84vw1d6fjukU3bVDzFFZ1eQmRdL
	Ep82roY4fnD+dsKQlRI0VCb0BczTf7NuO09oWupcvauXJWNytrhUE3z6F4WlHONkjDWiBbxcRC1gf
	PapU79hw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQw-0000000F31P-0EZI;
	Sun, 04 Oct 2026 16:51:30 +0000
Received: from mail-wm1-x330.google.com ([2a00:1450:4864:20::330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xDPQs-0000000F2zl-2WBm
	for ath12k@lists.infradead.org;
	Sun, 04 Oct 2026 16:51:29 +0000
Received: by mail-wm1-x330.google.com with SMTP id 5b1f17b1804b1-4a140e7405dso11869665e9.3
        for <ath12k@lists.infradead.org>; Sun, 04 Oct 2026 09:51:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1791132684; x=1791737484; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=;
        b=QcLnA38azQXO1rNkx2/JoKh1zQJIouGpzF7eDzempXsJDG5FF7iv62S55JHDpT4D37
         Mj6ICn5i4WyJxU7n2am23mu5sEdGLxLGuEni3cgNPBoK20i1k8f91V9SUDYwSs4Ryzzs
         YV9yMmQDDPS+JrjOHwl50Q0PMZd3q9Nh1QVSYgI2JPz11D0uKLxFyIdhdk8Wk4/0Ooub
         i7I0g0mK9ZWGHe05gEgIGe60mCrJkxSeKiWqppqL5AVJYjot9kAt1oc1i2FLRg6s6HD8
         sPJD05tT1GxRH27fVRgfqqTbApdjr4U84WOkapEmlZHYLhd6f25O2r+cqLxGHnJENvLk
         I9ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791132684; x=1791737484;
        h=content-transfer-encoding:content-type:mime-version:references
         :in-reply-to:message-id:date:subject:cc:to:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=B1NQoDPcpD7pDGtYHOkFZsvr7R+guI6V8OnUcMpSaOk=;
        b=lfoCK0rn6t4gbZgkjJ2zQzEbgBs3wcP9/JbcaDCfTCqB3ixijXie6Yb6OWRwFchu6p
         qcb+TD4Hz5ZspmFT2U9jnWSrxqtMtQSNMySyv7jExLTr1+jwJI6GTd990lH4Pt6sj+t5
         gaxygfOfo13dg+usGUDbIZmZL4N240MnsPsYbhnARa9q32KtMjaJWRMKQF2qkPVQdxps
         TST+RfBkqSkNG1cRpW0mObLlBGcDiwb0t6tdc1jf3vfSTsJqiR4ON9qTFvhul3nKIZjW
         YEjBlJjEk154kc0q3p8ToyV+lI3PcvWNoWd6dxQq41aWA4UYez2uEW9/KEqyGwdZJxAI
         EUqg==
X-Forwarded-Encrypted: i=1; AKwUvBwBNlJsrEkUxdaEgbnzEyI4wjg73sy3khhJVG1kDixbp3+nN3KcAgkMNxIoDIUV/gfS3NeNx/M=@lists.infradead.org
X-Gm-Message-State: AFuF++lX0gnshoQu0KKj1ZZoFbM+MJ3HrciR80YYlYc46S/S5FYJLTtO
	ZOReguke2udd8PfDO8IX8jYajrEtZOxFAFlhKDc5RuKgAoIEtywcJenA
X-Gm-Gg: AYBFou1y8byWgP6ZS/4OrJTJjGSwfCJdiEGskFMaGFuHIQTfOTqZ4AAkO+Y3jsY7az5
	bp6hDI1RVzu8fXrg1iilgkedh20r2BjxjDqrZYSncY+4WeyvrXL55jL56/MZXPKgY2SKtpXHqzj
	TdARbvDJnDdkDD1lCf6g/++UR1jtACTBzflfJcGt78cGJCSS5iQiTN8NktNt9O2/0//rFUpOuvr
	oq4dE6Faq9ep6cKsBp5IwZLEJer0n/ZdcRq9YXxryY1OGP+Dxng+5eI48J3vmZLGRQoP6uW4Ndf
	V4RdrOoRfBStFDZBWtW0g4+Hu3dSfmEzjlSV72E4d4kODQhCI4IhTTQBMV5aOUqA9jxqH0qXdND
	sE36/p9FSd0Khvbq9DJjFqMjXR84DGM1u2ij9Qo18jwScGmaNVn9NZGhQVaC3qVebZ1X/HRWss6
	rury84Qp3fT+gBKxRNl8/cnJ2VJajrLni5IqSegAJsV98CNWqJsjjmVrC5bimzdZK3KANkZ58rW
	jf1M6QgAiOsbxCMhQtRbw==
X-Received: by 2002:a05:600c:4594:b0:4a0:22d5:908c with SMTP id 5b1f17b1804b1-4a1680eee54mr65008155e9.12.1791132684137;
        Sun, 04 Oct 2026 09:51:24 -0700 (PDT)
Received: from FranzSP11.fritz.box ([31.31.60.25])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4a027f2a4cfsm233973165e9.1.2026.10.04.09.51.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 04 Oct 2026 09:51:23 -0700 (PDT)
From: =?UTF-8?q?Fran=C3=A7ois=20Roux?= <franzelfranzel@gmail.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Jeff Johnson <jjohnson@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Bjorn Andersson <andersson@kernel.org>,
	Konrad Dybcio <konradybcio@kernel.org>,
	Johannes Berg <johannes@sipsolutions.net>,
	Abel Vesa <abelvesa@kernel.org>,
	Manivannan Sadhasivam <mani@kernel.org>,
	=?UTF-8?q?J=C3=A9r=C3=B4me=20de=20Bretagne?= <jerome.debretagne@gmail.com>,
	Dale Whinham <daleyo@gmail.com>,
	ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org,
	devicetree@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH RFC 1/3] dt-bindings: net: wireless: qcom,ath12k: add disable-rfkill
Date: Sun,  4 Oct 2026 18:50:49 +0200
Message-ID: <20261004165049.4174-1-franzelfranzel@gmail.com>
X-Mailer: git-send-email 2.56.0
In-Reply-To: <608f9f6c-a405-4903-a1bb-86ca8a0999f3@kernel.org>
References: <20261003091509.4822-1-franzelfranzel@gmail.com> <20261003091509.4822-2-franzelfranzel@gmail.com> <608f9f6c-a405-4903-a1bb-86ca8a0999f3@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261004_095126_646899_8A5DC9A1 
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

On 03/10/2026 11:27, Krzysztof Kozlowski wrote:
> Please do not duplicate work but build on top or reference previous
> discussions.

Sorry, I missed those threads. Having read them now: a DT property for
this was already rejected there, so please disregard this RFC series.

I will instead send a single ath12k patch following Manivannan's
suggestion from that discussion (board compatible plus device ID,
handled in the driver), with Jérôme and Dale in Cc.

On the tags in 2/3: understood. From now on I sign off with my full
name, and I use the Assisted-by format from
Documentation/process/coding-assistants.rst.

Thanks,
François Roux

