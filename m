Return-Path: <ath12k-bounces+ath12k=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BAE89CD11DB
	for <ath12k@archiver.kernel.org>; Wed, 20 Mar 2024 21:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cLWCmrKQpmzI/Bar2tJN0ed8F5UfwO5QNB0jLMmkcD0=; b=wC7zvsgdglMWsqDI2JYWqUy+xI
	f0tQaSOWQPvmmohjaPB+Wo5KXlYJSUefv/S54tocoCQOoRuZULd8jLTXLWRF9SbZTNsHd5lGLdFFW
	4j1KfepqvsO4X+HmvFNXWHQJ76ykslGN/Om2JhRyJH8L9cZ7qs6nx4GmWVd2Aw0t4268YmH0Zcolx
	hLUXKKYP+0LVmyofWyXoH5I4IhvOiBMMFOHUcZRUB926yjJxg9yH0/d5aER6WUrkyFxcltqOo1IsW
	lDxiFswSoYnNDeoEqOtB7VsUdlMTQIDCdJPUxih8WfyKyPXotcMpTG6ycL8fudutwD1unm4fpVZTD
	akk+jqqQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3bF-000000012GN-1hc2
	for ath12k@archiver.kernel.org;
	Wed, 20 Mar 2024 21:35:53 +0000
Received: from mx0a-0031df01.pphosted.com ([205.220.168.131])
	by bombadil.infradead.org with esmtps (Exim 4.97.1 #2 (Red Hat Linux))
	id 1rn3bD-000000012Fh-0cpD
	for ath12k@lists.infradead.org;
	Wed, 20 Mar 2024 21:35:52 +0000
Received: from pps.filterd (m0279866.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.17.1.24/8.17.1.24) with ESMTP id 42KJ82pN005326;
	Wed, 20 Mar 2024 21:35:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=quicinc.com; h=
	message-id:date:mime-version:subject:to:cc:references:from
	:in-reply-to:content-type:content-transfer-encoding; s=
	qcppdkim1; bh=cLWCmrKQpmzI/Bar2tJN0ed8F5UfwO5QNB0jLMmkcD0=; b=Kc
	uJ7xRkNyGi3h2JShujJmkcV4JkFTuDJCsRe0eXa26ikdpkXLRCre3j8LZUwvVTo3
	WX32UiTln86Wkle4jIZXBiT72t6j4QeFITn/0itZSU0yPUNS2WB2pa+5QYAD9ldH
	Hc7780i2o5eQsmqtvgH0AiQXhlr/i4ExqdTRB+MPrjgnKeecE4vRC2IRM2huntWf
	yZS5phSe2KFSk+IJ3oeFCBr+je6EjijIa74Cbbbht5VrKxNMmBR3ZTg+a7slFe7I
	qHFyzdY1pqbQrNjmHeQWSYibIfEAnPNF6HXQpN3qMgsyXtolsn/WMjKBkimbihsU
	2xCY0MVDfOeP0z8Jvuwg==
Received: from nalasppmta01.qualcomm.com (Global_NAT1.qualcomm.com [129.46.96.20])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 3wyyvdh9e4-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 21:35:50 +0000 (GMT)
Received: from nalasex01a.na.qualcomm.com (nalasex01a.na.qualcomm.com [10.47.209.196])
	by NALASPPMTA01.qualcomm.com (8.17.1.5/8.17.1.5) with ESMTPS id 42KLZnYb029315
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
	Wed, 20 Mar 2024 21:35:49 GMT
Received: from [10.110.120.226] (10.80.80.8) by nalasex01a.na.qualcomm.com
 (10.47.209.196) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.1118.40; Wed, 20 Mar
 2024 14:35:49 -0700
Message-ID: <cb9af1aa-d213-43b4-8ff3-bf984050a8b4@quicinc.com>
Date: Wed, 20 Mar 2024 14:35:48 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 01/12] wifi: ath12k: add multiple radio support in a
 single MAC HW un/register
Content-Language: en-US
To: Rameshkumar Sundaram <quic_ramess@quicinc.com>,
        <ath12k@lists.infradead.org>
