Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5BA2CCDDE6A
	for <ath12k@archiver.kernel.org>; Thu, 24 Oct 2024 09:58:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wq3EFFsdwR+z5EEZSz4e61xf5Ku7uJg777ge//8CJvk=; b=Y1zb2BW1epJs023d02Xlo/dEcA
	jHJF3SHTRAZxeoa+x6f7oShGQKJXmMZ/hBf3ZB8tXuHArd5Yc5TU3uiBqlFgOeAQOIO6z2Uplr06M
	siiml9RdKYS8J3KGjfHpJu1iqqj09Ak3gIJmzXp+Twd52wOb/zYfO/CLh09024sfcRx37hPd3gEPL
	DnC7iJmZRHRQVDuBLsS0dXp9wuyyIVx7oAtAtVJ0gdBGXxV4YnSmst1f2pBwhdfqsR1IVUuClGoLF
	mJv1a+/hYTS6I9LsM53Id8qqIJH5EjUbn1I4+EYmqXadCN89TzHlKDpeyRIK/YXBOc8PBAxW4+9gf
	QpT4qZzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uc9-0000000Ha8W-033T
	for ath12k@archiver.kernel.org;
	Thu, 24 Oct 2024 09:58:45 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uSE-0000000HXvt-2Dos
	for ath12k@lists.infradead.org;
	Thu, 24 Oct 2024 09:48:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 8AA9BA45296;
	Thu, 24 Oct 2024 09:48:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0D7AEC4CEC7;
	Thu, 24 Oct 2024 09:48:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729763309;
	bh=kGeIHMWd4A1zAwUB34qoIGbCj+6EFwJ/Rf1fl0x7NB4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=QRRDLTIp2RZ4t3cPh2SbLbVa+6a1eovn7HIII4ssBKMljvaE+xxl1q+Cbj9hXv+L0
	 AV1Lc3qnMzakLnKC1V0HLckyoGnwoOaeJO0bTPtAeIvXSGq3MJJj0DxhRh7GP7Syfm
	 As6SDHca1gqkYg9SZKTEIwuPOZce6dZNDqx3DyG2UFqPm46clD6WjXwoj7iNdtgoQl
	 wxRmW1HtjYroXNjVI3yxQnldSgCvkqkjw0im6wmpMOUffYiDQbtTuKBH9tTonPPVQX
	 UwnZo3ebLXi/HhpoGL8/bvpN5rmccgnD7jnpCyrmwIvhgylHESj9lp9vFiXGfNoJDC
	 uwS1myPpD4E3Q==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Raj Kumar Bhagat <quic_rajkbhag@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH v3] wifi: ath12k: convert tasklet to BH workqueue for CE
 interrupts
References: <20241022072406.3231450-1-quic_rajkbhag@quicinc.com>
	<d5fffc97-2603-4614-95cd-333c86435534@quicinc.com>
Date: Thu, 24 Oct 2024 12:48:25 +0300
In-Reply-To: <d5fffc97-2603-4614-95cd-333c86435534@quicinc.com> (Jeff
	Johnson's message of "Wed, 23 Oct 2024 10:14:34 -0700")
Message-ID: <87froln85y.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_024830_652641_E0B7C2A6 
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

Jeff Johnson <quic_jjohnson@quicinc.com> writes:

> On 10/22/2024 12:24 AM, Raj Kumar Bhagat wrote:
>> Currently in Ath12k, tasklet is used to handle the BH context of CE
>> interrupts. However the tasklet is marked deprecated and has some
>> design flaws. To replace tasklets, BH workqueue support has been
>> added. BH workqueue behaves similarly to regular workqueues except
>> that the queued work items are executed in the BH context.
>> 
>> Hence, convert the tasklet to BH workqueue for handling CE interrupts
>> in the BH context.
>> 
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.1.1-00214-QCAHKSWPL_SILICONZ-1
>> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
>
> (Not sure how to stress-test this, but it does survive multiple rmmod/insmod
> with a Youtube video stream running)

Raj, did you notice any changes in throughput?

Passes my tests as well:

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

