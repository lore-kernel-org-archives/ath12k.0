Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D1C1CDD56A
	for <ath12k@archiver.kernel.org>; Thu, 19 Sep 2024 02:44:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LDsYwrcGZLZ6kDfm21Q86Cz3hfLWyZqBR8GPf3iPfA0=; b=t7v+V0jGuOeUpbLyZjmfmJsUQW
	j5Or7qLas/FB2YRKxUx9mOLudlcfQrlzcTFnOAxZHrIN3fe9owKngumV93Tc/nSe2t/jahi2Hd05o
	eSIgyY5PUSN8I6Yg2pQMtKmrTkhHArT+pRbyxbbro100ozqHZkQZgLe7ZSNKLZMpizPn2kTOdlfcN
	4OIT8t/ZYPULUgsu49Ji++oOAzz0nuSFjl+zmbPxyPCJs0Q5GECAZ/pzegaiTJegQLvc6MDSItFzC
	AGYCJ3D+Zt7CE1FNq5maNo7LfKZrF/J2VqlmUkLvpjvINx+aJY0itMhtm51wRYY5LKrXUAvgatAG1
	3ZD9BOLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1sr79M-00000009JR4-3pmL
	for ath12k@archiver.kernel.org;
	Thu, 19 Sep 2024 02:44:08 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1sr79J-00000009JQc-39GD
	for ath12k@lists.infradead.org;
	Thu, 19 Sep 2024 02:44:07 +0000
Received: from pps.filterd (m0279865.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 48ILMt8j002336;
	Thu, 19 Sep 2024 02:44:00 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	LDsYwrcGZLZ6kDfm21Q86Cz3hfLWyZqBR8GPf3iPfA0=; b=FEu7+TQ3f8pa6pjS
	s4VxqlpCjCW4uK8ht8PAJvCF+BXXOHdZ09unasDK87bAhvma/yluEfrwRdhzhLf7
	A2G1y5wK2jSy2BXIGK0dFt0GYR8aStTze7AeH+PYq+Uj57DMvWW8qtq9YmiRu8Jp
	GXdVyGVTOBGneCnD7BY0CgmYB/SYnr7wNFziVs0rF6zhyA6mOukdQNGJQ7WHqOhA
	0PNChOhdYRS3vJ0vYB5FN6KtFFzpzdDoDFWHvrp0ybk+Jc7Wrqz8UXWn7QS26dmx
	K1v4iX1I9jEEoDeHb/eZa6b726xE1iATBdRaUm0lkk17EqX6CXLQWgk1gedR4CEE
	RyP5uQ==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 41n4gnut0b-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 02:44:00 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 48J2hxW4010642
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 19 Sep 2024 02:43:59 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 18 Sep
 2024 19:43:58 -0700
Message-ID: <33963bc8-7cc9-434a-8910-cbcfc6fa965e@quicinc.com>
Date: Thu, 19 Sep 2024 10:43:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC v2 1/4] wifi: ath12k: switch to using wiphy_lock() and
 remove ar->conf_mutex
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240918181042.91891-1-kvalo@kernel.org>
 <20240918181042.91891-2-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240918181042.91891-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 4Clxvxdm_Kfqo8ILt_gDhYVDgcrEjr9G
X-Proofpoint-ORIG-GUID: 4Clxvxdm_Kfqo8ILt_gDhYVDgcrEjr9G
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.60.29
 definitions=2024-09-06_09,2024-09-06_01,2024-09-02_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 adultscore=0
 mlxlogscore=999 malwarescore=0 suspectscore=0 clxscore=1015 phishscore=0
 lowpriorityscore=0 bulkscore=0 impostorscore=0 priorityscore=1501
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2408220000 definitions=main-2409190017
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240918_194405_852536_7F872DC2 
X-CRM114-Status: UNSURE (   8.88  )
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



On 9/19/2024 2:10 AM, Kalle Valo wrote:
> @@ -4310,7 +4301,7 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>  
>  	spin_unlock_bh(&ar->data_lock);
>  
> -	mutex_lock(&ar->conf_mutex);
> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
note in patch 4/4 ath12k_sta::update_wk is converted to use wiphy_work. While a wiphy work item is running wiphy lock is held already. So here try to acquire wiphy lock once again will lead to a deadlock.

>  
>  	nss = max_t(u32, 1, nss);
>  	nss = min(nss, max(ath12k_mac_max_ht_nss(ht_mcs_mask),
> @@ -4426,7 +4417,7 @@ static void ath12k_sta_rc_update_wk(struct work_struct *wk)
>  		}
>  	}
>  err_rc_bw_changed:
> -	mutex_unlock(&ar->conf_mutex);
> +	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
>  }

