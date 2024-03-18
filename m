Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4766C54E58
	for <ath12k@archiver.kernel.org>; Mon, 18 Mar 2024 17:55:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j21nH3XrzXe/wDHa4dA3IIPt0CkdNZmC6+IG9l7HLSk=; b=G4jHR/Yi2TJCvTTF7c7Od+6K1F
	AcDlv2jIn59G835ABD+DkVQ5VH8luUswyDxQnbDIJvSXWIDb/+g0SpvWsu4T7tcSn0Gcf6C21aGbl
	cgtJRpKGVVZHHkhGAlZ9hcCRnrLPHV+JiJWMXTX2+gyiGP0uekD6YTbjvNlgkTOc8QgyL+aHhOrC6
	HPGYNOOaFU/jlicCcdtw427hjH8HPU56WJenvqxJZBZfLKXIIdHgb112wVnkCfYLLaPkXgZUbhWb+
	trHlamo39AbPdTUzZrxy0vY0hA/c9i3QFzU6zYaq1mW/ETfm3WwTVUJTOY2pxvhUmcv2PPgedel3r
	mkLfpr6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHCQ-00000009YF0-1Bb7
	for ath12k@archiver.kernel.org;
	Mon, 18 Mar 2024 17:55:02 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rmHCD-00000009YBn-2vqw
	for ath12k@lists.infradead.org;
	Mon, 18 Mar 2024 17:55:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 620B8CE0A36;
	Mon, 18 Mar 2024 17:54:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D987EC433F1;
	Mon, 18 Mar 2024 17:54:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710784486;
	bh=qepjLFBOtzZoOmQQb1bfwPWOL137DOQO8cSoa8pFgnU=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=nzUcX5p+/rvDh513vLqNqZ9WBbrRWIIE0qI/66bHS5ahGZh3X8bIgMaxlQnKJqhbj
	 IIC0G6QpTlbU8lIggbKq/jOUSmuWybnOZi//ScNw+q6Nk/83ecHLhRBvVfBTWRJ68z
	 lM8wkS5DxhilM6okT9EmH8L6JUF+SlTbA0KNcb1z8PgvsYmnyPymVFZsIXLlWiOf1l
	 egIeSEdp3FpP2mvQ1o70+muS2Vo4rlvjGJWjF5KQNiQzu5E8LJWZg81RY/se5WFrkT
	 bHhJ0HOkqsdqx0KowWN/MZI+JKf0VTgRblVWwphXGpHKDoa7rIdqpu3mJA32+4Xf02
	 m4Mb1DdimTR+g==
From: Kalle Valo <kvalo@kernel.org>
To: Aloka Dixit <quic_alokad@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: use correct flag field for 320 MHz
References: <20240314204651.11075-1-quic_alokad@quicinc.com>
	<87sf0nczca.fsf@kernel.org>
Date: Mon, 18 Mar 2024 19:54:43 +0200
In-Reply-To: <87sf0nczca.fsf@kernel.org> (Kalle Valo's message of "Mon, 18 Mar
	2024 17:51:49 +0200")
Message-ID: <878r2fctng.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240318_105459_688362_2CEBC0F7 
X-CRM114-Status: UNSURE (   8.57  )
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

Kalle Valo <kvalo@kernel.org> writes:

> Aloka Dixit <quic_alokad@quicinc.com> writes:
>
>> WMI_PEER_EXT_320MHZ (0x2) is defined as an extended flag, replace
>> peer_flags by peer_flags_ext while sending peer data.
>>
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
>>
>> Fixes: 6734cf9b4cc7 ("wifi: ath12k: peer assoc for 320 MHz")
>> Signed-off-by: Aloka Dixit <quic_alokad@quicinc.com>
>
> What does this fix from user's point of view? Does it mean that 320 MHz
> chanels were broken before and this commit fixes that? I can ammend the
> commit message.

And what about WCN7850? Does it work the same?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

