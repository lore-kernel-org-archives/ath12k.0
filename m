Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D96BFC0219D
	for <ath12k@archiver.kernel.org>; Thu, 13 Feb 2025 04:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DpFojV8qvjKGTMHmuccqiv6sfbfKo8T3UgcGKfeRWYw=; b=rS4q6aLl48+6xjOwa2KG4JfMX4
	wGKGkMZECYZXSmEUtxdStWm8LzrBB7IcoOsGWDP0TuHisrvwqsv8oRAEX9pgtYvMvDkcdKjv+xEzb
	AslocmsXSXHB4Gc5BaQW0dvDRMZj1sEA+QL0C4L32t7NwS57/PcsxCuHtkT2S2PX6owE3BdiPlaUy
	gLZbDSXo+3sgDBf7zE+croFN1Pj9sh77Ie3CBe+ZbyAaJMak3FyoSaQ/YXhYEpB6O9UNd0Oslfr6Y
	zMYu4Bo6BCOjeVUnXO5iD9M4cqo+kUeqvvDoEd1uH1Xl2B7dW2v2luIsXEt4htlrfCR637JzMkXmP
	rNActJOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQRn-00000009eqJ-2Xzy
	for ath12k@archiver.kernel.org;
	Thu, 13 Feb 2025 04:03:31 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiQRk-00000009eot-2Yli
	for ath12k@lists.infradead.org;
	Thu, 13 Feb 2025 04:03:29 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 51D05gVI002731
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 04:03:26 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	DpFojV8qvjKGTMHmuccqiv6sfbfKo8T3UgcGKfeRWYw=; b=kKKPEjk3JyH0A+wt
	bYgR3YB8tfX++DdPjLNGdgm512dNz/nAR7yYYkismprtT/5SUrDWvaD2CnZpfGTl
	OqyHOu3c3wAEYKkti/W0trYzrEa7EUjz71d42axVKBZn8wX1oQCEJY8eegDUWNBb
	5GV4HGRCpHyt6P9cR5IyANSkjj1cbxivbydwmoU5jmD08O9EWpKFGTnDxtlK+9Lf
	oX8tSzQcc8JH0bEUAqXwrb2d69jRQHSTu6Dd8OQA7aqKuhQ+JkHVsN31HgmQaQwm
	7WhwpEDk05Bhduc6BWeBM38lV7N7KSG5aa7pfDc810jWXmzbiUrZh8AGGqulwpY5
	juX5JQ==
