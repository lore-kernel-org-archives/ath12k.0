Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53CA0CA100A
	for <ath12k@archiver.kernel.org>; Fri, 30 Aug 2024 16:24:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n40eqImWNJaJ1eZyhml6lDvg7HoUmFqBfkd7fEOtuGA=; b=1sHaQPYVtVSudSVTkp4cDZpTAM
	LTUeug9VLyWFm2pEjniTvSyKf9zv37eu1wpcv/zDhTAPVjyF6ZukhRZLQqmaZXUeqJUfc/1LNTQLO
	QnlVepwXzi6aFGh61YbiRllE3fXf1HSHUERptxk1i/YprPavi7xNIUuwuiXkET7sMIldF2kNlX0ry
	ngPpgDWZ1f37A8TJJeLE7cKSpvE2UwzpojR4okcDNCB9vk/JEI2SAkanIDQDvhuqUmimepTMPZFGe
	Cmnvr6/42SujGQiBz9DhNLE+22lIbbbFCNrNay4x11JiSvz2/cA1EBDZIjZ39x8bZAxGKHiDh/d0W
	VA0baAIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk4Pu-0000000709h-09FS
	for ath12k@archiver.kernel.org;
	Fri, 30 Aug 2024 16:24:06 +0000
Received: from e3i110.smtp2go.com ([158.120.84.110])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sk4MW-00000006zhh-2R5h
	for ath12k@lists.infradead.org;
	Fri, 30 Aug 2024 16:20:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=smtpservice.net;
 i=@smtpservice.net; q=dns/txt; s=a1-4; t=1725034823; h=feedback-id :
 x-smtpcorp-track : date : message-id : to : subject : from : reply-to
 : sender : list-unsubscribe : list-unsubscribe-post;
 bh=n40eqImWNJaJ1eZyhml6lDvg7HoUmFqBfkd7fEOtuGA=;
 b=2Tl75uzL0/87VW1UuqFzbxgawLz0jlGph7No9+EqeBn6euGyq5ONt7pG6y0Zk6P2VnBQ1
 VvHkq8pI7AY+kklUxoSVgf4WrTs62r1p4JQzyoLuscU5OvY5fdSa8rePtmadGz9tps65a3w
 NM4Dnl6FJyUabxVp+cKjEz5YRSO3GLryvGKKIwVTxo04d4vCT2LNKKNQ1ybaVIXSi8XCFBm
 aJc1EJln0mwZ5CH+DCd15cUJC/Y/HBeyXTl0RXP5KtScQ6JyaFyeNw/Z09IVL4Slv7+vF0K
 dBzyR8rQXc7d6pBYHqzQ6i3a3XvZqk/b62Oaw7dOHbngwnh/xbiXg4lIyrlw==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=triplefau.lt;
 i=@triplefau.lt; q=dns/txt; s=s510616; t=1725034823; h=from : subject
 : to : message-id : date;
 bh=n40eqImWNJaJ1eZyhml6lDvg7HoUmFqBfkd7fEOtuGA=;
 b=Rh4Hr1jQP7wfrX75/ENxzq74ngtu2g1thOkYPskFWCK87cYAfRmz2iBiGgr+cMFZJB512
 kTgqeEK7mfTJP0Khxw+B9TVoRkJ4WvFAePWYe1csiloxfUdXRYilMVTXKj8xZhfdTyho8MU
 IJ+k70eh/hC0AKS1WUNJwVtLxcN+e7/PaRQzSqJOg0FM/VtkF/669C7/B4mabOqUVHi3fH5
 FcdsCf4f5B50Q2a6PvlRdjlIRED+IpABl0AWidFGS1zLErze0wDF+KT3/1uL5w+otJOD+W5
 IvHO7BAYeF/isAYBIU+0L81fvwT+UhfDPj5Iy1TrkwuuAjbbMthfkT3u5W7g==
Received: from [10.12.239.196] (helo=localhost)
	by smtpcorp.com with esmtpsa (TLS1.3:ECDHE_SECP256R1__RSA_PSS_RSAE_SHA256__AES_256_GCM:256)
	(Exim 4.97.1-S2G)
	(envelope-from <repk@triplefau.lt>)
	id 1sk4MG-4o5NDgrw4Fa-nsAO;
	Fri, 30 Aug 2024 16:20:20 +0000
Date: Fri, 30 Aug 2024 18:21:50 +0200
From: Remi Pommarel <repk@triplefau.lt>
To: Nicolas Escande <nico.escande@gmail.com>
Cc: ath12k@lists.infradead.org, linux-wireless@vger.kernel.org
Subject: Re: [PATCH] wifi: ath12k: move txbaddr/rxbaddr into struct ath12k_dp
Message-ID: <ZtHxnk0weaxYUIwZ@pilgrim>
References: <20240830081942.3623380-1-nico.escande@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20240830081942.3623380-1-nico.escande@gmail.com>
X-Report-Abuse: Please forward a copy of this message, including all headers, to <abuse-report@smtp2go.com>
Feedback-ID: 510616m:510616apGKSTK:510616su41D9LAPX
X-smtpcorp-track: kcUFBkK2YMnn.EHszNDYNABbB.CFLmCgT2G4Q
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240830_092037_035554_BE9FFA22 
X-CRM114-Status: GOOD (  11.97  )
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

Hi Nicolas,

On Fri, Aug 30, 2024 at 10:19:42AM +0200, Nicolas Escande wrote:
> Those two fields are used to store the per SPT page of tx/rx descriptors send to
> the firmware for cookie conversion. Right now they are in struct ath12k_spt_info
> which means they are duplicated PPT page times while we only need one instance
> of them. This works for now as we always use the first spt_info as a global
> storage for all PPT pages.
> 
> Let's move them into struct ath12k_dp where they belong, alongside of the
> spt_info array they are tied to, to avoid waisting a good bit of memory.
> 
> Tested-on: QCN9274 hw2.0 PCI CI_WLAN.WBE.1.3-03283.1-QCAHKSWPL_SILICONZ-2
> 
> Signed-off-by: Nicolas Escande <nico.escande@gmail.com>

Looks good to me. For what it worth:

Reviewed-by: Remi Pommarel <repk@triplefau.lt>

-- 
Remi

