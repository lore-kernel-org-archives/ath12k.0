Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 04FF8CCD187
	for <ath12k@archiver.kernel.org>; Thu,  9 Oct 2025 07:58:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sjBxU5GmKJljpC5RlW25Sr2TYBc+Ri11gCihrueEv90=; b=4cMC/aRxLOFrZ27OwbxSlRaR0J
	UB/TKTCUtFh5zzsXMqNAoEI4jxQ+NMdcEce2wBOPXDIWyzhZPKKqKbUSsAw8pBGxRsO4Djc7Nln1w
	mLip1kDDk5/c3kk0QBdbWB+0Pv3T7N2yuQcARPVsV+55mDcN2phic/E2oZF3INgLBN18eOcGgTf97
	soF37pamPqxIpRjaLKZ5RFrPemTZljTbjLqyoA59egDQHL2wtzyJVJ/whuTSRXiJkwSgYJkKwZpBk
	ip1zv1LRoFdV/coJ2HvL9WT1n/EjqBtogtq7CRegvyZJv3bR803wTxYbxXvIByHbiQWxDsj3UMmay
	6/aSOTsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lXE-00000005QD3-2qxv;
	Thu, 09 Oct 2025 07:58:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lXD-00000005QCj-0PP0
	for ath12k@bombadil.infradead.org;
	Thu, 09 Oct 2025 07:57:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
	In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=sjBxU5GmKJljpC5RlW25Sr2TYBc+Ri11gCihrueEv90=; b=dzG+uWwUyKouu6NA2VkugJTC42
	XsbQDQyAjEOAoErAh/okaKJ4MD7EFk7qiCWeuey8LuiplIU2ALKozFo1qlHSqTOqA8v9cgM+hy1/i
	RNDucyLJMooKrTZ0fTKpMktOF5Cso6lYskz7AxdNhl5rY5MRF+i3zrV0jWX/jibcEu2637Vru5bcO
	QacbBqGWXBL1SFHpo6E9KwvpNhEQ4Cz9v//SNgz5N77rZAWl5IInh6QAKwv+psJp9d/bqtDMwOTRm
	gY/w329iV5gkI4K6oaPHECJOTS0rwLREUtzZgM5yL4edcZRGSjrDIciWJ+3v4thfyk7YDxVwLJiaj
	dHHhbfIA==;
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by casper.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v6lX8-00000003kYN-26qw
	for ath12k@lists.infradead.org;
	Thu, 09 Oct 2025 07:57:57 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 5996EMKr028523
	for <ath12k@lists.infradead.org>; Thu, 9 Oct 2025 07:52:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	sjBxU5GmKJljpC5RlW25Sr2TYBc+Ri11gCihrueEv90=; b=jaO4Wkuth7JtrG/f
	4v/VoPGv+JQJ4KNSOcUhSON3q7OIbhOa9x3bkAEf4pwvSCGUg4F3eZN9BESiHo0/
	hVlN/EnBDQ9G/W35939sQaX3o2B1v+W2ggKParT7vJyAgA3YXSj85+pYvJqfOVCG
	0ucQxTYtKNDW4MLzAUWdipJpPg3GeTSVarUsYyWGukGnmOj64rvhtf4lj0Ve5vVP
	LaoA7POaiv1uVy2o+Jc0sX1aRQoTECg5Pfgq28SloiHXzU9xxJX/k/I0T9mgCuof
	yAOQR+0/dsIx46UgpseXLCQwx/bBvqPfqoVVHyYSFlJqyXqOm2kP8uvs2covWtBP
	odjg2g==
