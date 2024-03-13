Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C599C54E66
	for <ath12k@archiver.kernel.org>; Wed, 13 Mar 2024 16:49:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7BtBOzTnblpeDzj/b0IIEPIFGWtiOw5RZYCbtc0G10o=; b=YU4Fx/c+r6tZ398rxqDPi7pUVN
	ho8Arryrp+2VNAqUJ+GLQ6ja9Arl9b8ZqUfhGy+KSnUl2yaXwI5gu6Q10hgO1SrYji2qUSEvqWYLA
	P2SUq3uSTR38pD/ZTAyZfZ3KtuJvKW9bZzoaBtYynyS0JpRKaDW574QdctvBKqmmrt+wZT5l0nb4Y
	OXI+DpIoyHla+hGXWSQG7h3JIrGh4dfhG5W3xCrFk5iTQzNT8ycxS9A3KJk/fZ41esl5DhdGn/ZRX
	w9XWnNLD+Vlswn78qaXtxlvTFrXfdv92Y1EJ+n30CxN358qBmCPO0QjW9Qbo9/T4w35P+45my6/6D
	StmeGHTQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRmm-0000000Ar5s-3AN9
	for ath12k@archiver.kernel.org;
	Wed, 13 Mar 2024 16:49:00 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rkRmi-0000000Ar3c-1wFs
	for ath12k@lists.infradead.org;
	Wed, 13 Mar 2024 16:48:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id B31FDCE1B42;
	Wed, 13 Mar 2024 16:48:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF39CC433C7;
	Wed, 13 Mar 2024 16:48:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1710348534;
	bh=oESQXRrfUQn5iwHR7vuIGyuXA0ZCNnj5Jo5AGFJyb3s=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=Sr4aViDB3YIcBQARBhQq/BMG133CKzR2ns5C4wmLKZpIVoLbqBKjw9ubxMQdWwZXR
	 p658VANWNsn0RwQs2ZC3NJoNSkY0hEOdJpSPOPy3mSgpeQFi6cM5ScyxQo+ZTn0hor
	 38FOlBlSG0ThjilOZHp82FWPRC5OhpGLAhMELIeFudn8MZg061C6DLMAuoxBRJw1Sc
	 UfPmgiQAidYx+y8MiA8vl5+xvaCC9oMJ9oY83MbFSpMdIv55oZHbruvhvZsRSQkmJc
	 SPlFi/PkI4Tt8d/KS6p22QEhHQivU9HU9XVBfTw27eFceP8Sc1FJX5bnhukDRkLpR+
	 +VS0pBG4GDjCw==
From: Kalle Valo <kvalo@kernel.org>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,
  Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Subject: Re: [PATCH v4 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
References: <20240312135557.1778379-1-quic_ramess@quicinc.com>
	<20240312135557.1778379-2-quic_ramess@quicinc.com>
	<4a527729-2bf8-47ce-8275-d36b76bde95c@quicinc.com>
	<3178cf8c-d328-4fe2-b3be-f5c4c908f20f@quicinc.com>
	<605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com>
Date: Wed, 13 Mar 2024 18:48:50 +0200
In-Reply-To: <605a673e-3686-47d0-b71b-1e314fde65db@quicinc.com> (Jeff
	Johnson's message of "Wed, 13 Mar 2024 08:06:02 -0700")
Message-ID: <87il1qf571.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240313_094856_694437_40BC2255 
X-CRM114-Status: GOOD (  11.29  )
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

> On 3/13/2024 5:57 AM, Rameshkumar Sundaram wrote:
>> On 3/13/2024 3:23 AM, Jeff Johnson wrote:
>>> and guess we have to figure out how to suppress the ath12k-check issues with
>>> this macro
>> ath12k-check complains about the reuse of ah and index arguments which 
>> may get evaluated multiple times if its an arithmetic expression, But 
>> areas where we use the macro in our code aren't doing so.
>> Do you have any suggestions here ? or shall we go back and use this 
>> for-loop inline.
>
> The macro makes sense -- we'll need to update the overrides in ath12k-check.

IIRC it is possible to avoid variable reuse in macros with typeof()
operator (or something like that). I can't remember the details right
now but I think there are examples in the kernel code.

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

