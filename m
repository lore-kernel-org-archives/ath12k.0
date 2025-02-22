Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA5EBC021B2
	for <ath12k@archiver.kernel.org>; Sat, 22 Feb 2025 06:21:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NLuS/fQFdeAUaLvtNfjMp5wzz4vO8rZ8NdHQnoz6Qu4=; b=SQyMyaWk5P24XMg3X4niHvWqY5
	sf1cYAUq5mFxcYb+qrFxX8iRT+J0lo8YoXiHHETPmPnRuD/zABsNZ0pXJuGyddiRZFK9xOEMurxsk
	u1NMCvqEf8jDFQVRPOAuUwBlOPii4HpPoN+v1zCYnYAUNfOxA0p8yBJDQ+3EzEh0CE+2IOYAiLaCz
	xyJsBmpad8w9juhQJtb3fzqGaXhDzzpf1h8tKi5xa7NcnoauP+YRMh/l3YXV+7pBx8jW9xB0S6cyz
	AsJ7Om6em2S/eZZaEGCipFifz0AoRM1DLqw44HDPOF+hiR0Gf7TkIC3/ejOXDuawL+v2iQdKHsCfX
	UDxrSKlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlitI-00000007WcR-2Lig
	for ath12k@archiver.kernel.org;
	Sat, 22 Feb 2025 06:21:32 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlitG-00000007Wc3-2FNb
	for ath12k@lists.infradead.org;
	Sat, 22 Feb 2025 06:21:31 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51M5wbik022370
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 06:21:29 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	NLuS/fQFdeAUaLvtNfjMp5wzz4vO8rZ8NdHQnoz6Qu4=; b=VDLC9YLnsGpHMSAV
	m9LXA2Fjc+o2KAp2tFIUMtUECZHLk6Rw2sivhTiUwboRMTokBOxyIhKncepow18x
	6VX5aSnsaM1QUY9A9WGd1akJ8qBgmqV2ofCqKn5zwfXtBgSCbrF6qXzlGiMcq1Pz
	dyJz9oOuo5c/buwuq1PgJ2JI7ziDSKjEkv8u6718ZDRJKl/kFW+1CRXi7AOirE4Z
	xXaKqHoxZMioi2P/p58EF4ubSdT4zGje06wcMeXx3bSuDt9TM6hxfUO4U/D17Es/
	htirnhk0VOfjcC1gOeVdgUFdM/9XOIWVcAVDvhi+FvUbwEXjhp1r/0TvgDFwBP5V
	RsSykg==
Received: from mail-pj1-f70.google.com (mail-pj1-f70.google.com [209.85.216.70])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44y5hrrach-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Sat, 22 Feb 2025 06:21:28 +0000 (GMT)
Received: by mail-pj1-f70.google.com with SMTP id 98e67ed59e1d1-2fc1e7efe00so6090264a91.2
        for <ath12k@lists.infradead.org>; Fri, 21 Feb 2025 22:21:28 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1740205288; x=1740810088;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=NLuS/fQFdeAUaLvtNfjMp5wzz4vO8rZ8NdHQnoz6Qu4=;
        b=I+LYE+m5hUVLvNp/MI7D72CJNx4y/wZ4mDFQDMAodiZsa/6GpzxmpnFHkY6XG5Wp4K
         Z6Ylm1rI9TkfIqQBPh4tIvjNxYIM7sxrGac/3ldsOaqz3fx84+RcsYxF9ZBm2pCtIyn7
         ar0HPGuAUmZTQZ9+1z9iAcs99IIoqYNG+aSpCtUk4ss9dmyyaQQwEHqzBwYK7YfGOU4y
         5iNAvkggMWwGgtYEOoz2rljmfSorcicJRO9cH34iqp/dFvKl/+2o8JsHwrzh80xXamZW
         0Z2bTR36RBTjUuZAyhGpnYXDxdEa8m2NorDCm/AzOwdUSpFLoX6oe0yJCoJnD4BnLRd+
         YiTA==
