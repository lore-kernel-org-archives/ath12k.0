Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7E793C0219B
	for <ath12k@archiver.kernel.org>; Thu,  6 Feb 2025 22:15:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QPSWX/xi0RPCGcHZ6ZN4i8VHsUL5re2rNucDfwV3lfE=; b=Dg2PA+SyxFOjUT1pGf931Rrov1
	o7AcsTq7hLTy+eSJuYTHlOWh6440FD55WPTaXry0mE+RWnXvazfvuoXwLjlMm3Ft2tF6ZJgtk9jjm
	zvbSNKkSnMRMLSX3lhtRlv0jguBuO4pxQ12RQf9T+BuWAL95d8XNtADwEsUMNnz+KYFSlVPLcq5Lu
	21C5hozkufLUuVRIpNvOx49lnE9t6uZ+LSyeL4xoDNkeEqFp/M/DK2GbMGZccyVJ4ucx1ucp0eRHW
	OWlRp+GZCMMNwWHewNuQskGrTqi3Y9uSaeFN+VJRhnQuhQGWzArlc8KauiLm3HqwI59gZqFBg5yMf
	KbhU+laA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA9j-00000007fQO-0gq1
	for ath12k@archiver.kernel.org;
	Thu, 06 Feb 2025 22:15:31 +0000
Received: from 009.lax.mailroute.net ([199.89.1.12])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgA8B-00000007fC3-2axv
	for ath12k@lists.infradead.org;
	Thu, 06 Feb 2025 22:13:57 +0000
Received: from localhost (localhost [127.0.0.1])
	by 009.lax.mailroute.net (Postfix) with ESMTP id 4Yprwg2SJtzlgTxr;
	Thu,  6 Feb 2025 22:13:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=acm.org; h=
	content-transfer-encoding:content-type:content-type:in-reply-to
	:from:from:content-language:references:subject:subject
	:user-agent:mime-version:date:date:message-id:received:received;
	 s=mr01; t=1738880030; x=1741472031; bh=QPSWX/xi0RPCGcHZ6ZN4i8VH
	sUL5re2rNucDfwV3lfE=; b=dPngntNjukDId1ecMG9utEC9mZI2JWRlN9xKSC/h
	vsQOLLd8vMDsSyXIDlvD078U197CxSo72e9Myc4YtFeZehx9Ag8un0Kb6cPb0TCm
	nRKj+rPjOSFwakAohOaZ9yjTEGS3CL30u9iLnys2vdZsZKIwm1zS3dCuQHnkQGsL
	UOntFK2Vb0MEDssjAE/la5YtxRYunr+rTorYRcupoCkZH07nbvAyrc43viu/yXBf
	/w42+aNksLxdj1Z7zlGnsVj3i5cUaNlpddFtVepcZfSuJD1V75/sLPFvc1h0Edx/
	r+5LkvMwmjSc7/Q9GVsQ8Tlkpv/rUcXzM8dQKBPtPN2BDQ==
X-Virus-Scanned: by MailRoute
Received: from 009.lax.mailroute.net ([127.0.0.1])
 by localhost (009.lax [127.0.0.1]) (mroute_mailscanner, port 10029) with LMTP
 id J_o6Dsq11wuH; Thu,  6 Feb 2025 22:13:50 +0000 (UTC)
Received: from [100.66.154.22] (unknown [104.135.204.82])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: bvanassche@acm.org)
	by 009.lax.mailroute.net (Postfix) with ESMTPSA id 4YprwW2SzGzlgTw4;
	Thu,  6 Feb 2025 22:13:46 +0000 (UTC)
Message-ID: <335edb88-c850-44bc-ae1b-79349175bc8c@acm.org>
Date: Thu, 6 Feb 2025 14:13:45 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 25/33] wifi: ath12k: Fix locking in error paths
To: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
 Peter Zijlstra <peterz@infradead.org>
Cc: Will Deacon <will@kernel.org>, Christoph Hellwig <hch@lst.de>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Marco Elver <elver@google.com>, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>,
 Jann Horn <jannh@google.com>, linux-kernel@vger.kernel.org,
 Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
 linux-wireless <linux-wireless@vger.kernel.org>,
 "ath12k@lists.infradead.org" <ath12k@lists.infradead.org>
References: <20250206175114.1974171-1-bvanassche@acm.org>
 <20250206175114.1974171-26-bvanassche@acm.org>
 <7633c19b-2aab-4f2a-8c11-27425f7299ae@oss.qualcomm.com>
Content-Language: en-US
From: Bart Van Assche <bvanassche@acm.org>
In-Reply-To: <7633c19b-2aab-4f2a-8c11-27425f7299ae@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250206_141355_670890_132F145C 
X-CRM114-Status: UNSURE (   6.35  )
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

On 2/6/25 10:25 AM, Jeff Johnson wrote:
> Can you submit this as a single patch and cc the ath12k and linux-wireless
> lists (as I've done in this reply)

Done :-)



