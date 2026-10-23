Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 67DB8606A31D
	for <ath12k@archiver.kernel.org>; Fri, 23 Oct 2026 11:04:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Kl1Y2p+5;
	dkim=pass (2048-bit key, unprotected) header.d=qualcomm.com header.i=@qualcomm.com header.a=rsa-sha256 header.s=qcppdkim1 header.b=iMu3X0qS;
	dkim=pass (2048-bit key, unprotected) header.d=oss.qualcomm.com header.i=@oss.qualcomm.com header.a=rsa-sha256 header.s=google header.b=ScLxMXwQ
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=oh/QdS08xJfzEXWANCAEwRTXrhSArUWUrXvKqVaiqaw=; b=Kl1Y2p+57tejrB
	2TSiVkhFanZYmKq/+ovUFK2CS9iDgVntedIBWkC3EwWHYQ6XYnWZ//TQ4X9HYHAr8aR1K+1KoCa1R
	wlzoNtZ3U8VsGpymO0D+q0Sl5zGwcxjCLybySqErw3YUP2rv2K5SRDgMK1QYwSysPy1qla05PCdn3
	RkYlpZZT0tZG6pomoUgd5/TDNdtFJe+JFKwTff0q06qqpDSLcwpZqw2Km8Lpuls7vEXRlNOZVTSsm
	GUNjuoonAzwsrtvGgTIFy1DLmu/furGX7WNcfSo3w0r3IPb+9PkxqOMRy3LmGu6pB4sDFD8l1TG7x
	ViSjI5TUx16MWg5+l65A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD4V-0000000GCfq-1jEZ;
	Fri, 23 Oct 2026 11:04:27 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKD4T-0000000GCfR-2ge9
	for ath12k@lists.infradead.org;
	Fri, 23 Oct 2026 11:04:26 +0000
Received: from pps.filterd (m0279864.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.11/8.18.1.11) with ESMTP id 69NAAbMS980702
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 11:04:25 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	oh/QdS08xJfzEXWANCAEwRTXrhSArUWUrXvKqVaiqaw=; b=iMu3X0qSt5TaM3nW
	0oozGAtXDxhSbVtLh68cJA2UWMOEtoO84ClDNwE8ExLD+DEBXllUtfLQ/z14Rs9s
	e/mAFtKdSbp6xLWlePsoZnsOerr+ieCU1VaR9zu20Iwhtdo9YQnH67mmdLuy/YWj
	YAMLinphnYN2qFt+mHLZvZzoNKODmkeZwUwBNgFopU9anhdk1M9QfjjAwiDMnMvr
	QifsgW4yw2pFApPHj96dprUM8PAQvUKL6IACuWW6/SC/aT+WYoiOPWkQD4Xh4mi4
	T2RxTxR6EV1UgschO3NPQS9y+I9wqmFEf9gc4C43F3/++fiZo0sM7mnzpzxEZEV+
	hxbdig==
