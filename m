Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9550C3DA4A
	for <ath12k@archiver.kernel.org>; Thu, 22 Aug 2024 05:46:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lkrEjhhdrh2LxSFxa6D9QDj1lo1uBKP+h1FFIXtlK14=; b=HywfMm7ZQ+Ch4MF2dCU01j6zo6
	1+9l30Hw99lXShWU4/EnrqJdGFrDYZ62/6HY9SHeG66ucEGqCoGi7SLeK6ZedElL/IuOqLKpzvQ8S
	7JBCSlLbI9N3GieaLj7Y/i1Goh8qdLmTu5xrJRnlwmFy+8//Im6RvBGlV2OGkguUg1YDeGLEnLIrT
	o/POAlwfUqB9a5CZZ5Kx2N90oybOMyzwdlUFfXFZo+B9Qf64AJNXX/USfiVzPakl1+1xcMWTKfff8
	tVheg10eOzaq0o7oL8cOp8Ftst5n9hYFEwbJ5DdLpexhl7ugwYAagugchoayzAnU+qmNHdyJv78G2
	FxEsRHxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh0em-0000000BVbX-1nfi
	for ath12k@archiver.kernel.org;
	Thu, 22 Aug 2024 05:46:48 +0000
Received: from mx0b-0031df01.pphosted.com ([205.220.180.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sh0ek-0000000BVb6-0MPX
	for ath12k@lists.infradead.org;
	Thu, 22 Aug 2024 05:46:47 +0000
Received: from pps.filterd (m0279871.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 47M12Mk1029158;
	Thu, 22 Aug 2024 05:46:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	lkrEjhhdrh2LxSFxa6D9QDj1lo1uBKP+h1FFIXtlK14=; b=ZSoj4i2e2zI7bl2c
	AWCCQi3bWG5Yq6BbgYZjG5agyQYLVFjL9czHkMoQEeyYauIxm+xF5/vG3QDtw51i
	iRS3QSLxcNOc2yByuIBEUEvg6NUyYGVEHV7i/Y8jNSHEA5w7mczPTFmqWJ/aRQbu
	J+KVCEiey0hNr47UMikRiepfJ1bUQVbx0x15y//3ev7a2CnvlqWO9z7HG6QtAYfk
	/M2LgL7BDBLUodLJSm5cd0vYUyCxDr1i0ZmQvXv5vyLY1/9htOBzfFd4+gTZv5kS
	yL5VPX2WeGmCSxUgWOLEgBZnWKc5FksGsaALVPtPAV98UUUKkjmoKXa1TSzpSxCb
	74pEEw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 4159adbvnm-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 05:46:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.18.1.2/8.18.1.2) with ESMTPS id 47M5kecX006949
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 22 Aug 2024 05:46:40 GMT
Received: from [10.231.195.67] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Wed, 21 Aug
 2024 22:46:39 -0700
Message-ID: <a1a4202f-5c10-401a-9b02-47dacb9be048@quicinc.com>
Date: Thu, 22 Aug 2024 13:46:37 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH RFC 1/4] wifi: ath12k: switch to using wiphy_lock() and
 remove ar->conf_mutex
To: Kalle Valo <kvalo@kernel.org>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>
References: <20240821153728.2121600-1-kvalo@kernel.org>
 <20240821153728.2121600-2-kvalo@kernel.org>
Content-Language: en-US
From: Baochen Qiang <quic_bqiang@quicinc.com>
In-Reply-To: <20240821153728.2121600-2-kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: 1_JQS5AgmDkOGBI0aoKSzjr2FRWKY95L
X-Proofpoint-ORIG-GUID: 1_JQS5AgmDkOGBI0aoKSzjr2FRWKY95L
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-08-22_02,2024-08-19_03,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxlogscore=805
 impostorscore=0 lowpriorityscore=0 clxscore=1015 spamscore=0 mlxscore=0
 bulkscore=0 phishscore=0 adultscore=0 malwarescore=0 priorityscore=1501
 suspectscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2407110000 definitions=main-2408220040
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240821_224646_275762_DC8458CC 
X-CRM114-Status: UNSURE (   8.94  )
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



On 8/21/2024 11:37 PM, Kalle Valo wrote:
> @@ -845,7 +845,9 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
>  	struct ath12k *ar = ath12k_ah_to_ar(ah, 0);
>  	int ret;
>  
> -	mutex_lock(&ar->conf_mutex);
> +	lockdep_assert_wiphy(hw->wiphy);
> +
> +	wiphy_lock(ath12k_ar_to_hw(ar)->wiphy);
we don't need this lock because it is already held by mac80211.

>  
>  	ret =  ath12k_wow_cleanup(ar);
>  	if (ret) {
> @@ -913,7 +915,7 @@ int ath12k_wow_op_suspend(struct ieee80211_hw *hw,
>  	ath12k_wow_cleanup(ar);
>  
>  exit:
> -	mutex_unlock(&ar->conf_mutex);
> +	wiphy_unlock(ath12k_ar_to_hw(ar)->wiphy);
same here.

>  	return ret ? 1 : 0;
>  }

