Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95148C4345F
	for <ath12k@archiver.kernel.org>; Thu, 25 Apr 2024 22:32:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pa8CAObovv7DlxdzxgZvaYmcT5+YmXfpB+xjLVohJ6o=; b=Ns9PjaPkxoPOh/czQuEVLKFU/F
	4iUSObMdxDR93378d1l1wgMVZjRvwq6EsIod4nr9vczHoW8TOWdFe5zurhvT9IjX9G+GR8trqbKDm
	CLGPkBvgigjNGi1d5ukmejPwgFtKmjTyKjZWIuxBCcAulfekjqZJKQA2v3/ZYQn+RH6UaZqq4sHor
	rGT8A/r0YdA+hf6WcWeg/zdJO59ssez54R5X/ImCM47INIqF8mMZm9DR1QIhgRqPB/UoD49521PL2
	T88wwuUvYWE9HllwZ9MtIQNNXVDrYKTkrO6brePwf8z2NJgpAvVkFUUu3c8L15VaU8Bcr8B2kD5zH
	AUH705eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07dd-0000000AU9y-0V6t
	for ath12k@archiver.kernel.org;
	Thu, 25 Apr 2024 22:32:21 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s07da-0000000AU96-0Fox
	for ath12k@lists.infradead.org;
	Thu, 25 Apr 2024 22:32:19 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 43PIlIrv024808;
	Thu, 25 Apr 2024 22:32:17 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=pa8CAObovv7DlxdzxgZvaYmcT5+YmXfpB+xjLVohJ6o=; b=cV
	3J48dVhy3ZSvm51z3/BNbhOnVF5JCtY/qXYSEDutcTNJlE8pfDoScORE/WLIm6Ni
	5iYzt5QuwK7m+ODc16jIUllmcH+Djv6IpJL1xmXYxWYsV8EVAVhwpySa8GZ2jUH9
	w+4yUYuo9FFVlPksEa2EABq77ICAD7j0R+fmtJb3tQoFeg4JBvxwECiCGNgzb5o8
	6uVmW7a82SUdiFDTXw74gizm9rcd4tUL9TGG6vQs+jUVoZaJ/1VEKa5dfefqz6l5
	suXioiCrb6KF1hg9TwYtwV9yS0KxuaGkQNuTKqXib01YD+8j++IeemMBc29zxyEn
	5xjYAGIdmh/okS+Amo1Q==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xqenkkud3-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:32:16 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 43PMWFn8032438
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 25 Apr 2024 22:32:15 GMT
Received: from [10.110.61.159] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 25 Apr
 2024 15:32:15 -0700
Message-ID: <72bc6772-8bf7-427d-8f03-01e8dbf30d0c@quicinc.com>
Date: Thu, 25 Apr 2024 15:32:14 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 07/10] wifi: ath12k: add support for setting fixed HE
 rate/GI/LTF
Content-Language: en-US
To: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Muna Sinada <quic_msinada@quicinc.com>
References: <20240424201959.935-1-quic_pradeepc@quicinc.com>
 <20240424201959.935-8-quic_pradeepc@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240424201959.935-8-quic_pradeepc@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: rI3qjjRdKnAl7cpUDn3SXvuIK9uwXdeH
X-Proofpoint-GUID: rI3qjjRdKnAl7cpUDn3SXvuIK9uwXdeH
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1011,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-04-25_21,2024-04-25_01,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 clxscore=1015 phishscore=0
 mlxlogscore=999 priorityscore=1501 impostorscore=0 malwarescore=0
 bulkscore=0 lowpriorityscore=0 spamscore=0 adultscore=0 suspectscore=0
 mlxscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2404010003 definitions=main-2404250165
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240425_153218_254813_F63F0371 
X-CRM114-Status: UNSURE (   9.77  )
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

On 4/24/2024 1:19 PM, Pradeep Kumar Chitrapu wrote:
> Add support to set fixed HE rate/GI/LTF values using nl80211.
> Reuse parts of the existing code path already used for HT/VHT
> to implement the new helpers symmetrically, similar to how
> HT/VHT is handled.
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> 
> Co-developed-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Muna Sinada <quic_msinada@quicinc.com>
> Signed-off-by: Pradeep Kumar Chitrapu <quic_pradeepc@quicinc.com>
> ---

[...]

> @@ -7753,7 +8034,20 @@ ath12k_mac_bitrate_mask_get_single_nss(struct ath12k *ar,
>  			return false;
>  	}
>  
> -	if (ht_nss_mask != vht_nss_mask)
> +	he_mcs_map = le16_to_cpu(ath12k_mac_get_tx_mcs_map(&sband->iftype_data->he_cap));

drivers/net/wireless/ath/ath12k/mac.c:8041:22: warning: incorrect type in argument 1 (different address spaces)
drivers/net/wireless/ath/ath12k/mac.c:8041:22:    expected struct ieee80211_sta_he_cap const *he_cap
drivers/net/wireless/ath/ath12k/mac.c:8041:22:    got struct ieee80211_sta_he_cap const [noderef] __iftype_data *