Received: from mail-pj1-f72.google.com (mail-pj1-f72.google.com [209.85.216.72])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4hfsmatt6r-1
	(version=TLSv1.3 cipher=TLS_AES_128_GCM_SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 11:04:24 +0000 (GMT)
Received: by mail-pj1-f72.google.com with SMTP id 98e67ed59e1d1-39de4e72b33so1166242a91.2
        for <ath12k@lists.infradead.org>; Fri, 23 Oct 2026 04:04:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=oss.qualcomm.com; s=google; t=1792753464; x=1793358264; darn=lists.infradead.org;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=oh/QdS08xJfzEXWANCAEwRTXrhSArUWUrXvKqVaiqaw=;
        b=ScLxMXwQKXuNJ3rt19kC16jT4+tLUoXHsJXAnmdFB433KW8Xz2exQRYdf6jRl/CstM
         Pf1Pe/vmwLlA4NDeuSkZuItobwGuKZ+KhDRtXKhr2vilN9+Y3FtzPjRdkyIX69kZYE0m
         ncrCrjNro7m7oMjSiGuQdsLa7Tlb1E41J86fhOLeEh3nrN1JoCTIE8l/+YwWGTJ0dXnX
         jicdDhfquVnlqsQ1gU5Hc8UrEuSbLE8FHqKPiEI7Qj3G88AnyYZ3lycngURnS8xBX64m
         NC8LYZ64Z0ECPgZ3wQBKpqms2gC8+mgb7gk5ZXrwzkyWt6o9xO++PyPM/CJNsfYYfSY5
         wDBw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792753464; x=1793358264;
        h=content-transfer-encoding:content-type:in-reply-to:content-language
         :from:references:cc:to:subject:user-agent:mime-version:date
         :message-id:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oh/QdS08xJfzEXWANCAEwRTXrhSArUWUrXvKqVaiqaw=;
        b=Sr35HL4Nquap/WfOtTHiBVvRlg2CxOpvIYDKg0bqcTiSWwgLLkdtGoKjefC8HlxE/a
         fGYO/V/p12PlOKA7lXN/IIFuVNTC3pOdImoB78vsrWNNHkc95WTiuN/35UdJm3M4CNDe
         TTXCgQgtMKbGdrmKS+6EgXz8xVnI8a9vE23ZCncgSeX5ZPslzEzaDIpYdLRzQLbt77v7
         WymnJA6mBNN3gg9QwpEZkUzgajHOzRWpl2Lr/Mpxe/c3rzZvx6B8NbPpUZjNiZiEjoRq
         yqnyB2+RZB/z3+x2OYpX8W9PWWBT9Lp05xT5AXsxpCvt2jB//82TiCVQkbWuKRXDxbdf
         mG2A==
X-Forwarded-Encrypted: i=1; AKwUvBzatmS1O58fXxjXTCOAzin6KBFxsmMWwzxHFPMU7ySD6JrRuio19rqyeeYtGG202pOYlS5mggU=@lists.infradead.org
X-Gm-Message-State: AFq9FYJuVmQtDId2ZL95ufVYxU+B9zDl9MGTU0fsu7aVZJCjmqT8Rpac
	MnV2Gj+PUnLzg3kGPlxzoUBJhrYqY1pTguR/Wb5TnYkn7+O37cyZyvp6dTizz0JPs59jORDTnRF
	4UeoS4fOL5DM5LGp4Y/dnwo7ewDJfJNRWBjOaZri1ARPl/opgbXCgCl5wcSR/Oeai
X-Gm-Gg: AYBFou3zqm31kaIrhA1Uh/NXa6urgJdIji0mihpFfgN47J1dSkKmIPEW0LGjHIsWgja
	01VeMty6U9XVjF0Lz4LoNVhV5pWSh2tkMvj0jUQZhul9xGaAeoTVu/8eUDF47gR6epApJcn8IzL
	awb0uypTIFOxNy1ypjaLhozNq28Q1RJJLLcEGhMwTmmlNwBd3FFBgnCmw4UFEAll0r9DkQ95Uh1
	KfarAYJT7fyPZPX27BmZEwyplKfkwea1Q1Nu2eNQRO9TLhu02ZIZ76vFtOniqPRSKZrCf5kXEMQ
	QHeHwLhaw1IU3rLHpR4gMAJnjN7LIA24p4K9+Eu5se8W5MTgHsSWZvn7+/KweaRrva0hB6T3BGj
	WeI2r+bGTMraTQH5hAyNCx7UfSQb1sr0RadAaYZZBKO363HlsvDpTtxdPR19/aTxhFs9mh5FN
X-Received: by 2002:a17:90a:e7cc:b0:3ac:aa8d:19ee with SMTP id 98e67ed59e1d1-3adce072ec7mr1631684a91.38.1792753464054;
        Fri, 23 Oct 2026 04:04:24 -0700 (PDT)
X-Received: by 2002:a17:90a:e7cc:b0:3ac:aa8d:19ee with SMTP id 98e67ed59e1d1-3adce072ec7mr1631641a91.38.1792753463298;
        Fri, 23 Oct 2026 04:04:23 -0700 (PDT)
Received: from [10.133.33.125] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-cd8ba89f984sm650235a12.16.2026.10.23.04.04.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 23 Oct 2026 04:04:22 -0700 (PDT)
Message-ID: <2467a07c-e215-4cfa-82ac-22214a144dae@oss.qualcomm.com>
Date: Fri, 23 Oct 2026 19:04:19 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-current v2] wifi: ath12k: fix DMA direction for
 re-injected Rx buffers
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
        Jeff Johnson <jjohnson@kernel.org>, Kalle Valo <kvalo@kernel.org>,
        Baochen Qiang <quic_bqiang@quicinc.com>
Cc: Jeff Johnson <jeff.johnson@oss.qualcomm.com>,
        linux-wireless@vger.kernel.org, ath12k@lists.infradead.org