CC: <linux-wireless@vger.kernel.org>,
        Karthikeyan Periyasamy
	<quic_periyasa@quicinc.com>,
        Sriram R <quic_srirrama@quicinc.com>
References: <20240320190943.3850106-1-quic_ramess@quicinc.com>
 <20240320190943.3850106-2-quic_ramess@quicinc.com>
From: Jeff Johnson <quic_jjohnson@quicinc.com>
In-Reply-To: <20240320190943.3850106-2-quic_ramess@quicinc.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.80.80.8]
X-ClientProxiedBy: nasanex01b.na.qualcomm.com (10.46.141.250) To
 nalasex01a.na.qualcomm.com (10.47.209.196)
X-QCInternal: smtphost
X-Proofpoint-Virus-Version: vendor=nai engine=6200 definitions=5800 signatures=585085
X-Proofpoint-GUID: QppOEfP7HRmX_gHSIimpOeiCFXddstmz
X-Proofpoint-ORIG-GUID: QppOEfP7HRmX_gHSIimpOeiCFXddstmz
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.272,Aquarius:18.0.1011,Hydra:6.0.619,FMLib:17.11.176.26
 definitions=2024-03-20_12,2024-03-18_03,2023-05-22_02
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0 suspectscore=0 phishscore=0
 bulkscore=0 priorityscore=1501 malwarescore=0 lowpriorityscore=0
 impostorscore=0 adultscore=0 mlxlogscore=653 clxscore=1015 mlxscore=0
 spamscore=0 classifier=spam adjust=0 reason=mlx scancount=1
 engine=8.19.0-2403140001 definitions=main-2403200172
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20240320_143551_428861_E19E559D 
X-CRM114-Status: UNSURE (   9.21  )
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

On 3/20/2024 12:09 PM, Rameshkumar Sundaram wrote:
> From: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> 
> Currently MAC HW un/register helper function support the single radio.
> To enable single/multi link operation in the future, the following helper
> functions need to be refactored to accommodate multiple radios under a
> single MAC HW un/register:
> 
> 	* ath12k_ah_to_ar()
> 	* ath12k_mac_hw_allocate()
> 	* ath12k_mac_hw_register()
> 	* ath12k_mac_hw_unregister()
> 
> This refactoring will make it easier to scale these functionalities and
> support Multi link operation.
> 
>                          Current Multi wiphy Model
> 
>  +---------------+          +---------------+            +---------------+
>  |  Mac80211 hw  |          | Mac80211 hw   |            | Mac80211 hw   |
>  |  private data |          | private data  |            | private data  |
>  |               |          |               |            |               |
>  |ath12k_hw (ah) |          |ath12k_hw (ah) |            |ath12k_hw (ah) |
>  |               |          |               |            |               |
>  | +-----------+ |          | +-----------+ |            | +-----------+ |
>  | | ar (2GHz) | |          | | ar (5GHz) | |            | | ar (6GHz) | |
>  | +-----------+ |          | +-----------+ |            | +-----------+ |
>  |               |          |               |            |               |
>  +---------------+          +---------------+            +---------------+
> 
>                            Single wiphy Model
> 
>                             +--------------+
>                             | Mac80211 hw  |
>                             | private data |
>                             |              |
>                             |ath12k hw (ah)|
>                             | +----------+ |
>                             | |ar (2GHz) | |
>                             | +----------+ |
>                             | |ar (5GHz) | |
>                             | +----------+ |
>                             | |ar (6GHz) | |
>                             | +----------+ |
>                             +--------------+
> 
> Tested-on: QCN9274 hw2.0 PCI WLAN.WBE.1.0.1-00029-QCAHKSWPL_SILICONZ-1
> Tested-on: WCN7850 hw2.0 PCI WLAN.HMT.1.0.c5-00481-QCAHMTSWPL_V1.0_V2.0_SILICONZ-3
> 
> Signed-off-by: Karthikeyan Periyasamy <quic_periyasa@quicinc.com>
> Signed-off-by: Sriram R <quic_srirrama@quicinc.com>
> Signed-off-by: Rameshkumar Sundaram <quic_ramess@quicinc.com>
Acked-by: Jeff Johnson <quic_jjohnson@quicinc.com>