Received: from mail-pg1-f200.google.com (mail-pg1-f200.google.com [209.85.215.200])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 49nv4ksx4w-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 07:52:41 +0000 (GMT)
Received: by mail-pg1-f200.google.com with SMTP id 41be03b00d2f7-b63038a6350so2213888a12.0
        for <ath12k@lists.infradead.org>; Thu, 09 Oct 2025 00:52:41 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1759996360; x=1760601160;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=sjBxU5GmKJljpC5RlW25Sr2TYBc+Ri11gCihrueEv90=;
        b=CoyixOUp9+u9wuieNMtMiaNpqDVqrfUbNGXudmTCXM5oZZKTcHiwPweDms/DkDBP4e
         3XJiziCaHaphKRmR4tOzrZ5iWaG2URniknTBxpahxSNjjv8T9GH/dS81XnDKTrh5HRdn
         yFr4D8UGwZ4B/kgOUPyBoXvPvhQcKXSGMNVgFVAwaR6Z6LYJunytG+4GcjmmYSFF8RpN
         /38IEqBc96N7pBTIYqoBI6wIRbW6q5I/eYy1bCqILvNNbiBap28jy1tqTMTIbW88LIbp
         R/6gICO/TcGwcUOwwoNi91UQS//SmMThFouvT6VeB4TBe0tGDxoTYKkuWra54jYpA04n
         OysQ==
X-Forwarded-Encrypted: i=1; AJvYcCVeuQV0oEZUCoaZ3egYualjvEHZlE7LMeBehlUxM+/6AURyla2zcdHLl9QN08JrJ4D/z8tIxo4=@lists.infradead.org
X-Gm-Message-State: AOJu0YzUwe6Al+K3RQ+VckzdN/1eA2bZnHb3g4L1K65SSEBTOv5I0Mqs
	+uMW94OpP6K2cYtNk7QaWbFjeaxyKLvYkrVxf2rVM+TD7f7BFOSID8ZqEPRSr++o9GmAUimsoqK
	oEfqr8VYHCu5ZmJGDBeWeItLVuQ4/f+1I74sl7Wchoq0w8iNesYU7L1yT3fbQrj93
X-Gm-Gg: ASbGncsQ7l6Oabt/YIgU/Qhr0ibomZzwFT31gZQ5jpp/NQwXqViAQsLAnauVtYfhORq
	gOqybu14cyZ1lfjjLSfg1eTLokX6j4BzAv2hG0rYOfG6qsGVna24zK+xjygsJSIEze3iBovQJtJ
	/eKveUIOR5h19Vq9myQfGmQuDU98pq//2I2Lt6I7hSpiM8WYF4MQ0Il9GcZ5FHETrC9F1j8sO76
	u5tFjNh1mYkElpLzrlKObUeTBXEmWTwlSXd8JfoyfdW3mBtLQdvwU0jV1A2Dw9ve5ldyKuitswr
	wUw2uXd47Rz/m9auCgt12m+eKSRuUuWMfozXfMIIXBwMiNkbXd4DybCisxxfJUVxvS5SLKN3UBI
	YI9kYxoV1gRSitGWLOv9PPZ2YO61pfYx6ntX4TA88Av8=
X-Received: by 2002:a17:903:2c03:b0:279:b2cf:26b0 with SMTP id d9443c01a7336-28ec9c97450mr130060175ad.14.1759996360595;
        Thu, 09 Oct 2025 00:52:40 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IFp8+6ovArh7jZS4tcGwwokh9/VJpOZgph5nDQI4KG2pGwZUoAIVvoiD6PI+5CSXtkxXLHORw==
X-Received: by 2002:a17:903:2c03:b0:279:b2cf:26b0 with SMTP id d9443c01a7336-28ec9c97450mr130059915ad.14.1759996360160;
        Thu, 09 Oct 2025 00:52:40 -0700 (PDT)
Received: from [10.133.33.228] (tpe-colo-wan-fw-bordernet.qualcomm.com. [103.229.16.4])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-29034f93b66sm19682165ad.124.2025.10.09.00.52.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 09 Oct 2025 00:52:39 -0700 (PDT)
Message-ID: <d2c0cc75-6ec3-4566-ab5c-1757d1a753de@oss.qualcomm.com>
Date: Thu, 9 Oct 2025 15:52:35 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH ath-next V16 2/2] wifi: ath12k: fix TX and RX MCS rate
 configurations in HE mode
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Baochen Qiang <quic_bqiang@quicinc.com>
References: <20251002000732.1916364-1-quic_pradeepc@quicinc.com>
 <20251002000732.1916364-3-quic_pradeepc@quicinc.com>