X-Forwarded-Encrypted: i=1; AJvYcCWYy3/eFQBidxdo03T4NT6bKxRqXD1xfMCst5DKuDfvU7hmpqe4vN4AGrMwkpWwXP/l+HXgbnc=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywfovj5JzWXmLW0VesHwdkpX1W4zJFOi28/NTxdT73iMCbOPiRf
	UeKjoPXwbAkIvMgiFh2HRCohU6VdGm85jYHIloyRBzsrfnV3lShaPIMLg3V2s+it4cQeijw7bL/
	KbDZg8DpdsueucNwHUSMRIzXjuiWkumzGfgsMU0aKuco7s6Y7bECA6On+4Uev
X-Gm-Gg: ASbGncvKjuHVEO3wqzYhNTW9WzOY74V9WKlS/JGvrKGH8fZZpYp3calhu7sf4nC1/8L
	bhVaI4WmFiSAxa8uQZatk9NqRLK6atkJhJPN2alNxmsrKbudpHIDG3yYRegriXnrW7eANLyyQxo
	yRRNPmE2fZ5MY+aWDtM030/a17M3/LbiEXCZkyP4GQs6ysUgPmff6oNPiRmHlNGzJ88YoiBYKpu
	0eVRM/6r9Mr60fR9vQh2imrEoEKINTikugtMAYRghjjpEae7wPsx0iUApMV8s2JsbSQGJ+4kE2d
	V1wDN1iiZT6043Q8+WzAUdgZtSlX69MnU8+zF8yxgq2YZpc42YMPI4vXtj+z
X-Received: by 2002:a17:90b:5201:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2fce86af0b9mr11037807a91.14.1740205287995;
        Fri, 21 Feb 2025 22:21:27 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH3E4+j/BLmEF4Q7LW9se54I5K4FhcH0koIkMPTHuO6ghxRVZsQFseo/0mgOCw9usR/9gRcwA==
X-Received: by 2002:a17:90b:5201:b0:2ee:c6c8:d89f with SMTP id 98e67ed59e1d1-2fce86af0b9mr11037768a91.14.1740205287621;
        Fri, 21 Feb 2025 22:21:27 -0800 (PST)
Received: from [192.168.225.142] ([157.46.94.4])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2fceb05f885sm2440615a91.26.2025.02.21.22.21.25
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 21 Feb 2025 22:21:27 -0800 (PST)
Message-ID: <a9f4e06a-1d77-5ab8-83a2-59e2920d8dc1@oss.qualcomm.com>
Date: Sat, 22 Feb 2025 11:51:22 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH v7 7/9] wifi: ath12k: fix NULL access in assign channel
 context handler
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org
References: <20250222033002.3886215-1-quic_periyasa@quicinc.com>
 <20250222033002.3886215-8-quic_periyasa@quicinc.com>
From: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>
In-Reply-To: <20250222033002.3886215-8-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-ORIG-GUID: Az2A0afTzHXgGGk_28LshLZEeOUCob8_
X-Proofpoint-GUID: Az2A0afTzHXgGGk_28LshLZEeOUCob8_
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-22_02,2025-02-20_02,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 mlxlogscore=987
 priorityscore=1501 lowpriorityscore=0 adultscore=0 spamscore=0
 malwarescore=0 bulkscore=0 mlxscore=0 suspectscore=0 impostorscore=0
 phishscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2502100000 definitions=main-2502220048
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_222130_618991_5DFB1F69 
X-CRM114-Status: UNSURE (   8.62  )
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



On 2/22/2025 9:00 AM, Karthikeyan Periyasamy wrote:
> Currently, when ath12k_mac_assign_vif_to_vdev() fails, the radio handle
> (ar) gets accessed fom the link VIF handle (arvif) for debug logging, This
> is incorrect. In the fail scenario, radio handle is NULL. Fix the NULL
> access, avoid radio handle access by moving to the hardware debug logging
> helper function (ath12k_hw_warn).
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.3.1-00173-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Fixes: 90570ba4610b ("wifi: ath12k: do not return invalid link id for scan link")
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>

Reviewed-by: Vasanthakumar Thiagarajan <vasanthakumar.thiagarajan@oss.qualcomm.com>

