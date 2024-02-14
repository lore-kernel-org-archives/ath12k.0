Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80AE6C48BEB
	for <ath12k@archiver.kernel.org>; Wed, 14 Feb 2024 10:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Subject:Cc:To:
	From:Date:References:In-Reply-To:Message-Id:MIME-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hsAwWJXbZPPI/cnP33KCPKaERFMiR+GhoK31+f3s78A=; b=3hW28FEkmznzD0wT3PtajYtJpd
	z8Lw3heUtpefPN+DSYAivMlfVZQc3lQmqtWZmB2vrGy4ILfcDTsSqop7iEAZY2OmF3E4Ov0fkJ/sy
	cPooH1iwGwWqiKau7VJs96KRJSB448pvZbeL4WDvMgfiaMkV/7QuHAAwnmQl9ux2FjMDoPi1GdW0f
	oFAp1kvRdNT5Ka/FJQPjgP6eef7FttSb2V86uZrghVzxyQ6Fb/BBGOVN7xLg3rWTBXfCyCQlZTP/t
	6C3CL0VgmxvzlY3YlsTYZyHqYHXjf1nRV2E4hiJrEWtNZ3KnUPZYmp9tl7E2X5yZccd8t33DzNU8u
	DNuWHhjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCen-0000000CY6j-0Dlo
	for ath12k@archiver.kernel.org;
	Wed, 14 Feb 2024 10:38:25 +0000
Received: from wfout5-smtp.messagingengine.com ([64.147.123.148])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1raCek-0000000CY6D-2vMs
	for ath12k@lists.infradead.org;
	Wed, 14 Feb 2024 10:38:24 +0000
Received: from compute5.internal (compute5.nyi.internal [10.202.2.45])
	by mailfout.west.internal (Postfix) with ESMTP id 31B471C00070;
	Wed, 14 Feb 2024 05:38:15 -0500 (EST)
Received: from imap51 ([10.202.2.101])
  by compute5.internal (MEProxy); Wed, 14 Feb 2024 05:38:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=arndb.de; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm3; t=1707907094; x=1707993494; bh=hsAwWJXbZP
	PI/cnP33KCPKaERFMiR+GhoK31+f3s78A=; b=bLjuLiUeHArSfkef+Wd6hi4JSZ
	uzR/mr6mPiImtzU92m7boaR/S3qb8gazw5An9VYAP8GSPqTUisgIzs40In7MwtDR
	ioQPgLuAx8ExbNosqTg1/qCSxPh3k+ZZ2HOiPLsPQPqLdBIRkq3V7B5JR82Q5F+Z
	VO8KHyZyXT8B07WvHD0ID6lErwdSko+r8Gb85RuZbKf1/+n6yJdoGs7oBVO6pyY/
	PB+OD/NHMqBfEUOKuj3bbsRnJS9peCWzy90Sf770RA0VCFRS+2BWEux1puit2dyX
	rxyD2k8UNtLSc730s3y2D67FrBqehIwshr7THNZ2sp3sY/hRj7n+UKnELqYA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=
	fm3; t=1707907094; x=1707993494; bh=hsAwWJXbZPPI/cnP33KCPKaERFMi
	R+GhoK31+f3s78A=; b=ndd8+BfctchXQ/AjAbk8pLKgxqHR4DZNOjdlkQTKhqxy
	xUq8wdRBBYh8L08eAw2NCp2gXdsHG/jpDtgOCCLu2luOzZue3eM4dJ2S2hVrtkdE
	B2hy1MNG7qNtwazBReU02j9HR9CIgy9Y173IWOvDzwUCt4Zb/xAY8Q09oSV1yuTE
	SHRD3lw4Gm2tkrz1rOYgbRK7UD9ViYsc9+naIlphsqa1n3ENpY2/oMw5KSuAAgu7
	lV8efUY+PDxRYZJjt2EzQzqsTy0EugOdMHnGiRmV+xkMyPkqIP1qCURb0nraFFNI
	JJimtZtmAz0yEx0FjaRumCvAQepFyInmuyNSshIAQw==