From: Baochen Qiang <baochen.qiang@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20251002000732.1916364-3-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUxMDA4MDEyMSBTYWx0ZWRfX7BBj3hC4zCP4
 J5sMMfh7zfa5bt58YIUC+XJ8R0cPjnq6s38nZyzcRySAEsTzqIt5YQ+3gtF1MWcmEDKI146tAQ4
 GhGThgEm0/ONzf31gT/296vdknxNMPei2GXwpz5cRh81b9fW83AW3H+i7k4BIlwYLUTRaCYpXAV
 zphwwVyzefovzWJcJcGrk05/G8jSguL5cOBcN1Ae6SkwcEYm8nogkZ9KLSXqXuyPQ1RuPvvoEQv
 fKiOt98ucQoayti+5uD1QhIDjddAEqbT42Z/sY2DoDA0Uk6BIezrlrOJidpu0lfa1zuAeDHSPgf
 Ald5fEqi1C8EFCaT3a78H0GOkPp8iGamfGUbgo/xdLZFlTyijJw8mjQiXxt/YxWAfsvYImanegr
 KITGtSHb84jaj8vm5BhWmdGDfUYvhA==
X-Proofpoint-GUID: 63B26NOPEGXvecUtvqJS-wysKqbJ4uJ9
X-Proofpoint-ORIG-GUID: 63B26NOPEGXvecUtvqJS-wysKqbJ4uJ9
X-Authority-Analysis: v=2.4 cv=SJxPlevH c=1 sm=1 tr=0 ts=68e769c9 cx=c_pps
 a=oF/VQ+ItUULfLr/lQ2/icg==:117 a=nuhDOHQX5FNHPW3J6Bj6AA==:17
 a=IkcTkHD0fZMA:10 a=x6icFKpwvdMA:10 a=COk6AnOGAAAA:8 a=ZkQ9Z5jrJcQJduYU1mwA:9
 a=QEXdDO2ut3YA:10 a=3WC7DwWrALyhR5TkjVHa:22 a=TjNXssC_j7lpFel5tvFf:22
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1117,Hydra:6.1.9,FMLib:17.12.80.40
 definitions=2025-10-09_02,2025-10-06_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 malwarescore=0 suspectscore=0 impostorscore=0 spamscore=0 phishscore=0
 clxscore=1015 bulkscore=0 lowpriorityscore=0 priorityscore=1501 adultscore=0
 classifier=typeunknown authscore=0 authtc= authcc= route=outbound adjust=0
 reason=mlx scancount=1 engine=8.19.0-2510020000 definitions=main-2510080121
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251009_085756_059040_094D6A35 
X-CRM114-Status: GOOD (  13.93  )
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



On 10/2/2025 8:07 AM, Pradeep Kumar Chitrapu wrote:
> Currently, the TX and RX MCS rate configurations per peer are
> reversed when sent to the firmware. As a result, RX MCS rates
> are configured for TX, and vice versa. This commit rectifies
> the configuration to match what the firmware expects.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Fixes: d889913205cf ("wifi: ath12k: driver for Qualcomm Wi-Fi 7 devices")
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/mac.c | 5 ++---
>  1 file changed, 2 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/mac.c b/drivers/net/wireless/ath/ath12k/mac.c
> index 0d425a1bc0ab..19be450b42ff 100644
> --- a/drivers/net/wireless/ath/ath12k/mac.c
> +++ b/drivers/net/wireless/ath/ath12k/mac.c
> @@ -2624,9 +2624,8 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
>  	switch (link_sta->bandwidth) {
>  	case IEEE80211_STA_RX_BW_160:
>  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_160);
> -		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
> -
>  		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
> +		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;

missing recalculation of v for TX MCS 160 before assignment to
arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160]:

		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_160);

>  		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_160] = v;
>  
>  		arg->peer_he_mcs_count++;
> @@ -2636,10 +2635,10 @@ static void ath12k_peer_assoc_h_he(struct ath12k *ar,
>  
>  	default:
>  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.rx_mcs_80);
> +		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
>  		arg->peer_he_rx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
>  
>  		v = le16_to_cpu(he_cap->he_mcs_nss_supp.tx_mcs_80);
> -		v = ath12k_peer_assoc_h_he_limit(v, he_mcs_mask);
>  		arg->peer_he_tx_mcs_set[WMI_HECAP_TXRX_MCS_NSS_IDX_80] = v;
>  
>  		arg->peer_he_mcs_count++;


