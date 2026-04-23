Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5261FFAD3E7
	for <ath12k@archiver.kernel.org>; Thu, 23 Apr 2026 05:01:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JeZ0eQ1N+i62g85dcr6rfQmz3jxz9fSJ7G8cYPR8Hzg=; b=T7rUSQcDoukI4neenaPl1P9k2C
	WFQZ5Sit8xCAU3DWBnowQ7objwA/y/RZxcOMciID+pY1CxoEuwevF2xs79a70iBbvHICjePzJ1+0Y
	p1ZOEMzus9eoyIhESkooP/kClskG8xeD8LjmaxhcU4UyZ987gmv7DdFc08y9EPVi2XKXlEp04uwjt
	brqpA4srT/9c8Kdap09CPrM8rvToR5QTslYKdnMl6qinNVj1jHOXvoea+8L5bIs0lJOIiA76Vcacl
	DQTAB8h9icW65CNQqJlS6oJ5TIvbYEbYGfA5wG7YFNDujQ56d48XGkEPDm1fYeztFJrHTx+CtWaF8
	ZyjjV4yQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmCM-0000000B2xg-2yJR;
	Thu, 23 Apr 2026 05:01:58 +0000
Received: from fhigh-a2-smtp.messagingengine.com ([103.168.172.153])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFmCI-0000000B2xL-3tQJ
	for ath12k@lists.infradead.org;
	Thu, 23 Apr 2026 05:01:56 +0000
Received: from phl-compute-05.internal (phl-compute-05.internal [10.202.2.45])
	by mailfhigh.phl.internal (Postfix) with ESMTP id 740C31400093;
	Thu, 23 Apr 2026 01:01:50 -0400 (EDT)
Received: from phl-frontend-04 ([10.202.2.163])
  by phl-compute-05.internal (MEProxy); Thu, 23 Apr 2026 01:01:50 -0400
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kroah.com; h=cc
	:cc:content-type:content-type:date:date:from:from:in-reply-to
	:in-reply-to:message-id:mime-version:references:reply-to:subject
	:subject:to:to; s=fm2; t=1776920510; x=1777006910; bh=JeZ0eQ1N+i
	62g85dcr6rfQmz3jxz9fSJ7G8cYPR8Hzg=; b=eCpWQugjDSAFfQ7utr5Xp4Derz
	RxRtb/n4r8/BJs3EmTzzlTuMw38reptlBgiZSfRowKIeRzbYoa+1iRxq99tBCbI9
	cW2Z/1iTuE4mtu0OHKSoPuM0EkETLKnsuR6BvZSdU8pS3qD2xF1cx2QJiOwxwlVC
	YUJyPxStPNPwRdyVAGseXa3SgJTYkU2MaeL93I4t9K91Nrwpwmaw8c8kS3JCwzKg
	VNvc0T5ZVmg5T+ItDDPm05kkFBNsh1o49f/C0uZfABVd1vHPRuTocueOjrhx6aWw
	2IIhqfb3cysr6Lys619OJUpICqbYE8E+1N4R6ibnhCqvQWu5vNUSDHNdXHDA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=
	messagingengine.com; h=cc:cc:content-type:content-type:date:date
	:feedback-id:feedback-id:from:from:in-reply-to:in-reply-to
	:message-id:mime-version:references:reply-to:subject:subject:to
	:to:x-me-proxy:x-me-sender:x-me-sender:x-sasl-enc; s=fm2; t=
	1776920510; x=1777006910; bh=JeZ0eQ1N+i62g85dcr6rfQmz3jxz9fSJ7G8
	cYPR8Hzg=; b=umy7pxb2C2+g7aJSFQnp1htnGB1zNwktRbNSFBl4PX6BjgRLOJQ
	zQyGD8bL1z6Pxc3bi1K8K4WcBg0Et8Py2AGdUC0SPkc+w1g0N5ISy0M5fHFQGhgm
	Zfr5HCTpblhsHflmDAWOnI8EnS7uoD9xEqL4+ibuO+zhobfgeLIkQ6sk8bDuZjUO
	ouatJiL94XlXB4ag8xUEeo9qLBHmLaeSp8dbeG8vRyWbO8/fVNqUk/KKU/YYcj61
	KR8Da9VDqfJ+I9o9nhHhwqe0b8wl3wMquG9D3+MhyXIOC6nPv2PXGZF/rP09SnuP
	RN9JeOi9tTOXR7dnZoizaNejL55aMjORUOw==
X-ME-Sender: <xms:vafpaZG0x_QjHPR_Sj304wnwh5Yn5UxG9U5pOH3lY8R-wvobWqueww>
    <xme:vafpaf5knAvz7MSzn260V0m6uGB6SqlNYCWxpT-5s9GA0pEZmwabQty6wqOfQL6wq
    ZyzciwXAIB66poPwM4OIm3zt8EA2jQvgzXiQ7u81NjeW9kyOG0>
