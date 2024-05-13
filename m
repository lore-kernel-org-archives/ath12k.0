Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2B88C25B79
	for <ath12k@archiver.kernel.org>; Mon, 13 May 2024 23:31:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=stdxCUCTG4Tu5RjdGtgCgwWooLwi/XToQAgw3DMRbjs=; b=DZIqg0CrIwRWL8+i74Vht2Uitq
	6ob8lSpsU/NNGb6RW80Z6WJOR+USJSMKHi5t42Bj37oyU/JJ+rM6KlQQK8VqLVlr1NijSMgVJORr6
	NFNPFnGwBs/D9Zf0f2tzJ+s8w8Yj14fMFfDKfFWXGAyhPM7iJGll6dp8EXQM4mgYkhA1wj762A7NV
	n408VzHUgpNEN5w+tXdk9Szk2EMvhmFrKtKrmmSZ+y+wDgdn6YDEWr06LQWWz11f4s2wGLaSfFVb2
	t7dmGWrrWv6eN6ugb2ftM+JvS5B9PdwAWx/Keh4uwg8UAd1dL3Zq64e+gkOW50ediMM/XvW02fZid
	PbDNtyZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6f8x-0000000EVjQ-1tZK
	for ath12k@archiver.kernel.org;
	Mon, 13 May 2024 23:31:43 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s6f8k-0000000EVfz-3jp5
	for ath12k@lists.infradead.org;
	Mon, 13 May 2024 23:31:41 +0000
Received: from pps.filterd (m0279867.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 44DJ9BLA001659;
	Mon, 13 May 2024 23:31:30 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=stdxCUCTG4Tu5RjdGtgCgwWooLwi/XToQAgw3DMRbjs=; b=Qv
	1uSelxI2JD7SQUqpA9zJLPBkUsy8VOJjxTrByO1pg4wLKphCQZHZjbGlw2sJ+4Eu
	Z0UHNe2W+BcKC5U7BOEFWojYFR0btcAizTzyugXZ0D//jmh6NR8WPuvrU1WMS7Ij
	uCHp6S+UxHlT3OdqttM7kpo9j9+eIt1z+cHHcClh9rXx7eEuco3ZZkj6jByIIQFN
	Wp9xLXHW26ZGGLMPMsr6SVcd0YUA6CAQbFkwYfxTAjzLKmpaLlyjvW1VuMDCTK6I
	kS1t57Lsg3VglpZPztkiEVTIuQIl6M11zHJn2f3Z5b+X67LYzYriqHzWLqytv6O3
	SEOG56rKW/oY3IruHh3A==
Received: from nasanppmta03.qualcomm.com (i-global254.qualcomm.com [199.106.103.254])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3y1y9kvuah-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 23:31:30 +0000 (GMT)
Received: from nasanex01b.na.qualcomm.com (nasanex01b.na.qualcomm.com [10.46.141.250])
	by NASANPPMTA03.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 44DNVT0M013978
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Mon, 13 May 2024 23:31:29 GMT
Received: from [10.110.0.4] (10.80.80.8) by nasanex01b.na.qualcomm.com
 (10.46.141.250) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Mon, 13 May
 2024 16:31:29 -0700
Message-ID: <7916534b-ee14-4b95-b339-d614ce9393f1@quicinc.com>
Date: Mon, 13 May 2024 16:31:28 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] wifi: ath12k: use correct MAX_RADIOS
Content-Language: en-US
To: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240511013644.3103905-1-quic_periyasa@quicinc.com>
 <20240511013644.3103905-3-quic_periyasa@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240511013644.3103905-3-quic_periyasa@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nasanex01b.na.qualcomm.com (10.46.141.250)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: F_edr42BTH3FD5XAYO5o2zTFVDJrvEDm
X-Proofpoint-GUID: F_edr42BTH3FD5XAYO5o2zTFVDJrvEDm
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-13_17,2024-05-10_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 bulkscore=0
 priorityscore=1501 malwarescore=0 phishscore=0 mlxscore=0 suspectscore=0
 spamscore=0 clxscore=1015 impostorscore=0 adultscore=0 lowpriorityscore=0
 mlxlogscore=999 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405010000 definitions=main-2405130161
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240513_163130_969771_087A0823 
X-CRM114-Status: GOOD (  15.43  )
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

On 5/10/2024 6:36 PM, Karthikeyan Periyasamy wrote:
> The current value of the MAX_RADIOS define is 3. However, this value is
> incorrect as the maximum number of radios supported by all devices does
> not exceed 2. Therefore, the MAX_RADIOS define should be modified to 2.

Use imperative tense: Therefore, modify ...

What is the observed problem, if any, with the current code?

> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> ---
>  drivers/net/wireless/ath/ath12k/wmi.h | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> 
> diff --git a/drivers/net/wireless/ath/ath12k/wmi.h b/drivers/net/wireless/ath/ath12k/wmi.h
> index 496866673aea..27bec3800bff 100644
> --- a/drivers/net/wireless/ath/ath12k/wmi.h
> +++ b/drivers/net/wireless/ath/ath12k/wmi.h
> @@ -4770,7 +4770,7 @@ struct wmi_probe_tmpl_cmd {
>  	__le32 buf_len;
>  } __packed;
>  
> -#define MAX_RADIOS 3
> +#define MAX_RADIOS 2
>  
>  #define WMI_SERVICE_READY_TIMEOUT_HZ (5 * HZ)
>  #define WMI_SEND_TIMEOUT_HZ (3 * HZ)


