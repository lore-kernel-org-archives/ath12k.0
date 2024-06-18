Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 446A4C2BA15
	for <ath12k@archiver.kernel.org>; Tue, 18 Jun 2024 08:38:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DFDolnuzWyrp6AXce9heck8VnVyrRB1xMbbj+kft3QE=; b=fhE+EFcdpiRRHWv/8UJrMAL4TD
	R2vg816c67tMnXBltqy447I6XXXWcQmPo6Wu/JpMymhNC6kjysOq4t4vHEpx3A+CaizcZGEj9COTr
	rCzamaxJRSyWxDoGwiPyDUXFJB/DHabR9qBFHMXP3kuOkcaAPC4USzynniyg8PSrp9gXWG9RH4m5e
	EsyXEua/OgpdmpkLhh2EOYXQGDcVebQR68/enUoQ2S9UlkphdLc7pVruMS4fLvgxtNICGUAyE9EIG
	nZ0W3T3QAXT3THy6m6jh8PsQ60tq5w0w+zL9OFf1fFjKbtDdjSIxMlWr/SGWrVvL+nXhgv/hHmUA5
	EGxvCMCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJULs-0000000E5vq-3IDG
	for ath12k@archiver.kernel.org;
	Tue, 18 Jun 2024 08:38:04 +0000
Received: from sin.source.kernel.org ([145.40.73.55])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sJULp-0000000E5un-412r
	for ath12k@lists.infradead.org;
	Tue, 18 Jun 2024 08:38:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 7B9CBCE1006;
	Tue, 18 Jun 2024 08:37:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 842D9C3277B;
	Tue, 18 Jun 2024 08:37:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1718699873;
	bh=fYQJnw1HECgzYN1KAhN5C+vIw4kw3q70dv0DpSBl6pE=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=gdpQcxYfOpmA909/13ufw+YrtcK31AgX7UEibdUKgYvuy7fQp1msBKgHwj7L5yvRn
	 8w9jtLqxgH4tPY1VtUe19yoiawJO6gFscgU41rNefR0jIS2AXHpsXo/gfuNxXzFq/4
	 spILweSlEVxwDgeLa+Ikspy1ePErHNW+UldpQdkbs/CiP5zREmTzITU1lQBryJ3v4N
	 aXQt9fTrVd2fJa3nYvDRy31jPr+PI3A9Um97jSoJ2n3cpi7ytMiZMv9ovNN0Slf5Jf
	 ZfNOqnS2DOgQbNKxq4twh5xkBjcVIiIA7Lrg12kYA90YsISvuJg+aa2Te7MHg9lMO6
	 IG8lPc9pnwKQg==
From: Kalle Valo <kvalo@kernel.org>
To: Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
  <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>,  Sriram
 R <quic_srirrama@quicinc.com>
Subject: Re: [PATCH v4 1/3] wifi: ath12k: prepare vif data structure for MLO
 handling
References: <20240617131650.3288118-1-quic_ramess@quicinc.com>
	<20240617131650.3288118-2-quic_ramess@quicinc.com>
	<3754f5f3-0e67-4c5e-9b56-888ad5071622@quicinc.com>
Date: Tue, 18 Jun 2024 11:37:50 +0300
In-Reply-To: <3754f5f3-0e67-4c5e-9b56-888ad5071622@quicinc.com> (Baochen
	Qiang's message of "Tue, 18 Jun 2024 15:47:46 +0800")
Message-ID: <87ed8umysh.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240618_013802_228168_BEF273D8 
X-CRM114-Status: UNSURE (   5.73  )
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

Baochen Qiang <quic_bqiang@quicinc.com> writes:

>> +static inline struct ieee80211_vif *ath12k_vif_to_vif(struct ath12k_vif *ahvif)
>
> better naming as ath12k_ahvif_to_vif()?

Thanks a lot for the review, I appreciate it. But please edit your
quotes, having thousands of lines of quotes makes use of patchwork
practically impossible:

https://patchwork.kernel.org/project/linux-wireless/patch/20240617131650.3288118-2-quic_ramess@quicinc.com/

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

