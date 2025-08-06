Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C671CA0EC0
	for <ath12k@archiver.kernel.org>; Wed,  6 Aug 2025 14:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=s0+7ree/F3r99ZU2R0sSJbdWkvCGZQRwgAxW/AdE8qI=; b=CwSZP++VvSwQnrKhXa0IQ6In0z
	Vo2tt5087gF3nFIzJvz5M0u7lbKnHaRsNdWZ+fPK7o0QSKvox9tmR7o87c606psY6BwqmAMnqX6L+
	LbTZKnbkiqxnY83Epd0V21r7VjmYQdczILQ1im6AB7ePOuRfgXNpAVoUhjU/ZEx7wqeu5rW9GyQZj
	A6ZRrj4Lk7WhAUUcywvtO3RSdmJEd7CKL8oaHg2MWnCivBaDxCBiSmDiP7Zb9fN21UlGhkBF5tsJ4
	u0Kwa0I2v6Liq7lf2Ug/615xQ2cBxY1m2zrZlktt07aBN9v7nPJNkw6ylHeNdRTfG7oUD5mQJYhsj
	7NluQJPw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujesK-0000000FPQY-1XnS;
	Wed, 06 Aug 2025 14:12:16 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujeoU-0000000FOpj-1AGG
	for ath12k@lists.infradead.org;
	Wed, 06 Aug 2025 14:08:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 47D18601FA;
	Wed,  6 Aug 2025 14:08:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F1F4C4CEE7;
	Wed,  6 Aug 2025 14:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754489297;
	bh=gFK8OTJEyw46i3VVqV/FUE5R71FnlRtaDMqr/AA+WRk=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=tVCz1cPx3xfRSiEV+xPPufAJlChb2haUwVPpseZ89ETmuc4dbD+YrtcQ8iz5CvWeM
	 7Rp0A/Ps/YDEkwQL44PUSvOCYyHO7FgLRMu9ikP1Tm0oAKr00q9GWIi46aTQOLBktu
	 83odU3wC1kL/CDqXSftPoucl88vHCiNu4zFm0TdzTgxqaZQSXnTeZHgNbgsbB9PXo6
	 +xfy6okJAzoqGlBKYNV+xWZBuJ7dMmlpBVzu+BJOwt28/bVBUzcDZ4+azDYVHdVJ8O
	 YyNtp1HDPD2vVSzcKfIbR7dbnp09An1BViy1QPw6IkdnA3Sx6ttTeQeIsIbvgPgRdr
	 M3B9gYrWxEhqA==
Message-ID: <87566200-1d0f-4360-bafb-f7a7fab67f3e@kernel.org>
Date: Wed, 6 Aug 2025 07:08:15 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] soc: qcom: mdt_loader: Remove pas id parameter
To: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
 Bjorn Andersson <andersson@kernel.org>,
 Konrad Dybcio <konradybcio@kernel.org>,
 Vikash Garodia <quic_vgarodia@quicinc.com>,
 Dikshita Agarwal <quic_dikshita@quicinc.com>,
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Jeff Johnson <jjohnson@kernel.org>,
 Mathieu Poirier <mathieu.poirier@linaro.org>,
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-media@vger.kernel.org, linux-wireless@vger.kernel.org,
 ath12k@lists.infradead.org, linux-remoteproc@vger.kernel.org,
 Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
References: <20250804-mdtloader-changes-v1-0-5e74629a2241@oss.qualcomm.com>
 <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
From: Jeff Johnson <jjohnson@kernel.org>
Content-Language: en-US
In-Reply-To: <20250804-mdtloader-changes-v1-2-5e74629a2241@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 8/4/2025 5:41 AM, Mukesh Ojha wrote:
> pas id is not used in qcom_mdt_load_no_init() and it should not
> be used as it is non-PAS specific function and has no relation
> to PAS specific mechanism.
> 
> Signed-off-by: Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>
> ---
>  drivers/media/platform/qcom/venus/firmware.c |  4 ++--
>  drivers/net/wireless/ath/ath12k/ahb.c        |  2 +-
>  drivers/remoteproc/qcom_q6v5_adsp.c          |  2 +-
>  drivers/remoteproc/qcom_q6v5_pas.c           |  7 +++----
>  drivers/remoteproc/qcom_q6v5_wcss.c          |  2 +-
>  drivers/soc/qcom/mdt_loader.c                | 14 ++++++--------
>  include/linux/soc/qcom/mdt_loader.h          |  7 +++----
>  7 files changed, 17 insertions(+), 21 deletions(-)

Acked-by: Jeff Johnson <jjohnson@kernel.org> # drivers/net/wireless/ath/ath12k/ahb.c