X-ME-Sender: <xms:FpjMZX9nsMfUEhw23aFDNY6xqqF4U-TDgIpzPzniQIDQ6xZlTYXJbw>
    <xme:FpjMZTtHIla148Ndnxzf0szn95jFQLSpj8-aLhJ4aYbb081wPnq82v3pkV91pekJs
    ohMwMlHCf79Av0-DDo>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgedvledrudejgddujecutefuodetggdotefrodftvf
    curfhrohhfihhlvgemucfhrghsthforghilhdpqfgfvfdpuffrtefokffrpgfnqfghnecu
    uegrihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenuc
    fjughrpefofgggkfgjfhffhffvvefutgesthdtredtreertdenucfhrhhomhepfdetrhhn
    ugcuuegvrhhgmhgrnhhnfdcuoegrrhhnugesrghrnhgusgdruggvqeenucggtffrrghtth
    gvrhhnpeevhfffledtgeehfeffhfdtgedvheejtdfgkeeuvefgudffteettdekkeeufeeh
    udenucffohhmrghinhepkhgvrhhnvghlrdhorhhgnecuvehluhhsthgvrhfuihiivgeptd
    enucfrrghrrghmpehmrghilhhfrhhomheprghrnhgusegrrhhnuggsrdguvg
X-ME-Proxy: <xmx:FpjMZVCuW0SbRLGhEKESMu7pqkLSLc01Tit5nY405FrCJUaOimdZbA>
    <xmx:FpjMZTeESNBnx_kTCNm1IGs5894e2nN4U4IF5CnjaJ39M-7HrONstw>
    <xmx:FpjMZcN5oaaGAdL53lB5sswES1k3g1WR4RekmyACIdVQPDdNxbDIiA>
    <xmx:FpjMZdECtm7lFqNpDxD1lmPpnTZF0zwCpIfrsFRhUieXUYCHDQVINOAJQvc>
Feedback-ID: i56a14606:Fastmail
Received: by mailuser.nyi.internal (Postfix, from userid 501)
	id 64771B6008D; Wed, 14 Feb 2024 05:38:14 -0500 (EST)
X-Mailer: MessagingEngine.com Webmail Interface
User-Agent: Cyrus-JMAP/3.11.0-alpha0-144-ge5821d614e-fm-20240125.002-ge5821d61
MIME-Version: 1.0
Message-Id: <08ac32ef-610d-479d-a3fd-a3c3b8c4c697@app.fastmail.com>
In-Reply-To: <170790025305.3179441.138152315558305278.kvalo@kernel.org>
References: <20240213100912.459018-1-arnd@kernel.org>
 <170790025305.3179441.138152315558305278.kvalo@kernel.org>
Date: Wed, 14 Feb 2024 11:37:52 +0100
From: "Arnd Bergmann" <arnd@arndb.de>
To: "Kalle Valo" <kvalo@kernel.org>, "Arnd Bergmann" <arnd@kernel.org>
Cc: "Jeff Johnson" <quic_jjohnson@quicinc.com>,
 "Karthikeyan Periyasamy" <quic_periyasa@quicinc.com>,
 "Aloka Dixit" <quic_alokad@quicinc.com>, "Wen Gong" <quic_wgong@quicinc.com>,
 "Muna Sinada" <quic_msinada@quicinc.com>,
 "Aditya Kumar Singh" <quic_adisi@quicinc.com>, ath12k@lists.infradead.org,
 linux-wireless@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: sanitize ath12k_mac_allocate() return code
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240214_023822_791057_06351972 
X-CRM114-Status: UNSURE (   8.36  )
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

On Wed, Feb 14, 2024, at 09:44, Kalle Valo wrote:
> Arnd Bergmann <arnd@kernel.org> wrote:
>
>> The return code has no initializer:
>> 
>> drivers/net/wireless/ath/ath12k/mac.c:8006:9: error: variable 'ret' is uninitialized when used here [-Werror,-Wuninitialized]
>> 
>> Make it return -ENOMEM for allocation failures and remove the unused
>> variable instead.
>> 
>> Fixes: 6db6e70a17f6 ("wifi: ath12k: Introduce the container for mac80211 hw")
>> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
>
> Nathan already fixed this:
>
> https://git.kernel.org/kvalo/ath/c/04edb5dc68f4
>
> Patch set to Rejected.

Ok, sounds good. Nathan's patch looks fine to me, but
I see it's not in linux-next yet as of today.

     Arnd

