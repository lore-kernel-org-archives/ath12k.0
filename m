Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10898C27C79
	for <ath12k@archiver.kernel.org>; Thu, 20 Jun 2024 16:57:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jOnIOyMbv9+Xav1Yh+aebdf37DE/bK2YV1q6ZQixIMA=; b=yoHe4wa+/teuX6ONvAFg5Bpy6G
	PMq9z8U+PYAhylXVevrVTiJX9+p6jy+kQbjnQtoIEqegV5gLOUEZujNBvFvxQitPkgB0YY5X0+B4i
	JkbpPuPavvKnSOejx/M2ht48tCf5eQnG5uX2KvHSHn8Fu+0wo3h43sI82s6O/K1vRvDvHALmpv6af
	P/jBTV2UZByZlRGTRb4O6hvyMM3iDdmLkyiUNQOYf++Rv6UMSYwJOCSD/Obp9/mAc73mMtI7KaQss
	lmRpc5dIfx7MSk53jYm+2oz2iIw9vr/29i/9kPQXECX2COLFaj7CZoeuhvOlw4KB5C0o1FW4W7Azv
	oybwyXXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKL6X-00000005xu1-2nbD
	for ath12k@archiver.kernel.org;
	Thu, 20 Jun 2024 16:57:45 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1sKL6U-00000005xtI-2Nhb
	for ath12k@lists.infradead.org;
	Thu, 20 Jun 2024 16:57:44 +0000
Received: from pps.filterd (m0279862.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 45KDlwOG024058;
	Thu, 20 Jun 2024 16:57:41 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	cc:content-transfer-encoding:content-type:date:from:in-reply-to
	:message-id:mime-version:references:subject:to; s=qcppdkim1; bh=
	jOnIOyMbv9+Xav1Yh+aebdf37DE/bK2YV1q6ZQixIMA=; b=YOj4viEaqvDDqd1M
	SuP46QGYiKEl2Mx5nc1xlJBLM1rXGYr0tanuQSzbkm6YEzr+032QNhJDfhM6jbQh
	zcrJXlALNfC/ixz39fUCdmodXKe30VnT/jFoT5JEBZzlZ67DxSRgVTZouTK0gq83
	ufBMh2n6CQJQx/3/0343C6D+vOzEw5jB3GpK1rUQ4XrrPP+l9FHWFX2vc6S+IdPU
	l/IJ3ubfk1VgQmWIkP6tZMJpZH/dOhNqOwDJHnJQScLkk7MsTswRtypw79/QpwFN
	diDnJx4IkpCHPOowBMt5crn4Pa8O0/OcwNAuLn8AHDn+hAshS7XlEviNt5uIYO0a
	/ANfgA==
Received: from nalasppmta04.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3yvnmh8fws-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 16:57:41 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA04.qualcomm.com (8.17.1.19/8.17.1.19) with ESMTPS id 45KGveAV011891
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Thu, 20 Jun 2024 16:57:40 GMT
Received: from [10.216.57.43] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Thu, 20 Jun
 2024 09:57:38 -0700
Message-ID: <d3cbc5b0-5003-49a9-817a-e5a37c274fcb@quicinc.com>
Date: Thu, 20 Jun 2024 22:27:34 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] wifi: ath12k: prepare sta data structure for MLO
 handling
To: Baochen Qiang <quic_bqiang@quicinc.com>, <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>, Sriram R <quic_srirrama@quicinc.com>,
        Jeff Johnson <quic_jjohnson@quicinc.com>
References: <20240617131650.3288118-1-quic_ramess@quicinc.com>
 <20240617131650.3288118-4-quic_ramess@quicinc.com>
 <29fcda42-8d83-40e4-856a-d98e56981091@quicinc.com>
Content-Language: en-US
From: Rameshkumar Sundaram <quic_ramess@quicinc.com>
In-Reply-To: <29fcda42-8d83-40e4-856a-d98e56981091@quicinc.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: dxJbAhmYgrl_Br0p0AcrL7Y7CTvSJ8FS
X-Proofpoint-GUID: dxJbAhmYgrl_Br0p0AcrL7Y7CTvSJ8FS
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.680,FMLib:17.12.28.16
 definitions=2024-06-20_08,2024-06-20_04,2024-05-17_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 mlxscore=0 bulkscore=0
 adultscore=0 lowpriorityscore=0 spamscore=0 clxscore=1011 mlxlogscore=832
 suspectscore=0 impostorscore=0 priorityscore=1501 phishscore=0
 malwarescore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2405170001 definitions=main-2406200122
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240620_095742_646274_240B777D 
X-CRM114-Status: UNSURE (   6.69  )
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



On 6/18/2024 3:49 PM, Baochen Qiang wrote:
> 
> 
> On 6/17/2024 9:16 PM, Rameshkumar Sundaram wrote:
>> +static inline struct ieee80211_sta *ath12k_sta_to_sta(struct ath12k_sta *ahsta)
>> +{
>> +	return container_of((void *)ahsta, struct ieee80211_sta, drv_priv);
>> +}
>> +
> better naming as ath12k_ahsta_to_sta()?

Sure, will change as suggested.

