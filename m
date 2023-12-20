Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93239C3DA6E
	for <ath12k@archiver.kernel.org>; Wed, 20 Dec 2023 18:32:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Message-ID:Cc:To:
	References:In-Reply-To:From:Subject:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hSLfJ7DvSJI8/qF2NUch+BNKL7Y7lOUzUUgZycX5YRk=; b=TpLc2vt9C+4pbhBjnPXUS+a9Xh
	9FEHj7BeP5DX3Edr40sbOp2cHeSTARsriZ+J1kB+halMM+zUfo6gyVjD3P9mS9CzD3p/WADLspHur
	lCkIExdPqyNEZryhx25mfolecpXmIThO9ldCczMrhL7RZThDVN8GFMTv9d3Knzzn6LcSia1QKnnwA
	0jjAlKLcWTmPkjc/EoGcUUfpLsMhVGrwPAaJzEHBRERq8f8V3oAYZryW0ziX6Vpv0UHqgmDIJfryj
	p9Josz2BNPD7C/ic32A7ikDHtMjp6LKkhLjz4Ohc/NpRqzM4K3kgH6p6F06/rF2Lupukvv8wus6R0
	RGVNeGBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.96 #2 (Red Hat Linux))
	id 1rG1MX-000h3m-0b
	for ath12k@archiver.kernel.org;
	Wed, 20 Dec 2023 18:32:09 +0000
Received: from sin.source.kernel.org ([2604:1380:40e1:4800::1])
	by bombadil.infradead.org with esmtps (Exim 4.96 #2 (Red Hat Linux))
	id 1rG1MV-000h3B-0g
	for ath12k@lists.infradead.org;
	Wed, 20 Dec 2023 18:32:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sin.source.kernel.org (Postfix) with ESMTP id 35E23CE1DD6;
	Wed, 20 Dec 2023 18:32:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E4A2AC433C8;
	Wed, 20 Dec 2023 18:32:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1703097122;
	bh=+W4MZSnIdFxDeoOGN4ZEea9W+NDCRvgrpYi4Ct0HJ0M=;
	h=Subject:From:In-Reply-To:References:To:Cc:Date:From;
	b=dJuZaVo+DSNOPKL9xLE+Z6apOJkt00w6sKsTrCHjTX1DTRPJPNGfYD6aCvL2/h/oZ
	 P+w/uL+WgRraEG0lpwDMBKoDGmGWpFT06jINne0WXPPKY87Hhdgxw9iscQ3ysweW1I
	 GtZbystadfdPjbwZnuHOVxNB5IPe+g70zRTmbbI+Iu0oynac9XVHHx9t/wyrWDCvAO
	 tr9RJ3trT5t11mQiUXVYY7EoRvYPM94PHxYtPYH+4shXN8O4SrPYLf/7k+WYkJOkzq
	 qz08cr/ODcGtMV/MPcMbM/gMKw40pg4gPixq81zOTzvzFFoGJuNRFxi7G/P72eDahU
	 xOSeASjr4qKbw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit
Subject: Re: [PATCH] wifi: ath12k: Make QMI message rules const
From: Kalle Valo <kvalo@kernel.org>
In-Reply-To: <20231217-ath12k-qmi_elem_info-const-v1-1-7ebb0de0a2b6@quicinc.com>
References: <20231217-ath12k-qmi_elem_info-const-v1-1-7ebb0de0a2b6@quicinc.com>
To: Jeff Johnson <quic_jjohnson@quicinc.com>
Cc: Jeff Johnson <quic_jjohnson@quicinc.com>, <ath12k@lists.infradead.org>,
 <linux-wireless@vger.kernel.org>, <linux-kernel@vger.kernel.org>
User-Agent: pwcli/0.1.1-git (https://github.com/kvalo/pwcli/) Python/3.11.2
Message-ID: <170309711908.1012170.4054276554183355555.kvalo@kernel.org>
Date: Wed, 20 Dec 2023 18:32:00 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20231220_103207_451030_9C10E5E5 
X-CRM114-Status: UNSURE (   5.35  )
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

Jeff Johnson <quic_jjohnson@quicinc.com> wrote:

> Commit ff6d365898d4 ("soc: qcom: qmi: use const for struct
> qmi_elem_info") allows QMI message encoding/decoding rules
> to be const, so do that for ath12k.
> 
> Compile tested only.
> 
> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>

Patch applied to ath-next branch of ath.git, thanks.

e7ab40b73309 wifi: ath12k: Make QMI message rules const

-- 
https://patchwork.kernel.org/project/linux-wireless/patch/20231217-ath12k-qmi_elem_info-const-v1-1-7ebb0de0a2b6@quicinc.com/

https://wireless.wiki.kernel.org/en/developers/documentation/submittingpatches


