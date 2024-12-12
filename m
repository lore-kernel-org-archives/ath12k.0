Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E778CE77182
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 11:27:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C5JpY8ekvCLmVVJDg7YRy0jtZA0z4hBVWotaQmcL3Xw=; b=fhTxNIWbnIhoS07idY8VRM6qAY
	iX7T7zeIGtaQ+kehwxukzSrJNuH01qytMaGzQEhLfXwov+0Jlbk5i/WUktOlqF/+RILjhuGcsOvKX
	UFHA+KT7Pp9EI0U5XMUcAr0VpdF/2AR8fVi2U/cIUZq5Iu7CVOPXz16SXWQ2s2nT0viyGv8QmhU/9
	XyBN5QY83AH8YKRNlS8FtzZwk1v7qkCUyOo/jpfwjEp5wHE6ojEYZLcS0NtbQMM7YDrKCJ7K0rR8T
	+TfmV+kL2aWo45TSFLdjqX+49cCe3OLcquryQpUw4GHQTVWCchZt4gHpOeOnufX6vJCrlg9tmUWG6
	I4TlsYMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhLh-00000000B3B-2H4V
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 11:27:17 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLhLI-00000000Ax3-3nYn
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 11:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 053735C621C;
	Thu, 12 Dec 2024 11:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2314DC4CED1;
	Thu, 12 Dec 2024 11:26:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734002812;
	bh=pccqLc7i82mC3GgYKCrj2ARpPSBFqcYNm0iJ15hvcbI=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=q3E0Ju/FLqCDCHdnrqHsakSbX2yXQkkroxiPNSrAX09m54+Y4bVYJUGoeA9VQ3pru
	 FMSBXhBydUMzZAXhRmSCCH1HX2t95NsmPTCdJ2uwz+pHsDABdypJcqNmdqqFj/lGjA
	 7m0wMbKAcDloLvlfaIezjIx3G1gFZ6WyGhQkIH48l1VwbgaJ0vBd90l3JLriLNXBmd
	 PaNSXMvR4v3MGrGVLlGlzQtim+kwiDkAyApJXYclg2ZFFQQ+wsCfcVbmqrOXV5QUnO
	 5c88ZtrAExlX78JsSQZzlKd/xNZMdr4+k8VZqS6US55+a1bT0EeGueznqjWl31S1uH
	 ol87nF3PwRC3w==
From: Kalle Valo <kvalo@kernel.org>
To: Aditya Kumar Singh <quic_adisi@quicinc.com>
Cc: Jeff Johnson <jjohnson@kernel.org>,  Rameshkumar Sundaram
 <quic_ramess@quicinc.com>,  Sriram R <quic_srirrama@quicinc.com>,  Kalle
 Valo <quic_kvalo@quicinc.com>,  Jeff Johnson <quic_jjohnson@quicinc.com>,
  <linux-wireless@vger.kernel.org>,  <ath12k@lists.infradead.org>,
  <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] wifi: ath12k: fix read pointer after free in
 ath12k_mac_assign_vif_to_vdev()
References: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com>
Date: Thu, 12 Dec 2024 13:26:48 +0200
In-Reply-To: <20241210-read_after_free-v1-1-969f69c7d66c@quicinc.com> (Aditya
	Kumar Singh's message of "Tue, 10 Dec 2024 10:56:33 +0530")
Message-ID: <87bjxhp2fb.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_032652_985485_371F0DD5 
X-CRM114-Status: UNSURE (   7.42  )
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

Aditya Kumar Singh <quic_adisi@quicinc.com> writes:

> In ath12k_mac_assign_vif_to_vdev(), if arvif is created on a different
> radio, it gets deleted from that radio through a call to
> ath12k_mac_unassign_link_vif(). This action frees the arvif pointer.
> Subsequently, there is a check involving arvif, which will result in a
> read-after-free scenario.
>
> Fix this by moving this check after arvif is again assigned via call to
> ath12k_mac_assign_link_vif().
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Closes: https://scan5.scan.coverity.com/#/project-view/63541/10063?selectedIssue=1636423
> Fixes: b5068bc9180d ("wifi: ath12k: Cache vdev configs before vdev create")
> Signed-off-by: Aditya Kumar Singh <quic_adisi@quicinc.com>

Acked-by: Kalle Valo <kvalo@kernel.org>

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