X-ME-Received: <xmr:vafpaabKBRmJYMRWEncKxjO3-DtJQHifp54Aer3Ilh0UWeOCcLgzOqg0_kEPA5HuenYy8nkqW9PzGoi0seYXySfhiQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefhedrtddtgdeiiedviecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpefirhgvghcumffj
    uceoghhrvghgsehkrhhorghhrdgtohhmqeenucggtffrrghtthgvrhhnpeehgedvvedvle
    ejuefgtdduudfhkeeltdeihfevjeekjeeuhfdtueefhffgheekteenucevlhhushhtvghr
    ufhiiigvpedtnecurfgrrhgrmhepmhgrihhlfhhrohhmpehgrhgvgheskhhrohgrhhdrtg
    homhdpnhgspghrtghpthhtohepuddtpdhmohguvgepshhmthhpohhuthdprhgtphhtthho
    pehjvghffhdrjhhohhhnshhonhesohhsshdrqhhurghltghomhhmrdgtohhmpdhrtghpth
    htohepnhhitghordgvshgtrghnuggvsehgmhgrihhlrdgtohhmpdhrtghpthhtoheprght
    hhduvdhksehlihhsthhsrdhinhhfrhgruggvrggurdhorhhgpdhrtghpthhtoheplhhinh
    hugidqfihirhgvlhgvshhssehvghgvrhdrkhgvrhhnvghlrdhorhhgpdhrtghpthhtohep
    shhtrggslhgvsehvghgvrhdrkhgvrhhnvghlrdhorhhg
X-ME-Proxy: <xmx:vafpaVg-j8utCR_6r2vWMmStMH1PgY4cCNqBDEUCRzMA6y-bSzaPZQ>
    <xmx:vafpaUepufAr-kaZiXdx6-JlOm2wKI60n6tn-DW-_e3rkNLZ7VH3vg>
    <xmx:vafpaclbAT9ctQw3RdyrJGDDRPEeJojaL5qku9-rrMRvL4qf8lfM_w>
    <xmx:vafpaRzMRnTQd3WPOUaDPc6bDlQ_IUPIeBaPpqlnDmY_qRQSWhyvNQ>
    <xmx:vqfpaViYSJumZaVsKB3_7F06R7gi0IrQ_Vo_ZNT63BdPvV3JCCJIkdSs>
Feedback-ID: i787e41f1:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Thu,
 23 Apr 2026 01:01:49 -0400 (EDT)
Date: Thu, 23 Apr 2026 07:01:48 +0200
From: Greg KH <greg@kroah.com>
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>
Cc: Nicolas Escande <nico.escande@gmail.com>, ath12k@lists.infradead.org,
	linux-wireless@vger.kernel.org, stable@vger.kernel.org
Subject: Re: [PATCH ath] wifi: ath12k: fix leak in some ath12k_wmi_xxx()
 functions
Message-ID: <2026042326-sediment-earring-4050@gregkh>
References: <20260422163258.3013872-1-nico.escande@gmail.com>
 <0456ecb5-130e-481d-97d9-e88a7aaca02d@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <0456ecb5-130e-481d-97d9-e88a7aaca02d@oss.qualcomm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_220155_403622_613B6C14 
X-CRM114-Status: GOOD (  12.90  )
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

On Wed, Apr 22, 2026 at 05:08:59PM -0700, Jeff Johnson wrote:
> On 4/22/2026 9:32 AM, Nicolas Escande wrote:
> > Some wmi functions were using plain 'return ath12k_wmi_cmd_send(...)'
> > without explicitly handling the error code. This leads to leaking the skb
> > in case of error.
> > 
> > Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00218-QCAHKSWPL_SILICONZ-1
> > 
> > Fixes: 66a9448b1b89 ("wifi: ath12k: implement hardware data filter")
> > Fixes: 593174170919 ("wifi: ath12k: implement WoW enable and wakeup commands")
> > Fixes: 4a3c212eee0e ("wifi: ath12k: add basic WoW functionalities")
> > Fixes: 16f474d6d49d ("wifi: ath12k: add WoW net-detect functionality")
> > Fixes: 1666108c74c4 ("wifi: ath12k: support ARP and NS offload")
> > Fixes: aab4ae566fa1 ("wifi: ath12k: support GTK rekey offload")
> > Fixes: 7af01e569529 ("wifi: ath12k: handle keepalive during WoWLAN suspend and resume")
> 
> @Stable team:
> 
> are you OK with one patch that fixes a bunch of places, or would you prefer a
> separate patch per fixed commit?

I do not understand, we take what is in Linus's tree, so the same rules
apply here.  If the patch should be broken up for Linus's tree, that's
good for us in stable.  If it is one "big" one, then you have to deal
with the fall-out if it doesn't apply to all relevant stable releases by
providing a working backport for us :)

thanks,

greg k-h