References: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20261023-ath12k-fix-dma-mapping-for-reinject-packets-v2-1-9f436a26dd72@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Authority-Analysis: v=2.4 cv=V7LoQuni c=1 sm=1 tr=0 ts=6adb3f38 cx=c_pps
 a=RP+M6JBNLl+fLTcSJhASfg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=660iZSQnnn4A:10 a=s4-Qcg_JpJYA:10
 a=VkNPw1HP01LnGYTKEx00:22 a=u7WPNUs3qKkmUXheDGA7:22 a=DJpcGTmdVt4CTyJn9g5Z:22
 a=ibqxR-RKkZcGmlNDQqMA:9 a=QEXdDO2ut3YA:10 a=iS9zxrgQBfv6-_F4QbHw:22
X-Proofpoint-Spam-Info: AW1haW4tMjYxMDIzMDA0MiBTYWx0ZWRfX9X2LFgCQVbvg
 Dsj3+uUQb6YpDo2kFVFHoEhAopQMfLffVlCMIp51onuC/YuoHNMS3nNC2BRlf5dtlb4vrnQwSkF
 k4sbOsijfc+OZyI2aifLKLRkf1RzYrI=
X-Proofpoint-GUID: mfrAXCXgqwyjO4T2py3momjiGEBU7-Ls
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjYxMDIzMDA0MiBTYWx0ZWRfX/uN7vitKRFBL
 okW4aUM79VllKhuBMB1lgmiLarmD2PtM4ki7yqzz3k3+KojK4T2gwQfmPeOMld3H46z7jTqQFba
 7jV/IWwajgrpFtyKMnIQ7+TrtyRDyryhzRL5U8OZ8/bTqbwGYnHciK89T6QJxH65ur6C4S13Tov
 oUVL1TN+yuwzCfYnoiO6ryNdeUghkOvMsyhOgmJ6ETPbN8YUOqxJI7fHUhEyBY+eVe1MATyE3X/
 oStayOP2SDs3uDvmdVLNCQnMbqeqUbjolorBeZqkB5Ot2wHntOmhlE2l8NzPQZ++PG3WZxwjZTL
 bfUHZCZXiEvzcyBOnum92rLeaAfHe9iCl6VivDSqnOiyPhUx016rd3u2IlNjvnDTDylsG1DuBI7
 D1YTuTsOTPFA7yPywpbniM/4k39W8GT3ZCqaYi1h+qi1AQWFVFhmcsMkmyYycMplDYk4PlS2nnl
 yXCLES7N2N9pdTGmHFg==
X-Proofpoint-ORIG-GUID: mfrAXCXgqwyjO4T2py3momjiGEBU7-Ls
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1176,Hydra:6.1.138,FMLib:17.12.100.49
 definitions=2026-10-23_03,2026-10-21_02,2025-10-01_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 suspectscore=0 adultscore=0 impostorscore=0 bulkscore=0 lowpriorityscore=0
 malwarescore=0 priorityscore=1501 phishscore=0 spamscore=0 clxscore=1015
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.22.0-2610190000 definitions=main-2610230042
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_040425_690929_292F0E89 
X-CRM114-Status: UNSURE (   7.87  )
X-CRM114-Notice: Please train this message.
X-Spam-Score: -2.8 (--)
X-BeenThere: ath12k@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <ath12k.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/ath12k/>
List-Post: <mailto:ath12k@lists.infradead.org>
List-Help: <mailto:ath12k-request@lists.infradead.org?subject=help>
List-Subscribe: <https://lists.infradead.org/mailman/listinfo/ath12k>,
 <mailto:ath12k-request@lists.infradead.org?subject=subscribe>
Sender: "ath12k" <ath12k-bounces@lists.infradead.org>
X-Spam-Status: No, score=-12.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



On 10/23/2026 5:25 PM, Lorenzo Bianconi wrote:

> @@ -983,8 +980,8 @@ static int ath12k_wifi7_dp_rx_h_defrag_reo_reinject(struct ath12k_dp *dp,
>  	list_add_tail(&desc_info->list, &dp->rx_desc_free_list);
>  	spin_unlock_bh(&dp->rx_desc_lock);
>  err_unmap_dma:
> -	dma_unmap_single(dp->dev, buf_paddr, defrag_skb->len + skb_tailroom(defrag_skb),
> -			 DMA_TO_DEVICE);
> +	ath12k_dp_unmap_rx_buf(dp, defrag_skb);

buf_paddr has not been updated to skb_cb->paddr when we reach here. v1 has

rxcb->paddr = buf_paddr;

before jumping, so v1 is good.