Received: from mail-pl1-f199.google.com (mail-pl1-f199.google.com [209.85.214.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 44s5w48fh5-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <ath12k@lists.infradead.org>; Thu, 13 Feb 2025 04:03:26 +0000 (GMT)
Received: by mail-pl1-f199.google.com with SMTP id d9443c01a7336-220cb5924a4so13918845ad.2
        for <ath12k@lists.infradead.org>; Wed, 12 Feb 2025 20:03:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739419405; x=1740024205;
        h=content-transfer-encoding:in-reply-to:content-language:from
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=DpFojV8qvjKGTMHmuccqiv6sfbfKo8T3UgcGKfeRWYw=;
        b=w982Mqn7cYxP6kdv/ywlBICZYaCg4HM6aOu92HmtxVrgv3UcSU8JBF4OveBaUagRZf
         OOkegE1fKx07UXhRBf6P1yScG6nVAcXFuR2xEVXc1++HlEmX8n/TK3yoaxiMOJ8oknGu
         SYkwn1P6lgRT5tOM4bt5CSnvG2SdHuyn911uICxXWrty4ufeVfbdc8PJphrZlg5aheFe
         hqh72gZ7tYxcHLWZtHvGieLs8SigocNtlSP6d/oJZ1C2hz8naPY7G1Qvj1bFM/qDaFoF
         Dg+ID2Uhf1U9h8q3/HnQMqya300EbkV1LsH5GQNfyiuV7jUcczZH5KO73Kj2NB3HtxLX
         0gVA==
X-Forwarded-Encrypted: i=1; AJvYcCW2DTLsXUL82DTt19l7rTgDcIWjnQSqy3vnSU+Pwx2TfKcZ6qYB0bxOGKCaaBuJf7MLFjKoyYU=@lists.infradead.org
X-Gm-Message-State: AOJu0YxoFdIbAl6EiXICbUCRoQK/a/kDjRRatwNBYjVtEBhvbH8G+0BY
	YfJRrPfUBWqNvWvoTjOqE6FYX1YGsNBrSQSmxVjp+rfyaAasD4h8+2BjKP1+3dCmJSBUUfQ6HtO
	6w8y7V2LIuSaxIy8o6qoJ+E9utkK72Ng68BmJaU3CYe3XhfsoWdfLCDdK+ObwxBtIaUiM
X-Gm-Gg: ASbGncu0ltYmp7tIHq2y9baDc2gs+17c6r3Gk2AdMH3svi5x8PSCqJ6QUalfxvJQA6d
	S6ZCYIZRXIj6uQ8whZHffsudaxRsFgCb+a3Ji8SFQAbS93kEGZPEc5j78NddSsRIcZRi9TLhJhL
	Xxp4zsri22l44/rw0YNcgDrCNVdymSSnl6W9S3SXeHvsiSnjhWFbZR/UcPzUGzwZkHiy0woQ2qx
	8jfO+CzPP4hH2i7l07/AOfUiWGv0b46urx3BEYfNd8fDwX3viMwDQmpu1M1AZJKOLMN0d3RqZ4p
	8BHcEU26yRcHliBZs3fQtwzwsFPBgItQ+xV2P7k=
X-Received: by 2002:a05:6a20:cd8f:b0:1dc:790e:3bd0 with SMTP id adf61e73a8af0-1ee6b33e920mr3631944637.15.1739419405490;
        Wed, 12 Feb 2025 20:03:25 -0800 (PST)
X-Google-Smtp-Source: AGHT+IH80RdQecEYqdXH6ZAQ1iJdmJuvwwgU8GSEsQt9vZpz7RCxE50/YAiWlbAGv60OBfGkMybPlg==
X-Received: by 2002:a05:6a20:cd8f:b0:1dc:790e:3bd0 with SMTP id adf61e73a8af0-1ee6b33e920mr3631909637.15.1739419405135;
        Wed, 12 Feb 2025 20:03:25 -0800 (PST)
Received: from [10.152.202.18] ([202.46.23.19])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-adb586186f5sm225806a12.37.2025.02.12.20.03.23
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 12 Feb 2025 20:03:24 -0800 (PST)
Message-ID: <78d9cf28-6fb0-44e7-8305-a2dc6b64a121@oss.qualcomm.com>
Date: Thu, 13 Feb 2025 09:33:20 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V10 6/9] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        ath12k@lists.infradead.org
Cc: linux-wireless@vger.kernel.org, Muna Sinada <quic_msinada@quicinc.com>
References: <20250213012439.278373-1-quic_pradeepc@quicinc.com>
 <20250213012439.278373-7-quic_pradeepc@quicinc.com>
From: Aditya Kumar Singh <aditya.kumar.singh@oss.qualcomm.com>
Content-Language: en-US
In-Reply-To: <20250213012439.278373-7-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-Proofpoint-GUID: RghmbJ_1ibCtYzUis7FsWpyRD95MppYz
X-Proofpoint-ORIG-GUID: RghmbJ_1ibCtYzUis7FsWpyRD95MppYz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1057,Hydra:6.0.680,FMLib:17.12.68.34
 definitions=2025-02-13_01,2025-02-11_01,2024-11-22_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 spamscore=0
 phishscore=0 impostorscore=0 lowpriorityscore=0 clxscore=1015
 suspectscore=0 mlxlogscore=895 priorityscore=1501 adultscore=0
 malwarescore=0 bulkscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2501170000 definitions=main-2502130027
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_200328_679236_2DAB9D78 
X-CRM114-Status: GOOD (  10.07  )
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

On 2/13/25 06:54, Pradeep Kumar Chitrapu wrote:
> @@ -3690,6 +3859,7 @@ static void ath12k_mac_init_arvif(struct ath12k_vif *ahvif,
>   
>   	for (i = 0; i < ARRAY_SIZE(arvif->bitrate_mask.control); i++) {
>   		arvif->bitrate_mask.control[i].legacy = 0xffffffff;
> +		arvif->bitrate_mask.control[i].gi = NL80211_TXRATE_DEFAULT_GI;
>   		memset(arvif->bitrate_mask.control[i].ht_mcs, 0xff,
>   		       sizeof(arvif->bitrate_mask.control[i].ht_mcs));
>   		memset(arvif->bitrate_mask.control[i].vht_mcs, 0xff,

No need of setting arvif->bitrate_mask.control[i].he_mcs with 0xff ? It 
was there in v9 and this change is not present in version change log 
either.


-- 
Aditya


