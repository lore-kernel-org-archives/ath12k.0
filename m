Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C93E1C10F1A
	for <ath12k@archiver.kernel.org>; Tue,  7 May 2024 14:20:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f3WM8370/lnueAlT0eDtBR4HcsXIQHe1qxf55wjIXws=; b=hRlh51FEnH9I0ztd+coSKz5L3z
	oKRMdNI3JvgoB2qmoNososZDFlXOBShoz1FqSopx8OTClqwZzwgrUinYCvwc/BNW1gndVzbin9oZf
	T43MTcl4l/ENEIC5sabR6SaTxPA5Y+h72PnbQ234u2uBV0V47crO7ppvq6ncF+kK0nqX89VBknRP5
	LbCLVOeWMjDAgJC5uJ9oqp9KkQkoGFX36z2kfuinjRuLUvSaSY7FQHo3ygy6NTwjA4ushM5O2i7lQ
	hc6n/Kx3HWvpMrS+2W8NDtOOkOZf8aT4JWRWekF9+41MUbJKVnCz5E/my8bOhEF6ypAOiUEmLKLoZ
	UJ2yPAiQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lfy-0000000BSME-1w6C
	for ath12k@archiver.kernel.org;
	Tue, 07 May 2024 14:20:14 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1s4Lfu-0000000BSKN-2vZ0
	for ath12k@lists.infradead.org;
	Tue, 07 May 2024 14:20:12 +0000
Received: from pps.filterd (m0279863.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 4477AHAO012181;
	Tue, 7 May 2024 14:20:06 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=f3WM8370/lnueAlT0eDtBR4HcsXIQHe1qxf55wjIXws=; b=O4
	I0ksf5MqLT5OPN92db1eBs0yjNfNtCFNARLYmukvc94v+jx4dIppyB58XxotsYok
	N7p5h43dEp2v/OtGhUA28Wr+drRumxwo96ufJbaBSFpsnZz+JzOSKA+sKfjBiSRZ
	IJ9FowjrAC+H42sdsU5Og6jIagrRfbNhxiUysPRbJ/05IKDLTg+XbuoexDYdbYu/
	xchzxQZo0S/6OaoYTHuXSL2Cm38QfsoXRYYXqcND9u0pHSCr39/DTo30qHTUrEvM
	K0Yv842uWllnJ8f8FTCH0fYSXJdSQD9W1ANAX/X9c1O1V6cs+YzhgHrxzYvd2px5
	CXqiLfBsg8QvwbnGVDSw==
Received: from nalasppmta02.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3xyf1097h4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 07 May 2024 14:20:05 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA02.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 447EK2jQ027702
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Tue, 7 May 2024 14:20:02 GMT
Received: from [10.110.82.245] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1544.9; Tue, 7 May 2024
 07:20:01 -0700
Message-ID: <c344144c-8593-474c-9e85-c957b3c8e5a9@quicinc.com>
Date: Tue, 7 May 2024 07:20:00 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/2] wifi: ath12k: fix misspelling of "dma" in
 num_rxmda_per_pdev
Content-Language: en-US
To: Kalle Valo <kvalo@kernel.org>
CC: Jeff Johnson <jjohnson@kernel.org>, <linux-wireless@vger.kernel.org>,
        <ath12k@lists.infradead.org>, <linux-kernel@vger.kernel.org>
References: <20240504-ath12k_dp_rxdma_ring_sel_config_wcn7850-ret-v1-1-44d2843a2857@quicinc.com>
 <171507926213.4120318.15441054563934456845.kvalo@kernel.org>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <171507926213.4120318.15441054563934456845.kvalo@kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01a.na.qualcomm.com (10.52.223.231) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-ORIG-GUID: 7osSpe1tlQ_fInMWx3-yuMviDRsLzvHk
X-Proofpoint-GUID: 7osSpe1tlQ_fInMWx3-yuMviDRsLzvHk
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1039,Hydra:6.0.650,FMLib:17.11.176.26
 definitions=2024-05-07_08,2024-05-06_02,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 adultscore=0
 priorityscore=1501 lowpriorityscore=0 impostorscore=0 mlxscore=0
 spamscore=0 suspectscore=0 malwarescore=0 bulkscore=0 phishscore=0
 mlxlogscore=621 clxscore=1015 classifier=spam adjust=0 reason=mlx
 scancount=1 engine=8.19.0-2404010003 definitions=main-2405070098
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240507_072010_900549_990EC323 
X-CRM114-Status: UNSURE (   8.24  )
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

On 5/7/2024 3:54 AM, Kalle Valo wrote:
> Jeff Johnson <quic_jjohnson@quicinc.com> wrote:
> 
>> The ath12k_hw_params member num_rxmda_per_pdev contains a misspelling
>> of "dma" so fix it.
>>
>> No functional changes, compile tested only.
>>
>> Signed-off-by: Jeff Johnson <quic_jjohnson@quicinc.com>
>> Signed-off-by: Kalle Valo <quic_kvalo@quicinc.com>
> 
> There was a trivial conflict in ath12k_dp_rx_pdev_srng_free(), please check my changes:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/kvalo/ath.git/commit/?h=pending&id=238d04b67c32e99181b0249bb847b11ce702960b
> 
LGTM


