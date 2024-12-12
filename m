Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B19AE77182
	for <ath12k@archiver.kernel.org>; Thu, 12 Dec 2024 07:46:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:In-Reply-To:Date:References:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RR+tmdw2ZivcsXBOjZjrOlWAr0SwNPf5ONAq2PPpKEk=; b=iTj0ipRTsSIOdnwNzLibwhDPqO
	XU2VrifHe1htAriigVuL2UfwZdD+rFzO8KFUkcg+uudAVAwyYr81jtr1gl9mRP22vmdZw+uUE3hi1
	SeZJ1j/EJQMGIUCxTeVtuTs+z051iHDdwEHJ9fFzwlU/Hteup66j+L8yxpNQgQO8YiBzsP+rTA9iN
	j6zNzGVCZdaMaPKQh5nOxW6LjDvVqomuc94sTPSa6aYS8fWMSYOGeKd6J6OpmyXvDDO8NIF7D8zgk
	6xvxzlzGt3wvU0+2VfV15ywbVq5fnIHqaxlxrXGg9wfLqkrv6XF71Oq4EfKEj/+yzleNXoq6m9BGL
	cl/DWpOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdu5-0000000HBuo-37gs
	for ath12k@archiver.kernel.org;
	Thu, 12 Dec 2024 07:46:33 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLdu3-0000000HBtw-0tBh
	for ath12k@lists.infradead.org;
	Thu, 12 Dec 2024 07:46:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id AD77F5C5C5E;
	Thu, 12 Dec 2024 07:45:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 17F10C4CECE;
	Thu, 12 Dec 2024 07:46:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733989589;
	bh=dtg1tQV1yWPm8gDAL7vJ10IRdA03eRnZ4qO5YBayvk4=;
	h=From:To:Cc:Subject:References:Date:In-Reply-To:From;
	b=JB2GbhRSa+4wk7WXKLwtxq4qcoNPGeA0Y67ks33o5KYH66EYCa0nLnBZLpKrUKOJI
	 GI77CcQZKXo5FgPKtwVOiTBGi3HrdQ3awjL2il2d2maZ46zunfCOkaWVikyRvBD9EJ
	 qLC8jnhJcUpvHoaG6MwfT/Vcqn+EbVyuhaOShjjQAKZgzsKNpcO79OUtIh3ALLGbSq
	 xf+fpAs+w8Axp2g/PbT/9Tijf+CulUA5kqRTpaoIAvNx8h7PesqHgKMznhxyY5hsz/
	 zcMTuHQh11glVdMWzyUwi/5/ADzW/5AYAJ89FzuMhtJjaqAQmRHiWHSatUdRmtmCTo
	 TXk373uWtKWQw==
From: Kalle Valo <kvalo@kernel.org>
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
Cc: <ath12k@lists.infradead.org>,  <linux-wireless@vger.kernel.org>
Subject: Re: [PATCH 1/4] wifi: ath12k: Refactor ath12k_hw set helper
 function argument
References: <20241212004906.3087425-1-quic_periyasa@quicinc.com>
	<20241212004906.3087425-2-quic_periyasa@quicinc.com>
Date: Thu, 12 Dec 2024 09:46:27 +0200
In-Reply-To: <20241212004906.3087425-2-quic_periyasa@quicinc.com> (Karthikeyan
	Periyasamy's message of "Thu, 12 Dec 2024 06:19:03 +0530")
Message-ID: <878qslqr70.fsf@kernel.org>
User-Agent: Gnus/5.13 (Gnus v5.13) Emacs/28.2 (gnu/linux)
MIME-Version: 1.0
Content-Type: text/plain
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241211_234631_288177_FBD268C7 
X-CRM114-Status: UNSURE (   7.68  )
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

Karthikeyan Periyasamy <quic_periyasa@quicinc.com> writes:

> Currently, ath12k_hw is placed inside the ath12k_hw_group. However, the
> ath12k_hw set helper function takes the device handle and the index as
> parameters. Here, the index parameter is specific to the group handle.
> Therefore, change this helper function argument from the device handle to
> the group handle.
>
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
>
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

What's the user visible impact here?

-- 
https://patchwork.kernel.org/project/linux-wireless/list/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches

